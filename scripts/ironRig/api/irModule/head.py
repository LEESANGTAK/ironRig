from ... import utils
from ..irGlobal import Controller
from ..irSystem import FK
from .module import Module


class Head(Module):
    def __init__(self, name='new', side=Module.SIDE.CENTER, skeletonJoints=[]):
        self._fkSystem = None
        super(Head, self).__init__(name, side, skeletonJoints)

    @property
    def fkSystem(self):
        return self._fkSystem

    def _addSystems(self):
        self._fkSystem = FK(self._name, self._side)
        self._systems.append(self._fkSystem)
        super(Head, self)._addSystems()

    def _buildSystems(self):
        fkJoints = utils.buildNewJointChain(self._initJoints, searchStr='init', replaceStr='fk')
        self._fkSystem.joints = fkJoints
        self._fkSystem.build()

        self._fkSystem.controllers[0].shape = Controller.SHAPE.CUBE
        self._fkSystem.controllers[0].size = utils.getDistance(self._skelJoints[0], self._skelJoints[-1]) * 0.5

        self._sysJoints = self._fkSystem.joints

    def _connectSystems(self):
        pass
