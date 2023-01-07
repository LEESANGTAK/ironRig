import pymel.core as pm
from ... import utils
from ..irSystem import SplineIK
from ..irSystem import RibbonIK
from ..irSystem import FK
from .module import Module


class IKType:
    SPLINE = 0
    RIBBON = 1


class String(Module):
    """
    This module can be applied for
    SPLINE: hair, tongue, tail, ...
    RIBBON: brow, lid, lip, ...
    """
    IK_TYPE = IKType

    def __init__(self, prefix='', joints=[]):
        super(String, self).__init__(prefix, joints)

        # Properties
        self.__numberOfControllers = 3
        self.__fk = False
        self.__hybridIK = False
        self.__wave = False
        self.__coil = False
        self.__dynamic = False
        self.__ikType = String.IK_TYPE.SPLINE

        self.__ikSystem = None
        self.__fkSystem = None
        self.__blendJoints = None
        self.__coilJoints = None
        self.__blendConstraints = None
        self.__scaleChoices = None

    @property
    def numberOfControllers(self):
        return self.__numberOfControllers

    @numberOfControllers.setter
    def numberOfControllers(self, val):
        self.__numberOfControllers = val

    @property
    def fk(self):
        return self.__fk

    @fk.setter
    def fk(self, val):
        self.__fk = val

    @property
    def hybridIK(self):
        return self.__hybridIK

    @hybridIK.setter
    def hybridIK(self, val):
        self.__hybridIK = val

    @property
    def wave(self):
        return self.__wave

    @wave.setter
    def wave(self, val):
        self.__wave = val

    @property
    def coil(self):
        return self.__coil

    @coil.setter
    def coil(self, val):
        self.__coil = val

    @property
    def dynamic(self):
        return self.__dynamic

    @dynamic.setter
    def dynamic(self, val):
        self.__dynamic = val

    @property
    def ikType(self):
        return self.__ikType

    @ikType.setter
    def ikType(self, val):
        self.__ikType = val

    def build(self):
        super(String, self).build()
        self.__buildControls()

    def _buildSystems(self):
        ikJoints = utils.buildNewJointChain(self._initJoints, searchStr='init', replaceStr='ik')
        if self.__ikType == String.IK_TYPE.SPLINE:
            self.__ikSystem = SplineIK(self._prefix+'ik_', ikJoints, self.__numberOfControllers)
            if self._negateScaleX:
                self.__ikSystem.negateSclaeX = True
            self.__ikSystem.build()
            self.__ikSystem.setupAdvancedTwist()
            self.__ikSystem.setupStretch()
            if self.__hybridIK:
                self.__ikSystem.setupHybridIK()
            if self.__wave:
                self.__ikSystem.setupWave()
            if self.__dynamic:
                self.__ikSystem.setupDynamic()
        elif self.__ikType == String.IK_TYPE.RIBBON:
            self.__ikSystem = RibbonIK(self._prefix+'ik_', ikJoints, self.__numberOfControllers)
            if self._negateScaleX:
                self.__ikSystem.negateSclaeX = True
            self.__ikSystem.build()
            if self.__hybridIK:
                self.__ikSystem.setupHybridIK()
            if self.__wave:
                self.__ikSystem.setupWave()
        self.addSystems(self.__ikSystem)

        if self.__fk:
            fkJoints = utils.buildNewJointChain(self._initJoints, searchStr='init', replaceStr='fk')
            self.__fkSystem = FK(self._prefix+'fk_', fkJoints)
            if self._negateScaleX:
                self.__fkSystem.negateSclaeX = True
            self.__fkSystem.build()
            self.addSystems(self.__fkSystem)

    def _connectSystems(self):
        if self.__fk:
            self.__blendJoints = utils.buildNewJointChain(self._initJoints, searchStr='init', replaceStr='blend')
            utils.parentKeepHierarchy(self.__blendJoints, self._systemGrp)
            self.__blendJoints[0].hide()
            blendCnsts = []
            scaleChoices = []
            for ikJnt, fkJnt, blendJnt in zip(self.__ikSystem.joints(), self.__fkSystem.joints(), self.__blendJoints):
                blendCnst = pm.parentConstraint(ikJnt, fkJnt, blendJnt, mo=True)
                blendCnst.interpType.set(2)
                blendCnsts.append(blendCnst)
                scaleChoice = pm.createNode('choice', n='{0}scale_choice'.format(self._prefix))
                scaleChoices.append(scaleChoice)
                fkJnt.scale >> scaleChoice.input[0]
                ikJnt.scale >> scaleChoice.input[1]
                scaleChoice.output >> blendJnt.scale
            self.__blendConstraints = blendCnsts
            self.__scaleChoices = scaleChoices

        if self.__coil:
            self.__coilJoints = utils.buildNewJointChain(self._initJoints, searchStr='init', replaceStr='coil')
            utils.parentKeepHierarchy(self.__coilJoints, self._systemGrp)
            self.__coilJoints[0].hide()
            driverJoints = self.__blendJoints if self.__blendJoints else self.__ikSystem.joints()

            # Connect channels of coil joints
            pairDriverCoilJnts = zip(driverJoints, self.__coilJoints)

            if not pm.pluginInfo('multiRemapValue', q=True, loaded=True):
                pm.loadPlugin('multiRemapValue')
            numCoilJnts = len(self.__coilJoints) - 1  # Subtract 1 from the number of coil joints to skip end joint
            endIndex = numCoilJnts - 1
            multRemapVal = pm.createNode('multiRemapValue', n='{}coil_multRemap'.format(self._prefix))
            multRemapVal.inputMin.set(endIndex)
            multRemapVal.inputMax.set(endIndex)
            multRemapVal.outputMax.set(-100)

            for i in range(numCoilJnts):
                driverJnt = pairDriverCoilJnts[i][0]
                coilJnt = pairDriverCoilJnts[i][1]
                addNode = pm.createNode('addDoubleLinear', n='{}_rz_add'.format(coilJnt))
                multRemapVal.inputValue[i].set(i)
                driverJnt.rotateX >> coilJnt.rotateX
                driverJnt.rotateY >> coilJnt.rotateY
                driverJnt.rotateZ >> addNode.input1
                multRemapVal.outValue[i] >> addNode.input2
                addNode.output >> coilJnt.rotateZ

            for driverJnt, coilJnt in pairDriverCoilJnts:
                utils.connectTransform(driverJnt, coilJnt, ['translate', 'scale'], 'XYZ')
            utils.connectTransform(pairDriverCoilJnts[-1][0], pairDriverCoilJnts[-1][1], ['rotate'], 'XYZ')

            # Setup control attribute
            coilAttrName = 'coil'
            baseCtrl = self.__ikSystem.controllers()[-1]
            otherCtrls = self.__ikSystem.controllers()[:-1]
            if self.__fk:
                otherCtrls.extend(self.__fkSystem.controllers())
            pm.addAttr(baseCtrl.transform(), ln=coilAttrName, at='float', min=0.0, max=1.0, dv=0.0, keyable=True)
            for ctrl in otherCtrls:
                pm.addAttr(ctrl.transform(), ln=coilAttrName, proxy='{0}.{1}'.format(baseCtrl.transform(), coilAttrName))
            coilAttrRemap = pm.createNode('remapValue', n='{}coil_remap'.format(self._prefix))
            coilAttrRemap.outputMin.set(endIndex)
            coilAttrRemap.outputMax.set(0.0)
            baseCtrl.transform().coil >> coilAttrRemap.inputValue
            coilAttrRemap.outValue >> multRemapVal.inputMin
            baseCtrl.transform().coil >> multRemapVal.value[1].value_FloatValue

            self.addMembers(multRemapVal, coilAttrRemap, addNode)

    def _connectOutputs(self):
        systemJoints = self.__ikSystem.joints()
        if self.__fk:
            systemJoints = self.__blendJoints
        if self.__coil:
            systemJoints = self.__coilJoints

        for sysJnt, outJnt in zip(systemJoints, self._outJoints):
            pm.pointConstraint(sysJnt, outJnt, mo=True)
            pm.orientConstraint(sysJnt, outJnt, mo=True)
            utils.connectTransform(sysJnt, outJnt, ['scale'], ['X', 'Y', 'Z'])

    def __buildControls(self):
        if self.__fk:
            # Add proxy switch attribute to all controls
            ikAttrName = 'ik'
            baseCtrl = self.__ikSystem.controllers()[-1]
            otherCtrls = self.__ikSystem.controllers()[:-1] + self.__fkSystem.controllers()
            pm.addAttr(baseCtrl.transform(), ln=ikAttrName, at='float', min=0.0, max=1.0, dv=1.0, keyable=True)
            for ctrl in otherCtrls:
                pm.addAttr(ctrl.transform(), ln=ikAttrName, proxy='{0}.{1}'.format(baseCtrl.transform(), ikAttrName))

            fkIkRev = pm.createNode('reverse', n='{}fkIk_rev'.format(self._prefix))
            baseCtrl.transform().ik >> self.__ikSystem.topGrp().visibility
            baseCtrl.transform().ik >> fkIkRev.inputX
            fkIkRev.outputX >> self.__fkSystem.topGrp().visibility
            for cnst, choice in zip(self.__blendConstraints, self.__scaleChoices):
                baseCtrl.transform().ik >> cnst.target[0].targetWeight
                fkIkRev.outputX >> cnst.target[1].targetWeight
                baseCtrl.transform().ik >> choice.selector
