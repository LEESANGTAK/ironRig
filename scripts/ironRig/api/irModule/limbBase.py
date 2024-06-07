from maya import cmds
from ... import utils
from ... import common
from ..irSystem import FK
from .module import Module


class LimbBase(Module):
    """Base module of a `Limb Module`. (e.g. Clavicle)

    :param Module: Base class of a `Module`
    """
    def __init__(self, name='new', side=Module.SIDE.CENTER, skeletonJoints=[]):
        self._fkSystem = None
        super(LimbBase, self).__init__(name, side, skeletonJoints)

    @property
    def fkSystem(self):
        return self._fkSystem

    @property
    def fkRootController(self):
        return self._fkSystem.controllers[0]

    def _addSystems(self):
        self._fkSystem = FK(self._name, self._side)
        self._systems.append(self._fkSystem)
        super(LimbBase, self)._addSystems()

    def _buildSystems(self):
        fkJoints = utils.buildNewJointChain(self._initJoints, searchStr='init', replaceStr='fk')
        self._fkSystem.joints = fkJoints
        self._fkSystem.build()

        self._sysJoints = self._fkSystem.joints

    def _connectSystems(self):
        pass

    def _connectSkeleton(self):
        for outJnt, skelJnt in zip(self._outJoints, self._skelJoints):
            if outJnt == self._outJoints[-1]:
                break
            cmds.parentConstraint(outJnt, skelJnt, mo=True)
            cmds.scaleConstraint(outJnt, skelJnt, mo=True)

    def mirror(self):
        oppSideChar = common.SYMMETRY_CHAR_TABLE.get(self._side)
        oppSkelJoints = [jnt.replace('_{}'.format(self._side), '_{}'.format(oppSideChar)) for jnt in self._skelJoints]
        oppMod = LimbBase(self._name, oppSideChar, oppSkelJoints)
        oppMod.preBuild()
        oppMod.symmetrizeGuide()
        oppMod.build()
        oppMod.symmetrizeControllers()
        return oppMod
