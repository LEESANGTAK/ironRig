from maya import cmds
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
            self.__ikSystem = SplineIK(self.longName+'ik_', ikJoints, self.__numberOfControllers)
            if self._negateScaleX:
                self.__ikSystem.negateScaleX = True
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
            self.__ikSystem = RibbonIK(self.longName+'ik_', ikJoints, self.__numberOfControllers)
            if self._negateScaleX:
                self.__ikSystem.negateScaleX = True
            self.__ikSystem.build()
            if self.__hybridIK:
                self.__ikSystem.setupHybridIK()
            if self.__wave:
                self.__ikSystem.setupWave()
        self._addSystems(self.__ikSystem)

        if self.__fk:
            fkJoints = utils.buildNewJointChain(self._initJoints, searchStr='init', replaceStr='fk')
            self.__fkSystem = FK(self.longName+'fk_', fkJoints)
            if self._negateScaleX:
                self.__fkSystem.negateScaleX = True
            self.__fkSystem.build()
            self._addSystems(self.__fkSystem)

    def _connectSystems(self):
        if self.__fk:
            self.__blendJoints = utils.buildNewJointChain(self._initJoints, searchStr='init', replaceStr='blend')
            utils.parentKeepHierarchy(self.__blendJoints, self._systemGrp)
            self.__blendJoints[0].hide()
            blendCnsts = []
            scaleChoices = []
            for ikJnt, fkJnt, blendJnt in zip(self.__ikSystem.joints, self.__fkSystem.joints, self.__blendJoints):
                blendCnst = cmds.parentConstraint(ikJnt, fkJnt, blendJnt, mo=True)
                blendCnst.interpType.set(2)
                blendCnsts.append(blendCnst)
                scaleChoice = cmds.createNode('choice', n='{0}scale_choice'.format(self.longName))
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
            driverJoints = self.__blendJoints if self.__blendJoints else self.__ikSystem.joints

            # Connect channels of coil joints
            pairDriverCoilJnts = zip(driverJoints, self.__coilJoints)

            if not cmds.pluginInfo('multiRemapValue', q=True, loaded=True):
                cmds.loadPlugin('multiRemapValue')
            numCoilJnts = len(self.__coilJoints) - 1  # Subtract 1 from the number of coil joints to skip end joint
            endIndex = numCoilJnts - 1
            multRemapVal = cmds.createNode('multiRemapValue', n='{}coil_multRemap'.format(self.longName))
            multRemapVal.inputMin.set(endIndex)
            multRemapVal.inputMax.set(endIndex)
            multRemapVal.outputMax.set(-100)

            for i in range(numCoilJnts):
                driverJnt = pairDriverCoilJnts[i][0]
                coilJnt = pairDriverCoilJnts[i][1]
                addNode = cmds.createNode('addDoubleLinear', n='{}_rz_add'.format(coilJnt))
                multRemapVal.inputValue[i].set(i)
                driverJnt.rotateX >> coilJnt.rotateX
                driverJnt.rotateY >> coilJnt.rotateY
                driverJnt.rotateZ >> addNode.input1
                multRemapVal.outValue[i] >> addNode.input2
                addNode.output >> coilJnt.rotateZ

            for driverJnt, coilJnt in pairDriverCoilJnts:
                driverJnt.translate >> coilJnt.translate
                driverJnt.scale >> coilJnt.scale
            pairDriverCoilJnts[-1][0].rotate >> pairDriverCoilJnts[-1][1].rotate

            # Setup control attribute
            coilAttrName = 'coil'
            baseCtrl = self.__ikSystem.controllers[-1]
            otherCtrls = self.__ikSystem.controllers[:-1]
            if self.__fk:
                otherCtrls.extend(self.__fkSystem.controllers)
            cmds.addAttr(baseCtrl, ln=coilAttrName, at='float', min=0.0, max=1.0, dv=0.0, keyable=True)
            for ctrl in otherCtrls:
                cmds.addAttr(ctrl, ln=coilAttrName, proxy='{0}.{1}'.format(baseCtrl, coilAttrName))
            coilAttrRemap = cmds.createNode('remapValue', n='{}coil_remap'.format(self.longName))
            coilAttrRemap.outputMin.set(endIndex)
            coilAttrRemap.outputMax.set(0.0)
            baseCtrl.coil >> coilAttrRemap.inputValue
            coilAttrRemap.outValue >> multRemapVal.inputMin
            baseCtrl.coil >> multRemapVal.value[1].value_FloatValue

            self.addMembers(multRemapVal, coilAttrRemap, addNode)

        self._sysJoints = self.__ikSystem.joints
        if self.__fk:
            self._sysJoints = self.__blendJoints
        if self.__coil:
            self._sysJoints = self.__coilJoints

    def __buildControls(self):
        if self.__fk:
            # Add proxy switch attribute to all controls
            ikAttrName = 'ik'
            baseCtrl = self.__ikSystem.controllers[-1]
            otherCtrls = self.__ikSystem.controllers[:-1] + self.__fkSystem.controllers
            cmds.addAttr(baseCtrl, ln=ikAttrName, at='float', min=0.0, max=1.0, dv=1.0, keyable=True)
            for ctrl in otherCtrls:
                cmds.addAttr(ctrl, ln=ikAttrName, proxy='{0}.{1}'.format(baseCtrl, ikAttrName))

            fkIkRev = cmds.createNode('reverse', n='{}fkIk_rev'.format(self.longName))
            baseCtrl.ik >> self.__ikSystem.topGrp.visibility
            baseCtrl.ik >> fkIkRev.inputX
            fkIkRev.outputX >> self.__fkSystem.topGrp.visibility
            for cnst, choice in zip(self.__blendConstraints, self.__scaleChoices):
                baseCtrl.ik >> cnst.target[0].targetWeight
                fkIkRev.outputX >> cnst.target[1].targetWeight
                baseCtrl.ik >> choice.selector

    def _connectSkeleton(self):
        for outJnt, skelJnt in zip(self._outJoints, self._skelJoints):
            cmds.parentConstraint(outJnt, skelJnt, mo=True)
            cmds.scaleConstraint(outJnt, skelJnt, mo=True)
            # for axis in 'XYZ':
            #     outJnt.attr('scale'+axis) >> skelJnt.attr('scale'+axis)
