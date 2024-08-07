from maya import cmds
from ... import utils
from ... import common
from ..irGlobal.aligner import Aligner
from ..irSystem.aim import Aim
from ..irSystem.fk import FK
from .module import Module


class Eye(Module):
    def __init__(self, name='new', side=Module.SIDE.CENTER, skeletonJoints=[]):
        self._aimSystem = None
        self._fkSystem = None
        super().__init__(name, side, skeletonJoints)

    @property
    def aimSystem(self):
        return self._aimSystem

    def _addSystems(self):
        self._aimSystem = Aim(self._name, self._side)
        self._systems.append(self._aimSystem)

        self._fkSystem = FK(self._name, self._side)
        if len(self._skelJoints) == 1:
            self._fkSystem.endController = True
        self._systems.append(self._fkSystem)

        super()._addSystems()

    def preBuild(self):
        if len(self._skelJoints) == 1:
            self._buildGroups()
            self._buildInitSkelLocators()
            self._buildInitJoints()
        else:
            super().preBuild()

    def _buildInitJoints(self):
        if len(self._skelJoints) == 1:
            initJoints = []
            for initSkelLoc in self._initSkelLocators:
                initJnt = cmds.createNode('joint', n=initSkelLoc.replace('_loc', ''))
                cmds.matchTransform(initJnt, initSkelLoc)
                cmds.setAttr('{}.segmentScaleCompensate'.format(initJnt), False)
                cmds.setAttr('{}.displayLocalAxis'.format(initJnt), True)
                cmds.parent(initJnt, self._initGrp)
                initJoints.append(initJnt)

            self._initJoints = initJoints
        else:
            super()._buildInitJoints()

    def orientInitJoints(self):
        upVector = utils.getWorldPoint(self.midLocPlane) - utils.getWorldPoint(self._initJoints[0])
        if round(utils.getWorldPoint(self._initJoints[0]).x) < 0.0:  # The orientation of right eye is same as left eye has.
            Aligner.orientJoints(self._initJoints, upVector, mirror=False)

    def _buildSystems(self):
        ikJoints = utils.buildNewJointChain(self._initJoints, searchStr='init', replaceStr='ik')
        self._aimSystem.joints = ikJoints
        self._aimSystem.build()

        fkJoints = utils.buildNewJointChain(self._initJoints, searchStr='init', replaceStr='fk')
        self._fkSystem.joints = fkJoints
        self._fkSystem.build()

        shapeOffset = utils.getDistance(self._fkSystem.joints[0], self._fkSystem.joints[-1])*1.2 * (self._aimSystem.aimSign * utils.axisStrToVector(self._aimSystem.aimAxis))
        self._fkSystem.controllers[0].shapeOffset = shapeOffset

        self._sysJoints = self._fkSystem.joints

        super()._buildSystems()

    def _connectSystems(self):
        cmds.parentConstraint(self._aimSystem.joints[0], self._fkSystem.controllers[0].zeroGrp)

    def mirror(self, skeletonSearchStr='_l', skeletonReplaceStr='_r', mirrorTranslate=False):
        oppSideChar, oppSkelJoints = super().mirror(skeletonSearchStr, skeletonReplaceStr)
        oppMod = Eye(self._name, oppSideChar, oppSkelJoints)
        oppMod.mirrorTranslate = mirrorTranslate
        oppMod.preBuild()
        oppMod.symmetrizeGuide(jointAxis=False)
        oppMod.build()
        oppMod.symmetrizeControllerShapes()
        oppMod.controllerColor = common.SYMMETRY_COLOR_TABLE.get(self._controllerColor)
        return oppMod
