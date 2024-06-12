from maya import cmds
from ..irGlobal.controller import Controller
from ... import utils
from .system import System
from .twoBoneIK import TwoBoneIK


class ThreeBoneIK(System):
    def __init__(self, name='new', side=System.SIDE.CENTER, joints=[], poleVectorPosition=None):
        super().__init__(name, side, System.TYPE.IK_SYSTEM, joints)

        self._poleVectorPosition = poleVectorPosition

        self._hindJoints = None

        self._hindIkHandle = None
        self._calfIkHandle = None
        self._ankleIkHandle = None
        self._ikHandleLoc = None

        self._ikHandleController = None
        self._poleVectorController = None

    @property
    def ikHandle(self):
        return self._ankleIkHandle

    @property
    def ikHandleLocator(self):
        return self._ikHandleLoc

    @property
    def ikHandleController(self):
        return self._ikHandleController

    @property
    def poleVectorController(self):
        return self._poleVectorController
    @property
    def poleVectorPosition(self):
        return self._poleVectorPosition

    @poleVectorPosition.setter
    def poleVectorPosition(self, position):
        cmds.xform(self._poleVectorController.zeroGrp, t=list(position)[:3], ws=True)
        self._poleVectorPosition = position

    def build(self):
        super().build()
        self._createPoleVectorLine()

    def _buildSystems(self):
        super()._buildSystems()

        orientY = cmds.getAttr('{}.jointOrientY'.format(self._joints[1]))
        if abs(orientY) <= 0.02:  # IK does not working if jointOrient has too small value in case straight joint chain
            if orientY > 0:
                cmds.setAttr('{}.preferredAngleY'.format(self._joints[1]), 90)
            elif orientY < 0:
                cmds.setAttr('{}.preferredAngleY'.format(self._joints[1]), -90)

        self._hindJoints = utils.duplicateJointChain([self._joints[0], self._joints[1], self._joints[3]], name='hind_')
        cmds.setAttr('{}.tx'.format(self._hindJoints[1]), cmds.getAttr('{}.tx'.format(self._joints[2])))
        cmds.setAttr('{}.tx'.format(self._hindJoints[2]), cmds.getAttr('{}.tx'.format(self._joints[1])) + cmds.getAttr('{}.tx'.format(self._joints[3])))
        self._hindIkHandle = cmds.ikHandle(startJoint=self._hindJoints[0], endEffector=self._hindJoints[2], solver='ikRPsolver', n='{}_hind_ikh'.format(self.shortName))[0]
        hindIkhZeroGrp = utils.makeGroup(self._hindIkHandle, '{}_zero'.format(self._hindIkHandle))
        cmds.matchTransform(hindIkhZeroGrp, self._joints[3])
        cmds.parent(hindIkhZeroGrp, self._blbxGrp)

        self._calfIkHandle = cmds.ikHandle(startJoint=self._joints[0], endEffector=self._joints[2], solver='ikRPsolver', n='{}_calf_ikh'.format(self.shortName))[0]
        calfIkhZeroGrp = utils.makeGroup(self._calfIkHandle, '{}_zero'.format(self._calfIkHandle))
        self._calfRotGrp = cmds.createNode('transform', n='{}_rot'.format(self._calfIkHandle))
        cmds.matchTransform(self._calfRotGrp, self._joints[3])
        self._calfAutoRotGrp = cmds.createNode('transform', n='{}_autoRot'.format(self._calfIkHandle))
        cmds.matchTransform(self._calfAutoRotGrp, self._joints[3])
        utils.makeHierarchy(self._calfAutoRotGrp, self._calfRotGrp, calfIkhZeroGrp)
        self._ankleIkHandle = cmds.ikHandle(startJoint=self._joints[2], endEffector=self._joints[3], solver='ikSCsolver', n='{}_ankle_ikh'.format(self.shortName))[0]
        ankleIkhZeroGrp = utils.makeGroup(self._ankleIkHandle, '{}_zero'.format(self._ankleIkHandle))
        self._ikHandleLoc = cmds.spaceLocator(n='{}_ikh_loc'.format(self.shortName))[0]
        cmds.matchTransform(self._ikHandleLoc, self._joints[3])
        cmds.parent([self._calfAutoRotGrp, ankleIkhZeroGrp], self._ikHandleLoc)
        cmds.parent(self._ikHandleLoc, self._blbxGrp)

        jnt0Loc = cmds.spaceLocator(n='{}_loc'.format(self._joints[0]))[0]
        cmds.matchTransform(jnt0Loc, self._joints[0])
        cmds.parent([self._joints[0], self._hindJoints[0]], jnt0Loc)
        cmds.parent(jnt0Loc, self._blbxGrp)

    def _buildControls(self):
        self._ikHandleController = Controller(self._ankleIkHandle, shape=Controller.SHAPE.CUBE)
        cmds.matchTransform(self._ikHandleController.zeroGrp, self._joints[-1], position=True)
        if self._mirrorTranslate:
            cmds.setAttr('{}.sx'.format(self._ikHandleController.zeroGrp), -1)
        cmds.pointConstraint(self._ikHandleController, self._ikHandleLoc, mo=True)
        cmds.pointConstraint(self._ikHandleController, utils.getParent(self._hindIkHandle), mo=True)
        cmds.orientConstraint(self._ikHandleController, self._joints[-1], mo=True)
        self._ikHandleController.lockHideChannels(['scale', 'visibility'])
        self.addMembers(self._ikHandleController.allNodes)
        cmds.addAttr(self._ikHandleController, ln='calfLift', at='double', dv=0.0, keyable=True)
        cmds.connectAttr('{}.calfLift'.format(self._ikHandleController), '{}.ry'.format(self._calfRotGrp))

        startToEndVector = utils.getWorldPoint(self._joints[2]) - utils.getWorldPoint(self._joints[0])
        poleVector = TwoBoneIK.getPoleVector(self._joints[0], self._joints[1], self._joints[2])
        polePos = utils.getWorldPoint(self._joints[1]) + (poleVector.normal() * startToEndVector.length())
        if self._poleVectorPosition:  # Override pole vector position if is given
            polePos = self._poleVectorPosition
        self._poleVectorController = Controller('{}_pv'.format(self.shortName), shape=Controller.SHAPE.LOCATOR)
        cmds.xform(self._poleVectorController.zeroGrp, t=list(polePos)[:3], ws=True)
        if self._mirrorTranslate:
            cmds.setAttr('{}.sx'.format(self._poleVectorController.zeroGrp), -1)

        cmds.poleVectorConstraint(self._poleVectorController, self._hindIkHandle)
        cmds.setAttr('{}.twist'.format(self._hindIkHandle), 180)
        cmds.orientConstraint(self._hindJoints[1], self._calfAutoRotGrp, mo=True)

        cmds.poleVectorConstraint(self._poleVectorController, self._calfIkHandle)
        self._poleVectorController.lockHideChannels(['rotate', 'scale', 'visibility'])
        self.addMembers(self._poleVectorController.allNodes)

        self._controllers = [self._ikHandleController, self._poleVectorController]
        cmds.parent([ctrl.zeroGrp for ctrl in self._controllers], self._controllerGrp)

    def _createPoleVectorLine(self):
        midJntDec = cmds.createNode('decomposeMatrix', n='{0}_dec'.format(self._joints[1]))
        poleCtrlDec = cmds.createNode('decomposeMatrix', n='{0}_dec'.format(self._controllers[-1]))
        poleLine = cmds.curve(n='{0}_line'.format(self._controllers[-1]), d=1, p=[(0, 0, 0), (0, 1, 0)])
        cmds.setAttr('{}.inheritsTransform'.format(poleLine), False)
        cmds.setAttr('{}.overrideEnabled'.format(poleLine), True)
        cmds.setAttr('{}.overrideDisplayType'.format(poleLine), 2)

        cmds.connectAttr('{}.worldMatrix'.format(self._joints[1]), '{}.inputMatrix'.format(midJntDec))
        cmds.connectAttr('{}.worldMatrix'.format(self._controllers[-1]), '{}.inputMatrix'.format(poleCtrlDec))
        cmds.connectAttr('{}.outputTranslate'.format(midJntDec), '{}.controlPoints[0]'.format(poleLine))
        cmds.connectAttr('{}.outputTranslate'.format(poleCtrlDec), '{}.controlPoints[1]'.format(poleLine))

        self.addMembers(midJntDec, poleCtrlDec)
        cmds.parent(poleLine, self._controllerGrp)

    def setupStretch(self):
        # Setup DAG
        stretchGrp = cmds.createNode('transform', n='{}_stretch_grp'.format(self.shortName))
        cmds.addAttr(self._controllers[0], at='double', ln='length1', min=0.01, dv=1.0, keyable=True)
        cmds.addAttr(self._controllers[0], at='double', ln='length2', min=0.01, dv=1.0, keyable=True)
        cmds.addAttr(self._controllers[0], at='double', ln='length3', min=0.01, dv=1.0, keyable=True)
        cmds.addAttr(self._controllers[0], at='double', ln='stretch', min=0.0, max=1.0, dv=1.0, keyable=True)

        stretchInputNode = cmds.createNode('transform', n='{}_stretch_input'.format(self.shortName))
        cmds.addAttr(stretchInputNode, at='double', ln='inLength1')
        cmds.addAttr(stretchInputNode, at='double', ln='inLength2')
        cmds.addAttr(stretchInputNode, at='double', ln='inLength3')
        cmds.addAttr(stretchInputNode, at='double', ln='inStretch')
        cmds.addAttr(stretchInputNode, at='double', ln='inCurLength')
        cmds.addAttr(stretchInputNode, at='double', ln='inLength1Orig')
        cmds.addAttr(stretchInputNode, at='double', ln='inLength2Orig')
        cmds.addAttr(stretchInputNode, at='double', ln='inLength3Orig')
        cmds.addAttr(stretchInputNode, at='double', ln='inHindLength1Orig')
        cmds.addAttr(stretchInputNode, at='double', ln='inHindLength2Orig')

        stretchOutputNode = cmds.createNode('transform', n='{}_stretch_output'.format(self.shortName))
        cmds.addAttr(stretchOutputNode, at='double', ln='outLength1')
        cmds.addAttr(stretchOutputNode, at='double', ln='outLength2')
        cmds.addAttr(stretchOutputNode, at='double', ln='outLength3')
        cmds.addAttr(stretchOutputNode, at='double', ln='outHindLength1')
        cmds.addAttr(stretchOutputNode, at='double', ln='outHindLength2')

        jnt0StretchLoc = cmds.spaceLocator(n='{}_stretch_loc'.format(self._joints[0]))[0]
        jnt1StretchLoc = cmds.spaceLocator(n='{}_stretch_loc'.format(self._joints[1]))[0]
        jnt2StretchLoc = cmds.spaceLocator(n='{}_stretch_loc'.format(self._joints[2]))[0]
        jnt3StretchLoc = cmds.spaceLocator(n='{}_stretch_loc'.format(self._joints[3]))[0]
        hindJnt0StretchLoc = cmds.spaceLocator(n='{}_stretch_loc'.format(self._hindJoints[0]))[0]
        hindJnt1StretchLoc = cmds.spaceLocator(n='{}_stretch_loc'.format(self._hindJoints[1]))[0]
        hindJnt2StretchLoc = cmds.spaceLocator(n='{}_stretch_loc'.format(self._hindJoints[2]))[0]

        cmds.matchTransform(jnt0StretchLoc, self._joints[0])
        cmds.matchTransform(jnt1StretchLoc, self._joints[1])
        cmds.matchTransform(jnt2StretchLoc, self._joints[2])
        cmds.matchTransform(jnt3StretchLoc, self._joints[3])
        cmds.matchTransform(hindJnt0StretchLoc, self._hindJoints[0])
        cmds.matchTransform(hindJnt1StretchLoc, self._hindJoints[1])
        cmds.matchTransform(hindJnt2StretchLoc, self._hindJoints[2])

        cmds.parent([stretchInputNode, stretchOutputNode], stretchGrp)
        utils.makeHierarchy(stretchGrp, jnt0StretchLoc, jnt1StretchLoc, jnt2StretchLoc, jnt3StretchLoc)
        utils.makeHierarchy(stretchGrp, hindJnt0StretchLoc, hindJnt1StretchLoc, hindJnt2StretchLoc)
        cmds.parent(stretchGrp, self._blbxGrp)

        # Create DG nodes
        ikhCtrlLocalMtx = cmds.createNode('multMatrix', n='{}_local_multMtx'.format(self._controllers[0]))
        ikhCtrlLocalDist = cmds.createNode('distanceBetween', n='{}_local_dist'.format(self._controllers[0]))

        lenOrigAbsSquare = cmds.createNode('multiplyDivide', n='{}_lenOrigAbs_square'.format(self.shortName))
        cmds.setAttr('{}.operation'.format(lenOrigAbsSquare), 3)
        cmds.setAttr('{}.input2X'.format(lenOrigAbsSquare), 2)
        cmds.setAttr('{}.input2Y'.format(lenOrigAbsSquare), 2)
        cmds.setAttr('{}.input2Z'.format(lenOrigAbsSquare), 2)
        lenOrigAbsSqrt = cmds.createNode('multiplyDivide', n='{}_lenOrigAbs_sqrt'.format(self.shortName))
        cmds.setAttr('{}.operation'.format(lenOrigAbsSqrt), 3)
        cmds.setAttr('{}.input2X'.format(lenOrigAbsSqrt), 0.5)
        cmds.setAttr('{}.input2Y'.format(lenOrigAbsSqrt), 0.5)
        cmds.setAttr('{}.input2Z'.format(lenOrigAbsSqrt), 0.5)
        hindLenOrigAbsSquare = cmds.createNode('multiplyDivide', n='{}_hindLenOrigAbs_square'.format(self.shortName))
        cmds.setAttr('{}.operation'.format(hindLenOrigAbsSquare), 3)
        cmds.setAttr('{}.input2X'.format(hindLenOrigAbsSquare), 2)
        cmds.setAttr('{}.input2Y'.format(hindLenOrigAbsSquare), 2)
        hindLenOrigAbsSqrt = cmds.createNode('multiplyDivide', n='{}_hindLenOrigAbs_sqrt'.format(self.shortName))
        cmds.setAttr('{}.operation'.format(hindLenOrigAbsSqrt), 3)
        cmds.setAttr('{}.input2X'.format(hindLenOrigAbsSqrt), 0.5)
        cmds.setAttr('{}.input2Y'.format(hindLenOrigAbsSqrt), 0.5)

        len1OrigMul = cmds.createNode('multDoubleLinear', n='{}_length1Orig_mul'.format(self.shortName))
        len2OrigMul = cmds.createNode('multDoubleLinear', n='{}_length2Orig_mul'.format(self.shortName))
        len3OrigMul = cmds.createNode('multDoubleLinear', n='{}_length3Orig_mul'.format(self.shortName))

        wholeLenOrigAdd = cmds.createNode('plusMinusAverage', n='{}_wholeLenOrig_add'.format(self.shortName))

        stretchFactorDiv = cmds.createNode('multiplyDivide', n='{}_stretchFactor_div'.format(self.shortName))
        cmds.setAttr('{}.operation'.format(stretchFactorDiv), 2)

        stretchLen1OrigMul = cmds.createNode('multDoubleLinear', n='{}_stretchLen1Orig_mul'.format(self.shortName))
        stretchLen2OrigMul = cmds.createNode('multDoubleLinear', n='{}_stretchLen2Orig_mul'.format(self.shortName))
        stretchLen3OrigMul = cmds.createNode('multDoubleLinear', n='{}_stretchLen3Orig_mul'.format(self.shortName))
        stretchHindLen1OrigMul = cmds.createNode('multDoubleLinear', n='{}_stretchHindLen1Orig_mul'.format(self.shortName))
        stretchHindLen2OrigMul = cmds.createNode('multDoubleLinear', n='{}_stretchHindLen2Orig_mul'.format(self.shortName))

        stretchCond = cmds.createNode('condition', n='{}_stretch_cond'.format(self.shortName))
        cmds.setAttr('{}.operation'.format(stretchCond), 2)
        hindStretchCond = cmds.createNode('condition', n='{}_hindStretch_cond'.format(self.shortName))
        cmds.setAttr('{}.operation'.format(hindStretchCond), 2)

        len1Blend = cmds.createNode('blendTwoAttr', n='{}_length1_blend'.format(self.shortName))
        len2Blend = cmds.createNode('blendTwoAttr', n='{}_length2_blend'.format(self.shortName))
        len3Blend = cmds.createNode('blendTwoAttr', n='{}_length3_blend'.format(self.shortName))
        hindLen1Blend = cmds.createNode('blendTwoAttr', n='{}_hindLength1_blend'.format(self.shortName))
        hindLen2Blend = cmds.createNode('blendTwoAttr', n='{}_hindLength2_blend'.format(self.shortName))

        len1SignMult = cmds.createNode('multDoubleLinear', n='{}_length1Sign_mult'.format(self.shortName))
        cmds.setAttr('{}.input1'.format(len1SignMult), self._aimSign)
        len2SignMult = cmds.createNode('multDoubleLinear', n='{}_length2Sign_mult'.format(self.shortName))
        cmds.setAttr('{}.input1'.format(len2SignMult), self._aimSign)
        len3SignMult = cmds.createNode('multDoubleLinear', n='{}_length3Sign_mult'.format(self.shortName))
        cmds.setAttr('{}.input1'.format(len3SignMult), self._aimSign)
        hindLen1SignMult = cmds.createNode('multDoubleLinear', n='{}_hindLength1Sign_mult'.format(self.shortName))
        cmds.setAttr('{}.input1'.format(hindLen1SignMult), self._aimSign)
        hindLen2SignMult = cmds.createNode('multDoubleLinear', n='{}_hindLength2Sign_mult'.format(self.shortName))
        cmds.setAttr('{}.input1'.format(hindLen2SignMult), self._aimSign)

        # Connect nodes
        cmds.connectAttr('{}.worldMatrix'.format(self._ikHandleLoc), '{}.matrixIn[0]'.format(ikhCtrlLocalMtx))
        cmds.connectAttr('{}.worldInverseMatrix'.format(utils.getParent(self._joints[0])), '{}.matrixIn[1]'.format(ikhCtrlLocalMtx))
        cmds.connectAttr('{}.matrixSum'.format(ikhCtrlLocalMtx), '{}.inMatrix2'.format(ikhCtrlLocalDist))

        cmds.connectAttr('{}.distance'.format(ikhCtrlLocalDist), '{}.inCurLength'.format(stretchInputNode))
        cmds.connectAttr('{}.{}'.format(jnt1StretchLoc, 'translate{}'.format(self._aimAxis)), '{}.inLength1Orig'.format(stretchInputNode))
        cmds.connectAttr('{}.{}'.format(jnt2StretchLoc, 'translate{}'.format(self._aimAxis)), '{}.inLength2Orig'.format(stretchInputNode))
        cmds.connectAttr('{}.{}'.format(jnt3StretchLoc, 'translate{}'.format(self._aimAxis)), '{}.inLength3Orig'.format(stretchInputNode))
        cmds.connectAttr('{}.{}'.format(hindJnt1StretchLoc, 'translate{}'.format(self._aimAxis)), '{}.inHindLength1Orig'.format(stretchInputNode))
        cmds.connectAttr('{}.{}'.format(hindJnt2StretchLoc, 'translate{}'.format(self._aimAxis)), '{}.inHindLength2Orig'.format(stretchInputNode))
        cmds.connectAttr('{}.length1'.format(self._controllers[0]), '{}.inLength1'.format(stretchInputNode))
        cmds.connectAttr('{}.length2'.format(self._controllers[0]), '{}.inLength2'.format(stretchInputNode))
        cmds.connectAttr('{}.length3'.format(self._controllers[0]), '{}.inLength3'.format(stretchInputNode))
        cmds.connectAttr('{}.stretch'.format(self._controllers[0]), '{}.inStretch'.format(stretchInputNode))

        # Convert negative value to positive value
        cmds.connectAttr('{}.inLength1Orig'.format(stretchInputNode), '{}.input1X'.format(lenOrigAbsSquare))
        cmds.connectAttr('{}.inLength2Orig'.format(stretchInputNode), '{}.input1Y'.format(lenOrigAbsSquare))
        cmds.connectAttr('{}.inLength3Orig'.format(stretchInputNode), '{}.input1Z'.format(lenOrigAbsSquare))
        cmds.connectAttr('{}.inHindLength1Orig'.format(stretchInputNode), '{}.input1X'.format(hindLenOrigAbsSquare))
        cmds.connectAttr('{}.inHindLength2Orig'.format(stretchInputNode), '{}.input1Y'.format(hindLenOrigAbsSquare))
        cmds.connectAttr('{}.outputX'.format(lenOrigAbsSquare), '{}.input1X'.format(lenOrigAbsSqrt))
        cmds.connectAttr('{}.outputY'.format(lenOrigAbsSquare), '{}.input1Y'.format(lenOrigAbsSqrt))
        cmds.connectAttr('{}.outputZ'.format(lenOrigAbsSquare), '{}.input1Z'.format(lenOrigAbsSqrt))
        cmds.connectAttr('{}.outputX'.format(hindLenOrigAbsSquare), '{}.input1X'.format(hindLenOrigAbsSqrt))
        cmds.connectAttr('{}.outputY'.format(hindLenOrigAbsSquare), '{}.input1Y'.format(hindLenOrigAbsSqrt))

        cmds.connectAttr('{}.inLength1'.format(stretchInputNode), '{}.input1'.format(len1OrigMul))
        cmds.connectAttr('{}.outputX'.format(lenOrigAbsSqrt), '{}.input2'.format(len1OrigMul))
        cmds.connectAttr('{}.inLength2'.format(stretchInputNode), '{}.input1'.format(len2OrigMul))
        cmds.connectAttr('{}.outputY'.format(lenOrigAbsSqrt), '{}.input2'.format(len2OrigMul))
        cmds.connectAttr('{}.inLength3'.format(stretchInputNode), '{}.input1'.format(len3OrigMul))
        cmds.connectAttr('{}.outputZ'.format(lenOrigAbsSqrt), '{}.input2'.format(len3OrigMul))

        # Sum all length
        cmds.connectAttr('{}.output'.format(len1OrigMul), '{}.input1D[0]'.format(wholeLenOrigAdd))
        cmds.connectAttr('{}.output'.format(len2OrigMul), '{}.input1D[1]'.format(wholeLenOrigAdd))
        cmds.connectAttr('{}.output'.format(len3OrigMul), '{}.input1D[2]'.format(wholeLenOrigAdd))

        cmds.connectAttr('{}.inCurLength'.format(stretchInputNode), '{}.input1X'.format(stretchFactorDiv))
        cmds.connectAttr('{}.output1D'.format(wholeLenOrigAdd), '{}.input2X'.format(stretchFactorDiv))

        # Scale the orignal length
        cmds.connectAttr('{}.outputX'.format(stretchFactorDiv), '{}.input1'.format(stretchLen1OrigMul))
        cmds.connectAttr('{}.output'.format(len1OrigMul), '{}.input2'.format(stretchLen1OrigMul))
        cmds.connectAttr('{}.outputX'.format(stretchFactorDiv), '{}.input1'.format(stretchLen2OrigMul))
        cmds.connectAttr('{}.output'.format(len2OrigMul), '{}.input2'.format(stretchLen2OrigMul))
        cmds.connectAttr('{}.outputX'.format(stretchFactorDiv), '{}.input1'.format(stretchLen3OrigMul))
        cmds.connectAttr('{}.output'.format(len3OrigMul), '{}.input2'.format(stretchLen3OrigMul))
        cmds.connectAttr('{}.outputX'.format(stretchFactorDiv), '{}.input1'.format(stretchHindLen1OrigMul))
        cmds.connectAttr('{}.outputX'.format(hindLenOrigAbsSqrt), '{}.input2'.format(stretchHindLen1OrigMul))
        cmds.connectAttr('{}.outputX'.format(stretchFactorDiv), '{}.input1'.format(stretchHindLen2OrigMul))
        cmds.connectAttr('{}.outputY'.format(hindLenOrigAbsSqrt), '{}.input2'.format(stretchHindLen2OrigMul))

        cmds.connectAttr('{}.inCurLength'.format(stretchInputNode), '{}.firstTerm'.format(stretchCond))
        cmds.connectAttr('{}.output1D'.format(wholeLenOrigAdd), '{}.secondTerm'.format(stretchCond))
        cmds.connectAttr('{}.output'.format(stretchLen1OrigMul), '{}.colorIfTrueR'.format(stretchCond))
        cmds.connectAttr('{}.output'.format(stretchLen2OrigMul), '{}.colorIfTrueG'.format(stretchCond))
        cmds.connectAttr('{}.output'.format(stretchLen3OrigMul), '{}.colorIfTrueB'.format(stretchCond))
        cmds.connectAttr('{}.output'.format(len1OrigMul), '{}.colorIfFalseR'.format(stretchCond))
        cmds.connectAttr('{}.output'.format(len2OrigMul), '{}.colorIfFalseG'.format(stretchCond))
        cmds.connectAttr('{}.output'.format(len3OrigMul), '{}.colorIfFalseB'.format(stretchCond))
        cmds.connectAttr('{}.inCurLength'.format(stretchInputNode), '{}.firstTerm'.format(hindStretchCond))
        cmds.connectAttr('{}.output1D'.format(wholeLenOrigAdd), '{}.secondTerm'.format(hindStretchCond))
        cmds.connectAttr('{}.output'.format(stretchHindLen1OrigMul), '{}.colorIfTrueR'.format(hindStretchCond))
        cmds.connectAttr('{}.output'.format(stretchHindLen2OrigMul), '{}.colorIfTrueG'.format(hindStretchCond))
        cmds.connectAttr('{}.outputX'.format(hindLenOrigAbsSqrt), '{}.colorIfFalseR'.format(hindStretchCond))
        cmds.connectAttr('{}.outputY'.format(hindLenOrigAbsSqrt), '{}.colorIfFalseG'.format(hindStretchCond))

        cmds.connectAttr('{}.inStretch'.format(stretchInputNode), '{}.attributesBlender'.format(len1Blend))
        cmds.connectAttr('{}.output'.format(len1OrigMul), '{}.input[0]'.format(len1Blend))
        cmds.connectAttr('{}.outColorR'.format(stretchCond), '{}.input[1]'.format(len1Blend))
        cmds.connectAttr('{}.inStretch'.format(stretchInputNode), '{}.attributesBlender'.format(len2Blend))
        cmds.connectAttr('{}.output'.format(len2OrigMul), '{}.input[0]'.format(len2Blend))
        cmds.connectAttr('{}.outColorG'.format(stretchCond), '{}.input[1]'.format(len2Blend))
        cmds.connectAttr('{}.inStretch'.format(stretchInputNode), '{}.attributesBlender'.format(len3Blend))
        cmds.connectAttr('{}.output'.format(len3OrigMul), '{}.input[0]'.format(len3Blend))
        cmds.connectAttr('{}.outColorB'.format(stretchCond), '{}.input[1]'.format(len3Blend))
        cmds.connectAttr('{}.inStretch'.format(stretchInputNode), '{}.attributesBlender'.format(hindLen1Blend))
        cmds.connectAttr('{}.outputX'.format(hindLenOrigAbsSqrt), '{}.input[0]'.format(hindLen1Blend))
        cmds.connectAttr('{}.outColorR'.format(hindStretchCond), '{}.input[1]'.format(hindLen1Blend))
        cmds.connectAttr('{}.inStretch'.format(stretchInputNode), '{}.attributesBlender'.format(hindLen2Blend))
        cmds.connectAttr('{}.outputY'.format(hindLenOrigAbsSqrt), '{}.input[0]'.format(hindLen2Blend))
        cmds.connectAttr('{}.outColorG'.format(hindStretchCond), '{}.input[1]'.format(hindLen2Blend))

        cmds.connectAttr('{}.output'.format(len1Blend), '{}.input2'.format(len1SignMult))
        cmds.connectAttr('{}.output'.format(len2Blend), '{}.input2'.format(len2SignMult))
        cmds.connectAttr('{}.output'.format(len3Blend), '{}.input2'.format(len3SignMult))
        cmds.connectAttr('{}.output'.format(hindLen1Blend), '{}.input2'.format(hindLen1SignMult))
        cmds.connectAttr('{}.output'.format(hindLen2Blend), '{}.input2'.format(hindLen2SignMult))

        cmds.connectAttr('{}.output'.format(len1SignMult), '{}.outLength1'.format(stretchOutputNode))
        cmds.connectAttr('{}.output'.format(len2SignMult), '{}.outLength2'.format(stretchOutputNode))
        cmds.connectAttr('{}.output'.format(len3SignMult), '{}.outLength3'.format(stretchOutputNode))
        cmds.connectAttr('{}.output'.format(hindLen1SignMult), '{}.outHindLength1'.format(stretchOutputNode))
        cmds.connectAttr('{}.output'.format(hindLen2SignMult), '{}.outHindLength2'.format(stretchOutputNode))

        cmds.connectAttr('{}.outLength1'.format(stretchOutputNode), '{}.{}'.format(self._joints[1], 'translate{}'.format(self._aimAxis)))
        cmds.connectAttr('{}.outLength2'.format(stretchOutputNode), '{}.{}'.format(self._joints[2], 'translate{}'.format(self._aimAxis)))
        cmds.connectAttr('{}.outLength3'.format(stretchOutputNode), '{}.{}'.format(self._joints[3], 'translate{}'.format(self._aimAxis)))
        cmds.connectAttr('{}.outHindLength1'.format(stretchOutputNode), '{}.{}'.format(self._hindJoints[1], 'translate{}'.format(self._aimAxis)))
        cmds.connectAttr('{}.outHindLength2'.format(stretchOutputNode), '{}.{}'.format(self._hindJoints[2], 'translate{}'.format(self._aimAxis)))

        self.addMembers(
            ikhCtrlLocalMtx,
            ikhCtrlLocalDist,
            lenOrigAbsSquare,
            lenOrigAbsSqrt,
            hindLenOrigAbsSquare,
            hindLenOrigAbsSqrt,
            len1OrigMul,
            len2OrigMul,
            len3OrigMul,
            wholeLenOrigAdd,
            stretchFactorDiv,
            stretchLen1OrigMul,
            stretchLen2OrigMul,
            stretchLen3OrigMul,
            stretchHindLen1OrigMul,
            stretchHindLen2OrigMul,
            stretchCond,
            hindStretchCond,
            len1Blend,
            len2Blend,
            len3Blend,
            hindLen1Blend,
            hindLen2Blend,
            len1SignMult,
            len2SignMult,
            len3SignMult,
            hindLen1SignMult,
            hindLen2SignMult
        )

    def setupPin(self):
        cmds.addAttr(self._controllers[-1], at='double', ln='pin', min=0.0, max=1.0, dv=0.0, keyable=True)

        pinGrp = cmds.createNode('transform', n='{}_pin_grp'.format(self.shortName))

        pinInputNode = cmds.createNode('transform', n='{}_pin_input'.format(self.shortName))
        cmds.addAttr(pinInputNode, at='double', ln='inPin')
        cmds.addAttr(pinInputNode, at='double', ln='inLength1')
        cmds.addAttr(pinInputNode, at='double', ln='inLength2')
        cmds.addAttr(pinInputNode, at='double', ln='inLength1Pin')
        cmds.addAttr(pinInputNode, at='double', ln='inLength2Pin')

        pinOutputNode = cmds.createNode('transform', n='{}_pin_output'.format(self.shortName))
        cmds.addAttr(pinOutputNode, at='double', ln='outLength1')
        cmds.addAttr(pinOutputNode, at='double', ln='outLength2')

        jnt0PinLoc = cmds.spaceLocator(n='{}_pin_loc'.format(self._joints[0]))[0]
        jnt1PinLoc = cmds.spaceLocator(n='{}_pin_loc'.format(self._joints[1]))[0]
        jnt2PinLoc = cmds.spaceLocator(n='{}_pin_loc'.format(self._joints[2]))[0]
        cmds.matchTransform(jnt2PinLoc, self._joints[2], position=True)

        cmds.pointConstraint(utils.getParent(self._joints[0]), jnt0PinLoc, mo=False)
        cmds.pointConstraint(self._controllers[-1], jnt1PinLoc, mo=False)
        cmds.pointConstraint(self._calfIkHandle, jnt2PinLoc, mo=True)

        cmds.parent([pinInputNode, pinOutputNode], pinGrp)
        utils.makeHierarchy(pinGrp, jnt0PinLoc, jnt1PinLoc, jnt2PinLoc)
        cmds.parent(pinGrp, self._blbxGrp)

        len1PinLocalDist = cmds.createNode('distanceBetween', n='{}_len1Pin_local_dist'.format(self.shortName))
        len2PinLocalDist = cmds.createNode('distanceBetween', n='{}_len2Pin_local_dist'.format(self.shortName))

        len1PinSignMult = cmds.createNode('multDoubleLinear', n='{}_len1PinSign_mult'.format(self.shortName))
        cmds.setAttr('{}.input1'.format(len1PinSignMult), self._aimSign)
        len2PinSignMult = cmds.createNode('multDoubleLinear', n='{}_len2PinSign_mult'.format(self.shortName))
        cmds.setAttr('{}.input1'.format(len2PinSignMult), self._aimSign)

        len1StretchPinBlend = cmds.createNode('blendTwoAttr', n='{}_len1StretchPin_blend'.format(self.shortName))
        len2StretchPinBlend = cmds.createNode('blendTwoAttr', n='{}_len2StretchPin_blend'.format(self.shortName))

        self.addMembers(
            len1PinLocalDist,
            len2PinLocalDist,
            len1PinSignMult,
            len2PinSignMult,
            len1StretchPinBlend,
            len2StretchPinBlend
        )

        cmds.connectAttr('{}.matrix'.format(jnt1PinLoc), '{}.inMatrix2'.format(len1PinLocalDist))
        cmds.connectAttr('{}.matrix'.format(jnt2PinLoc), '{}.inMatrix2'.format(len2PinLocalDist))

        cmds.connectAttr('{}.distance'.format(len1PinLocalDist), '{}.inLength1Pin'.format(pinInputNode))
        cmds.connectAttr('{}.distance'.format(len2PinLocalDist), '{}.inLength2Pin'.format(pinInputNode))
        jnt1Inputs = cmds.listConnections('{}.{}'.format(self._joints[1], 'translate{}'.format(self._aimAxis)), destination=False, plugs=True)
        if jnt1Inputs:
            cmds.connectAttr(jnt1Inputs[0], '{}.inLength1'.format(pinInputNode))
        else:
            cmds.setAttr('{}.inLength1'.format(pinInputNode), cmds.getAttr('{}.{}'.format(self._joints[1]), 'translate{}'.format(self._aimAxis)))
        jnt2Inputs = cmds.listConnections('{}.{}'.format(self._joints[2], 'translate{}'.format(self._aimAxis)), destination=False, plugs=True)
        if jnt2Inputs:
            cmds.connectAttr(jnt2Inputs[0], '{}.inLength2'.format(pinInputNode))
        else:
            cmds.setAttr('{}.inLength2'.format(pinInputNode), cmds.getAttr('{}.{}'.format(self._joints[2]), 'translate{}'.format(self._aimAxis)))
        cmds.connectAttr('{}.pin'.format(self._controllers[-1]), '{}.inPin'.format(pinInputNode))

        cmds.connectAttr('{}.inLength1Pin'.format(pinInputNode), '{}.input2'.format(len1PinSignMult))
        cmds.connectAttr('{}.inLength2Pin'.format(pinInputNode), '{}.input2'.format(len2PinSignMult))

        cmds.connectAttr('{}.inPin'.format(pinInputNode), '{}.attributesBlender'.format(len1StretchPinBlend))
        cmds.connectAttr('{}.inLength1'.format(pinInputNode), '{}.input[0]'.format(len1StretchPinBlend))
        cmds.connectAttr('{}.output'.format(len1PinSignMult), '{}.input[1]'.format(len1StretchPinBlend))

        cmds.connectAttr('{}.inPin'.format(pinInputNode), '{}.attributesBlender'.format(len2StretchPinBlend))
        cmds.connectAttr('{}.inLength2'.format(pinInputNode), '{}.input[0]'.format(len2StretchPinBlend))
        cmds.connectAttr('{}.output'.format(len2PinSignMult), '{}.input[1]'.format(len2StretchPinBlend))

        cmds.connectAttr('{}.output'.format(len1StretchPinBlend), '{}.outLength1'.format(pinOutputNode))
        cmds.connectAttr('{}.output'.format(len2StretchPinBlend), '{}.outLength2'.format(pinOutputNode))

        cmds.connectAttr('{}.outLength1'.format(pinOutputNode), '{}.{}'.format(self._joints[1]), 'translate{}'.format(self._aimAxis))
        cmds.connectAttr('{}.outLength2'.format(pinOutputNode), '{}.{}'.format(self._joints[2]), 'translate{}'.format(self._aimAxis))

    def buildRootController(self):
        startCtrl = Controller('{}_root'.format(self.shortName), shape=Controller.SHAPE.SPHERE)
        cmds.matchTransform(startCtrl.zeroGrp, self._joints[0], position=True)
        cmds.matchTransform(startCtrl.zeroGrp, self._ikHandleController, rotation=True, scale=True)
        cmds.parentConstraint(startCtrl, utils.getParent(self._joints[0]), mo=True)
        startCtrl.lockHideChannels(['rotate', 'scale', 'visibility'])
        self._controllers.append(startCtrl)
        cmds.parent(startCtrl.zeroGrp, self._controllerGrp)
