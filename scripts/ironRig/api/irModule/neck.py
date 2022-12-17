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
            self.__ikSystem.setupAdvancedTwist()
        self.__ikSystem.setupStretch()
        self.__ikSystem.setupHybridIK()

        self.__ikSystem.controllerShape = Controller.SHAPE.CIRCLE
        self.__ikSystem.controllers()[-1].shape = Controller.SHAPE.CUBE
        self.__ikSystem.controllers()[-1].name = 'head_ctrl'.format(self._prefix)

        self.addSystems(self.__ikSystem)

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
