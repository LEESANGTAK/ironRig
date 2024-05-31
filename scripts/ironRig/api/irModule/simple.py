from maya import cmds
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
                initJnt = cmds.createNode('joint', n=initSkelLoc.replace('_loc', ''))
                cmds.matchTransform(initJnt, initSkelLoc)
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
            self.__system = FK(self.fullName+'fk_', fkJoints)
        elif self.__type == Simple.TYPE.SINGLE:
            singleJoints = utils.buildNewJoints(self._initJoints, searchStr='init', replaceStr='sg')
            self.__system = Single(self.fullName+'sg_', singleJoints)

        if self._negateScaleX:
            self.__system.negateScaleX = True

        self.__system.build()
        self._addSystems(self.__system)
        self._sysJoints = self.__system.joints

    def _connectSystems(self):
        pass

    def _buildOutputs(self):
        if self.__type == Simple.TYPE.FK:
            self._outJoints = utils.buildNewJointChain(self._initJoints, searchStr='init', replaceStr='out')
        elif self.__type == Simple.TYPE.SINGLE:
            self._outJoints = utils.buildNewJoints(self._initJoints, searchStr='init', replaceStr='out')
        utils.parentKeepHierarchy(self._outJoints, self._outGrp)

    def _connectSkeleton(self):
        for outJnt, skelJnt in zip(self._outJoints, self._skelJoints):
            cmds.parentConstraint(outJnt, skelJnt, mo=True)
            cmds.scaleConstraint(outJnt, skelJnt, mo=True)
            # for axis in 'XYZ':
            #     outJnt.attr('scale'+axis) >> skelJnt.attr('scale'+axis)

    def postBuild(self):
        super(Simple, self).postBuild()

        for ctrl in self.__system.controllers:
            ctrl.shape = self.__controllerShape
