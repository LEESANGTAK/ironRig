from maya.api import OpenMaya as om
from maya import cmds
from ... import utils
from ..irGlobal import Controller
from .master import Master

class FingersMaster(Master):
    def __init__(self, name='', side=Master.SIDE.CENTER):
        super(FingersMaster, self).__init__(name, side)

    def build(self):
        super(FingersMaster, self).build()
        self._movePivotToModulesCenter()

    def _movePivotToModulesCenter(self):
        tempLoc = cmds.spaceLocator()[0]
        cmds.xform(tempLoc, t=list(self._getModulesCenter())[:3], ws=True)
        cmds.matchTransform(self._topGrp, tempLoc, pivots=True)
        cmds.delete(tempLoc)

    def _buildControls(self):
        masterCtrl = Controller('{}_ctrl'.format(self.shortName), Controller.SHAPE.CUBE, Controller.COLOR.GREEN)
        masterCtrl.lockHideChannels(['translate', 'rotate', 'scale', 'visibility'], ['X', 'Y', 'Z'])
        masterCtrl.shapeOffset = [0, 5, 0]
        for module in self._modules:
            cmds.addAttr(masterCtrl, ln='{}_curl'.format(module.name), at='double', dv=0.0, keyable=True)
            for fkCtrl in module.fkSystem.controllers[module.curlStartIndex:]:
                cmds.connectAttr('{}.{}'.format(masterCtrl, '{}_curl'.format(module.name)), '{}.rotateZ'.format(fkCtrl.extraGrp))

        cmds.xform(masterCtrl.zeroGrp, t=list(self._getModulesCenter())[:3], ws=True)
        cmds.parent(masterCtrl.zeroGrp, self._topGrp)
        self.addMembers(masterCtrl.allNodes)

    def _getModulesCenter(self):
        modulesCenter = om.MVector()
        for module in self._modules:
            modulesCenter += om.MVector(utils.getWorldPoint(module.topGrp))
        return om.MPoint(modulesCenter / len(self._modules))
