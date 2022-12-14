import pymel.core as pm
from ... import utils
from ..irGlobal import Controller
from ..irSystem import Single
from ..irSystem import FK
from .module import Module


class SimpleType:
    FK = 0
    SINGLE = 1


class Simple(Module):
    TYPE = SimpleType

    """
    Simple can be applied for simple joint chain or non-hierachical joints.
    """
    def __init__(self, prefix='', joints=[]):
        super(Simple, self).__init__(prefix, joints)

        self.__type = Simple.TYPE.SINGLE
        self.__system = None
        self.__controllerShape = Controller.SHAPE.CIRCLE
        self._controllerColor = Controller.COLOR.SKYBLUE

    @property
    def type(self):
        return self.__type

    @type.setter
    def type(self, type):
        self.__type = type

    def system(self):
        return self.__system

    @property
    def controllerShape(self):
        return self.__controllerShape

    @controllerShape.setter
    def controllerShape(self, shape):
        self.__controllerShape = shape

    def preBuild(self):
        if self.__type == Simple.TYPE.FK:
            super(Simple, self).preBuild()
        elif self.__type == Simple.TYPE.SINGLE:
            self._buildGroups()
            self._buildInitSkelLocators()
            self._buildInitJoints()

    def _buildInitJoints(self):
        if self.__type == Simple.TYPE.FK:
            super(Simple, self)._buildInitJoints()
        elif self.__type == Simple.TYPE.SINGLE:
            initJoints = []
            for initSkelLoc in self._initSkelLocators:
                initJnt = pm.createNode('joint', n=initSkelLoc.replace('_loc', ''))
                pm.matchTransform(initJnt, initSkelLoc)
                initJnt.segmentScaleCompensate.set(False)
                initJnt.displayLocalAxis.set(True)
                self._initGrp | initJnt
                initJoints.append(initJnt)

            self._initJoints = initJoints

    def _getAimAxisInfo(self):
        pass

    def _buildSystems(self):
        if self.__type == Simple.TYPE.FK:
            fkJoints = utils.buildNewJointChain(self._initJoints, searchStr='init', replaceStr='fk')
            self.__system = FK(self._prefix+'fk_', fkJoints)
        elif self.__type == Simple.TYPE.SINGLE:
            singleJoints = utils.buildNewJoints(self._initJoints, searchStr='init', replaceStr='sg')
            self.__system = Single(self._prefix+'sg_', singleJoints)

        if self._negateScaleX:
            self.__system.negateSclaeX = True

        self.__system.build()

        self.addSystems(self.__system)

    def _connectSystems(self):
        pass

    def _connectOutputs(self):
        for sysJnt, outJnt in zip(self.__system.joints(), self._outJoints):
            pm.pointConstraint(sysJnt, outJnt, mo=True)
            pm.orientConstraint(sysJnt, outJnt, mo=True)
            utils.connectTransform(sysJnt, outJnt, ['scale'], ['X', 'Y', 'Z'])

    def _connectSkeleton(self):
        for outJnt, skelJnt in zip(self._outJoints, self._skelJoints):
            pm.parentConstraint(outJnt, skelJnt, mo=True)
            utils.connectTransform(outJnt, skelJnt, ['scale'], ['X', 'Y', 'Z'])

    def postBuild(self):
        super(Simple, self).postBuild()

        for ctrl in self.__system.controllers():
            ctrl.shape = self.__controllerShape
