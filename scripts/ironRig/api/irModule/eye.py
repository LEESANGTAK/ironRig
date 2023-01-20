import pymel.core as pm
from ... import utils
from ..irGlobal import Aligner
from ..irSystem import Aim
from ..irSystem import FK
from .module import Module


class Eye(Module):
    def __init__(self, prefix='', joints=[]):
        super(Eye, self).__init__(prefix, joints)

        self.__aimSystem = None
        self.__fkSystem = None

    def aimSystem(self):
        return self.__aimSystem

    def orientInitJoints(self):
        upVector = utils.getWorldPoint(self.midLocPlane) - utils.getWorldPoint(self._initJoints[0])
        if round(utils.getWorldPoint(self._initJoints[0]).x) < 0.0:  # The orientation of right eye is same as left eye has.
            Aligner.orientJoints(self._initJoints, upVector, mirror=False)

    def _buildSystems(self):
        ikJoints = utils.buildNewJointChain(self._initJoints, searchStr='init', replaceStr='ik')
        self.__aimSystem = Aim(self._prefix+'ik_', ikJoints)
        if self._negateScaleX:
            self.__aimSystem.negateSclaeX = True
        self.__aimSystem.build()
        self.addSystems(self.__aimSystem)

        fkJoints = utils.buildNewJointChain(self._initJoints, searchStr='init', replaceStr='fk')
        self.__fkSystem = FK(self._prefix+'fk_', fkJoints)
        if self._negateScaleX:
            self.__fkSystem.negateSclaeX = True
        self.__fkSystem.build()
        shapeOffset = utils.getDistance(self.__fkSystem.joints()[0], self.__fkSystem.joints()[-1])*1.2 * (self.__aimSystem.aimSign() * utils.axisToVector(self.__aimSystem.aimAxis()))
        self.__fkSystem.controllers()[0].shapeOffset = shapeOffset
        self.addSystems(self.__fkSystem)

        self._sysJoints = self.__fkSystem.joints()

    def _connectSystems(self):
        pm.parentConstraint(self.__aimSystem.joints()[0], self.__fkSystem.controllers()[0].zeroGrp())
