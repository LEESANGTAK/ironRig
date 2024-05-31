from ... import utils
from ..irSystem import FK
from .module import Module


class Jaw(Module):
    def __init__(self, prefix='', joints=[]):
        super(Jaw, self).__init__(prefix, joints)

        self.__fkSystem = None

    def _buildSystems(self):
        fkJoints = utils.buildNewJointChain(self._initJoints, searchStr='init', replaceStr='fk')
        self.__fkSystem = FK(self.fullName+'fk_', fkJoints)
        if self._negateScaleX:
            self.__fkSystem.negateScaleX = True
        self.__fkSystem.build()
        shapeOffset = utils.getDistance(self.__fkSystem.joints[0], self.__fkSystem.joints[-1])*1.2 * (self.__fkSystem.aimSign * utils.axisStrToVector(self.__fkSystem.aimAxis()))
        self.__fkSystem.controllers[0].shapeOffset = shapeOffset

        self._addSystems(self.__fkSystem)
        self._sysJoints = self.__fkSystem.joints

    def _connectSystems(self):
        pass
