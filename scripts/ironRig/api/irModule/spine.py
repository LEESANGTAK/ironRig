from maya.api import OpenMaya as om
from maya import cmds
from ... import utils
from ... import common
from ..irGlobal.controller import Controller
from ..irSystem.splineIK import SplineIK
from .module import Module


class Spine(Module):
    def __init__(self, name='new', side=Module.SIDE.CENTER, skeletonJoints=[]):
        self._ikSystem = None
        self._fkSystem = None
        super().__init__(name, side, skeletonJoints)

    @property
    def ikSystem(self):
        return self._ikSystem

    @property
    def fkSystem(self):
        return self._fkSystem

    @property
    def pelvisController(self):
        return self._controllers[0]

    @property
    def chestController(self):
        return self._ikSystem.controllers[-1]

    def _addSystems(self):
        self._ikSystem = SplineIK(self._name, self._side, numberOfControllers=4)
        self._systems.append(self._ikSystem)
        super()._addSystems()

    def _buildGroups(self):
        super()._buildGroups()
        self._controllerGrp = cmds.group(n='{}_ctrl_grp'.format(self.shortName), empty=True)
        cmds.parent(self._controllerGrp, self._topGrp)

    def build(self):
        super().build()
        self._buildControls()

    def _buildSystems(self):
        ikJoints = utils.buildNewJointChain(self._initJoints, searchStr='init', replaceStr='ik')
        self._ikSystem.joints = ikJoints
        self._ikSystem.build()

        self._ikSystem.setupAdvancedTwist()
        self._ikSystem.setupStretch()
        self._ikSystem.setupHybridIK()
        self._ikSystem.controllers[0].hide()
        self._ikSystem.controllers[-1].name = 'chest'
        utils.removeConnections(self._ikSystem.controllers[1].zeroGrp)
        for ctrl in self._ikSystem.controllers[1:-1]:
            ctrl.shape = Controller.SHAPE.CIRCLE

        self._sysJoints = self._ikSystem.joints

    @staticmethod
    def buildFKJoints(prefix, joints, numFKJoints):
        fkJnts = []

        startJntPnt = utils.getWorldPoint(joints[0])
        endJntPnt = utils.getWorldPoint(joints[-1])
        startToEndJntVec = endJntPnt - startJntPnt
        fkJntSegments = numFKJoints - 1
        increment = 1.0 / fkJntSegments
        for i in range(numFKJoints):
            fkJnt = cmds.createNode('joint', n='{}{:02d}_fk'.format(prefix, i))
            fkJntPos = om.MVector(startJntPnt) + startToEndJntVec * (increment * i)
            cmds.xform(fkJnt, t=list(fkJntPos)[:3], ws=True)
            closestJnt = utils.findClosestObject(fkJntPos, joints)
            cmds.matchTransform(fkJnt, closestJnt, rotation=True)
            fkJnts.append(fkJnt)

        utils.makeHierarchy(fkJnts)

        return fkJnts

    def _connectSystems(self):
        pass

    def _buildControls(self):
        pelvisCtrl = Controller('pelvis', Controller.SHAPE.CUBE)
        cmds.matchTransform(pelvisCtrl.zeroGrp, self._ikSystem.joints[1], position=True, rotation=True)
        cmds.xform(pelvisCtrl.zeroGrp, m=utils.matrixAlignedToWorldAxis(pelvisCtrl), ws=True)
        cmds.parentConstraint(pelvisCtrl, self._ikSystem.controllers[0], mo=True)
        cmds.parent(pelvisCtrl.zeroGrp, self._controllerGrp)
        pelvisCtrl.lockHideChannels(['scale', 'visibility'])
        self._controllers.append(pelvisCtrl)
        self.addMembers(pelvisCtrl.allNodes)

        upBodyCtrl = Controller('upBody', Controller.SHAPE.ARROW_QUAD, direction=Controller.DIRECTION.Y)
        cmds.matchTransform(upBodyCtrl.zeroGrp, self._initJoints[0], position=True)
        cmds.xform(upBodyCtrl.zeroGrp, m=utils.matrixAlignedToWorldAxis(upBodyCtrl), ws=True)
        cmds.parent(cmds.listRelatives(self._topGrp, children=True), upBodyCtrl)
        cmds.parent(upBodyCtrl.zeroGrp, self._topGrp)
        self._controllers.append(upBodyCtrl)
        self.addMembers(upBodyCtrl.allNodes)

    def mirror(self, skeletonSearchStr='_l', skeletonReplaceStr='_r', mirrorTranslate=False):
        oppSideChar, oppSkelJoints = super().mirror(skeletonSearchStr, skeletonReplaceStr)
        oppMod = Spine(self._name, oppSideChar, oppSkelJoints)
        oppMod.mirrorTranslate = mirrorTranslate
        oppMod.preBuild()
        oppMod.symmetrizeGuide()
        oppMod.build()
        oppMod.symmetrizeControllerShapes()
        oppMod.controllerColor = common.SYMMETRY_COLOR_TABLE.get(self._controllerColor)
        return oppMod
