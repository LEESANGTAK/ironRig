import pymel.core as pm
from ... import utils
from ..irGlobal import OBB
from ..irGlobal import Controller
from .system import System


class RevFootIK(System):
    ATTRS_INFO = [
        {'name': 'roll', 'default': 0, 'min': -90, 'max': 90},
        {'name': 'toeLiftStartAngle', 'default': 45, 'min': 0, 'max': 60},
        {'name': 'ballLift', 'default': 0, 'min': -90, 'max': 90},
        {'name': 'toeLift', 'default': 0, 'min': -90, 'max': 90},
        {'name': 'heelLift', 'default': 0, 'min': -90, 'max': 90},
        {'name': 'toeTwist', 'default': 0, 'min': -180, 'max': 180},
        {'name': 'ballTwist', 'default': 0, 'min': -180, 'max': 180},
        {'name': 'heelTwist', 'default': 0, 'min': -180, 'max': 180},
        {'name': 'toe', 'default': 0, 'min': -90, 'max': 90},
        {'name': 'bank', 'default': 0, 'min': -90, 'max': 90}
    ]

    def __init__(self, prefix='', joints=[]):
        super(RevFootIK, self).__init__(prefix, joints)

        self.__revFootJoints = None

    def revFootJoints(self):
        return self.__revFootJoints

    def _buildSystems(self):
        super(RevFootIK, self)._buildSystems()
        self.__revFootJoints = self.__buildRevFootJoints()
        self.__createIKs()
        pm.parentConstraint(self.__revFootJoints[-1], self._joints[0], mo=True)

    def __createIKs(self):
        ballIK = pm.ikHandle(solver='ikSCsolver', n='{0}ball_ikh'.format(self._prefix), startJoint=self._joints[0], ee=self._joints[1])[0]
        toeIK = pm.ikHandle(solver='ikSCsolver', n='{0}toe_ikh'.format(self._prefix), startJoint=self._joints[1], ee=self._joints[2])[0]

        self.__toeIKPivotTrsf = pm.createNode('transform', n='{0}_pivot'.format(toeIK))
        pm.matchTransform(self.__toeIKPivotTrsf, self._joints[1])
        toeIKPivotTrsfZero = pm.duplicate(self.__toeIKPivotTrsf, n='{0}_zero'.format(toeIK))[0]

        self.__revFootJoints[-3] | toeIKPivotTrsfZero | self.__toeIKPivotTrsf | toeIK
        self.__revFootJoints[-2] | ballIK

    def __buildRevFootJoints(self):
        skelJoints = [pm.PyNode(jnt.replace(self._prefix, '')) for jnt in self._joints]
        afVtxs = utils.getAffectedVertices(skelJoints, minWeight=0.5)
        pm.select(afVtxs, r=True)
        pm.mel.ConvertSelectionToFaces()
        fFaces = utils.getFacingFaces(pm.selected(fl=True), pm.dt.Vector.yNegAxis, tol=0.8)

        # Create bottom mesh of foot
        dupMesh = utils.duplicateFace(fFaces)

        # Get center point of bottom points of obb
        obb = OBB.from_points(dupMesh.name())
        pm.delete(dupMesh)
        obbBotPoints = obb.getBottomPoints()
        centerVec = pm.dt.Vector()
        for pnt in obbBotPoints:
            centerVec += pm.dt.Vector(pnt)
        centerPnt = pm.dt.Point(centerVec / len(obbBotPoints))

        # Get middle points of bottom edges of obb
        midPoints = []
        for i, pnt in enumerate(obbBotPoints):
            if pnt == obbBotPoints[-1]:
                break
            for otherPnt in obbBotPoints[i+1:]:
                midVec = (pm.dt.Vector(pnt) + pm.dt.Vector(otherPnt)) * 0.5
                # When diagnol edge, mid point will same as center point
                if pm.dt.Point(midVec) == centerPnt:
                    continue
                else:
                    midPoints.append(pm.dt.Point(midVec))

        # Sort middle points
        centerToMidVectors = []
        for midPnt in midPoints:
            centerToMidVectors.append(midPnt - centerPnt)
        if centerPnt.x > 0:
            mostAlignedVector = utils.getMostAlignedVector(pm.dt.Vector.xNegAxis, centerToMidVectors)
            firstMidPntIndex = centerToMidVectors.index(mostAlignedVector)
            mostAlignedVector = utils.getMostAlignedVector(pm.dt.Vector.xAxis, centerToMidVectors)
            secondMidPntIndex = centerToMidVectors.index(mostAlignedVector)
        else:
            mostAlignedVector = utils.getMostAlignedVector(pm.dt.Vector.xAxis, centerToMidVectors)
            firstMidPntIndex = centerToMidVectors.index(mostAlignedVector)
            mostAlignedVector = utils.getMostAlignedVector(pm.dt.Vector.xNegAxis, centerToMidVectors)
            secondMidPntIndex = centerToMidVectors.index(mostAlignedVector)
        mostAlignedVector = utils.getMostAlignedVector(pm.dt.Vector.zNegAxis, centerToMidVectors)
        thirdMidPntIndex = centerToMidVectors.index(mostAlignedVector)
        mostAlignedVector = utils.getMostAlignedVector(pm.dt.Vector.zAxis, centerToMidVectors)
        fourthMidPntIndex = centerToMidVectors.index(mostAlignedVector)

        inBankPnt = midPoints[firstMidPntIndex]
        outBankPnt = midPoints[secondMidPntIndex]
        heelPnt = midPoints[thirdMidPntIndex]
        toeTipPnt = midPoints[fourthMidPntIndex]
        ballPnt = utils.getWorldPoint(self._joints[1])
        anklePnt = utils.getWorldPoint(self._joints[0])
        toePnt = pm.dt.Point(heelPnt + utils.getProjectedVector(ballPnt-heelPnt, toeTipPnt-heelPnt))

        # Build orientation matrix for reverse foot joints
        oriMtx = utils.getOrientMatrix(utils.getWorldPoint(self._joints[0]),
                                       utils.getWorldPoint(self._joints[-1]),
                                       utils.getWorldPoint(self._joints[0]) + pm.dt.Vector.yNegAxis)
        if centerPnt.x < 0:  # In case right side
            oriMtx = pm.dt.Matrix([oriMtx[0][0], oriMtx[0][1], oriMtx[0][2], oriMtx[0][3],
                                   -oriMtx[1][0], -oriMtx[1][1], -oriMtx[1][2], oriMtx[1][3],
                                   -oriMtx[2][0], -oriMtx[2][1], -oriMtx[2][2], oriMtx[2][3],
                                   oriMtx[3][0], oriMtx[3][1], oriMtx[3][2], oriMtx[3][3]])

        # Build reverse foot joints
        inBankRevJnt = pm.createNode('joint', n='{}inBank_revJnt'.format(self._prefix))
        pm.xform(inBankRevJnt, matrix=oriMtx, ws=True)
        pm.xform(inBankRevJnt, t=inBankPnt, ws=True)
        outBankRevJnt = pm.createNode('joint', n='{}outBank_revJnt'.format(self._prefix))
        pm.xform(outBankRevJnt, matrix=oriMtx, ws=True)
        pm.xform(outBankRevJnt, t=outBankPnt, ws=True)
        heelRevJnt = pm.createNode('joint', n='{}heel_revJnt'.format(self._prefix))
        pm.xform(heelRevJnt, matrix=oriMtx, ws=True)
        pm.xform(heelRevJnt, t=heelPnt, ws=True)
        toeRevJnt = pm.createNode('joint', n='{}toe_revJnt'.format(self._prefix))
        pm.xform(toeRevJnt, matrix=oriMtx, ws=True)
        pm.xform(toeRevJnt, t=toePnt, ws=True)
        toeTipRevJnt = pm.createNode('joint', n='{}toeTip_revJnt'.format(self._prefix))
        pm.xform(toeTipRevJnt, matrix=oriMtx, ws=True)
        pm.xform(toeTipRevJnt, t=toeTipPnt, ws=True)
        ballRevJnt = pm.createNode('joint', n='{}ball_revJnt'.format(self._prefix))
        pm.xform(ballRevJnt, matrix=oriMtx, ws=True)
        pm.xform(ballRevJnt, t=ballPnt, ws=True)
        ankleRevJnt = pm.createNode('joint', n='{}ankle_revJnt'.format(self._prefix))
        pm.xform(ankleRevJnt, matrix=oriMtx, ws=True)
        pm.xform(ankleRevJnt, t=anklePnt, ws=True)

        inBankRevJnt | outBankRevJnt | heelRevJnt | toeRevJnt | toeTipRevJnt | ballRevJnt | ankleRevJnt
        revFootJoints = [inBankRevJnt, outBankRevJnt, heelRevJnt, toeRevJnt, toeTipRevJnt, ballRevJnt, ankleRevJnt]

        pm.makeIdentity(revFootJoints, apply=True)
        pm.parent(inBankRevJnt, self._blbxGrp)

        return revFootJoints

    def _buildControls(self):
        footCtrl = Controller('{0}ctrl'.format(self._prefix), Controller.SHAPE.FOOT, scale=5, direction=Controller.DIRECTION.Y)
        jointsMidVec = (utils.getWorldPoint(self._joints[0]) + utils.getWorldPoint(self._joints[-1])) * 0.5
        pm.xform(footCtrl.zeroGrp(), t=[jointsMidVec.x, 0, jointsMidVec.z], ws=True)
        if self._negateScaleX:
            footCtrl.zeroGrp().sx.set(-1)
        footCtrl.constraint(self._blbxGrp, parent=True)
        pm.parent(footCtrl.zeroGrp(), self._controllerGrp)
        footCtrl.lockChannels(['visibility'])
        self._controllers.append(footCtrl)
        self.addMembers(footCtrl.controllerNode())

        for attrInfo in RevFootIK.ATTRS_INFO:
            pm.addAttr(footCtrl, ln=attrInfo['name'], at='float', min=attrInfo['min'], max=attrInfo['max'], dv=attrInfo['default'], keyable=True)

        self._connectAttributes()

    def _connectAttributes(self):
        footCtrl = self._controllers[0]
        inBankJnt = self.__revFootJoints[0]
        outBankJnt = self.__revFootJoints[1]
        heelJnt = self.__revFootJoints[2]
        toeJnt = self.__revFootJoints[3]
        toeTipJnt = self.__revFootJoints[4]
        ballJnt = self.__revFootJoints[5]

        rollRemap = pm.createNode('remapValue', n='{0}roll_remap'.format(self._prefix))
        rollRemap.inputMax.set(90)
        rollRemap.outputMin.set(1)
        rollRemap.outputMax.set(0)

        rollBallClamp = pm.createNode('clamp', n='{0}roll_ball_clamp'.format(self._prefix))
        rollBallClamp.maxR.set(90)
        ballMult = pm.createNode('multDoubleLinear', n='{0}ball_mult'.format(self._prefix))
        ballAdd = pm.createNode('addDoubleLinear', n='{0}ball_add'.format(self._prefix))
        ballClamp = pm.createNode('clamp', n='{0}ball_clamp'.format(self._prefix))
        ballClamp.minR.set(-90)
        ballClamp.maxR.set(90)

        rollRev = pm.createNode('reverse', n='{0}roll_rev'.format(self._prefix))
        toeTipMult = pm.createNode('multDoubleLinear', n='{0}toeTip_mult'.format(self._prefix))
        toeTipAdd = pm.createNode('addDoubleLinear', n='{0}toeTip_add'.format(self._prefix))
        toeTipClamp = pm.createNode('clamp', n='{0}toeTip_clamp'.format(self._prefix))
        toeTipClamp.minR.set(-90)
        toeTipClamp.maxR.set(90)

        rollHeelClamp = pm.createNode('clamp', n='{0}roll_heel_clamp'.format(self._prefix))
        rollHeelClamp.minR.set(-90)
        heelAdd = pm.createNode('addDoubleLinear', n='{0}heel_add'.format(self._prefix))
        heelClamp = pm.createNode('clamp', n='{0}heel_clamp'.format(self._prefix))
        heelClamp.minR.set(-90)
        heelClamp.maxR.set(90)

        bankInv = pm.createNode('multDoubleLinear', n='{0}bank_inv'.format(self._prefix))
        bankInv.input2.set(-1)
        inBankClamp = pm.createNode('clamp', n='{0}inBank_clamp'.format(self._prefix))
        inBankClamp.maxR.set(90)
        outBankClamp = pm.createNode('clamp', n='{0}outBank_clamp'.format(self._prefix))
        outBankClamp.minR.set(-90)

        # Add dependency nodes to set
        self.addMembers(rollRemap, rollBallClamp, ballMult, ballAdd, ballClamp, rollRev, toeTipMult, toeTipAdd, toeTipClamp, rollHeelClamp, heelAdd, heelClamp, bankInv, inBankClamp, outBankClamp)

        # Roll and Lift connections #
        footCtrl.transform().roll >> rollRemap.inputValue
        footCtrl.transform().toeLiftStartAngle >> rollRemap.inputMin

        # Ball connections
        footCtrl.transform().roll >> rollBallClamp.inputR
        rollBallClamp.outputR >> ballMult.input1
        rollRemap.outValue >> ballMult.input2
        ballMult.output >> ballAdd.input1
        footCtrl.transform().ballLift >> ballAdd.input2
        ballAdd.output >> ballClamp.inputR
        ballClamp.outputR >> ballJnt.rx

        # ToeTip connections
        rollRemap.outValue >> rollRev.inputX
        footCtrl.transform().roll >> toeTipMult.input1
        rollRev.outputX >> toeTipMult.input2
        toeTipMult.output >> toeTipAdd.input1
        footCtrl.transform().toeLift >> toeTipAdd.input2
        toeTipAdd.output >> toeTipClamp.inputR
        toeTipClamp.outputR >> toeTipJnt.rx

        # Heel connections
        footCtrl.transform().roll >> rollHeelClamp.inputR
        rollHeelClamp.outputR >> heelAdd.input1
        footCtrl.transform().heelLift >> heelAdd.input2
        heelAdd.output >> heelClamp.inputR
        heelClamp.outputR >> heelJnt.rx

        # Twist connections #
        footCtrl.transform().heelTwist >> heelJnt.ry
        footCtrl.transform().ballTwist >> toeJnt.ry
        footCtrl.transform().toeTwist >> toeTipJnt.ry

        # Toe connections #
        footCtrl.transform().toe >> self.__toeIKPivotTrsf.ry

        # Bank connections #
        footCtrl.transform().bank >> bankInv.input1
        bankInv.output >> inBankClamp.inputR
        inBankClamp.outputR >> inBankJnt.rz
        bankInv.output >> outBankClamp.inputR
        outBankClamp.outputR >> outBankJnt.rz

