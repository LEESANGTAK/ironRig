import pymel.core as pm
from ..irGlobal import Controller
from ... import utils
from .system import System


class TwoBoneIK(System):
    def __init__(self, prefix='', joints=[], poleVectorPosition=None):
        super(TwoBoneIK, self).__init__(prefix, joints)

        self.__poleVectorPosition = poleVectorPosition

        self.__ikHandle = None
        self.__ikHandleLoc = None

        self.__ikHandleController = None
        self.__poleVectorController = None

    def ikHandle(self):
        return self.__ikHandle

    def ikHandleLocator(self):
        return self.__ikHandleLoc

    def ikHandleController(self):
        return self.__ikHandleController

    def poleVectorController(self):
        return self.__poleVectorController

    def build(self):
        super(TwoBoneIK, self).build()
        self.__createPoleVectorLine()

    def _buildSystems(self):
        super(TwoBoneIK, self)._buildSystems()
        self.__ikHandle = pm.ikHandle(startJoint=self._joints[0], endEffector=self._joints[-1], solver='ikRPsolver', n='{}ikh'.format(self._prefix))[0]
        self.__ikHandleLoc = pm.spaceLocator(n='{}_zero'.format(self.__ikHandle))
        pm.matchTransform(self.__ikHandleLoc, self.__ikHandle)
        pm.parent(self.__ikHandle, self.__ikHandleLoc)
        self._blbxGrp | self.__ikHandleLoc

        jnt0Loc = pm.spaceLocator(n='{}_loc'.format(self._joints[0]))
        pm.matchTransform(jnt0Loc, self._joints[0])
        self._blbxGrp | jnt0Loc | self._joints[0]

    def _buildControls(self):
        self.__ikHandleController = Controller('{0}_ctrl'.format(self.__ikHandle), shape=Controller.SHAPE.CUBE)
        pm.matchTransform(self.__ikHandleController.zeroGrp(), self._joints[-1], position=True)
        if self._negateScaleX:
            self.__ikHandleController.zeroGrp().sx.set(-1)
        pm.pointConstraint(self.__ikHandleController, self.__ikHandle.getParent(), mo=True)
        pm.orientConstraint(self.__ikHandleController, self._joints[-1], mo=True)
        self.__ikHandleController.lockHideChannels(['scale', 'visibility'])
        self.addMembers(self.__ikHandleController.controllerNode())

        startToEndVector = utils.getWorldPoint(self._joints[2]) - utils.getWorldPoint(self._joints[0])
        poleVector = self.getPoleVector(self._joints[0], self._joints[1], self._joints[2])
        polePos = utils.getWorldPoint(self._joints[1]) + (poleVector.normal() * startToEndVector.length())
        if self.__poleVectorPosition:  # Override pole vector position if is given
            polePos = self.__poleVectorPosition
        self.__poleVectorController = Controller('{}pv_ctrl'.format(self._prefix), shape=Controller.SHAPE.LOCATOR)
        pm.xform(self.__poleVectorController.zeroGrp(), t=polePos, ws=True)
        if self._negateScaleX:
            self.__poleVectorController.zeroGrp().sx.set(-1)
        pm.poleVectorConstraint(self.__poleVectorController, self.__ikHandle)
        self.__poleVectorController.lockHideChannels(['rotate', 'scale', 'visibility'])
        self.addMembers(self.__poleVectorController.controllerNode())

        self._controllers = [self.__ikHandleController, self.__poleVectorController]
        pm.parent([ctrl.zeroGrp() for ctrl in self._controllers], self._controllerGrp)

    @staticmethod
    def getPoleVector(startObject, midObject, endObject):
        startVector = pm.dt.Vector(pm.xform(startObject, q=True, rp=True, ws=True))
        midVector = pm.dt.Vector(pm.xform(midObject, q=True, rp=True, ws=True))
        endVector = pm.dt.Vector(pm.xform(endObject, q=True, rp=True, ws=True))

        startToEndCenter = (startVector + endVector) * 0.5
        poleVector = midVector - startToEndCenter

        return poleVector

    def __createPoleVectorLine(self):
        midJntDec = pm.createNode('decomposeMatrix', n='{0}_dec'.format(self._joints[1]))
        poleCtrlDec = pm.createNode('decomposeMatrix', n='{0}_dec'.format(self._controllers[-1]))
        poleLine = pm.curve(n='{0}_line'.format(self._controllers[-1]), d=1, p=[(0, 0, 0), (0, 1, 0)])
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
        stretchGrp = pm.createNode('transform', n='{}stretch_grp'.format(self._prefix))
        pm.addAttr(self._controllers[0], at='double', ln='length1', min=0.01, dv=1.0, keyable=True)
        pm.addAttr(self._controllers[0], at='double', ln='length2', min=0.01, dv=1.0, keyable=True)
        pm.addAttr(self._controllers[0], at='double', ln='stretch', min=0.0, max=1.0, dv=1.0, keyable=True)

        stretchInputNode = pm.createNode('transform', n='{}stretch_input'.format(self._prefix))
        pm.addAttr(stretchInputNode, at='double', ln='inLength1')
        pm.addAttr(stretchInputNode, at='double', ln='inLength2')
        pm.addAttr(stretchInputNode, at='double', ln='inStretch')
        pm.addAttr(stretchInputNode, at='double', ln='inCurLength')
        pm.addAttr(stretchInputNode, at='double', ln='inLength1Orig')
        pm.addAttr(stretchInputNode, at='double', ln='inLength2Orig')

        stretchOutputNode = pm.createNode('transform', n='{}stretch_output'.format(self._prefix))
        pm.addAttr(stretchOutputNode, at='double', ln='outLength1')
        pm.addAttr(stretchOutputNode, at='double', ln='outLength2')
        jnt0StretchLoc = pm.spaceLocator(n='{}_stretch_loc'.format(self._joints[0]))
        jnt1StretchLoc = pm.spaceLocator(n='{}_stretch_loc'.format(self._joints[1]))
        jnt2StretchLoc = pm.spaceLocator(n='{}_stretch_loc'.format(self._joints[2]))

        pm.matchTransform(jnt0StretchLoc, self._joints[0])
        pm.matchTransform(jnt1StretchLoc, self._joints[1])
        pm.matchTransform(jnt2StretchLoc, self._joints[2])

        pm.parent([stretchInputNode, stretchOutputNode], stretchGrp)
        stretchGrp | jnt0StretchLoc | jnt1StretchLoc | jnt2StretchLoc
        self._blbxGrp | stretchGrp

        ikhCtrlLocalMtx = pm.createNode('multMatrix', n='{}_local_multMtx'.format(self._controllers[0]))
        ikhCtrlLocalDist = pm.createNode('distanceBetween', n='{}_local_dist'.format(self._controllers[0]))

        lenOrigAbsSquare = pm.createNode('multiplyDivide', n='{}lenOrigAbs_square'.format(self._prefix))
        lenOrigAbsSquare.operation.set(3)
        lenOrigAbsSquare.input2X.set(2)
        lenOrigAbsSquare.input2Y.set(2)
        lenOrigAbsSqrt = pm.createNode('multiplyDivide', n='{}lenOrigAbs_sqrt'.format(self._prefix))
        lenOrigAbsSqrt.operation.set(3)
        lenOrigAbsSqrt.input2X.set(0.5)
        lenOrigAbsSqrt.input2Y.set(0.5)

        len1OrigMul = pm.createNode('multDoubleLinear', n='{}length1Orig_mul'.format(self._prefix))
        len2OrigMul = pm.createNode('multDoubleLinear', n='{}length2Orig_mul'.format(self._prefix))

        len1OrigLen2OrigAdd = pm.createNode('addDoubleLinear', n='{}len1OrigLen2Orig_add'.format(self._prefix))

        stretchFactorDiv = pm.createNode('multiplyDivide', n='{}stretchFactor_div'.format(self._prefix))
        stretchFactorDiv.operation.set(2)

        stretchLen1OrigMul = pm.createNode('multDoubleLinear', n='{}stretchLen1Orig_mul'.format(self._prefix))
        stretchLen2OrigMul = pm.createNode('multDoubleLinear', n='{}stretchLen2Orig_mul'.format(self._prefix))

        stretchCond = pm.createNode('condition', n='{}stretch_cond'.format(self._prefix))
        stretchCond.operation.set(2)

        len1Blend = pm.createNode('blendTwoAttr', n='{}length1_blend'.format(self._prefix))
        len2Blend = pm.createNode('blendTwoAttr', n='{}length2_blend'.format(self._prefix))

        len1SignMult = pm.createNode('multDoubleLinear', n='{}length1Sign_mult'.format(self._prefix))
        len1SignMult.input1.set(self._aimSign)
        len2SignMult = pm.createNode('multDoubleLinear', n='{}length2Sign_mult'.format(self._prefix))
        len2SignMult.input1.set(self._aimSign)

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

        self.__ikHandleLoc.worldMatrix >> ikhCtrlLocalMtx.matrixIn[0]
        self._joints[0].getParent().worldInverseMatrix >> ikhCtrlLocalMtx.matrixIn[1]
        ikhCtrlLocalMtx.matrixSum >> ikhCtrlLocalDist.inMatrix2

        ikhCtrlLocalDist.distance >> stretchInputNode.inCurLength
        jnt1StretchLoc.attr('translate{}'.format(self._aimAxis)) >> stretchInputNode.inLength1Orig
        jnt2StretchLoc.attr('translate{}'.format(self._aimAxis)) >> stretchInputNode.inLength2Orig
        self._controllers[0].length1 >> stretchInputNode.inLength1
        self._controllers[0].length2 >> stretchInputNode.inLength2
        self._controllers[0].stretch >> stretchInputNode.inStretch

        stretchInputNode.inLength1Orig >> lenOrigAbsSquare.input1X
        stretchInputNode.inLength2Orig >> lenOrigAbsSquare.input1Y
        lenOrigAbsSquare.outputX >> lenOrigAbsSqrt.input1X
        lenOrigAbsSquare.outputY >> lenOrigAbsSqrt.input1Y

        stretchInputNode.inLength1 >> len1OrigMul.input1
        lenOrigAbsSqrt.outputX >> len1OrigMul.input2
        stretchInputNode.inLength2 >> len2OrigMul.input1
        lenOrigAbsSqrt.outputY >> len2OrigMul.input2

        len1OrigMul.output >> len1OrigLen2OrigAdd.input1
        len2OrigMul.output >> len1OrigLen2OrigAdd.input2

        stretchInputNode.inCurLength >> stretchFactorDiv.input1X
        len1OrigLen2OrigAdd.output >> stretchFactorDiv.input2X

        stretchFactorDiv.outputX >> stretchLen1OrigMul.input1
        len1OrigMul.output >> stretchLen1OrigMul.input2
        stretchFactorDiv.outputX >> stretchLen2OrigMul.input1
        len2OrigMul.output >> stretchLen2OrigMul.input2

        stretchInputNode.inCurLength >> stretchCond.firstTerm
        len1OrigLen2OrigAdd.output >> stretchCond.secondTerm
        stretchLen1OrigMul.output >> stretchCond.colorIfTrueR
        stretchLen2OrigMul.output >> stretchCond.colorIfTrueG
        len1OrigMul.output >> stretchCond.colorIfFalseR
        len2OrigMul.output >> stretchCond.colorIfFalseG

        stretchInputNode.inStretch >> len1Blend.attributesBlender
        len1OrigMul.output >> len1Blend.input[0]
        stretchCond.outColorR >> len1Blend.input[1]
        stretchInputNode.inStretch >> len2Blend.attributesBlender
        len2OrigMul.output >> len2Blend.input[0]
        stretchCond.outColorG >> len2Blend.input[1]

        len1Blend.output >> len1SignMult.input2
        len2Blend.output >> len2SignMult.input2

        len1SignMult.output >> stretchOutputNode.outLength1
        len2SignMult.output >> stretchOutputNode.outLength2

        stretchOutputNode.outLength1 >> self._joints[1].attr('translate{}'.format(self._aimAxis))
        stretchOutputNode.outLength2 >> self._joints[2].attr('translate{}'.format(self._aimAxis))

    def setupPin(self):
        pm.addAttr(self._controllers[-1], at='double', ln='pin', min=0.0, max=1.0, dv=0.0, keyable=True)

        pinGrp = pm.createNode('transform', n='{}pin_grp'.format(self._prefix))

        pinInputNode = pm.createNode('transform', n='{}pin_input'.format(self._prefix))
        pm.addAttr(pinInputNode, at='double', ln='inPin')
        pm.addAttr(pinInputNode, at='double', ln='inLength1')
        pm.addAttr(pinInputNode, at='double', ln='inLength2')
        pm.addAttr(pinInputNode, at='double', ln='inLength1Pin')
        pm.addAttr(pinInputNode, at='double', ln='inLength2Pin')

        pinOutputNode = pm.createNode('transform', n='{}pin_output'.format(self._prefix))
        pm.addAttr(pinOutputNode, at='double', ln='outLength1')
        pm.addAttr(pinOutputNode, at='double', ln='outLength2')

        jnt0PinLoc = pm.spaceLocator(n='{}_pin_loc'.format(self._joints[0]))
        jnt1PinLoc = pm.spaceLocator(n='{}_pin_loc'.format(self._joints[1]))
        jnt2PinLoc = pm.spaceLocator(n='{}_pin_loc'.format(self._joints[2]))

        pm.pointConstraint(self._joints[0].getParent(), jnt0PinLoc, mo=False)
        pm.pointConstraint(self._controllers[-1], jnt1PinLoc, mo=False)
        pm.pointConstraint(self._controllers[0], jnt2PinLoc, mo=False)

        pm.parent([pinInputNode, pinOutputNode], pinGrp)
        pinGrp | jnt0PinLoc | jnt1PinLoc | jnt2PinLoc
        self._blbxGrp | pinGrp

        len1PinLocalDist = pm.createNode('distanceBetween', n='{}len1Pin_local_dist'.format(self._prefix))
        len2PinLocalDist = pm.createNode('distanceBetween', n='{}len2Pin_local_dist'.format(self._prefix))

        len1PinSignMult = pm.createNode('multDoubleLinear', n='{}len1PinSign_mult'.format(self._prefix))
        len1PinSignMult.input1.set(self._aimSign)
        len2PinSignMult = pm.createNode('multDoubleLinear', n='{}len2PinSign_mult'.format(self._prefix))
        len2PinSignMult.input1.set(self._aimSign)

        len1StretchPinBlend = pm.createNode('blendTwoAttr', n='{}len1StretchPin_blend'.format(self._prefix))
        len2StretchPinBlend = pm.createNode('blendTwoAttr', n='{}len2StretchPin_blend'.format(self._prefix))

        self.addMembers(len1PinLocalDist,
                        len2PinLocalDist,
                        len1PinSignMult,
                        len2PinSignMult,
                        len1StretchPinBlend,
                        len2StretchPinBlend)

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
        pm.matchTransform(startCtrl.zeroGrp(), self._joints[0], position=True)
        pm.matchTransform(startCtrl.zeroGrp(), self.__ikHandleController, rotation=True, scale=True)
        pm.parentConstraint(startCtrl, self._joints[0].getParent(), mo=True)
        startCtrl.lockHideChannels(['rotate', 'scale', 'visibility'])
        self._controllers.append(startCtrl)
        pm.parent(startCtrl.zeroGrp(), self._controllerGrp)
