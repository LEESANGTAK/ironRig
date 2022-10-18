import pymel.core as pm
from ... import utils
from ..irSystem import FK
from .module import Module


class Jaw(Module):
    def __init__(self, prefix='', joints=[]):
        super(Jaw, self).__init__(prefix, joints)

        self.__fkSystem = None

    def _buildSystems(self):
        fkJoints = utils.buildNewJointChain(self._initJoints, searchStr='init', replaceStr='fk')
        self.__fkSystem = FK(self._prefix+'fk_', fkJoints)
        if self._negateScaleX:
            self.__fkSystem.negateSclaeX = True
        self.__fkSystem.build()
        shapeOffset = utils.getDistance(self.__fkSystem.joints()[0], self.__fkSystem.joints()[-1])*1.2 * self.__fkSystem.aimSign() * utils.axisToVector(self.__fkSystem.aimAxis())
        self.__fkSystem.controllers()[0].shapeOffset = shapeOffset
        self.addSystems(self.__fkSystem)

    def _connectSystems(self):
        pass

    def _connectOutputs(self):
        for sysJnt, outJnt in zip(self.__fkSystem.joints(), self._outJoints):
            pm.pointConstraint(sysJnt, outJnt, mo=True)
            pm.orientConstraint(sysJnt, outJnt, mo=True)
            utils.connectTransform(sysJnt, outJnt, ['scale'], ['X', 'Y', 'Z'])
