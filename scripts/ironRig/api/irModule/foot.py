from maya.api import OpenMaya as om
from maya import cmds
from ... import utils
from ..irGlobal import Controller
from ..irSystem import FK
from ..irSystem import RevFootIK
from .module import Module
from .twoBoneLimb import TwoBoneLimb
from .threeBoneLimb import ThreeBoneLimb


class Foot(Module):
    def __init__(self, prefix='', joints=[]):
        super(Foot, self).__init__(prefix, joints)

        self.__pivotLocators = ['{}in_loc'.format(self._name), '{}out_loc'.format(self._name), '{}heel_loc'.format(self._name), '{}tip_loc'.format(self._name)]

        self.__ikSystem = None
        self.__fkSystem = None

        self.__blendJoints = []
        self.__blendConstraints = []

    def _createMidLocator(self):
        midLoc = None

        midInitSkelLoc = self._initSkelLocators[int(len(self._initSkelLocators)*0.5)]
        midLocPos = utils.getWorldPoint(midInitSkelLoc) + (om.MVector.kYaxisVector * utils.getDistance(self._initSkelLocators[0], self._initSkelLocators[-1]))

        midLoc = cmds.spaceLocator(n='{}mid_oriPlane_loc'.format(self._name))
        midLoc.overrideEnabled.set(True)
        midLoc.overrideColor.set(6)
        cmds.xform(midLoc, t=midLocPos, ws=True)

        negAxisAttrNames = ['negateXAxis', 'negateZAxis', 'swapYZAxis']
        for attrName in negAxisAttrNames:
            cmds.addAttr(midLoc, ln=attrName, at='bool', dv=False, keyable=True)
            midLoc.attr(attrName) >> self._orientPlane.attr(attrName)

        return midLoc

    def preBuild(self):
        super(Foot, self).preBuild()
        for pivotLoc in self.__pivotLocators:
            cmds.spaceLocator(n=pivotLoc)
        cmds.parent(self.__pivotLocators, self._initGrp)

    def build(self):
        super(Foot, self).build()
        self.__buildControls()

    def _buildGroups(self):
        super(Foot, self)._buildGroups()
        self.__controllerGrp = cmds.group(n='{}ctrl_grp'.format(self._name), empty=True)
        cmds.parent(self.__controllerGrp, self._topGrp)

    def _buildSystems(self):
        ikJoints = utils.buildNewJointChain(self._initJoints, searchStr='init', replaceStr='ik')
        self.__ikSystem = RevFootIK(self._name+'ik_', ikJoints, self.__pivotLocators)
        if self._negateScaleX:
            self.__ikSystem.negateSclaeX = True
        self.__ikSystem.build()
        self.addSystems(self.__ikSystem)

        fkJoints = utils.buildNewJointChain(self._initJoints, searchStr='init', replaceStr='fk')
        self.__fkSystem = FK(self._name+'fk_', fkJoints)
        if self._negateScaleX:
            self.__fkSystem.negateSclaeX = True
        self.__fkSystem.build()
        self.addSystems(self.__fkSystem)

    def _connectSystems(self):
        self.__blendJoints = utils.buildNewJointChain(self._initJoints, searchStr='init', replaceStr='blend')
        utils.parentKeepHierarchy(self.__blendJoints, self._systemGrp)
        for ikJnt, fkJnt, blendJnt in zip(self.__ikSystem.joints, self.__fkSystem.joints, self.__blendJoints):
            blendCnst = cmds.parentConstraint(ikJnt, fkJnt, blendJnt, mo=True)
            blendCnst.interpType.set(2)
            self.__blendConstraints.append(blendCnst)
        self.__blendJoints[0].hide()

        self._sysJoints = self.__blendJoints

    def __buildControls(self):
        moduleCtrl = Controller('{}module_ctrl'.format(self._name), Controller.SHAPE.SPHERE)
        moduleCtrl.lockHideChannels(['translate', 'rotate', 'scale', 'visibility'])
        cmds.addAttr(moduleCtrl, ln='ik', at='double', min=0.0, max=1.0, dv=1.0, keyable=True)
        cmds.parentConstraint(self.__blendJoints[1], moduleCtrl.zeroGrp, mo=False)
        moduleCtrl.shapeOffset = [0, self._aimSign*10, 0]

        fkIkRev = cmds.createNode('reverse', n='{}fkIk_rev'.format(self._name))
        moduleCtrl.ik >> self.__ikSystem.topGrp.visibility
        moduleCtrl.ik >> fkIkRev.inputX
        fkIkRev.outputX >> self.__fkSystem.topGrp.visibility
        for cnst in self.__blendConstraints:
            moduleCtrl.ik >> cnst.target[0].targetWeight
            fkIkRev.outputX >> cnst.target[1].targetWeight

        cmds.parent(moduleCtrl.zeroGrp, self.__controllerGrp)
        self._controllers.append(moduleCtrl)

    def attachTo(self, module):
        if isinstance(module, TwoBoneLimb) or isinstance(module, ThreeBoneLimb):
            # Connect ik joints
            utils.removeConnections(self.__ikSystem.joints[0])
            cmds.parentConstraint(module.ikSystem().joints[-1], self.__ikSystem.joints[0], mo=True)
            # Connect skel joints
            utils.removeConnections(module.skelJoints[-1])
            cmds.parentConstraint(self._outJoints[0], module.skelJoints[-1], mo=True)
            # Connect ik handle
            moduleIkHandleLoc = module.ikSystem().ikHandleLocator()
            utils.removeConnections(moduleIkHandleLoc)
            cmds.pointConstraint(self.__ikSystem.revFootJoints()[-1], moduleIkHandleLoc, mo=True)
            # Connect ik controllers
            cmds.parentConstraint(module.ikSystem().controllers[0], self.__ikSystem.controllers[0], mo=True)
            utils.cloneUserDefinedAttrs(self.__ikSystem.controllers[0], module.ikSystem().controllers[0])
            self.__ikSystem.controllers[0].hide()
            # Connect fk controllers
            cmds.parentConstraint(module.fkSystem().controllers[-1], self.__fkSystem.controllers[0], mo=True)
            self.__fkSystem.controllers[0].hide()
            # Connect module controllers
            module.controllers[0].ik >> self._controllers[0].ik
            self._controllers[0].hide()
        else:
            super(Foot, self).attachTo(module)

    def postBuild(self):
        super(Foot, self).postBuild()

        self.__ikSystem.controllers[0].size = self._controllerSize * 2
        self._controllers[0].size = self._controllerSize * 0.2
