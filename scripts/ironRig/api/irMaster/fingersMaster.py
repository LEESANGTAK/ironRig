from maya.api import OpenMaya as om
from maya import cmds
from ... import utils
from ..irGlobal import Controller
from .master import Master

class FingersMaster(Master):
    def __init__(self, prefix=''):
        super(FingersMaster, self).__init__(prefix)

    def build(self):
        super(FingersMaster, self).build()
        self.__movePivotToModulesCenter()

    def __movePivotToModulesCenter(self):
        tempLoc = cmds.spaceLocator()
        cmds.xform(tempLoc, t=self._getModulesCenter(), ws=True)
        cmds.matchTransform(self._topGrp, tempLoc, pivots=True)
        cmds.delete(tempLoc)

    def _buildControls(self):
        masterCtrl = Controller('{}ctrl'.format(self._name), Controller.SHAPE.CUBE, Controller.COLOR.GREEN)
        masterCtrl.lockHideChannels(['translate', 'rotate', 'scale', 'visibility'], ['X', 'Y', 'Z'])
        masterCtrl.shapeOffset = [0, 5, 0]
        for module in self._modules:
            attrStr = module.prefix.split('_')[0]
            cmds.addAttr(masterCtrl, ln='{}_curl'.format(attrStr), at='double', dv=0.0, keyable=True)
            for fkCtrl in module.fkSystem().controllers:
                masterCtrl.attr('{}_curl'.format(attrStr)) >> fkCtrl.extraGrp.rotateZ

        cmds.xform(masterCtrl.zeroGrp, t=self._getModulesCenter(), ws=True)
        self._topGrp | masterCtrl.zeroGrp
        self.addMembers(masterCtrl.controllerNode)

    def _getModulesCenter(self):
        modulesCenter = cmds.dt.Vector()
        for module in self._modules:
            modulesCenter += om.MVector(utils.getWorldPoint(module.topGrp))
        return om.MPoint(modulesCenter / len(self._modules))
