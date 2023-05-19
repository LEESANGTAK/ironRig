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
        self.__autoOddnumController = False
        self.__dynamic = False

    @property
    def numberOfControllers(self):
        return self.__numberOfControllers

    @numberOfControllers.setter
    def numberOfControllers(self, val):
        if not utils.isOddNumber(val):
            pm.error('Number of controllers should be odd number.')
        self.__numberOfControllers = val

    @property
    def autoOddnumController(self):
        return self.__dynamic

    @autoOddnumController.setter
    def autoOddnumController(self, val):
        self.__autoOddnumController = val

    @property
    def dynamic(self):
        return self.__dynamic

    @dynamic.setter
    def dynamic(self, val):
        self.__dynamic = val

    def _buildSystems(self):
        sgJoints = utils.buildNewJoints(self._initJoints, searchStr='init', replaceStr='sg')
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
        if self.__dynamic:
            self.__ikSystem.setupDynamic()
            self.__ikSystem.dynLock = SplineIK.DYNAMIC_LOCK.BOTH
        utils.removeConnections(self.__ikSystem.joints()[-1])  # Remove orient constraint for the end joint
        self.addSystems(self.__ikSystem)

        if self.__autoOddnumController:
            ikCtrls = self.__ikSystem.controllers()
            for index, curCtrl in enumerate(ikCtrls):
                if utils.isOddNumber(index):
                    cnst = pm.parentConstraint(ikCtrls[index-1], ikCtrls[index+1], curCtrl.zeroGrp(), mo=True)
                    cnst.interpType.set(2)

        self._sysJoints = self.__sgSystem.joints()

    def _connectSystems(self):
        for sgCtrl in self.__sgSystem.controllers():
            closestIkJnt = utils.findClosestObject(utils.getWorldPoint(sgCtrl), self.__ikSystem.joints())
            pm.parentConstraint(closestIkJnt, sgCtrl.zeroGrp(), mo=True)

            sgJnt = sgCtrl.outputs(type='joint')[0]
            ikScaleMult = pm.createNode('multiplyDivide', n='{}{}_scale_mult'.format(self._prefix, closestIkJnt))
            closestIkJnt.scale >> ikScaleMult.input1
            sgCtrl.scale >> ikScaleMult.input2
            ikScaleMult.output >> sgJnt.scale

        ikEndCtrl = self.__ikSystem.controllers()[-1]
        pm.addAttr(ikEndCtrl, ln='detailCtrlVis', at='bool', dv=False, keyable=True)
        ikEndCtrl.detailCtrlVis.set(channelBox=True)
        ikEndCtrl.detailCtrlVis >> self.__sgSystem.topGrp().visibility

    def _buildOutputs(self):
        self._outJoints = utils.buildNewJointChain(self._initJoints, searchStr='init', replaceStr='out')
        utils.parentKeepHierarchy(self._outJoints, self._outGrp)

    def _connectSkeleton(self):
        for outJnt, skelJnt in zip(self._outJoints, self._skelJoints):
            utils.removeConnections(skelJnt)
            pm.parentConstraint(outJnt, skelJnt, mo=True)
            outJnt.scale >> skelJnt.scale

    def postBuild(self):
        super(Rope, self).postBuild()
        self.__sgSystem.controllerSize = self._controllerSize * 0.5
        self.__sgSystem.controllerColor = Controller.COLOR.SKYBLUE
