from maya.api import OpenMaya as om
from maya import cmds
from ... import utils
from ..irGlobal import Controller
from .system import System


class FootIK(System):
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

    def __init__(self, name='new', side=System.SIDE.CENTER, joints=[], pivotLocators=[]):
        super(FootIK, self).__init__(name, side, System.TYPE.FOOTIK_SYSTEM, joints)

        self._isSingleBone = False  # In case of horse, elephant
        self._origJoints = None
        self._pivotLocators = pivotLocators
        self._revFootJoints = None
        self._footCtrl = None

        if len(joints) == 2:
            self._isSingleBone = True
            self._origJoints = joints
            self._addBallJoint()

    def _addBallJoint(self):
        ballJntPos = utils.getWorldPoint(self._joints[0]) + (utils.getWorldPoint(self._joints[1]) - utils.getWorldPoint(self._joints[0])) * 0.75
        ballJnt = cmds.createNode('joint', n='{}_ball'.format(self.shortName))
        cmds.xform(ballJnt, t=list(ballJntPos)[:3], ws=True)
        cmds.matchTransform(ballJnt, self._joints[0], rotation=True)
        utils.makeHierarchy(self._joints[0], ballJnt, self._joints[1])
        self._joints.insert(1, ballJnt)

    @property
    def joints(self):
        if self._isSingleBone:
            return self._origJoints
        else:
            return self._joints

    @joints.setter
    def joints(self, joints):
        self._joints = joints

    def revFootJoints(self):
        return self._revFootJoints

    def build(self):
        super(FootIK, self).build()
        if self._isSingleBone:
            cmds.setAttr('{}.toeLiftStartAngle'.format(self._footCtrl), 0)
            self._footCtrl.lockHideChannels(['toeLiftStartAngle', 'ballLift', 'ballTwist', 'toe'])

    def _buildSystems(self):
        super(FootIK, self)._buildSystems()
        self._revFootJoints = self._buildRevFootJoints()
        self._createIKs()
        cmds.parentConstraint(self._revFootJoints[-1], self._joints[0], mo=True)

    def _buildRevFootJoints(self):
        bankInLocPnt = utils.getWorldPoint(self._pivotLocators[0])
        bankOutLocPnt = utils.getWorldPoint(self._pivotLocators[1])
        heelLocPnt = utils.getWorldPoint(self._pivotLocators[2])
        toeTipLocPnt = utils.getWorldPoint(self._pivotLocators[3])
        ballPnt = utils.getWorldPoint(self._joints[1])
        anklePnt = utils.getWorldPoint(self._joints[0])

        vertPoints = [om.MPoint(item) for item in [heelLocPnt, bankInLocPnt, toeTipLocPnt, bankOutLocPnt]]
        faceVertCount = [4]
        faceVertOrder = [0, 1, 2, 3]
        fnMesh = om.MFnMesh()
        fnMesh.create(vertPoints, faceVertCount, faceVertOrder)
        toePnt, faceId = fnMesh.getClosestPoint(om.MPoint(ballPnt))
        cmds.delete(utils.getParent(fnMesh.fullPathName()))

        sumPivotVec = om.MVector()
        for pnt in [bankInLocPnt, bankOutLocPnt, heelLocPnt, toeTipLocPnt]:
            sumPivotVec += om.MVector(pnt)
        centerPnt = om.MPoint(sumPivotVec / 4.0)

        # Build orientation matrix for reverse foot joints
        oriMtx = utils.getOrientMatrix(utils.getWorldPoint(self._joints[0]),
                                       utils.getWorldPoint(self._joints[-1]),
                                       utils.getWorldPoint(self._joints[0]) + om.MVector.kYnegAxisVector)
        if centerPnt.x < 0:  # In case right side
            oriMtx = om.MMatrix(oriMtx)

        # Build reverse foot joints
        inBankRevJnt = cmds.createNode('joint', n='{}_inBank_revJnt'.format(self.shortName))
        cmds.xform(inBankRevJnt, matrix=oriMtx, ws=True)
        cmds.xform(inBankRevJnt, t=list(bankInLocPnt)[:3], ws=True)
        outBankRevJnt = cmds.createNode('joint', n='{}_outBank_revJnt'.format(self.shortName))
        cmds.xform(outBankRevJnt, matrix=oriMtx, ws=True)
        cmds.xform(outBankRevJnt, t=list(bankOutLocPnt)[:3], ws=True)
        heelRevJnt = cmds.createNode('joint', n='{}_heel_revJnt'.format(self.shortName))
        cmds.xform(heelRevJnt, matrix=oriMtx, ws=True)
        cmds.xform(heelRevJnt, t=list(heelLocPnt)[:3], ws=True)
        toeRevJnt = cmds.createNode('joint', n='{}_toe_revJnt'.format(self.shortName))
        cmds.xform(toeRevJnt, matrix=oriMtx, ws=True)
        cmds.xform(toeRevJnt, t=(toePnt.x, toePnt.y, toePnt.z), ws=True)
        toeTipRevJnt = cmds.createNode('joint', n='{}_toeTip_revJnt'.format(self.shortName))
        cmds.xform(toeTipRevJnt, matrix=oriMtx, ws=True)
        cmds.xform(toeTipRevJnt, t=list(toeTipLocPnt)[:3], ws=True)
        ballRevJnt = cmds.createNode('joint', n='{}_ball_revJnt'.format(self.shortName))
        cmds.xform(ballRevJnt, matrix=oriMtx, ws=True)
        cmds.xform(ballRevJnt, t=list(ballPnt)[:3], ws=True)
        ankleRevJnt = cmds.createNode('joint', n='{}_ankle_revJnt'.format(self.shortName))
        cmds.xform(ankleRevJnt, matrix=oriMtx, ws=True)
        cmds.xform(ankleRevJnt, t=list(anklePnt)[:3], ws=True)

        utils.makeHierarchy([inBankRevJnt, outBankRevJnt, heelRevJnt, toeRevJnt, toeTipRevJnt, ballRevJnt, ankleRevJnt])
        revFootJoints = [inBankRevJnt, outBankRevJnt, heelRevJnt, toeRevJnt, toeTipRevJnt, ballRevJnt, ankleRevJnt]

        cmds.makeIdentity(revFootJoints, apply=True)
        cmds.parent(inBankRevJnt, self._blbxGrp)

        return revFootJoints

    def _createIKs(self):
        ballIK = cmds.ikHandle(solver='ikSCsolver', n='{0}_ball_ikh'.format(self.shortName), startJoint=self._joints[0], ee=self._joints[1])[0]
        toeIK = cmds.ikHandle(solver='ikSCsolver', n='{0}_toe_ikh'.format(self.shortName), startJoint=self._joints[1], ee=self._joints[2])[0]

        self._toeIKPivotTrsf = cmds.createNode('transform', n='{0}_pivot'.format(toeIK))
        cmds.matchTransform(self._toeIKPivotTrsf, self._joints[1])
        toeIKPivotTrsfZero = cmds.duplicate(self._toeIKPivotTrsf, n='{0}_zero'.format(toeIK))[0]

        utils.makeHierarchy(self._revFootJoints[-3], toeIKPivotTrsfZero, self._toeIKPivotTrsf, toeIK)
        cmds.parent(ballIK, self._revFootJoints[-2])

    def _buildControls(self):
        self._footCtrl = Controller(self.shortName, Controller.SHAPE.FOOT, size=5, direction=Controller.DIRECTION.Y)
        jointsMidVec = (utils.getWorldVector(self._joints[0]) + utils.getWorldVector(self._joints[-1])) * 0.5
        cmds.xform(self._footCtrl.zeroGrp, t=[jointsMidVec.x, 0, jointsMidVec.z], ws=True)
        if self._negateScaleX:
            cmds.setAttr('{}.sx'.format(self._footCtrl.zeroGrp), -1)
        cmds.parentConstraint(self._footCtrl, self._blbxGrp, mo=True)
        cmds.parent(self._footCtrl.zeroGrp, self._controllerGrp)
        self._footCtrl.lockHideChannels(['visibility'])
        self._controllers.append(self._footCtrl)
        self.addMembers(self._footCtrl.allNodes)

        for attrInfo in FootIK.ATTRS_INFO:
            cmds.addAttr(self._footCtrl, ln=attrInfo['name'], at='float', min=attrInfo['min'], max=attrInfo['max'], dv=attrInfo['default'], keyable=True)

        self._connectAttributes()

        if self._negateScaleX:
            toeUnitConversion = cmds.listConnections('{}.toe'.format(self._footCtrl), source=False, type='unitConversion')[0]
            cmds.setAttr('{}.conversionFactor'.format(toeUnitConversion), -cmds.getAttr('{}.conversionFactor'.format(toeUnitConversion)))

    def _connectAttributes(self):
        footCtrl = self._controllers[0]
        inBankJnt = self._revFootJoints[0]
        outBankJnt = self._revFootJoints[1]
        heelJnt = self._revFootJoints[2]
        toeJnt = self._revFootJoints[3]
        toeTipJnt = self._revFootJoints[4]
        ballJnt = self._revFootJoints[5]

        rollRemap = cmds.createNode('remapValue', n='{0}_roll_remap'.format(self.shortName))
        if self._isSingleBone:
            cmds.setAttr('{}.inputMax'.format(rollRemap), 0.1)
        else:
            cmds.setAttr('{}.inputMax'.format(rollRemap), 90)
        cmds.setAttr('{}.outputMin'.format(rollRemap), 1)
        cmds.setAttr('{}.outputMax'.format(rollRemap), 0)

        rollBallClamp = cmds.createNode('clamp', n='{0}_roll_ball_clamp'.format(self.shortName))
        cmds.setAttr('{}.maxR'.format(rollBallClamp), 90)
        ballMult = cmds.createNode('multDoubleLinear', n='{0}_ball_mult'.format(self.shortName))
        ballAdd = cmds.createNode('addDoubleLinear', n='{0}_ball_add'.format(self.shortName))
        ballClamp = cmds.createNode('clamp', n='{0}_ball_clamp'.format(self.shortName))
        cmds.setAttr('{}.minR'.format(ballClamp), -90)
        cmds.setAttr('{}.maxR'.format(ballClamp), 90)

        rollRev = cmds.createNode('reverse', n='{0}_roll_rev'.format(self.shortName))
        toeTipMult = cmds.createNode('multDoubleLinear', n='{0}_toeTip_mult'.format(self.shortName))
        toeTipAdd = cmds.createNode('addDoubleLinear', n='{0}_toeTip_add'.format(self.shortName))
        toeTipClamp = cmds.createNode('clamp', n='{0}_toeTip_clamp'.format(self.shortName))
        cmds.setAttr('{}.minR'.format(toeTipClamp), -90)
        cmds.setAttr('{}.maxR'.format(toeTipClamp), 90)

        rollHeelClamp = cmds.createNode('clamp', n='{0}_roll_heel_clamp'.format(self.shortName))
        cmds.setAttr('{}.minR'.format(rollHeelClamp), -90)
        heelAdd = cmds.createNode('addDoubleLinear', n='{0}_heel_add'.format(self.shortName))
        heelClamp = cmds.createNode('clamp', n='{0}_heel_clamp'.format(self.shortName))
        cmds.setAttr('{}.minR'.format(heelClamp), -90)
        cmds.setAttr('{}.maxR'.format(heelClamp), 90)

        bankInv = cmds.createNode('multDoubleLinear', n='{0}_bank_inv'.format(self.shortName))
        cmds.setAttr('{}.input2'.format(bankInv), -1)
        inBankClamp = cmds.createNode('clamp', n='{0}_inBank_clamp'.format(self.shortName))
        cmds.setAttr('{}.maxR'.format(inBankClamp), 90)
        outBankClamp = cmds.createNode('clamp', n='{0}_outBank_clamp'.format(self.shortName))
        cmds.setAttr('{}.minR'.format(outBankClamp), -90)

        # Add dependency nodes to set
        self.addMembers(rollRemap, rollBallClamp, ballMult, ballAdd, ballClamp, rollRev, toeTipMult, toeTipAdd, toeTipClamp, rollHeelClamp, heelAdd, heelClamp, bankInv, inBankClamp, outBankClamp)

        # Roll and Lift connections #
        cmds.connectAttr('{}.roll'.format(footCtrl), '{}.inputValue'.format(rollRemap))
        cmds.connectAttr('{}.toeLiftStartAngle'.format(footCtrl), '{}.inputMin'.format(rollRemap))

        # Ball connections
        cmds.connectAttr('{}.roll'.format(footCtrl), '{}.inputR'.format(rollBallClamp))
        cmds.connectAttr('{}.outputR'.format(rollBallClamp), '{}.input1'.format(ballMult))
        cmds.connectAttr('{}.outValue'.format(rollRemap), '{}.input2'.format(ballMult))
        cmds.connectAttr('{}.output'.format(ballMult), '{}.input1'.format(ballAdd))
        cmds.connectAttr('{}.ballLift'.format(footCtrl), '{}.input2'.format(ballAdd))
        cmds.connectAttr('{}.output'.format(ballAdd), '{}.inputR'.format(ballClamp))
        cmds.connectAttr('{}.outputR'.format(ballClamp), '{}.rx'.format(ballJnt))

        # ToeTip connections
        cmds.connectAttr('{}.outValue'.format(rollRemap), '{}.inputX'.format(rollRev))
        cmds.connectAttr('{}.roll'.format(footCtrl), '{}.input1'.format(toeTipMult))
        cmds.connectAttr('{}.outputX'.format(rollRev), '{}.input2'.format(toeTipMult))
        cmds.connectAttr('{}.output'.format(toeTipMult), '{}.input1'.format(toeTipAdd))
        cmds.connectAttr('{}.toeLift'.format(footCtrl), '{}.input2'.format(toeTipAdd))
        cmds.connectAttr('{}.output'.format(toeTipAdd), '{}.inputR'.format(toeTipClamp))
        cmds.connectAttr('{}.outputR'.format(toeTipClamp), '{}.rx'.format(toeTipJnt))

        # Heel connections
        cmds.connectAttr('{}.roll'.format(footCtrl), '{}.inputR'.format(rollHeelClamp))
        cmds.connectAttr('{}.outputR'.format(rollHeelClamp), '{}.input1'.format(heelAdd))
        cmds.connectAttr('{}.heelLift'.format(footCtrl), '{}.input2'.format(heelAdd))
        cmds.connectAttr('{}.output'.format(heelAdd), '{}.inputR'.format(heelClamp))
        cmds.connectAttr('{}.outputR'.format(heelClamp), '{}.rx'.format(heelJnt))

        # Twist connections #
        cmds.connectAttr('{}.heelTwist'.format(footCtrl), '{}.ry'.format(heelJnt))
        cmds.connectAttr('{}.ballTwist'.format(footCtrl), '{}.ry'.format(toeJnt))
        cmds.connectAttr('{}.toeTwist'.format(footCtrl), '{}.ry'.format(toeTipJnt))

        # Toe connections #
        cmds.connectAttr('{}.toe'.format(footCtrl), '{}.rz'.format(self._toeIKPivotTrsf))

        # Bank connections #
        cmds.connectAttr('{}.bank'.format(footCtrl), '{}.input1'.format(bankInv))
        cmds.connectAttr('{}.output'.format(bankInv), '{}.inputR'.format(inBankClamp))
        cmds.connectAttr('{}.outputR'.format(inBankClamp), '{}.rz'.format(inBankJnt))
        cmds.connectAttr('{}.output'.format(bankInv), '{}.inputR'.format(outBankClamp))
        cmds.connectAttr('{}.outputR'.format(outBankClamp), '{}.rz'.format(outBankJnt))
