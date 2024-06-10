from ... import utils
from ... import common
from ..irSystem import FK
from .module import Module


class Jaw(Module):
    def __init__(self, name='new', side=Module.SIDE.CENTER, skeletonJoints=[]):
        self._fkSystem = None
        super(Jaw, self).__init__(name, side, skeletonJoints)

    def _addSystems(self):
        self._fkSystem = FK(self._name, self._side)
        self._systems.append(self._fkSystem)
        super(Jaw, self)._addSystems()

    def _buildSystems(self):
        fkJoints = utils.buildNewJointChain(self._initJoints, searchStr='init', replaceStr='fk')
        self._fkSystem.joints = fkJoints
        self._fkSystem.build()

        shapeOffset = utils.getDistance(self._fkSystem.joints[0], self._fkSystem.joints[-1])*1.2 * (self._fkSystem.aimSign * utils.axisStrToVector(self._fkSystem.aimAxis))
        self._fkSystem.controllers[0].shapeOffset = shapeOffset

        self._sysJoints = self._fkSystem.joints

    def _connectSystems(self):
        pass

    def mirror(self, skeletonSearchStr='_l', skeletonReplaceStr='_r', mirrorTranslate=False):
        oppSideChar, oppSkelJoints = super(Jaw, self).mirror(skeletonSearchStr, skeletonReplaceStr)
        oppMod = Jaw(self._name, oppSideChar, oppSkelJoints)
        oppMod.mirrorTranslate = mirrorTranslate
        oppMod.preBuild()
        oppMod.symmetrizeGuide()
        oppMod.build()
        oppMod.symmetrizeControllerShapes()
        oppMod.controllerColor = common.SYMMETRY_COLOR_TABLE.get(self._controllerColor)
        return oppMod
