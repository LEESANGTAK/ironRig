from maya import cmds
from ... import utils
from ... import common
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
        for initJnt in self._initJoints[1:]:
            cmds.connectAttr('{}.curl'.format(self._oriPlaneLocators[1]), '{}.rz'.format(initJnt))

    def _buildSystems(self):
        fkJoints = utils.buildNewJointChain(self._initJoints, searchStr='init', replaceStr='fk')
        self._fkSystem.joints = fkJoints
        self._fkSystem.build()

        self._sysJoints = self._fkSystem.joints

    def _connectSystems(self):
        pass

    def mirror(self):
        oppSideChar = common.SYMMETRY_CHAR_TABLE.get(self._side)
        oppSkelJoints = [jnt.replace('_{}'.format(self._side), '_{}'.format(oppSideChar)) for jnt in self._skelJoints]
        oppMod = Finger(self._name, oppSideChar, oppSkelJoints)
        oppMod.preBuild()
        oppMod.symmetrizeGuide()
        oppMod.build()
        oppMod.symmetrizeControllers()
        return oppMod
