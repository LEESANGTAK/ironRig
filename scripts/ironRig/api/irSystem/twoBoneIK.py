from maya.api import OpenMaya as om
from maya import cmds
from ..irGlobal import Controller
from ... import utils
from .system import System


class TwoBoneIK(System):
    def __init__(self, name='new', side=System.SIDE.CENTER, type=System.TYPE.IK_SYSTEM, joints=[], poleVectorPosition=None):
        super(TwoBoneIK, self).__init__(name, side, type, joints)

        self._poleVectorPosition = poleVectorPosition

        self._ikHandle = None
        self._ikHandleLoc = None

        self._ikHandleController = None
        self._poleVectorController = None

    @property
    def ikHandle(self):
        return self._ikHandle

    @property
    def ikHandleLocator(self):
        return self._ikHandleLoc

    @property
    def ikHandleController(self):
        return self._ikHandleController

    @property
    def poleVectorController(self):
        return self._poleVectorController

    def build(self):
        super(TwoBoneIK, self).build()
        self._createPoleVectorLine()

    def _buildSystems(self):
        super(TwoBoneIK, self)._buildSystems()

        orientY = cmds.getAttr('{}.jointOrientY'.format(self._joints[1]))
        if abs(orientY) <= 0.02:  # IK does not working if jointOrient has too small value in case straight joint chain
            if orientY > 0:
                cmds.setAttr('{}.preferredAngleY'.format(self._joints[1]), 90)
            elif orientY < 0:
                cmds.setAttr('{}.preferredAngleY'.format(self._joints[1]), -90)

        self._ikHandle = cmds.ikHandle(startJoint=self._joints[0], endEffector=self._joints[-1], solver='ikRPsolver', n='{}_ikh'.format(self.fullName))[0]
        self._ikHandleLoc = cmds.spaceLocator(n='{}_zero'.format(self._ikHandle))
        cmds.matchTransform(self._ikHandleLoc, self._ikHandle)
        utils.makeHierarchy(self._blbxGrp, self._ikHandleLoc, self._ikHandle)

        jnt0Loc = cmds.spaceLocator(n='{}_loc'.format(self._joints[0]))
        cmds.matchTransform(jnt0Loc, self._joints[0])
        utils.makeHierarchy(self._blbxGrp, jnt0Loc, self._joints[0])

    def _buildControls(self):
        self._ikHandleController = Controller('{0}_ctrl'.format(self._ikHandle), shape=Controller.SHAPE.CUBE)
        cmds.matchTransform(self._ikHandleController.zeroGrp, self._joints[-1], position=True)
        if self._negateScaleX:
            cmds.setAttr('{}.sx'.format(self._ikHandleController.zeroGrp), -1)
        cmds.pointConstraint(self._ikHandleController, utils.getParent(self._ikHandle), mo=True)
        cmds.orientConstraint(self._ikHandleController, self._joints[-1], mo=True)
        self._ikHandleController.lockHideChannels(['scale', 'visibility'])
        self.addMembers(self._ikHandleController.allNodes)

        startToEndVector = utils.getWorldPoint(self._joints[2]) - utils.getWorldPoint(self._joints[0])
        poleVector = self.getPoleVector(self._joints[0], self._joints[1], self._joints[2])
        polePos = utils.getWorldPoint(self._joints[1]) + (poleVector.normal() * startToEndVector.length())
        if self._poleVectorPosition:  # Override pole vector position if is given
            polePos = self._poleVectorPosition
        self._poleVectorController = Controller('{}_pv_ctrl'.format(self.fullName), shape=Controller.SHAPE.LOCATOR)
        cmds.xform(self._poleVectorController.zeroGrp, t=list(polePos)[:3], ws=True)
        if self._negateScaleX:
            cmds.setAttr('{}.sx'.format(self._poleVectorController.zeroGrp), -1)
        cmds.poleVectorConstraint(self._poleVectorController, self._ikHandle)
        self._poleVectorController.lockHideChannels(['rotate', 'scale', 'visibility'])
        self.addMembers(self._poleVectorController.allNodes)

        self._controllers = [self._ikHandleController, self._poleVectorController]
        cmds.parent([ctrl.zeroGrp for ctrl in self._controllers], self._controllerGrp)

    @staticmethod
    def getPoleVector(startObject, midObject, endObject):
        startVector = om.MVector(cmds.xform(startObject, q=True, rp=True, ws=True))
        midVector = om.MVector(cmds.xform(midObject, q=True, rp=True, ws=True))
        endVector = om.MVector(cmds.xform(endObject, q=True, rp=True, ws=True))

        startToEndCenter = (startVector + endVector) * 0.5
        poleVector = midVector - startToEndCenter

        return poleVector

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
        stretchGrp = cmds.createNode('transform', n='{}_stretch_grp'.format(self.fullName))
        cmds.addAttr(self._controllers[0], at='double', ln='length1', min=0.01, dv=1.0, keyable=True)
        cmds.addAttr(self._controllers[0], at='double', ln='length2', min=0.01, dv=1.0, keyable=True)
        cmds.addAttr(self._controllers[0], at='double', ln='stretch', min=0.0, max=1.0, dv=1.0, keyable=True)

        stretchInputNode = cmds.createNode('transform', n='{}_stretch_input'.format(self.fullName))
        cmds.addAttr(stretchInputNode, at='double', ln='inLength1')
        cmds.addAttr(stretchInputNode, at='double', ln='inLength2')
        cmds.addAttr(stretchInputNode, at='double', ln='inStretch')
        cmds.addAttr(stretchInputNode, at='double', ln='inCurLength')
        cmds.addAttr(stretchInputNode, at='double', ln='inLength1Orig')
        cmds.addAttr(stretchInputNode, at='double', ln='inLength2Orig')

        stretchOutputNode = cmds.createNode('transform', n='{}_stretch_output'.format(self.fullName))
        cmds.addAttr(stretchOutputNode, at='double', ln='outLength1')
        cmds.addAttr(stretchOutputNode, at='double', ln='outLength2')
        jnt0StretchLoc = cmds.spaceLocator(n='{}_stretch_loc'.format(self._joints[0]))
        jnt1StretchLoc = cmds.spaceLocator(n='{}_stretch_loc'.format(self._joints[1]))
        jnt2StretchLoc = cmds.spaceLocator(n='{}_stretch_loc'.format(self._joints[2]))

        cmds.matchTransform(jnt0StretchLoc, self._joints[0])
        cmds.matchTransform(jnt1StretchLoc, self._joints[1])
        cmds.matchTransform(jnt2StretchLoc, self._joints[2])

        cmds.parent([stretchInputNode, stretchOutputNode], stretchGrp)
        utils.makeHierarchy(stretchGrp, jnt0StretchLoc, jnt1StretchLoc, jnt2StretchLoc)
        cmds.parent(stretchGrp, self._blbxGrp)

        ikhCtrlLocalMtx = cmds.createNode('multMatrix', n='{}_local_multMtx'.format(self._controllers[0]))
        ikhCtrlLocalDist = cmds.createNode('distanceBetween', n='{}_local_dist'.format(self._controllers[0]))

        lenOrigAbsSquare = cmds.createNode('multiplyDivide', n='{}_lenOrigAbs_square'.format(self.fullName))
        cmds.setAttr('{}.operation'.format(lenOrigAbsSquare), 3)
        cmds.setAttr('{}.input2X'.format(lenOrigAbsSquare), 2)
        cmds.setAttr('{}.input2Y'.format(lenOrigAbsSquare), 2)
        lenOrigAbsSqrt = cmds.createNode('multiplyDivide', n='{}_lenOrigAbs_sqrt'.format(self.fullName))
        cmds.setAttr('{}.operation'.format(lenOrigAbsSqrt), 3)
        cmds.setAttr('{}.input2X'.format(lenOrigAbsSqrt), 0.5)
        cmds.setAttr('{}.input2Y'.format(lenOrigAbsSqrt), 0.5)

        len1OrigMul = cmds.createNode('multDoubleLinear', n='{}_length1Orig_mul'.format(self.fullName))
        len2OrigMul = cmds.createNode('multDoubleLinear', n='{}_length2Orig_mul'.format(self.fullName))

        len1OrigLen2OrigAdd = cmds.createNode('addDoubleLinear', n='{}_len1OrigLen2Orig_add'.format(self.fullName))

        stretchFactorDiv = cmds.createNode('multiplyDivide', n='{}_stretchFactor_div'.format(self.fullName))
        cmds.setAttr('{}.operation'.format(stretchFactorDiv), 2)

        stretchLen1OrigMul = cmds.createNode('multDoubleLinear', n='{}_stretchLen1Orig_mul'.format(self.fullName))
        stretchLen2OrigMul = cmds.createNode('multDoubleLinear', n='{}_stretchLen2Orig_mul'.format(self.fullName))

        stretchCond = cmds.createNode('condition', n='{}_stretch_cond'.format(self.fullName))
        cmds.setAttr('{}.operation'.format(stretchCond), 2)

        len1Blend = cmds.createNode('blendTwoAttr', n='{}_length1_blend'.format(self.fullName))
        len2Blend = cmds.createNode('blendTwoAttr', n='{}_length2_blend'.format(self.fullName))

        len1SignMult = cmds.createNode('multDoubleLinear', n='{}_length1Sign_mult'.format(self.fullName))
        cmds.setAttr('{}.input1'.format(len1SignMult), self._aimSign)
        len2SignMult = cmds.createNode('multDoubleLinear', n='{}_length2Sign_mult'.format(self.fullName))
        cmds.setAttr('{}.input1'.format(len2SignMult), self._aimSign)

        self.addMembers(ikhCtrlLocalMtx,
                        ikhCtrlLocalDist,
                        lenOrigAbsSquare,
                        lenOrigAbsSqrt,
                        len1OrigMul,
                        len2OrigMul,
                        len1OrigLen2OrigAdd,
                        stretchFactorDiv,
                        stretchLen1OrigMul,
                        stretchLen2OrigMul,
                        stretchCond,
                        len1Blend,
                        len2Blend,
                        len1SignMult,
                        len2SignMult)

        cmds.connectAttr('{}.worldMatrix'.format(self._ikHandleLoc), '{}.matrixIn[0]'.format(ikhCtrlLocalMtx))
        cmds.connectAttr('{}.worldInverseMatrix'.format(utils.getParent(self._joints[0])), '{}.matrixIn[1]'.format(ikhCtrlLocalMtx))
        cmds.connectAttr('{}.matrixSum'.format(ikhCtrlLocalMtx), '{}.inMatrix2'.format(ikhCtrlLocalDist))

        cmds.connectAttr('{}.distance'.format(ikhCtrlLocalDist), '{}.inCurLength'.format(stretchInputNode))
        cmds.connectAttr('{}.{}'.format(jnt1StretchLoc, 'translate{}'.format(self._aimAxis)), '{}.inLength1Orig'.format(stretchInputNode))
        cmds.connectAttr('{}.{}'.format(jnt2StretchLoc, 'translate{}'.format(self._aimAxis)), '{}.inLength2Orig'.format(stretchInputNode))
        cmds.connectAttr('{}.length1'.format(self._controllers[0]), '{}.inLength1'.format(stretchInputNode))
        cmds.connectAttr('{}.length2'.format(self._controllers[0]), '{}.inLength2'.format(stretchInputNode))
        cmds.connectAttr('{}.stretch'.format(self._controllers[0]), '{}.inStretch'.format(stretchInputNode))

        cmds.connectAttr('{}.inLength1Orig'.format(stretchInputNode), '{}.input1X'.format(lenOrigAbsSquare))
        cmds.connectAttr('{}.inLength2Orig'.format(stretchInputNode), '{}.input1Y'.format(lenOrigAbsSquare))
        cmds.connectAttr('{}.outputX'.format(lenOrigAbsSquare), '{}.input1X'.format(lenOrigAbsSqrt))
        cmds.connectAttr('{}.outputY'.format(lenOrigAbsSquare), '{}.input1Y'.format(lenOrigAbsSqrt))

        cmds.connectAttr('{}.inLength1'.format(stretchInputNode), '{}.input1'.format(len1OrigMul))
        cmds.connectAttr('{}.outputX'.format(lenOrigAbsSqrt), '{}.input2'.format(len1OrigMul))
        cmds.connectAttr('{}.inLength2'.format(stretchInputNode), '{}.input1'.format(len2OrigMul))
        cmds.connectAttr('{}.outputY'.format(lenOrigAbsSqrt), '{}.input2'.format(len2OrigMul))

        cmds.connectAttr('{}.output'.format(len1OrigMul), '{}.input1'.format(len1OrigLen2OrigAdd))
        cmds.connectAttr('{}.output'.format(len2OrigMul), '{}.input2'.format(len1OrigLen2OrigAdd))

        cmds.connectAttr('{}.inCurLength'.format(stretchInputNode), '{}.input1X'.format(stretchFactorDiv))
        cmds.connectAttr('{}.output'.format(len1OrigLen2OrigAdd), '{}.input2X'.format(stretchFactorDiv))

        cmds.connectAttr('{}.outputX'.format(stretchFactorDiv), '{}.input1'.format(stretchLen1OrigMul))
        cmds.connectAttr('{}.output'.format(len1OrigMul), '{}.input2'.format(stretchLen1OrigMul))
        cmds.connectAttr('{}.outputX'.format(stretchFactorDiv), '{}.input1'.format(stretchLen2OrigMul))
        cmds.connectAttr('{}.output'.format(len2OrigMul), '{}.input2'.format(stretchLen2OrigMul))

        cmds.connectAttr('{}.inCurLength'.format(stretchInputNode), '{}.firstTerm'.format(stretchCond))
        cmds.connectAttr('{}.output'.format(len1OrigLen2OrigAdd), '{}.secondTerm'.format(stretchCond))
        cmds.connectAttr('{}.output'.format(stretchLen1OrigMul), '{}.colorIfTrueR'.format(stretchCond))
        cmds.connectAttr('{}.output'.format(stretchLen2OrigMul), '{}.colorIfTrueG'.format(stretchCond))
        cmds.connectAttr('{}.output'.format(len1OrigMul), '{}.colorIfFalseR'.format(stretchCond))
        cmds.connectAttr('{}.output'.format(len2OrigMul), '{}.colorIfFalseG'.format(stretchCond))

        cmds.connectAttr('{}.inStretch'.format(stretchInputNode), '{}.attributesBlender'.format(len1Blend))
        cmds.connectAttr('{}.output'.format(len1OrigMul), '{}.input[0]'.format(len1Blend))
        cmds.connectAttr('{}.outColorR'.format(stretchCond), '{}.input[1]'.format(len1Blend))
        cmds.connectAttr('{}.inStretch'.format(stretchInputNode), '{}.attributesBlender'.format(len2Blend))
        cmds.connectAttr('{}.output'.format(len2OrigMul), '{}.input[0]'.format(len2Blend))
        cmds.connectAttr('{}.outColorG'.format(stretchCond), '{}.input[1]'.format(len2Blend))

        cmds.connectAttr('{}.output'.format(len1Blend), '{}.input2'.format(len1SignMult))
        cmds.connectAttr('{}.output'.format(len2Blend), '{}.input2'.format(len2SignMult))

        cmds.connectAttr('{}.output'.format(len1SignMult), '{}.outLength1'.format(stretchOutputNode))
        cmds.connectAttr('{}.output'.format(len2SignMult), '{}.outLength2'.format(stretchOutputNode))

        cmds.connectAttr('{}.outLength1'.format(stretchOutputNode), '{}.{}'.format(self._joints[1], 'translate{}'.format(self._aimAxis)))
        cmds.connectAttr('{}.outLength2'.format(stretchOutputNode), '{}.{}'.format(self._joints[2], 'translate{}'.format(self._aimAxis)))

    def setupPin(self):
        cmds.addAttr(self._controllers[-1], at='double', ln='pin', min=0.0, max=1.0, dv=0.0, keyable=True)

        pinGrp = cmds.createNode('transform', n='{}_pin_grp'.format(self.fullName))

        pinInputNode = cmds.createNode('transform', n='{}_pin_input'.format(self.fullName))
        cmds.addAttr(pinInputNode, at='double', ln='inPin')
        cmds.addAttr(pinInputNode, at='double', ln='inLength1')
        cmds.addAttr(pinInputNode, at='double', ln='inLength2')
        cmds.addAttr(pinInputNode, at='double', ln='inLength1Pin')
        cmds.addAttr(pinInputNode, at='double', ln='inLength2Pin')

        pinOutputNode = cmds.createNode('transform', n='{}_pin_output'.format(self.fullName))
        cmds.addAttr(pinOutputNode, at='double', ln='outLength1')
        cmds.addAttr(pinOutputNode, at='double', ln='outLength2')

        jnt0PinLoc = cmds.spaceLocator(n='{}_pin_loc'.format(self._joints[0]))
        jnt1PinLoc = cmds.spaceLocator(n='{}_pin_loc'.format(self._joints[1]))
        jnt2PinLoc = cmds.spaceLocator(n='{}_pin_loc'.format(self._joints[2]))

        cmds.pointConstraint(utils.getParent(self._joints[0]), jnt0PinLoc, mo=False)
        cmds.pointConstraint(self._controllers[-1], jnt1PinLoc, mo=False)
        cmds.pointConstraint(self._controllers[0], jnt2PinLoc, mo=False)

        cmds.parent([pinInputNode, pinOutputNode], pinGrp)
        utils.makeHierarchy(pinGrp, jnt0PinLoc, jnt1PinLoc, jnt2PinLoc)
        cmds.parent(pinGrp, self._blbxGrp)

        len1PinLocalDist = cmds.createNode('distanceBetween', n='{}_len1Pin_local_dist'.format(self.fullName))
        len2PinLocalDist = cmds.createNode('distanceBetween', n='{}_len2Pin_local_dist'.format(self.fullName))

        len1PinSignMult = cmds.createNode('multDoubleLinear', n='{}_len1PinSign_mult'.format(self.fullName))
        cmds.setAttr('{}.input1'.format(len1PinSignMult), self._aimSign)
        len2PinSignMult = cmds.createNode('multDoubleLinear', n='{}_len2PinSign_mult'.format(self.fullName))
        cmds.setAttr('{}.input1'.format(len2PinSignMult), self._aimSign)

        len1StretchPinBlend = cmds.createNode('blendTwoAttr', n='{}_len1StretchPin_blend'.format(self.fullName))
        len2StretchPinBlend = cmds.createNode('blendTwoAttr', n='{}_len2StretchPin_blend'.format(self.fullName))

        self.addMembers(len1PinLocalDist,
                        len2PinLocalDist,
                        len1PinSignMult,
                        len2PinSignMult,
                        len1StretchPinBlend,
                        len2StretchPinBlend)

        cmds.connectAttr('{}.matrix'.format(jnt1PinLoc), '{}.inMatrix2'.format(len1PinLocalDist))
        cmds.connectAttr('{}.matrix'.format(jnt2PinLoc), '{}.inMatrix2'.format(len2PinLocalDist))

        cmds.connectAttr('{}.distance'.format(len1PinLocalDist), '{}.inLength1Pin'.format(pinInputNode))
        cmds.connectAttr('{}.distance'.format(len2PinLocalDist), '{}.inLength2Pin'.format(pinInputNode))
        jnt1Inputs = cmds.listConnections('{}.{}'.format(self._joints[1], 'translate{}'.format(self._aimAxis)), destination=False, plugs=True)
        if jnt1Inputs:
            cmds.connectAttr(jnt1Inputs[0], '{}.inLength1'.format(pinInputNode))
        else:
            cmds.setAttr('{}.inLength1'.format(pinInputNode), cmds.getAttr('{}.{}'.format(self._joints[1], 'translate{}'.format(self._aimAxis))))
        jnt2Inputs = cmds.listConnections('{}.{}'.format(self._joints[2], 'translate{}'.format(self._aimAxis)), destination=False, plugs=True)
        if jnt2Inputs:
            cmds.connectAttr(jnt2Inputs[0], '{}.inLength2'.format(pinInputNode))
        else:
            cmds.setAttr('{}.inLength2'.format(pinInputNode), cmds.getAttr('{}.{}'.format(self._joints[2], 'translate{}'.format(self._aimAxis))))
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

        cmds.connectAttr('{}.outLength1'.format(pinOutputNode), '{}.{}'.format(self._joints[1], 'translate{}'.format(self._aimAxis)))
        cmds.connectAttr('{}.outLength2'.format(pinOutputNode), '{}.{}'.format(self._joints[2], 'translate{}'.format(self._aimAxis)))

    def buildStartController(self):
        startCtrl = Controller('{}_ctrl'.format(self._joints[0]), shape=Controller.SHAPE.SPHERE)
        cmds.matchTransform(startCtrl.zeroGrp, self._joints[0], position=True)
        cmds.matchTransform(startCtrl.zeroGrp, self._ikHandleController, rotation=True, scale=True)
        cmds.parentConstraint(startCtrl, utils.getParent(self._joints[0]), mo=True)
        startCtrl.lockHideChannels(['rotate', 'scale', 'visibility'])
        self._controllers.append(startCtrl)
        cmds.parent(startCtrl.zeroGrp, self._controllerGrp)
