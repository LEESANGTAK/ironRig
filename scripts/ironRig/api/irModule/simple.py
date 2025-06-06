from maya import cmds
from ... import utils
from ... import common
from ..irGlobal.controller import Controller
from ..irSystem.single import Single
from ..irSystem.fk import FK
from .module import Module


class SystemType:
    FK = 0
    SINGLE = 1


class Simple(Module):
    SYSTEM_TYPE = SystemType

    """
    Simple can be applied for simple joint chain or non-hierachical joints.
    """
    def __init__(self, name='new', side=Module.SIDE.CENTER, skeletonJoints=[], simpleType=SystemType.FK):
        self._simpleType = simpleType
        self._system = None
        self._controllerShape = Controller.SHAPE.CIRCLE
        self._controllerColor = Controller.COLOR.SKYBLUE

        super().__init__(name, side, skeletonJoints)

    @property
    def system(self):
        return self._system

    @property
    def controllerShape(self):
        return self._controllerShape

    @controllerShape.setter
    def controllerShape(self, shape):
        self._controllerShape = shape

    def _addSystems(self):
        if self._simpleType == Simple.SYSTEM_TYPE.FK:
            self._system = FK(self._name, self._side)
        elif self._simpleType == Simple.SYSTEM_TYPE.SINGLE:
            self._system = Single(self._name, self._side)

        self._systems.append(self._system)
        super()._addSystems()

    def preBuild(self):
        if self._simpleType == Simple.SYSTEM_TYPE.FK:
            super().preBuild()
        elif self._simpleType == Simple.SYSTEM_TYPE.SINGLE:
            self._buildInitSkelLocators()
            self._buildInitJoints()

    def _buildInitJoints(self):
        if self._simpleType == Simple.SYSTEM_TYPE.FK:
            super()._buildInitJoints()
        elif self._simpleType == Simple.SYSTEM_TYPE.SINGLE:
            initJoints = []
            for initSkelLoc in self._initSkelLocators:
                initJnt = cmds.createNode('joint', n=initSkelLoc.replace('_loc', ''))
                cmds.matchTransform(initJnt, initSkelLoc)
                cmds.setAttr('{}.segmentScaleCompensate'.format(initJnt), False)
                cmds.setAttr('{}.displayLocalAxis'.format(initJnt), True)
                cmds.parent(initJnt, self._initGrp)
                initJoints.append(initJnt)

            self._initJoints = initJoints

    def _getAimAxisInfo(self):
        pass

    def _buildSystems(self):
        if self._simpleType == Simple.SYSTEM_TYPE.FK:
            jnts = utils.buildNewJointChain(self._initJoints, searchStr='init', replaceStr='fk')
        elif self._simpleType == Simple.SYSTEM_TYPE.SINGLE:
            jnts = utils.buildNewJoints(self._initJoints, searchStr='init', replaceStr='sg')
        self._system.joints = jnts
        self._system.build()

        self._sysJoints = self._system.joints

        for ctrl in self._system.controllers:
            ctrl.shape = self._controllerShape

        super()._buildSystems()

    def _connectSystems(self):
        pass

    def _buildOutputs(self):
        if self._simpleType == Simple.SYSTEM_TYPE.FK:
            self._outJoints = utils.buildNewJointChain(self._initJoints, searchStr='init', replaceStr='out')
        elif self._simpleType == Simple.SYSTEM_TYPE.SINGLE:
            self._outJoints = utils.buildNewJoints(self._initJoints, searchStr='init', replaceStr='out')
        utils.parentKeepHierarchy(self._outJoints, self._outGrp)

    def _connectSkeleton(self):
        for outJnt, skelJnt in zip(self._outJoints, self._skelJoints):
            cmds.parentConstraint(outJnt, skelJnt, mo=True)
            cmds.scaleConstraint(outJnt, skelJnt, mo=True)

    def mirror(self, skeletonSearchStr='_l', skeletonReplaceStr='_r', mirrorTranslate=False):
        oppSideChar, oppSkelJoints = super().mirror(skeletonSearchStr, skeletonReplaceStr)
        oppMod = Simple(self._name, oppSideChar, oppSkelJoints)
        oppMod.mirrorTranslate = mirrorTranslate
        oppMod.preBuild()
        oppMod.symmetrizeGuide(jointAxis=False)
        oppMod.build()
        oppMod.symmetrizeControllerShapes()
        oppMod.controllerColor = common.SYMMETRY_COLOR_TABLE.get(self._controllerColor)
        return oppMod
