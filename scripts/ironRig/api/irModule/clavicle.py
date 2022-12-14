import pymel.core as pm
from ... import utils
from ..irSystem import FK
from .module import Module


class Clavicle(Module):
    def __init__(self, prefix='', joints=[]):
        super(Clavicle, self).__init__(prefix, joints)

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

    def _connectSystems(self):
        pass

    def _connectOutputs(self):
        for sysJnt, outJnt in zip(self.__fkSystem.joints(), self._outJoints):
            pm.pointConstraint(sysJnt, outJnt, mo=True)
            pm.orientConstraint(sysJnt, outJnt, mo=True)
            utils.connectTransform(sysJnt, outJnt, channels=['scale'], axes=['X', 'Y', 'Z'])

    def _connectSkeleton(self):
        for outJnt, skelJnt in zip(self._outJoints, self._skelJoints):
            if outJnt == self._outJoints[-1]:
                break
            pm.parentConstraint(outJnt, skelJnt, mo=True)

