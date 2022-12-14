import pymel.core as pm
from ... import utils
from ..irGlobal import Controller
from ..irSystem import FK
from .module import Module


class Head(Module):
    def __init__(self, prefix='', joints=[]):
        super(Head, self).__init__(prefix, joints)

        self.__fkSystem = None

    def fkSystem(self):
        return self.__fkSystem

    def _buildSystems(self):
        fkJoints = utils.buildNewJointChain(self._initJoints, searchStr='init', replaceStr='fk')
        self.__fkSystem = FK(self._prefix+'fk_', fkJoints)
        if self._negateScaleX:
            self.__fkSystem.negateSclaeX = True
        self.__fkSystem.build()
        self.__fkSystem.controllers()[0].shape = Controller.SHAPE.CUBE
        self.__fkSystem.controllers()[0].scale = utils.getDistance(self._skelJoints[0], self._skelJoints[-1]) * 0.5
        self.__fkSystem.controllers()[0].alignShapeTo(utils.getWorldPoint(self._skelJoints[0]), Controller.SIDE.BOTTOM)
        self.addSystems(self.__fkSystem)

    def _connectSystems(self):
        pass

    def _connectOutputs(self):
        for sysJnt, outJnt in zip(self.__fkSystem.joints(), self._outJoints):
            pm.pointConstraint(sysJnt, outJnt, mo=True)
            pm.orientConstraint(sysJnt, outJnt, mo=True)
            utils.connectTransform(sysJnt, outJnt, ['scale'], ['X', 'Y', 'Z'])
