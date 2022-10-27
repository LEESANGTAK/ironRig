import pymel.core as pm
from ... import utils
from ..irGlobal import Controller
from ..irSystem import SplineIK
from ..irSystem import Single
from .module import Module


class Rope(Module):
    def __init__(self, prefix='', skeletonJoints=[]):
        super(Rope, self).__init__(prefix, skeletonJoints)
        self.__numberOfControllers = 3

    @property
    def numberOfControllers(self):
        return self.__numberOfControllers

    @numberOfControllers.setter
    def numberOfControllers(self, val):
        self.__numberOfControllers = val

    def _buildSystems(self):
        sgJoints = utils.buildNewJointChain(self._initJoints, searchStr='init', replaceStr='sg')
        self.__sgSystem = Single(self._prefix+'sg_', sgJoints)
        self.__sgSystem.build()
        self.__sgSystem.controllerShape = Controller.SHAPE.CUBE
        self.addSystems(self.__sgSystem)

        ikJoints = utils.buildNewJointChain(self._initJoints, searchStr='init', replaceStr='ik')
        self.__ikSystem = SplineIK(self._prefix+'ik_', ikJoints, self.__numberOfControllers)
        if self._negateScaleX:
            self.__ikSystem.negateSclaeX = True
        self.__ikSystem.build()
        self.__ikSystem.setupAdvancedTwist()
        self.__ikSystem.setupStretch()
        self.__ikSystem.setCurveWeightsArc()
        utils.removeConnections(self.__ikSystem.joints()[-1])  # Remove orient constraint for the end joint
        self.addSystems(self.__ikSystem)

        ikCtrls = self.__ikSystem.controllers()
        for index, curCtrl in enumerate(ikCtrls):
            if utils.isOddNumber(index):
                cnst = pm.parentConstraint(ikCtrls[index-1].transform(), ikCtrls[index+1].transform(), curCtrl.zeroGrp(), mo=True)
                cnst.interpType.set(2)
                curCtrl.lockChannels(channels=['rotate'], axes=['X', 'Y', 'Z'])

    def _connectSystems(self):
        for sgCtrl in self.__sgSystem.controllers():
            cloestIkJnt = utils.findClosestObject(utils.getWorldPoint(sgCtrl.transform()), self.__ikSystem.joints())
            pm.parentConstraint(cloestIkJnt, sgCtrl.zeroGrp(), mo=True)

    def _connectOutputs(self):
        for sysJnt, outJnt in zip(self.__sgSystem.joints(), self._outJoints):
            pm.pointConstraint(sysJnt, outJnt, mo=True)
            pm.orientConstraint(sysJnt, outJnt, mo=True)
            utils.connectTransform(sysJnt, outJnt, ['scale'], ['X', 'Y', 'Z'])

    def postBuild(self):
        super(Rope, self).postBuild()
        self.__sgSystem.controllerScale = self._controllerScale * 0.5
        self.__sgSystem.controllerColor = Controller.COLOR.SKYBLUE
