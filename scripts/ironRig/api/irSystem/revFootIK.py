from maya.api import OpenMaya as om
from maya import cmds
from ... import utils
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

    def __init__(self, prefix, joints, pivotLocators):
        super(RevFootIK, self).__init__(prefix, joints)

        self.__isSingleBone = False
        self.__origJoints = None
        self.__pivotLocators = pivotLocators
        self.__revFootJoints = None
        self.__footCtrl = None

        if len(joints) == 2:
            self.__isSingleBone = True
            self.__origJoints = joints
            self.__addBallJoint()

    def __addBallJoint(self):
        ballJntPos = utils.getWorldPoint(self._joints[0]) + (utils.getWorldPoint(self._joints[1]) - utils.getWorldPoint(self._joints[0])) * 0.75
        ballJnt = cmds.createNode('joint', n='{}ball_ik'.format(self._name))
        cmds.xform(ballJnt, t=ballJntPos, ws=True)
        cmds.matchTransform(ballJnt, self._joints[0], rotation=True)
        self._joints[0] | ballJnt | self._joints[1]
        self._joints.insert(1, ballJnt)

    def joints(self):
        if self.__isSingleBone:
            return self.__origJoints
        else:
            return self._joints

    def revFootJoints(self):
        return self.__revFootJoints

    def build(self):
        super(RevFootIK, self).build()
        if self.__isSingleBone:
            self.__footCtrl.toeLiftStartAngle.set(0)
            self.__footCtrl.lockHideChannels(['toeLiftStartAngle', 'ballLift', 'ballTwist', 'toe'])

    def _buildSystems(self):
        super(RevFootIK, self)._buildSystems()
        self.__revFootJoints = self.__buildRevFootJoints()
        self.__createIKs()
        cmds.parentConstraint(self.__revFootJoints[-1], self._joints[0], mo=True)

    def __buildRevFootJoints(self):
        anklePnt = utils.getWorldPoint(self._joints[0])
        ballPnt = utils.getWorldPoint(self._joints[1])
        toeTipLocPnt = utils.getWorldPoint(self.__pivotLocators[3])
        heelLocPnt = utils.getWorldPoint(self.__pivotLocators[2])
        bankOutLocPnt = utils.getWorldPoint(self.__pivotLocators[1])
        bankInLocPnt = utils.getWorldPoint(self.__pivotLocators[0])

        vertPoints = [om.MPoint(item) for item in [heelLocPnt, bankInLocPnt, toeTipLocPnt, bankOutLocPnt]]
        faceVertCount = [4]
        faceVertOrder = [0, 1, 2, 3]
        fnMesh = om.MFnMesh()
        fnMesh.create(vertPoints, faceVertCount, faceVertOrder)
        toePnt, faceId = fnMesh.getClosestPoint(om.MPoint(ballPnt))
        cmds.delete(fnMesh.fullPathName())

        sumPivotVec = om.MVector()
        for pnt in [bankInLocPnt, bankOutLocPnt, heelLocPnt, toeTipLocPnt]:
            sumPivotVec += om.MVector(pnt)
        centerPnt = om.MPoint(sumPivotVec / 4.0)

        # Build orientation matrix for reverse foot joints
        oriMtx = utils.getOrientMatrix(utils.getWorldPoint(self._joints[0]),
                                       utils.getWorldPoint(self._joints[-1]),
                                       utils.getWorldPoint(self._joints[0]) + om.MVector.kYnegAxisVector)
        if centerPnt.x < 0:  # In case right side
            oriMtx = om.MMatrix([oriMtx[0][0], oriMtx[0][1], oriMtx[0][2], oriMtx[0][3],
                                   -oriMtx[1][0], -oriMtx[1][1], -oriMtx[1][2], oriMtx[1][3],
                                   -oriMtx[2][0], -oriMtx[2][1], -oriMtx[2][2], oriMtx[2][3],
                                   oriMtx[3][0], oriMtx[3][1], oriMtx[3][2], oriMtx[3][3]])

        # Build reverse foot joints
        inBankRevJnt = cmds.createNode('joint', n='{}inBank_revJnt'.format(self._name))
        cmds.xform(inBankRevJnt, matrix=oriMtx, ws=True)
        cmds.xform(inBankRevJnt, t=bankInLocPnt, ws=True)
        outBankRevJnt = cmds.createNode('joint', n='{}outBank_revJnt'.format(self._name))
        cmds.xform(outBankRevJnt, matrix=oriMtx, ws=True)
        cmds.xform(outBankRevJnt, t=bankOutLocPnt, ws=True)
        heelRevJnt = cmds.createNode('joint', n='{}heel_revJnt'.format(self._name))
        cmds.xform(heelRevJnt, matrix=oriMtx, ws=True)
        cmds.xform(heelRevJnt, t=heelLocPnt, ws=True)
        toeRevJnt = cmds.createNode('joint', n='{}toe_revJnt'.format(self._name))
        cmds.xform(toeRevJnt, matrix=oriMtx, ws=True)
        cmds.xform(toeRevJnt, t=(toePnt.x, toePnt.y, toePnt.z), ws=True)
        toeTipRevJnt = cmds.createNode('joint', n='{}toeTip_revJnt'.format(self._name))
        cmds.xform(toeTipRevJnt, matrix=oriMtx, ws=True)
        cmds.xform(toeTipRevJnt, t=toeTipLocPnt, ws=True)
        ballRevJnt = cmds.createNode('joint', n='{}ball_revJnt'.format(self._name))
        cmds.xform(ballRevJnt, matrix=oriMtx, ws=True)
        cmds.xform(ballRevJnt, t=ballPnt, ws=True)
        ankleRevJnt = cmds.createNode('joint', n='{}ankle_revJnt'.format(self._name))
        cmds.xform(ankleRevJnt, matrix=oriMtx, ws=True)
        cmds.xform(ankleRevJnt, t=anklePnt, ws=True)

        inBankRevJnt | outBankRevJnt | heelRevJnt | toeRevJnt | toeTipRevJnt | ballRevJnt | ankleRevJnt
        revFootJoints = [inBankRevJnt, outBankRevJnt, heelRevJnt, toeRevJnt, toeTipRevJnt, ballRevJnt, ankleRevJnt]

        cmds.makeIdentity(revFootJoints, apply=True)
        cmds.parent(inBankRevJnt, self._blbxGrp)

        return revFootJoints

    def __createIKs(self):
        ballIK = cmds.ikHandle(solver='ikSCsolver', n='{0}ball_ikh'.format(self._name), startJoint=self._joints[0], ee=self._joints[1])[0]
        toeIK = cmds.ikHandle(solver='ikSCsolver', n='{0}toe_ikh'.format(self._name), startJoint=self._joints[1], ee=self._joints[2])[0]

        self.__toeIKPivotTrsf = cmds.createNode('transform', n='{0}_pivot'.format(toeIK))
        cmds.matchTransform(self.__toeIKPivotTrsf, self._joints[1])
        toeIKPivotTrsfZero = cmds.duplicate(self.__toeIKPivotTrsf, n='{0}_zero'.format(toeIK))[0]

        self.__revFootJoints[-3] | toeIKPivotTrsfZero | self.__toeIKPivotTrsf | toeIK
        self.__revFootJoints[-2] | ballIK

    def _buildControls(self):
        self.__footCtrl = Controller('{0}ctrl'.format(self._name), Controller.SHAPE.FOOT, size=5, direction=Controller.DIRECTION.Y)
        jointsMidVec = (utils.getWorldPoint(self._joints[0]) + utils.getWorldPoint(self._joints[-1])) * 0.5
        cmds.xform(self.__footCtrl.zeroGrp, t=[jointsMidVec.x, 0, jointsMidVec.z], ws=True)
        if self._negateScaleX:
            self.__footCtrl.zeroGrp.sx.set(-1)
        cmds.parentConstraint(self.__footCtrl, self._blbxGrp, mo=True)
        cmds.parent(self.__footCtrl.zeroGrp, self._controllerGrp)
        self.__footCtrl.lockHideChannels(['visibility'])
        self._controllers.append(self.__footCtrl)
        self.addMembers(self.__footCtrl.allNodes)

        for attrInfo in RevFootIK.ATTRS_INFO:
            cmds.addAttr(self.__footCtrl, ln=attrInfo['name'], at='float', min=attrInfo['min'], max=attrInfo['max'], dv=attrInfo['default'], keyable=True)

        self._connectAttributes()

        if self._negateScaleX:
            toeUnitConversion = self.__footCtrl.toe.outputs(type='unitConversion')[0]
            toeUnitConversion.conversionFactor.set(-toeUnitConversion.conversionFactor.get())

    def _connectAttributes(self):
        footCtrl = self._controllers[0]
        inBankJnt = self.__revFootJoints[0]
        outBankJnt = self.__revFootJoints[1]
        heelJnt = self.__revFootJoints[2]
        toeJnt = self.__revFootJoints[3]
        toeTipJnt = self.__revFootJoints[4]
        ballJnt = self.__revFootJoints[5]

        rollRemap = cmds.createNode('remapValue', n='{0}roll_remap'.format(self._name))
        if self.__isSingleBone:
            rollRemap.inputMax.set(0.1)
        else:
            rollRemap.inputMax.set(90)
        rollRemap.outputMin.set(1)
        rollRemap.outputMax.set(0)

        rollBallClamp = cmds.createNode('clamp', n='{0}roll_ball_clamp'.format(self._name))
        rollBallClamp.maxR.set(90)
        ballMult = cmds.createNode('multDoubleLinear', n='{0}ball_mult'.format(self._name))
        ballAdd = cmds.createNode('addDoubleLinear', n='{0}ball_add'.format(self._name))
        ballClamp = cmds.createNode('clamp', n='{0}ball_clamp'.format(self._name))
        ballClamp.minR.set(-90)
        ballClamp.maxR.set(90)

        rollRev = cmds.createNode('reverse', n='{0}roll_rev'.format(self._name))
        toeTipMult = cmds.createNode('multDoubleLinear', n='{0}toeTip_mult'.format(self._name))
        toeTipAdd = cmds.createNode('addDoubleLinear', n='{0}toeTip_add'.format(self._name))
        toeTipClamp = cmds.createNode('clamp', n='{0}toeTip_clamp'.format(self._name))
        toeTipClamp.minR.set(-90)
        toeTipClamp.maxR.set(90)

        rollHeelClamp = cmds.createNode('clamp', n='{0}roll_heel_clamp'.format(self._name))
        rollHeelClamp.minR.set(-90)
        heelAdd = cmds.createNode('addDoubleLinear', n='{0}heel_add'.format(self._name))
        heelClamp = cmds.createNode('clamp', n='{0}heel_clamp'.format(self._name))
        heelClamp.minR.set(-90)
        heelClamp.maxR.set(90)

        bankInv = cmds.createNode('multDoubleLinear', n='{0}bank_inv'.format(self._name))
        bankInv.input2.set(-1)
        inBankClamp = cmds.createNode('clamp', n='{0}inBank_clamp'.format(self._name))
        inBankClamp.maxR.set(90)
        outBankClamp = cmds.createNode('clamp', n='{0}outBank_clamp'.format(self._name))
        outBankClamp.minR.set(-90)

        # Add dependency nodes to set
        self.addMembers(rollRemap, rollBallClamp, ballMult, ballAdd, ballClamp, rollRev, toeTipMult, toeTipAdd, toeTipClamp, rollHeelClamp, heelAdd, heelClamp, bankInv, inBankClamp, outBankClamp)

        # Roll and Lift connections #
        footCtrl.roll >> rollRemap.inputValue
        footCtrl.toeLiftStartAngle >> rollRemap.inputMin

        # Ball connections
        footCtrl.roll >> rollBallClamp.inputR
        rollBallClamp.outputR >> ballMult.input1
        rollRemap.outValue >> ballMult.input2
        ballMult.output >> ballAdd.input1
        footCtrl.ballLift >> ballAdd.input2
        ballAdd.output >> ballClamp.inputR
        ballClamp.outputR >> ballJnt.rx

        # ToeTip connections
        rollRemap.outValue >> rollRev.inputX
        footCtrl.roll >> toeTipMult.input1
        rollRev.outputX >> toeTipMult.input2
        toeTipMult.output >> toeTipAdd.input1
        footCtrl.toeLift >> toeTipAdd.input2
        toeTipAdd.output >> toeTipClamp.inputR
        toeTipClamp.outputR >> toeTipJnt.rx

        # Heel connections
        footCtrl.roll >> rollHeelClamp.inputR
        rollHeelClamp.outputR >> heelAdd.input1
        footCtrl.heelLift >> heelAdd.input2
        heelAdd.output >> heelClamp.inputR
        heelClamp.outputR >> heelJnt.rx

        # Twist connections #
        footCtrl.heelTwist >> heelJnt.ry
        footCtrl.ballTwist >> toeJnt.ry
        footCtrl.toeTwist >> toeTipJnt.ry

        # Toe connections #
        footCtrl.toe >> self.__toeIKPivotTrsf.ry

        # Bank connections #
        footCtrl.bank >> bankInv.input1
        bankInv.output >> inBankClamp.inputR
        inBankClamp.outputR >> inBankJnt.rz
        bankInv.output >> outBankClamp.inputR
        outBankClamp.outputR >> outBankJnt.rz

