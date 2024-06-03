from maya import cmds
from ... import utils
from ..irSystem import FK
from .module import Module


class Finger(Module):
    def __init__(self, name='new', side=Module.SIDE.CENTER, skeletonJoints=[]):
        self._fkSystem = None
        super(Finger, self).__init__(name, side, skeletonJoints)

    @property
    def fkSystem(self):
        return self._fkSystem

    def _addSystems(self):
        self._fkSystem = FK(self._name, self._side)
        self._systems.append(self._fkSystem)
        super(Finger, self)._addSystems()

    def preBuild(self):
        super(Finger, self).preBuild()
        cmds.addAttr(self._oriPlaneLocators[1], ln='curl', at='float', dv=0.0, keyable=True)
        for initJnt in self._initJoints:
            cmds.connectAttr('{}.curl'.format(self._oriPlaneLocators[1]), '{}.rz'.format(initJnt))

    def _buildSystems(self):
        fkJoints = utils.buildNewJointChain(self._initJoints, searchStr='init', replaceStr='fk')
        self._fkSystem.joints = fkJoints
        self._fkSystem.build()

        self._sysJoints = self._fkSystem.joints

    def _connectSystems(self):
        pass
