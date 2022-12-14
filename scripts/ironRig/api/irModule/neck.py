import pymel.core as pm
from ... import utils
from ..irGlobal import Controller
from ..irSystem import SplineIK
from .module import Module


class Neck(Module):
    def __init__(self, prefix='', joints=[]):
        super(Neck, self).__init__(prefix, joints)
        self.__ikSystem = None
        self.__numControllers = 3
        self.__nonrollJoints = []

    @property
    def numControllers(self):
        return self.__numControllers

    @numControllers.setter
    def numControllers(self, numCtrl):
        self.__numControllers = max(2, numCtrl)

    def ikSystem(self):
        return self.__ikSystem

    def build(self):
        super(Neck, self).build()

    def _buildSystems(self):
        ikJoints = utils.buildNewJointChain(self._initJoints, searchStr='init', replaceStr='ik')
        self.__ikSystem = SplineIK(self._prefix+'ik_', ikJoints, self.__numControllers)
        if self.__numControllers == 2:
            self.__ikSystem.curveDegree = SplineIK.CURVE_DEGREE.LINEAR
            self.__ikSystem.curveSpans = 1
        elif self.__numControllers == 3:
            self.__ikSystem.curveDegree = SplineIK.CURVE_DEGREE.CUBIC
            self.__ikSystem.curveSpans = 1
        if self._negateScaleX:
            self.__ikSystem.negateSclaeX = True
        self.__ikSystem.build()

        if len(self._initJoints) > 2:
            self.__setupTwist()
        self.__ikSystem.setupStretch()
        self.__ikSystem.setupHybridIK()

        self.__ikSystem.controllerShape = Controller.SHAPE.CIRCLE
        self.__ikSystem.controllers()[-1].shape = Controller.SHAPE.CUBE
        self.__ikSystem.controllers()[-1].name = 'head_ctrl'.format(self._prefix)

        self.addSystems(self.__ikSystem)

    def __setupTwist(self):
        self.__setupNonroll()
        headCtrlLocalMtx = pm.createNode('multMatrix', n='{}_local_multMtx'.format(self.__ikSystem.controllers()[-1]))
        headCtrlLocalDecMtx = pm.createNode('decomposeMatrix', n='{}_local_decMtx'.format(self.__ikSystem.controllers()[-1]))
        self.__ikSystem.controllers()[-1].transform().worldMatrix >> headCtrlLocalMtx.matrixIn[0]
        self.__nonrollJoints[0].worldInverseMatrix >> headCtrlLocalMtx.matrixIn[1]
        headCtrlLocalMtx.matrixSum >> headCtrlLocalDecMtx.inputMatrix
        headCtrlLocalDecMtx.outputRotateX >> self.__ikSystem.ikHandle().twist

    def __setupNonroll(self):
        nonrollGrp = pm.createNode('transform', n='{}nonroll_grp'.format(self._prefix))
        nonrollGrp.hide()
        pm.matchTransform(nonrollGrp, self.__ikSystem.joints()[0], pivots=True)

        nonrollJntStart = pm.duplicate(self.__ikSystem.joints()[0], n='{}nonroll_start'.format(self._prefix), po=True)[0]
        nonrollJntEnd = pm.duplicate(self.__ikSystem.joints()[-1], n='{}nonroll_end'.format(self._prefix), po=True)[0]
        nonrollJntStart | nonrollJntEnd

        nonrollIkh = pm.ikHandle(startJoint=nonrollJntStart, endEffector=nonrollJntEnd, solver='ikRPsolver', n='{}nonroll_ikh'.format(self._prefix))[0]
        for attrStr in ['poleVector' + axis for axis in 'XYZ']:
            nonrollIkh.attr(attrStr).set(0)

        pm.pointConstraint(self.__ikSystem.controllers()[0], nonrollJntStart, mo=True)
        pm.parentConstraint(self.__ikSystem.controllers()[0], nonrollIkh, mo=True)

        pm.parent([nonrollJntStart, nonrollIkh], nonrollGrp)
        pm.parent(nonrollGrp, self._systemGrp)

        self.__nonrollJoints.append(nonrollJntStart)

        return nonrollGrp

    def _connectSystems(self):
        pass

    def _buildControls(self):
        pass

    def _connectOutputs(self):
        for sysJnt, outJnt in zip(self.__ikSystem.joints(), self._outJoints):
            pm.pointConstraint(sysJnt, outJnt, mo=True)
            pm.orientConstraint(sysJnt, outJnt, mo=True)
            utils.connectTransform(sysJnt, outJnt, ['scale'], ['X', 'Y', 'Z'])

    def postBuild(self):
        super(Neck, self).postBuild()
        self.__ikSystem.controllers()[-1].alignShapeTo(utils.getWorldPoint(self._initJoints[-1]), Controller.SIDE.BOTTOM)
