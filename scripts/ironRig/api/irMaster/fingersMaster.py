from maya.api import OpenMaya as om
from maya import cmds
from ... import utils
from ..irGlobal.controller import Controller
from .master import Master

class FingersMaster(Master):
    def __init__(self, name='', side=Master.SIDE.CENTER):
        super().__init__(name, side)

        self._masterCtrl = None

    def removeModules(self, *args):
        modules = sum([module if isinstance(module, list) else [module] for module in args], [])
        for module in modules:
            if module in self._modules:
                cmds.deleteAttr('{}.{}_curl'.format(self._masterCtrl, module.name))
                self._modules.remove(module)
                module.master = None

    def build(self):
        super().build()
        self._movePivotToModulesCenter()

    def _movePivotToModulesCenter(self):
        tempLoc = cmds.spaceLocator()[0]
        cmds.xform(tempLoc, t=list(self._getModulesCenter())[:3], ws=True)
        cmds.matchTransform(self._topGrp, tempLoc, pivots=True)
        cmds.delete(tempLoc)

    def _buildControls(self):
        self._masterCtrl = Controller(self.shortName, Controller.SHAPE.CUBE, Controller.COLOR.GREEN)
        self._masterCtrl.lockHideChannels(['translate', 'rotate', 'scale', 'visibility'], ['X', 'Y', 'Z'])
        self.connectFingers()

        cmds.xform(self._masterCtrl.zeroGrp, t=list(self._getModulesCenter())[:3], ws=True)
        cmds.parent(self._masterCtrl.zeroGrp, self._topGrp)
        self._controllers.append(self._masterCtrl)
        self.addMembers(self._masterCtrl.allNodes)

    def connectFingers(self):
        for module in self._modules:
            attr = '{}.{}_curl'.format(self._masterCtrl, module.name)
            if not cmds.objExists(attr):
                cmds.addAttr(self._masterCtrl, ln='{}_curl'.format(module.name), at='double', dv=0.0, keyable=True)
            for fkCtrl in module.fkSystem.controllers[module.curlStartIndex:]:
                cmds.connectAttr('{}.{}'.format(self._masterCtrl, '{}_curl'.format(module.name)), '{}.rotateZ'.format(fkCtrl.extraGrp), f=True)

    def _getModulesCenter(self):
        modulesCenter = om.MVector()
        for module in self._modules:
            modulesCenter += om.MVector(utils.getWorldPoint(module.topGrp))
        return om.MPoint(modulesCenter / len(self._modules))
