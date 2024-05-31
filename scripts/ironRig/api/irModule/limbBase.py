from maya import cmds
from ... import utils
from ..irSystem import FK
from .module import Module


class LimbBase(Module):
    """Base module of a `Limb Module`. (e.g. Clavicle)

    :param Module: Base class of a `Module`
    """
    def __init__(self, prefix='', joints=[]):
        super(LimbBase, self).__init__(prefix, joints)

        self.__fkSystem = None

    def fkSystem(self):
        return self.__fkSystem

    def _buildSystems(self):
        fkJoints = utils.buildNewJointChain(self._initJoints, searchStr='init', replaceStr='fk')
        self.__fkSystem = FK(self.longName+'fk_', fkJoints)
        if self._negateScaleX:
            self.__fkSystem.negateScaleX = True
        self.__fkSystem.build()

        shapeOffset = utils.getDistance(self.__fkSystem.joints[0], self.__fkSystem.joints[-1]) * 0.8 * (self.__fkSystem.aimSign * utils.axisStrToVector(self.__fkSystem.aimAxis()))
        if self._negateScaleX:
            shapeOffset = -shapeOffset
        self.__fkSystem.controllers[0].shapeOffset = shapeOffset

        self._addSystems(self.__fkSystem)
        self._sysJoints = self.__fkSystem.joints

    def _connectSystems(self):
        pass

    def _connectSkeleton(self):
        for outJnt, skelJnt in zip(self._outJoints, self._skelJoints):
            if outJnt == self._outJoints[-1]:
                break
            cmds.parentConstraint(outJnt, skelJnt, mo=True)
            cmds.scaleConstraint(outJnt, skelJnt, mo=True)
            # for axis in 'XYZ':
            #     outJnt.attr('scale'+axis) >> skelJnt.attr('scale'+axis)
