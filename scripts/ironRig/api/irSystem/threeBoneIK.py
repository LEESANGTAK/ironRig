from maya import cmds
from ..irGlobal import Controller
from ... import utils
from .system import System
from .twoBoneIK import TwoBoneIK


class ThreeBoneIK(System):
    def __init__(self, prefix='', joints=[], poleVectorPosition=None):
        super(ThreeBoneIK, self).__init__(prefix, joints)

        self.__poleVectorPosition = poleVectorPosition

        self.__hindJoints = None

        self.__hindIkHandle = None
        self.__calfIkHandle = None
        self.__ankleIkHandle = None
        self.__ikHandleLoc = None

        self.__ikHandleController = None
        self.__poleVectorController = None

    def ikHandle(self):
        return self.__ankleIkHandle

    def ikHandleLocator(self):
        return self.__ikHandleLoc

    def ikHandleController(self):
        return self.__ikHandleController

    def poleVectorController(self):
        return self.__poleVectorController

    def build(self):
        super(ThreeBoneIK, self).build()
        self.__createPoleVectorLine()

    def _buildSystems(self):
        super(ThreeBoneIK, self)._buildSystems()

        orientY = self._joints[1].jointOrientY.get()
        if abs(orientY) <= 0.02:  # IK does not working if jointOrient has too small value in case straight joint chain
            if orientY > 0:
                self._joints[1].preferredAngleY.set(90)
            elif orientY < 0:
                self._joints[1].preferredAngleY.set(-90)

        self.__hindJoints = utils.duplicateJointChain([self._joints[0], self._joints[1], self._joints[3]], prefix='hind_')
        self.__hindJoints[1].tx.set(self._joints[2].tx.get())
        self.__hindJoints[2].tx.set(self._joints[1].tx.get() + self._joints[3].tx.get())
        self.__hindIkHandle = cmds.ikHandle(startJoint=self.__hindJoints[0], endEffector=self.__hindJoints[2], solver='ikRPsolver', n='{}hind_ikh'.format(self._name))[0]
        hindIkhZeroGrp = utils.makeGroup(self.__hindIkHandle, '{}_zero'.format(self.__hindIkHandle))
        cmds.matchTransform(hindIkhZeroGrp, self._joints[3])
        self._blbxGrp | hindIkhZeroGrp

        self.__calfIkHandle = cmds.ikHandle(startJoint=self._joints[0], endEffector=self._joints[2], solver='ikRPsolver', n='{}calf_ikh'.format(self._name))[0]
        calfIkhZeroGrp = utils.makeGroup(self.__calfIkHandle, '{}_zero'.format(self.__calfIkHandle))
        self.__calfRotGrp = cmds.createNode('transform', n='{}_rot'.format(self.__calfIkHandle))
        cmds.matchTransform(self.__calfRotGrp, self._joints[3])
        self.__calfAutoRotGrp = cmds.createNode('transform', n='{}_autoRot'.format(self.__calfIkHandle))
        cmds.matchTransform(self.__calfAutoRotGrp, self._joints[3])
        self.__calfAutoRotGrp | self.__calfRotGrp | calfIkhZeroGrp
        self.__ankleIkHandle = cmds.ikHandle(startJoint=self._joints[2], endEffector=self._joints[3], solver='ikSCsolver', n='{}ankle_ikh'.format(self._name))[0]
        ankleIkhZeroGrp = utils.makeGroup(self.__ankleIkHandle, '{}_zero'.format(self.__ankleIkHandle))
        self.__ikHandleLoc = cmds.spaceLocator(n='{}ikh_loc'.format(self._name))
        cmds.matchTransform(self.__ikHandleLoc, self._joints[3])
        cmds.parent([self.__calfAutoRotGrp, ankleIkhZeroGrp], self.__ikHandleLoc)
        self._blbxGrp | self.__ikHandleLoc

        jnt0Loc = cmds.spaceLocator(n='{}_loc'.format(self._joints[0]))
        cmds.matchTransform(jnt0Loc, self._joints[0])
        cmds.parent([self._joints[0], self.__hindJoints[0]], jnt0Loc)
        self._blbxGrp | jnt0Loc

    def _buildControls(self):
        self.__ikHandleController = Controller('{0}_ctrl'.format(self.__ankleIkHandle), shape=Controller.SHAPE.CUBE)
        cmds.matchTransform(self.__ikHandleController.zeroGrp, self._joints[-1], position=True)
        if self._negateScaleX:
            self.__ikHandleController.zeroGrp.sx.set(-1)
        cmds.pointConstraint(self.__ikHandleController, self.__ikHandleLoc, mo=True)
        cmds.pointConstraint(self.__ikHandleController, self.__hindIkHandle.getParent(), mo=True)
        cmds.orientConstraint(self.__ikHandleController, self._joints[-1], mo=True)
        self.__ikHandleController.lockHideChannels(['scale', 'visibility'])
        self.addMembers(self.__ikHandleController.allNodes)
        cmds.addAttr(self.__ikHandleController, ln='calfLift', at='double', dv=0.0, keyable=True)
        self.__ikHandleController.calfLift >> self.__calfRotGrp.ry

        startToEndVector = utils.getWorldPoint(self._joints[2]) - utils.getWorldPoint(self._joints[0])
        poleVector = TwoBoneIK.getPoleVector(self._joints[0], self._joints[1], self._joints[2])
        polePos = utils.getWorldPoint(self._joints[1]) + (poleVector.normal() * startToEndVector.length())
        if self.__poleVectorPosition:  # Override pole vector position if is given
            polePos = self.__poleVectorPosition
        self.__poleVectorController = Controller('{}pv_ctrl'.format(self._name), shape=Controller.SHAPE.LOCATOR)
        cmds.xform(self.__poleVectorController.zeroGrp, t=polePos, ws=True)
        if self._negateScaleX:
            self.__poleVectorController.zeroGrp.sx.set(-1)

        cmds.poleVectorConstraint(self.__poleVectorController, self.__hindIkHandle)
        self.__hindIkHandle.twist.set(180)
        cmds.orientConstraint(self.__hindJoints[1], self.__calfAutoRotGrp, mo=True)

        cmds.poleVectorConstraint(self.__poleVectorController, self.__calfIkHandle)
        self.__poleVectorController.lockHideChannels(['rotate', 'scale', 'visibility'])
        self.addMembers(self.__poleVectorController.allNodes)

        self._controllers = [self.__ikHandleController, self.__poleVectorController]
        cmds.parent([ctrl.zeroGrp for ctrl in self._controllers], self._controllerGrp)

    def __createPoleVectorLine(self):
        midJntDec = cmds.createNode('decomposeMatrix', n='{0}_dec'.format(self._joints[1]))
        poleCtrlDec = cmds.createNode('decomposeMatrix', n='{0}_dec'.format(self._controllers[-1]))
        poleLine = cmds.curve(n='{0}_line'.format(self._controllers[-1]), d=1, p=[(0, 0, 0), (0, 1, 0)])
        poleLine.inheritsTransform.set(False)
        poleLine.overrideEnabled.set(True)
        poleLine.overrideDisplayType.set(2)

        self._joints[1].worldMatrix >> midJntDec.inputMatrix
        self._controllers[-1].worldMatrix >> poleCtrlDec.inputMatrix
        midJntDec.outputTranslate >> poleLine.controlPoints[0]
        poleCtrlDec.outputTranslate >> poleLine.controlPoints[1]

        self.addMembers(midJntDec, poleCtrlDec)
        self._controllerGrp | poleLine

    def setupStretch(self):
        # Setup DAG
        stretchGrp = cmds.createNode('transform', n='{}stretch_grp'.format(self._name))
        cmds.addAttr(self._controllers[0], at='double', ln='length1', min=0.01, dv=1.0, keyable=True)
        cmds.addAttr(self._controllers[0], at='double', ln='length2', min=0.01, dv=1.0, keyable=True)
        cmds.addAttr(self._controllers[0], at='double', ln='length3', min=0.01, dv=1.0, keyable=True)
        cmds.addAttr(self._controllers[0], at='double', ln='stretch', min=0.0, max=1.0, dv=1.0, keyable=True)

        stretchInputNode = cmds.createNode('transform', n='{}stretch_input'.format(self._name))
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

        stretchOutputNode = cmds.createNode('transform', n='{}stretch_output'.format(self._name))
        cmds.addAttr(stretchOutputNode, at='double', ln='outLength1')
        cmds.addAttr(stretchOutputNode, at='double', ln='outLength2')
        cmds.addAttr(stretchOutputNode, at='double', ln='outLength3')
        cmds.addAttr(stretchOutputNode, at='double', ln='outHindLength1')
        cmds.addAttr(stretchOutputNode, at='double', ln='outHindLength2')

        jnt0StretchLoc = cmds.spaceLocator(n='{}_stretch_loc'.format(self._joints[0]))
        jnt1StretchLoc = cmds.spaceLocator(n='{}_stretch_loc'.format(self._joints[1]))
        jnt2StretchLoc = cmds.spaceLocator(n='{}_stretch_loc'.format(self._joints[2]))
        jnt3StretchLoc = cmds.spaceLocator(n='{}_stretch_loc'.format(self._joints[3]))
        hindJnt0StretchLoc = cmds.spaceLocator(n='{}_stretch_loc'.format(self.__hindJoints[0]))
        hindJnt1StretchLoc = cmds.spaceLocator(n='{}_stretch_loc'.format(self.__hindJoints[1]))
        hindJnt2StretchLoc = cmds.spaceLocator(n='{}_stretch_loc'.format(self.__hindJoints[2]))

        cmds.matchTransform(jnt0StretchLoc, self._joints[0])
        cmds.matchTransform(jnt1StretchLoc, self._joints[1])
        cmds.matchTransform(jnt2StretchLoc, self._joints[2])
        cmds.matchTransform(jnt3StretchLoc, self._joints[3])
        cmds.matchTransform(hindJnt0StretchLoc, self.__hindJoints[0])
        cmds.matchTransform(hindJnt1StretchLoc, self.__hindJoints[1])
        cmds.matchTransform(hindJnt2StretchLoc, self.__hindJoints[2])

        cmds.parent([stretchInputNode, stretchOutputNode], stretchGrp)
        stretchGrp | jnt0StretchLoc | jnt1StretchLoc | jnt2StretchLoc | jnt3StretchLoc
        stretchGrp | hindJnt0StretchLoc | hindJnt1StretchLoc | hindJnt2StretchLoc
        self._blbxGrp | stretchGrp

        # Create DG nodes
        ikhCtrlLocalMtx = cmds.createNode('multMatrix', n='{}_local_multMtx'.format(self._controllers[0]))
        ikhCtrlLocalDist = cmds.createNode('distanceBetween', n='{}_local_dist'.format(self._controllers[0]))

        lenOrigAbsSquare = cmds.createNode('multiplyDivide', n='{}lenOrigAbs_square'.format(self._name))
        lenOrigAbsSquare.operation.set(3)
        lenOrigAbsSquare.input2X.set(2)
        lenOrigAbsSquare.input2Y.set(2)
        lenOrigAbsSquare.input2Z.set(2)
        lenOrigAbsSqrt = cmds.createNode('multiplyDivide', n='{}lenOrigAbs_sqrt'.format(self._name))
        lenOrigAbsSqrt.operation.set(3)
        lenOrigAbsSqrt.input2X.set(0.5)
        lenOrigAbsSqrt.input2Y.set(0.5)
        lenOrigAbsSqrt.input2Z.set(0.5)
        hindLenOrigAbsSquare = cmds.createNode('multiplyDivide', n='{}hindLenOrigAbs_square'.format(self._name))
        hindLenOrigAbsSquare.operation.set(3)
        hindLenOrigAbsSquare.input2X.set(2)
        hindLenOrigAbsSquare.input2Y.set(2)
        hindLenOrigAbsSqrt = cmds.createNode('multiplyDivide', n='{}hindLenOrigAbs_sqrt'.format(self._name))
        hindLenOrigAbsSqrt.operation.set(3)
        hindLenOrigAbsSqrt.input2X.set(0.5)
        hindLenOrigAbsSqrt.input2Y.set(0.5)

        len1OrigMul = cmds.createNode('multDoubleLinear', n='{}length1Orig_mul'.format(self._name))
        len2OrigMul = cmds.createNode('multDoubleLinear', n='{}length2Orig_mul'.format(self._name))
        len3OrigMul = cmds.createNode('multDoubleLinear', n='{}length3Orig_mul'.format(self._name))

        wholeLenOrigAdd = cmds.createNode('plusMinusAverage', n='{}wholeLenOrig_add'.format(self._name))

        stretchFactorDiv = cmds.createNode('multiplyDivide', n='{}stretchFactor_div'.format(self._name))
        stretchFactorDiv.operation.set(2)

        stretchLen1OrigMul = cmds.createNode('multDoubleLinear', n='{}stretchLen1Orig_mul'.format(self._name))
        stretchLen2OrigMul = cmds.createNode('multDoubleLinear', n='{}stretchLen2Orig_mul'.format(self._name))
        stretchLen3OrigMul = cmds.createNode('multDoubleLinear', n='{}stretchLen3Orig_mul'.format(self._name))
        stretchHindLen1OrigMul = cmds.createNode('multDoubleLinear', n='{}stretchHindLen1Orig_mul'.format(self._name))
        stretchHindLen2OrigMul = cmds.createNode('multDoubleLinear', n='{}stretchHindLen2Orig_mul'.format(self._name))

        stretchCond = cmds.createNode('condition', n='{}stretch_cond'.format(self._name))
        stretchCond.operation.set(2)
        hindStretchCond = cmds.createNode('condition', n='{}hindStretch_cond'.format(self._name))
        hindStretchCond.operation.set(2)

        len1Blend = cmds.createNode('blendTwoAttr', n='{}length1_blend'.format(self._name))
        len2Blend = cmds.createNode('blendTwoAttr', n='{}length2_blend'.format(self._name))
        len3Blend = cmds.createNode('blendTwoAttr', n='{}length3_blend'.format(self._name))
        hindLen1Blend = cmds.createNode('blendTwoAttr', n='{}hindLength1_blend'.format(self._name))
        hindLen2Blend = cmds.createNode('blendTwoAttr', n='{}hindLength2_blend'.format(self._name))

        len1SignMult = cmds.createNode('multDoubleLinear', n='{}length1Sign_mult'.format(self._name))
        len1SignMult.input1.set(self._aimSign)
        len2SignMult = cmds.createNode('multDoubleLinear', n='{}length2Sign_mult'.format(self._name))
        len2SignMult.input1.set(self._aimSign)
        len3SignMult = cmds.createNode('multDoubleLinear', n='{}length3Sign_mult'.format(self._name))
        len3SignMult.input1.set(self._aimSign)
        hindLen1SignMult = cmds.createNode('multDoubleLinear', n='{}hindLength1Sign_mult'.format(self._name))
        hindLen1SignMult.input1.set(self._aimSign)
        hindLen2SignMult = cmds.createNode('multDoubleLinear', n='{}hindLength2Sign_mult'.format(self._name))
        hindLen2SignMult.input1.set(self._aimSign)

        # Connect nodes
        self.__ikHandleLoc.worldMatrix >> ikhCtrlLocalMtx.matrixIn[0]
        self._joints[0].getParent().worldInverseMatrix >> ikhCtrlLocalMtx.matrixIn[1]
        ikhCtrlLocalMtx.matrixSum >> ikhCtrlLocalDist.inMatrix2

        ikhCtrlLocalDist.distance >> stretchInputNode.inCurLength
        jnt1StretchLoc.attr('translate{}'.format(self._aimAxis)) >> stretchInputNode.inLength1Orig
        jnt2StretchLoc.attr('translate{}'.format(self._aimAxis)) >> stretchInputNode.inLength2Orig
        jnt3StretchLoc.attr('translate{}'.format(self._aimAxis)) >> stretchInputNode.inLength3Orig
        hindJnt1StretchLoc.attr('translate{}'.format(self._aimAxis)) >> stretchInputNode.inHindLength1Orig
        hindJnt2StretchLoc.attr('translate{}'.format(self._aimAxis)) >> stretchInputNode.inHindLength2Orig
        self._controllers[0].length1 >> stretchInputNode.inLength1
        self._controllers[0].length2 >> stretchInputNode.inLength2
        self._controllers[0].length3 >> stretchInputNode.inLength3
        self._controllers[0].stretch >> stretchInputNode.inStretch

        # Convert negative value to positive value
        stretchInputNode.inLength1Orig >> lenOrigAbsSquare.input1X
        stretchInputNode.inLength2Orig >> lenOrigAbsSquare.input1Y
        stretchInputNode.inLength3Orig >> lenOrigAbsSquare.input1Z
        stretchInputNode.inHindLength1Orig >> hindLenOrigAbsSquare.input1X
        stretchInputNode.inHindLength2Orig >> hindLenOrigAbsSquare.input1Y
        lenOrigAbsSquare.outputX >> lenOrigAbsSqrt.input1X
        lenOrigAbsSquare.outputY >> lenOrigAbsSqrt.input1Y
        lenOrigAbsSquare.outputZ >> lenOrigAbsSqrt.input1Z
        hindLenOrigAbsSquare.outputX >> hindLenOrigAbsSqrt.input1X
        hindLenOrigAbsSquare.outputY >> hindLenOrigAbsSqrt.input1Y

        stretchInputNode.inLength1 >> len1OrigMul.input1
        lenOrigAbsSqrt.outputX >> len1OrigMul.input2
        stretchInputNode.inLength2 >> len2OrigMul.input1
        lenOrigAbsSqrt.outputY >> len2OrigMul.input2
        stretchInputNode.inLength3 >> len3OrigMul.input1
        lenOrigAbsSqrt.outputZ >> len3OrigMul.input2

        # Sum all length
        len1OrigMul.output >> wholeLenOrigAdd.input1D[0]
        len2OrigMul.output >> wholeLenOrigAdd.input1D[1]
        len3OrigMul.output >> wholeLenOrigAdd.input1D[2]

        stretchInputNode.inCurLength >> stretchFactorDiv.input1X
        wholeLenOrigAdd.output1D >> stretchFactorDiv.input2X

        # Scale the orignal length
        stretchFactorDiv.outputX >> stretchLen1OrigMul.input1
        len1OrigMul.output >> stretchLen1OrigMul.input2
        stretchFactorDiv.outputX >> stretchLen2OrigMul.input1
        len2OrigMul.output >> stretchLen2OrigMul.input2
        stretchFactorDiv.outputX >> stretchLen3OrigMul.input1
        len3OrigMul.output >> stretchLen3OrigMul.input2
        stretchFactorDiv.outputX >> stretchHindLen1OrigMul.input1
        hindLenOrigAbsSqrt.outputX >> stretchHindLen1OrigMul.input2
        stretchFactorDiv.outputX >> stretchHindLen2OrigMul.input1
        hindLenOrigAbsSqrt.outputY >> stretchHindLen2OrigMul.input2

        stretchInputNode.inCurLength >> stretchCond.firstTerm
        wholeLenOrigAdd.output1D >> stretchCond.secondTerm
        stretchLen1OrigMul.output >> stretchCond.colorIfTrueR
        stretchLen2OrigMul.output >> stretchCond.colorIfTrueG
        stretchLen3OrigMul.output >> stretchCond.colorIfTrueB
        len1OrigMul.output >> stretchCond.colorIfFalseR
        len2OrigMul.output >> stretchCond.colorIfFalseG
        len3OrigMul.output >> stretchCond.colorIfFalseB
        stretchInputNode.inCurLength >> hindStretchCond.firstTerm
        wholeLenOrigAdd.output1D >> hindStretchCond.secondTerm
        stretchHindLen1OrigMul.output >> hindStretchCond.colorIfTrueR
        stretchHindLen2OrigMul.output >> hindStretchCond.colorIfTrueG
        hindLenOrigAbsSqrt.outputX >> hindStretchCond.colorIfFalseR
        hindLenOrigAbsSqrt.outputY >> hindStretchCond.colorIfFalseG

        stretchInputNode.inStretch >> len1Blend.attributesBlender
        len1OrigMul.output >> len1Blend.input[0]
        stretchCond.outColorR >> len1Blend.input[1]
        stretchInputNode.inStretch >> len2Blend.attributesBlender
        len2OrigMul.output >> len2Blend.input[0]
        stretchCond.outColorG >> len2Blend.input[1]
        stretchInputNode.inStretch >> len3Blend.attributesBlender
        len3OrigMul.output >> len3Blend.input[0]
        stretchCond.outColorB >> len3Blend.input[1]
        stretchInputNode.inStretch >> hindLen1Blend.attributesBlender
        hindLenOrigAbsSqrt.outputX >> hindLen1Blend.input[0]
        hindStretchCond.outColorR >> hindLen1Blend.input[1]
        stretchInputNode.inStretch >> hindLen2Blend.attributesBlender
        hindLenOrigAbsSqrt.outputY >> hindLen2Blend.input[0]
        hindStretchCond.outColorG >> hindLen2Blend.input[1]

        len1Blend.output >> len1SignMult.input2
        len2Blend.output >> len2SignMult.input2
        len3Blend.output >> len3SignMult.input2
        hindLen1Blend.output >> hindLen1SignMult.input2
        hindLen2Blend.output >> hindLen2SignMult.input2

        len1SignMult.output >> stretchOutputNode.outLength1
        len2SignMult.output >> stretchOutputNode.outLength2
        len3SignMult.output >> stretchOutputNode.outLength3
        hindLen1SignMult.output >> stretchOutputNode.outHindLength1
        hindLen2SignMult.output >> stretchOutputNode.outHindLength2

        stretchOutputNode.outLength1 >> self._joints[1].attr('translate{}'.format(self._aimAxis))
        stretchOutputNode.outLength2 >> self._joints[2].attr('translate{}'.format(self._aimAxis))
        stretchOutputNode.outLength3 >> self._joints[3].attr('translate{}'.format(self._aimAxis))
        stretchOutputNode.outHindLength1 >> self.__hindJoints[1].attr('translate{}'.format(self._aimAxis))
        stretchOutputNode.outHindLength2 >> self.__hindJoints[2].attr('translate{}'.format(self._aimAxis))

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

        pinGrp = cmds.createNode('transform', n='{}pin_grp'.format(self._name))

        pinInputNode = cmds.createNode('transform', n='{}pin_input'.format(self._name))
        cmds.addAttr(pinInputNode, at='double', ln='inPin')
        cmds.addAttr(pinInputNode, at='double', ln='inLength1')
        cmds.addAttr(pinInputNode, at='double', ln='inLength2')
        cmds.addAttr(pinInputNode, at='double', ln='inLength1Pin')
        cmds.addAttr(pinInputNode, at='double', ln='inLength2Pin')

        pinOutputNode = cmds.createNode('transform', n='{}pin_output'.format(self._name))
        cmds.addAttr(pinOutputNode, at='double', ln='outLength1')
        cmds.addAttr(pinOutputNode, at='double', ln='outLength2')

        jnt0PinLoc = cmds.spaceLocator(n='{}_pin_loc'.format(self._joints[0]))
        jnt1PinLoc = cmds.spaceLocator(n='{}_pin_loc'.format(self._joints[1]))
        jnt2PinLoc = cmds.spaceLocator(n='{}_pin_loc'.format(self._joints[2]))
        cmds.matchTransform(jnt2PinLoc, self._joints[2], position=True)

        cmds.pointConstraint(self._joints[0].getParent(), jnt0PinLoc, mo=False)
        cmds.pointConstraint(self._controllers[-1], jnt1PinLoc, mo=False)
        cmds.pointConstraint(self.__calfIkHandle, jnt2PinLoc, mo=True)

        cmds.parent([pinInputNode, pinOutputNode], pinGrp)
        pinGrp | jnt0PinLoc | jnt1PinLoc | jnt2PinLoc
        self._blbxGrp | pinGrp

        len1PinLocalDist = cmds.createNode('distanceBetween', n='{}len1Pin_local_dist'.format(self._name))
        len2PinLocalDist = cmds.createNode('distanceBetween', n='{}len2Pin_local_dist'.format(self._name))

        len1PinSignMult = cmds.createNode('multDoubleLinear', n='{}len1PinSign_mult'.format(self._name))
        len1PinSignMult.input1.set(self._aimSign)
        len2PinSignMult = cmds.createNode('multDoubleLinear', n='{}len2PinSign_mult'.format(self._name))
        len2PinSignMult.input1.set(self._aimSign)

        len1StretchPinBlend = cmds.createNode('blendTwoAttr', n='{}len1StretchPin_blend'.format(self._name))
        len2StretchPinBlend = cmds.createNode('blendTwoAttr', n='{}len2StretchPin_blend'.format(self._name))

        self.addMembers(
            len1PinLocalDist,
            len2PinLocalDist,
            len1PinSignMult,
            len2PinSignMult,
            len1StretchPinBlend,
            len2StretchPinBlend
        )

        jnt1PinLoc.matrix >> len1PinLocalDist.inMatrix2
        jnt2PinLoc.matrix >> len2PinLocalDist.inMatrix2

        len1PinLocalDist.distance >> pinInputNode.inLength1Pin
        len2PinLocalDist.distance >> pinInputNode.inLength2Pin
        jnt1Inputs = self._joints[1].attr('translate{}'.format(self._aimAxis)).inputs(plugs=True)
        if jnt1Inputs:
            jnt1Inputs[0] >> pinInputNode.inLength1
        else:
            pinInputNode.inLength1.set(self._joints[1].attr('translate{}'.format(self._aimAxis)).get())
        jnt2Inputs = self._joints[2].attr('translate{}'.format(self._aimAxis)).inputs(plugs=True)
        if jnt2Inputs:
            jnt2Inputs[0] >> pinInputNode.inLength2
        else:
            pinInputNode.inLength2.set(self._joints[2].attr('translate{}'.format(self._aimAxis)).get())
        self._controllers[-1].pin >> pinInputNode.inPin

        pinInputNode.inLength1Pin >> len1PinSignMult.input2
        pinInputNode.inLength2Pin >> len2PinSignMult.input2

        pinInputNode.inPin >> len1StretchPinBlend.attributesBlender
        pinInputNode.inLength1 >> len1StretchPinBlend.input[0]
        len1PinSignMult.output >> len1StretchPinBlend.input[1]

        pinInputNode.inPin >> len2StretchPinBlend.attributesBlender
        pinInputNode.inLength2 >> len2StretchPinBlend.input[0]
        len2PinSignMult.output >> len2StretchPinBlend.input[1]

        len1StretchPinBlend.output >> pinOutputNode.outLength1
        len2StretchPinBlend.output >> pinOutputNode.outLength2

        pinOutputNode.outLength1 >> self._joints[1].attr('translate{}'.format(self._aimAxis))
        pinOutputNode.outLength2 >> self._joints[2].attr('translate{}'.format(self._aimAxis))

    def buildStartController(self):
        startCtrl = Controller('{}_ctrl'.format(self._joints[0]), shape=Controller.SHAPE.SPHERE)
        cmds.matchTransform(startCtrl.zeroGrp, self._joints[0], position=True)
        cmds.matchTransform(startCtrl.zeroGrp, self.__ikHandleController, rotation=True, scale=True)
        cmds.parentConstraint(startCtrl, self._joints[0].getParent(), mo=True)
        startCtrl.lockHideChannels(['rotate', 'scale', 'visibility'])
        self._controllers.append(startCtrl)
        cmds.parent(startCtrl.zeroGrp, self._controllerGrp)
