import pymel.core as pm
from ... import utils
from ..irGlobal import Controller
from ..irSystem import FK
from ..irSystem import RevFootIK
from .module import Module
from .twoBoneLimb import TwoBoneLimb


class Foot(Module):
    def __init__(self, prefix='', joints=[]):
        super(Foot, self).__init__(prefix, joints)

        self.__ikSystem = None
        self.__fkSystem = None

        self.__blendJoints = []
        self.__blendConstraints = []

    def build(self):
        super(Foot, self).build()
        self.__buildControls()

    def _buildGroups(self):
        super(Foot, self)._buildGroups()
        self.__controllerGrp = pm.group(n='{}ctrl_grp'.format(self._prefix), empty=True)
        pm.parent(self.__controllerGrp, self._topGrp)

    def _buildSystems(self):
        ikJoints = utils.buildNewJointChain(self._initJoints, searchStr='init', replaceStr='ik')
        self.__ikSystem = RevFootIK(self._prefix+'ik_', ikJoints)
        if self._negateScaleX:
            self.__ikSystem.negateSclaeX = True
        self.__ikSystem.build()
        self.addSystems(self.__ikSystem)

        fkJoints = utils.buildNewJointChain(self._initJoints, searchStr='init', replaceStr='fk')
        self.__fkSystem = FK(self._prefix+'fk_', fkJoints)
        if self._negateScaleX:
            self.__fkSystem.negateSclaeX = True
        self.__fkSystem.build()
        self.addSystems(self.__fkSystem)

    def _connectSystems(self):
        self.__blendJoints = utils.buildNewJointChain(self._initJoints, searchStr='init', replaceStr='blend')
        utils.parentKeepHierarchy(self.__blendJoints, self._systemGrp)
        for ikJnt, fkJnt, blendJnt in zip(self.__ikSystem.joints(), self.__fkSystem.joints(), self.__blendJoints):
            blendCnst = pm.parentConstraint(ikJnt, fkJnt, blendJnt, mo=True)
            blendCnst.interpType.set(2)
            self.__blendConstraints.append(blendCnst)
        self.__blendJoints[0].hide()

        self._sysJoints = self.__blendJoints

    def __buildControls(self):
        moduleCtrl = Controller('{}module_ctrl'.format(self._prefix), Controller.SHAPE.SPHERE)
        moduleCtrl.lockChannels(['translate', 'rotate', 'scale', 'visibility'])
        pm.addAttr(moduleCtrl.transform(), ln='ik', at='double', min=0.0, max=1.0, dv=1.0, keyable=True)
        pm.parentConstraint(self.__blendJoints[1], moduleCtrl.zeroGrp(), mo=False)
        moduleCtrl.shapeOffset = [0, self._aimSign*10, 0]

        fkIkRev = pm.createNode('reverse', n='{}fkIk_rev'.format(self._prefix))
        moduleCtrl.transform().ik >> self.__ikSystem.topGrp().visibility
        moduleCtrl.transform().ik >> fkIkRev.inputX
        fkIkRev.outputX >> self.__fkSystem.topGrp().visibility
        for cnst in self.__blendConstraints:
            moduleCtrl.transform().ik >> cnst.target[0].targetWeight
            fkIkRev.outputX >> cnst.target[1].targetWeight

        pm.parent(moduleCtrl.zeroGrp(), self.__controllerGrp)
        self._controllers.append(moduleCtrl)

    def attachTo(self, module):
        if isinstance(module, TwoBoneLimb):
            # Connect ik joints
            utils.removeConnections(self.__ikSystem.joints()[0])
            pm.parentConstraint(module.ikSystem().joints()[-1], self.__ikSystem.joints()[0], mo=True)
            # Connect skel joints
            utils.removeConnections(self._skelJoints[0])
            pm.parentConstraint(self._outJoints[0], self._skelJoints[0], mo=True)
            # Connect ik handle
            moduleIkHandleLoc = module.ikSystem().ikHandle().getParent()
            utils.removeConnections(moduleIkHandleLoc)
            pm.parentConstraint(self.__ikSystem.revFootJoints()[-1], moduleIkHandleLoc, mo=True)
            # Connect ik controllers
            pm.parentConstraint(module.ikSystem().controllers()[0], self.__ikSystem.controllers()[0], mo=True)
            utils.cloneUserDefinedAttrs(self.__ikSystem.controllers()[0].transform(), module.ikSystem().controllers()[0].transform())
            self.__ikSystem.controllers()[0].hide()
            # Connect fk controllers
            pm.parentConstraint(module.fkSystem().controllers()[-1], self.__fkSystem.controllers()[0], mo=True)
            self.__fkSystem.controllers()[0].hide()
            # Connect module controllers
            module.controllers()[0].transform().ik >> self._controllers[0].transform().ik
            self._controllers[0].hide()
        else:
            super(Foot, self).attachTo(module)

    def postBuild(self):
        super(Foot, self).postBuild()

        self.__ikSystem.controllers()[0].scale = self._controllerScale * 2
        self._controllers[0].scale = self._controllerScale * 0.2
