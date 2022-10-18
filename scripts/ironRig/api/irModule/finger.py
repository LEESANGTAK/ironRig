import pymel.core as pm
from ... import utils
from ..irSystem import FK
from .module import Module


class Finger(Module):
    def __init__(self, prefix='', joints=[]):
        super(Finger, self).__init__(prefix, joints)

        self.__fkSystem = None

    def fkSystem(self):
        return self.__fkSystem

    def preBuild(self):
        super(Finger, self).preBuild()
        pm.addAttr(self._oriPlaneLocators[1], ln='curl', at='float', keyable=True)
        for initJnt in self._initJoints:
            self._oriPlaneLocators[1].curl >> initJnt.rz

    def _buildSystems(self):
        fkJoints = utils.buildNewJointChain(self._initJoints, searchStr='init', replaceStr='fk')
        self.__fkSystem = FK(self._prefix, fkJoints)
        if self._negateScaleX:
            self.__fkSystem.negateSclaeX = True
        self.__fkSystem.build()
        self.addSystems(self.__fkSystem)

    def _connectSystems(self):
        pass

    def _connectOutputs(self):
        for sysJnt, outJnt in zip(self.__fkSystem.joints(), self._outJoints):
            pm.pointConstraint(sysJnt, outJnt, mo=True)
            pm.orientConstraint(sysJnt, outJnt, mo=True)
            utils.connectTransform(sysJnt, outJnt, channels=['scale'], axes=['X', 'Y', 'Z'])
