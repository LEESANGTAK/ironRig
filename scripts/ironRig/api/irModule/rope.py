from maya import cmds
from ... import utils
from ... import common
from ..irGlobal import Controller
from ..irSystem import SplineIK
from ..irSystem import Single
from .module import Module


class Rope(Module):
    def __init__(self, name='new', side=Module.SIDE.CENTER, skeletonJoints=[]):
        self._numberOfControllers = 3
        self._autoOddnumController = False
        self._dynamic = False
        super(Rope, self).__init__(name, side, skeletonJoints)

    @property
    def numberOfControllers(self):
        return self._numberOfControllers

    @numberOfControllers.setter
    def numberOfControllers(self, val):
        if not utils.isOddNumber(val):
            cmds.error('Number of controllers should be odd number.')
        self._numberOfControllers = val
        self._ikSystem.numberOfControllers = self._numberOfControllers

    # Automate controller for odd number indexed controllers
    @property
    def autoOddnumController(self):
        return self._dynamic

    @autoOddnumController.setter
    def autoOddnumController(self, val):
        self._autoOddnumController = val

    @property
    def dynamic(self):
        return self._dynamic

    @dynamic.setter
    def dynamic(self, val):
        self._dynamic = val

    def _addSystems(self):
        self._sgSystem = Single(self._name, self._side)
        self._systems.append(self._sgSystem)

        self._ikSystem = SplineIK(self._name, self._side)
        self._ikSystem.numberOfControllers = self._numberOfControllers
        self._systems.append(self._ikSystem)

        super(Rope, self)._addSystems()

    def _buildSystems(self):
        sgJoints = utils.buildNewJoints(self._initJoints, searchStr='init', replaceStr='sg')
        self._sgSystem.joints = sgJoints
        self._sgSystem.build()
        self._sgSystem.controllerShape = Controller.SHAPE.CUBE

        ikJoints = utils.buildNewJointChain(self._initJoints, searchStr='init', replaceStr='ik')
        self._ikSystem.joints = ikJoints
        self._ikSystem.build()
        self._ikSystem.setupAdvancedTwist()
        self._ikSystem.setupStretch()
        self._ikSystem.setCurveWeightsArc()
        if self._dynamic:
            self._ikSystem.setupDynamic()
            self._ikSystem.dynLock = SplineIK.DYNAMIC_LOCK.BOTH
        utils.removeConnections(self._ikSystem.joints[-1])  # Remove orient constraint for the end joint

        if self._autoOddnumController:
            ikCtrls = self._ikSystem.controllers
            for index, curCtrl in enumerate(ikCtrls):
                if utils.isOddNumber(index):
                    cnst = cmds.parentConstraint(ikCtrls[index-1], ikCtrls[index+1], curCtrl.zeroGrp, mo=True)[0]
                    cmds.setAttr('{}.interpType'.format(cnst), 2)

        self._sysJoints = self._sgSystem.joints

    def _connectSystems(self):
        for sgCtrl in self._sgSystem.controllers:
            closestIkJnt = utils.findClosestObject(utils.getWorldPoint(sgCtrl), self._ikSystem.joints)
            cmds.parentConstraint(closestIkJnt, sgCtrl.zeroGrp, mo=True)

            sgJnt = cmds.listConnections(sgCtrl, source=False, type='joint')[0]
            ikScaleMult = cmds.createNode('multiplyDivide', n='{}{}_scale_mult'.format(self.shortName, closestIkJnt))
            cmds.connectAttr('{}.scale'.format(closestIkJnt), '{}.input1'.format(ikScaleMult))
            cmds.connectAttr('{}.scale'.format(sgCtrl), '{}.input2'.format(ikScaleMult))
            cmds.connectAttr('{}.output'.format(ikScaleMult), '{}.scale'.format(sgJnt), f=True)

        ikEndCtrl = self._ikSystem.controllers[-1]
        cmds.addAttr(ikEndCtrl, ln='detailCtrlVis', at='bool', dv=False, keyable=True)
        cmds.setAttr('{}.detailCtrlVis'.format(ikEndCtrl), channelBox=True)
        cmds.connectAttr('{}.detailCtrlVis'.format(ikEndCtrl), '{}.visibility'.format(self._sgSystem.topGrp))

        self._sgSystem.controllerSize = self._controllerSize * 0.5
        self._sgSystem.controllerColor = Controller.COLOR.SKYBLUE

    def _buildOutputs(self):
        self._outJoints = utils.buildNewJointChain(self._initJoints, searchStr='init', replaceStr='out')
        utils.parentKeepHierarchy(self._outJoints, self._outGrp)

    def _connectSkeleton(self):
        for outJnt, skelJnt in zip(self._outJoints, self._skelJoints):
            utils.removeConnections(skelJnt)
            cmds.parentConstraint(outJnt, skelJnt, mo=True)
            # cmds.scaleConstraint(outJnt, skelJnt, mo=True)

    def mirror(self):
        oppSideChar = common.SYMMETRY_CHAR_TABLE.get(self._side)
        oppSkelJoints = [jnt.replace('_{}'.format(self._side), '_{}'.format(oppSideChar)) for jnt in self._skelJoints]
        oppMod = Rope(self._name, oppSideChar, oppSkelJoints)
        oppMod.preBuild()
        oppMod.symmetrizeGuide(jointAxis=False)
        oppMod.build()
        oppMod.symmetrizeControllers()
        return oppMod
