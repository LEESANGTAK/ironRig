from maya import cmds
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

    def preBuild(self):
        if len(self._skelJoints) == 1:
            self._buildGroups()
            self._buildInitSkelLocators()
            self._buildInitJoints()
        else:
            super(Eye, self).preBuild()

    def _buildInitJoints(self):
        if len(self._skelJoints) == 1:
            initJoints = []
            for initSkelLoc in self._initSkelLocators:
                initJnt = cmds.createNode('joint', n=initSkelLoc.replace('_loc', ''))
                cmds.matchTransform(initJnt, initSkelLoc)
                initJnt.segmentScaleCompensate.set(False)
                initJnt.displayLocalAxis.set(True)
                self._initGrp | initJnt
                initJoints.append(initJnt)

            self._initJoints = initJoints
        else:
            super(Eye, self)._buildInitJoints()

    def orientInitJoints(self):
        upVector = utils.getWorldPoint(self.midLocPlane) - utils.getWorldPoint(self._initJoints[0])
        if round(utils.getWorldPoint(self._initJoints[0]).x) < 0.0:  # The orientation of right eye is same as left eye has.
            Aligner.orientJoints(self._initJoints, upVector, mirror=False)

    def _buildSystems(self):
        ikJoints = utils.buildNewJointChain(self._initJoints, searchStr='init', replaceStr='ik')
        self.__aimSystem = Aim(self._name+'ik_', ikJoints)
        if self._negateScaleX:
            self.__aimSystem.negateSclaeX = True
        self.__aimSystem.build()
        self.addSystems(self.__aimSystem)

        fkJoints = utils.buildNewJointChain(self._initJoints, searchStr='init', replaceStr='fk')
        self.__fkSystem = FK(self._name+'fk_', fkJoints)
        if self._negateScaleX:
            self.__fkSystem.negateSclaeX = True
        if len(self._skelJoints) == 1:
            self.__fkSystem.endController = True
        self.__fkSystem.build()
        shapeOffset = utils.getDistance(self.__fkSystem.joints[0], self.__fkSystem.joints[-1])*1.2 * (self.__aimSystem.aimSign * utils.axisStrToVector(self.__aimSystem.aimAxis()))
        self.__fkSystem.controllers[0].shapeOffset = shapeOffset
        self.addSystems(self.__fkSystem)

        self._sysJoints = self.__fkSystem.joints

    def _connectSystems(self):
        cmds.parentConstraint(self.__aimSystem.joints[0], self.__fkSystem.controllers[0].zeroGrp)
