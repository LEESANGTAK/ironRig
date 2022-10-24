import pymel.core as pm
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
        tempLoc = pm.spaceLocator()
        pm.xform(tempLoc, t=self._getModulesCenter(), ws=True)
        pm.matchTransform(self._topGrp, tempLoc, pivots=True)
        pm.delete(tempLoc)

    def _buildControls(self):
        masterCtrl = Controller('{}ctrl'.format(self._prefix), Controller.SHAPE.CUBE, Controller.COLOR.GREEN)
        masterCtrl.lockChannels(['translate', 'rotate', 'scale', 'visibility'], ['X', 'Y', 'Z'])
        masterCtrl.shapeOffset = [0, 5, 0]
        for module in self._modules:
            attrStr = module.prefix.split('_')[0]
            pm.addAttr(masterCtrl.transform(), ln='{}_curl'.format(attrStr), at='double', dv=0.0, keyable=True)
            for fkCtrl in module.fkSystem().controllers():
                masterCtrl.transform().attr('{}_curl'.format(attrStr)) >> fkCtrl.extraGrp().rotateZ

        pm.xform(masterCtrl.zeroGrp(), t=self._getModulesCenter(), ws=True)
        self._topGrp | masterCtrl.zeroGrp()
        self.addMembers(masterCtrl.controllerNode())

    def _getModulesCenter(self):
        modulesCenter = pm.dt.Vector()
        for module in self._modules:
            modulesCenter += pm.dt.Vector(utils.getWorldPoint(module.topGrp()))
        return pm.dt.Point(modulesCenter / len(self._modules))
