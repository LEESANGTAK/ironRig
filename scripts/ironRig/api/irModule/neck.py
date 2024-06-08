from maya import cmds
from ... import utils
from ... import common
from ..irGlobal import Controller
from ..irSystem import SplineIK
from .module import Module


class Neck(Module):
    def __init__(self, name='new', side=Module.SIDE.CENTER, skeletonJoints=[]):
        self._ikSystem = None
        self._numberOfControllers = 3
        self._nonrollJoints = []
        super(Neck, self).__init__(name, side, skeletonJoints)

    @property
    def numberOfControllers(self):
        return self._numberOfControllers

    @numberOfControllers.setter
    def numberOfControllers(self, numCtrl):
        self._numberOfControllers = max(2, numCtrl)
        self._ikSystem.numberOfControllers = self._numberOfControllers

    @property
    def ikSystem(self):
        return self._ikSystem

    @property
    def neckController(self):
        return self._ikSystem.controllers[-2]

    @property
    def headController(self):
        return self._ikSystem.controllers[-1]

    def _addSystems(self):
        self._ikSystem = SplineIK(self._name, self._side)
        self._ikSystem.numberOfControllers = self._numberOfControllers
        self._ikSystem.alignEndControllerToWorld = True
        self._systems.append(self._ikSystem)

        super(Neck, self)._addSystems()

    def _buildSystems(self):
        ikJoints = utils.buildNewJointChain(self._initJoints, searchStr='init', replaceStr='ik')
        self._ikSystem.joints = ikJoints
        if self._numberOfControllers == 2:
            self._ikSystem.curveDegree = SplineIK.CURVE_DEGREE.LINEAR
            self._ikSystem.curveSpans = 1
        elif self._numberOfControllers == 3:
            self._ikSystem.curveDegree = SplineIK.CURVE_DEGREE.CUBIC
            self._ikSystem.curveSpans = 1
        self._ikSystem.build()

        if len(self._initJoints) > 2:
            self._setupTwist()
        self._ikSystem.setupStretch()
        self._ikSystem.setupHybridIK()

        self._ikSystem.controllerShape = Controller.SHAPE.CIRCLE
        self._ikSystem.controllers[-1].shape = Controller.SHAPE.CUBE
        self._ikSystem.controllers[-1].name = 'head'

        self._sysJoints = self._ikSystem.joints

    def _setupTwist(self):
        self._setupNonroll()
        headCtrlLocalMtx = cmds.createNode('multMatrix', n='{}_local_multMtx'.format(self._ikSystem.controllers[-1]))
        headCtrlLocalDecMtx = cmds.createNode('decomposeMatrix', n='{}_local_decMtx'.format(self._ikSystem.controllers[-1]))
        cmds.connectAttr('{}.worldMatrix'.format(self._ikSystem.controllers[-1]), '{}.matrixIn[0]'.format(headCtrlLocalMtx))
        cmds.connectAttr('{}.worldInverseMatrix'.format(self._nonrollJoints[0]), '{}.matrixIn[1]'.format(headCtrlLocalMtx))
        cmds.connectAttr('{}.matrixSum'.format(headCtrlLocalMtx), '{}.inputMatrix'.format(headCtrlLocalDecMtx))
        cmds.connectAttr('{}.outputRotateX'.format(headCtrlLocalDecMtx), '{}.twist'.format(self._ikSystem.ikHandle))
        cmds.setAttr('{}.rootTwistMode'.format(self._ikSystem.ikHandle), True)

    def _setupNonroll(self):
        nonrollGrp = cmds.createNode('transform', n='{}_nonroll_grp'.format(self.shortName))
        cmds.hide(nonrollGrp)
        cmds.matchTransform(nonrollGrp, self._ikSystem.joints[0], pivots=True)

        nonrollJntStart = cmds.duplicate(self._ikSystem.joints[0], n='{}_nonroll_start'.format(self.shortName), po=True)[0]
        nonrollJntEnd = cmds.duplicate(self._ikSystem.joints[-1], n='{}_nonroll_end'.format(self.shortName), po=True)[0]
        cmds.parent(nonrollJntEnd, nonrollJntStart)

        nonrollIkh = cmds.ikHandle(startJoint=nonrollJntStart, endEffector=nonrollJntEnd, solver='ikRPsolver', n='{}_nonroll_ikh'.format(self.shortName))[0]
        for attrStr in ['poleVector' + axis for axis in 'XYZ']:
            cmds.setAttr('{}.{}'.format(nonrollIkh, attrStr), 0)

        cmds.pointConstraint(self._ikSystem.controllers[0], nonrollJntStart, mo=True)
        cmds.parentConstraint(self._ikSystem.controllers[0], nonrollIkh, mo=True)

        cmds.parent([nonrollJntStart, nonrollIkh], nonrollGrp)
        cmds.parent(nonrollGrp, self._systemGrp)

        self._nonrollJoints.append(nonrollJntStart)

        return nonrollGrp

    def _connectSystems(self):
        pass

    def _buildControls(self):
        pass

    def mirror(self, skeletonSideChar='l'):
        oppSideChar = common.SYMMETRY_CHAR_TABLE.get(self._side)
        oppSkelJoints = [jnt.replace(skeletonSideChar, common.SYMMETRY_CHAR_TABLE.get(skeletonSideChar)) for jnt in self._skelJoints]
        oppMod = Neck(self._name, oppSideChar, oppSkelJoints)
        oppMod.preBuild()
        oppMod.symmetrizeGuide()
        oppMod.build()
        oppMod.symmetrizeControllerShapes()
        oppMod.controllerColor = common.SYMMETRY_COLOR_TABLE.get(self._controllerColor)
        return oppMod
