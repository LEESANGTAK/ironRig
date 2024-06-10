from maya import cmds
from ... import utils
from ... import common
from ..irSystem import SplineIK
from ..irSystem import RibbonIK
from ..irSystem import FK
from .module import Module


if not cmds.pluginInfo('multiRemapValue', q=True, loaded=True):
    cmds.loadPlugin('multiRemapValue')


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

    def __init__(self, name='new', side=Module.SIDE.CENTER, skeletonJoints=[], ikType=IKType.SPLINE):
        self._numberOfControllers = 3
        self._fk = False
        self._hybridIK = False
        self._wave = False
        self._coil = False
        self._dynamic = False
        self._ikType = ikType

        self._ikSystem = None
        self._fkSystem = None
        self._blendJoints = None
        self._coilJoints = None
        self._blendConstraints = None
        self._scaleChoices = None

        super(String, self).__init__(name, side, skeletonJoints)

    @property
    def numberOfControllers(self):
        return self._numberOfControllers

    @numberOfControllers.setter
    def numberOfControllers(self, val):
        self._ikSystem.numberOfControllers = val
        self._numberOfControllers = val

    @property
    def fk(self):
        return self._fk

    @fk.setter
    def fk(self, val):
        self._fk = val

    @property
    def hybridIK(self):
        return self._hybridIK

    @hybridIK.setter
    def hybridIK(self, val):
        self._hybridIK = val

    @property
    def wave(self):
        return self._wave

    @wave.setter
    def wave(self, val):
        self._wave = val

    @property
    def coil(self):
        return self._coil

    @coil.setter
    def coil(self, val):
        self._coil = val

    @property
    def dynamic(self):
        return self._dynamic

    @dynamic.setter
    def dynamic(self, val):
        self._dynamic = val

    @property
    def ikType(self):
        return self._ikType

    @ikType.setter
    def ikType(self, val):
        self._ikType = val

    def _addSystems(self):
        if self._ikType == String.IK_TYPE.SPLINE:
            self._ikSystem = SplineIK(self._name, self._side, numberOfControllers=self._numberOfControllers)
        elif self._ikType == String.IK_TYPE.RIBBON:
            self._ikSystem = RibbonIK(self._name, self._side, numberOfControllers=self._numberOfControllers)
        self._systems.append(self._ikSystem)

        super(String, self)._addSystems()

    def build(self):
        super(String, self).build()
        self._buildControls()

    def _buildSystems(self):
        ikJoints = utils.buildNewJointChain(self._initJoints, searchStr='init', replaceStr='ik')
        self._ikSystem.joints = ikJoints
        if self._ikType == String.IK_TYPE.SPLINE:
            self._ikSystem.build()
            self._ikSystem.setupAdvancedTwist()
            self._ikSystem.setupStretch()
            if self._hybridIK:
                self._ikSystem.setupHybridIK()
            if self._wave:
                self._ikSystem.setupWave()
            if self._dynamic:
                self._ikSystem.setupDynamic()
        elif self._ikType == String.IK_TYPE.RIBBON:
            self._ikSystem = RibbonIK(self.shortName+'ik_', ikJoints, self._numberOfControllers)
            self._ikSystem.build()
            if self._hybridIK:
                self._ikSystem.setupHybridIK()
            if self._wave:
                self._ikSystem.setupWave()

        if self._fk:
            fkJoints = utils.buildNewJointChain(self._initJoints, searchStr='init', replaceStr='fk')
            self._fkSystem = FK(self._name, self._side, fkJoints)
            self._fkSystem.build()
            self._systems.append(self._fkSystem)

    def _connectSystems(self):
        if self._fk:
            self._blendJoints = utils.buildNewJointChain(self._initJoints, searchStr='init', replaceStr='blend')
            utils.parentKeepHierarchy(self._blendJoints, self._systemGrp)
            cmds.hide(self._blendJoints[0])
            blendCnsts = []
            scaleChoices = []
            for ikJnt, fkJnt, blendJnt in zip(self._ikSystem.joints, self._fkSystem.joints, self._blendJoints):
                blendCnst = cmds.parentConstraint(ikJnt, fkJnt, blendJnt, mo=True)[0]
                cmds.setAttr('{}.interpType'.format(blendCnst), 2)
                blendCnsts.append(blendCnst)
                scaleChoice = cmds.createNode('choice', n='{0}_scale_choice'.format(self.shortName))
                scaleChoices.append(scaleChoice)
                cmds.connectAttr('{}.scale'.format(fkJnt), '{}.input[0]'.format(scaleChoice))
                cmds.connectAttr('{}.scale'.format(ikJnt), '{}.input[1]'.format(scaleChoice))
                cmds.connectAttr('{}.output'.format(scaleChoice), '{}.scale'.format(blendJnt))
            self._blendConstraints = blendCnsts
            self._scaleChoices = scaleChoices

        if self._coil:
            self._coilJoints = utils.buildNewJointChain(self._initJoints, searchStr='init', replaceStr='coil')
            utils.parentKeepHierarchy(self._coilJoints, self._systemGrp)
            cmds.hide(self._coilJoints[0])
            driverJoints = self._blendJoints if self._blendJoints else self._ikSystem.joints

            # Connect channels of coil joints
            numCoilJnts = len(self._coilJoints) - 1  # Subtract 1 from the number of coil joints to skip end joint
            endIndex = numCoilJnts - 1
            multRemapVal = cmds.createNode('multiRemapValue', n='{}_coil_multRemap'.format(self.shortName))
            cmds.setAttr('{}.inputMin'.format(multRemapVal), endIndex)
            cmds.setAttr('{}.inputMax'.format(multRemapVal), endIndex)
            cmds.setAttr('{}.outputMax'.format(multRemapVal), -100)

            for i, pair in enumerate(zip(driverJoints[:-1], self._coilJoints[:-1])):
                driverJnt = pair[0]
                coilJnt = pair[1]
                addNode = cmds.createNode('addDoubleLinear', n='{}_rz_add'.format(coilJnt))
                cmds.setAttr('{}.inputValue[{}]'.format(multRemapVal, i), i)
                cmds.connectAttr('{}.rotateX'.format(driverJnt), '{}.rotateX'.format(coilJnt))
                cmds.connectAttr('{}.rotateY'.format(driverJnt), '{}.rotateY'.format(coilJnt))
                cmds.connectAttr('{}.rotateZ'.format(driverJnt), '{}.input1'.format(addNode))
                cmds.connectAttr('{}.outValue[{}]'.format(multRemapVal, i), '{}.input2'.format(addNode))
                cmds.connectAttr('{}.output'.format(addNode), '{}.rotateZ'.format(coilJnt))

            for driverJnt, coilJnt in zip(driverJoints, self._coilJoints):
                cmds.connectAttr('{}.translate'.format(driverJnt), '{}.translate'.format(coilJnt))
                cmds.connectAttr('{}.scale'.format(driverJnt), '{}.scale'.format(coilJnt))

            cmds.connectAttr('{}.rotate'.format(driverJoints[-1]), '{}.rotate'.format(self._coilJoints[-1]))

            # Setup control attribute
            coilAttrName = 'coil'
            baseCtrl = self._ikSystem.controllers[-1]
            otherCtrls = self._ikSystem.controllers[:-1]
            if self._fk:
                otherCtrls.extend(self._fkSystem.controllers)
            cmds.addAttr(baseCtrl, ln=coilAttrName, at='float', min=0.0, max=1.0, dv=0.0, keyable=True)
            for ctrl in otherCtrls:
                cmds.addAttr(ctrl, ln=coilAttrName, proxy='{0}.{1}'.format(baseCtrl, coilAttrName))
            coilAttrRemap = cmds.createNode('remapValue', n='{}_coil_remap'.format(self.shortName))
            cmds.setAttr('{}.outputMin'.format(coilAttrRemap), endIndex)
            cmds.setAttr('{}.outputMax'.format(coilAttrRemap), 0.0)
            cmds.connectAttr('{}.coil'.format(baseCtrl), '{}.inputValue'.format(coilAttrRemap))
            cmds.connectAttr('{}.outValue'.format(coilAttrRemap), '{}.inputMin'.format(multRemapVal))
            cmds.connectAttr('{}.coil'.format(baseCtrl), '{}.value[1].value_FloatValue'.format(multRemapVal))

            self.addMembers(multRemapVal, coilAttrRemap, addNode)

        self._sysJoints = self._ikSystem.joints
        if self._fk:
            self._sysJoints = self._blendJoints
        if self._coil:
            self._sysJoints = self._coilJoints

    def _buildControls(self):
        if self._fk:
            # Add proxy switch attribute to all controls
            ikAttrName = 'ik'
            baseCtrl = self._ikSystem.controllers[-1]
            otherCtrls = self._ikSystem.controllers[:-1] + self._fkSystem.controllers
            cmds.addAttr(baseCtrl, ln=ikAttrName, at='float', min=0.0, max=1.0, dv=1.0, keyable=True)
            for ctrl in otherCtrls:
                cmds.addAttr(ctrl, ln=ikAttrName, proxy='{0}.{1}'.format(baseCtrl, ikAttrName))

            fkIkRev = cmds.createNode('reverse', n='{}_fkIk_rev'.format(self.shortName))
            cmds.connectAttr('{}.ik'.format(baseCtrl), '{}.visibility'.format(self._ikSystem.topGrp))
            cmds.connectAttr('{}.ik'.format(baseCtrl), '{}.inputX'.format(fkIkRev))
            cmds.connectAttr('{}.outputX'.format(fkIkRev), '{}.visibility'.format(self._fkSystem.topGrp))
            for cnst, choice in zip(self._blendConstraints, self._scaleChoices):
                ikWeightAttr = cmds.listConnections('{}.target[0].targetParentMatrix'.format(cnst))[0] + 'W0'
                cmds.connectAttr('{}.ik'.format(baseCtrl), '{}.{}'.format(cnst, ikWeightAttr))
                fkWeightAttr = cmds.listConnections('{}.target[1].targetParentMatrix'.format(cnst))[0] + 'W1'
                cmds.connectAttr('{}.outputX'.format(fkIkRev), '{}.{}'.format(cnst, fkWeightAttr))
                cmds.connectAttr('{}.ik'.format(baseCtrl), '{}.selector'.format(choice))

    def _connectSkeleton(self):
        for outJnt, skelJnt in zip(self._outJoints, self._skelJoints):
            cmds.parentConstraint(outJnt, skelJnt, mo=True)
            # cmds.scaleConstraint(outJnt, skelJnt, mo=True)

    def mirror(self, skeletonSearchStr='_l', skeletonReplaceStr='_r', mirrorTranslate=False):
        oppSideChar, oppSkelJoints = super(String, self).mirror(skeletonSearchStr, skeletonReplaceStr)
        oppMod = String(self._name, oppSideChar, oppSkelJoints)
        oppMod.mirrorTranslate = mirrorTranslate
        oppMod.preBuild()
        oppMod.symmetrizeGuide(jointAxis=False)
        oppMod.build()
        oppMod.symmetrizeControllerShapes()
        oppMod.controllerColor = common.SYMMETRY_COLOR_TABLE.get(self._controllerColor)
        return oppMod
