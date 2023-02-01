import pymel.core as pm
from ... import utils
from ..irSystem import FK
from .module import Module


class LimbBase(Module):
    def __init__(self, prefix='', joints=[]):
        super(LimbBase, self).__init__(prefix, joints)

        self.__fkSystem = None

    def fkSystem(self):
        return self.__fkSystem

    def _buildSystems(self):
        fkJoints = utils.buildNewJointChain(self._initJoints, searchStr='init', replaceStr='fk')
        self.__fkSystem = FK(self._prefix+'fk_', fkJoints)
        if self._negateScaleX:
            self.__fkSystem.negateSclaeX = True
        self.__fkSystem.build()

        shapeOffset = utils.getDistance(self.__fkSystem.joints()[0], self.__fkSystem.joints()[-1]) * 0.8 * (self.__fkSystem.aimSign() * utils.axisToVector(self.__fkSystem.aimAxis()))
        if self._negateScaleX:
            shapeOffset = -shapeOffset
        self.__fkSystem.controllers()[0].shapeOffset = shapeOffset

        self.addSystems(self.__fkSystem)
        self._sysJoints = self.__fkSystem.joints()

    def _connectSystems(self):
        pass

    def _connectSkeleton(self):
        for outJnt, skelJnt in zip(self._outJoints, self._skelJoints):
            if outJnt == self._outJoints[-1]:
                break
            pm.parentConstraint(outJnt, skelJnt, mo=True)

