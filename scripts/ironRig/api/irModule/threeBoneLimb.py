from maya.api import OpenMaya as om
from maya import cmds
from ... import utils
from ... import common
from ..irGlobal.controller import Controller
from ..irSystem.twoBoneIK import TwoBoneIK
from ..irSystem.threeBoneIK import ThreeBoneIK
from ..irSystem.fk import FK
from ..irSystem.splineIK import SplineIK
from .module import Module


class ThreeBoneLimb(Module):
    def __init__(self, name='new', side=Module.SIDE.CENTER, skeletonJoints=[], detectInbetweenJoints=False):
        self._detectInbetweenJoints = detectInbetweenJoints

        self._firstLimbInbSkelJoints = None
        self._secondLimbInbSkelJoints = None
        self._thirdLimbInbSkelJoints = None

        self._limbJnt0Index = None
        self._limbJnt1Index = None
        self._limbJnt2Index = None
        self._limbJnt3Index = None

        self._limbInitJoints = None
        self._firstLimbInbInitJoints = None
        self._secondLimbInbInitJoints = None
        self._thirdLimbInbInitJoints = None

        self._ikSystem = None
        self._fkSystem = None
        self._firstLimbTwistSystem = None
        self._secondLimbTwistSystem = None
        self._thirdLimbTwistSystem = None
        self._blendJoints = None
        self._nonrollJoints = []
        self._blendConstraints = []

        self._ikRootController = False

        super().__init__(name, side, skeletonJoints)

    @property
    def ikRootController(self):
        return self._ikRootController

    @ikRootController.setter
    def ikRootController(self, val):
        self._ikRootController = val

    @property
    def ikSystem(self):
        return self._ikSystem

    @property
    def fkSystem(self):
        return self._fkSystem

    @property
    def ikController(self):
        return self._ikSystem.ikHandleController

    @property
    def fkRootController(self):
        return self._fkSystem.controllers[0]

    @property
    def poleVectorController(self):
        return self._ikSystem.poleVectorController

    def _addSystems(self):
        self._ikSystem = ThreeBoneIK(self._name, self._side)
        self._systems.append(self._ikSystem)

        self._fkSystem = FK(self._name, self._side)
        self._fkSystem.endController = True
        self._systems.append(self._fkSystem)

        if self._detectInbetweenJoints:
            self._firstLimbInbSkelJoints = utils.getInbetweenJoints(self._skelJoints[0], self._skelJoints[1])
            if self._firstLimbInbSkelJoints:
                self._firstLimbTwistSystem = SplineIK(self.shortName+'FirstLimbTwist', self._side)
                self._firstLimbTwistSystem.numberOfControllers = 3
                self._firstLimbTwistSystem.curveSpans = 1
                self._systems.append(self._firstLimbTwistSystem)
            self._secondLimbInbSkelJoints = utils.getInbetweenJoints(self._skelJoints[1], self._skelJoints[2])
            if self._secondLimbInbSkelJoints:
                self._secondLimbTwistSystem = SplineIK(self.shortName+'SecondLimbTwist', self._side)
                self._secondLimbTwistSystem.numberOfControllers = 3
                self._secondLimbTwistSystem.curveSpans = 1
                self._systems.append(self._secondLimbTwistSystem)
            self._thirdLimbInbSkelJoints = utils.getInbetweenJoints(self._skelJoints[2], self._skelJoints[3])
            if self._thirdLimbInbSkelJoints:
                self._thirdLimbTwistSystem = SplineIK(self.shortName+'ThirdLimbTwist', self._side)
                self._thirdLimbTwistSystem.numberOfControllers = 3
                self._thirdLimbTwistSystem.curveSpans = 1
                self._systems.append(self._thirdLimbTwistSystem)

        super()._addSystems()

    def _buildInitSkelLocators(self):
        if self._detectInbetweenJoints:
            initSkelLocs = []

            skelJoints = [self._skelJoints[0]] + self._firstLimbInbSkelJoints + [self._skelJoints[1]] + self._secondLimbInbSkelJoints + [self.skelJoints[2]] + self._thirdLimbInbSkelJoints + [self.skelJoints[3]]

            self._limbJnt0Index = skelJoints.index(self._skelJoints[0])
            self._limbJnt1Index = skelJoints.index(self._skelJoints[1])
            self._limbJnt2Index = skelJoints.index(self._skelJoints[2])
            self._limbJnt3Index = skelJoints.index(self._skelJoints[3])

            for skelJnt in skelJoints:
                initSkelLoc = cmds.spaceLocator(n='{}_init_{}_loc'.format(self.shortName, skelJnt))[0]
                cmds.matchTransform(initSkelLoc, skelJnt, position=True)
                cmds.hide(initSkelLoc)
                initSkelLocs.append(initSkelLoc)
            self._initSkelLocators = initSkelLocs
            cmds.parent(self._initSkelLocators, self._initGrp)
        else:
            super()._buildInitSkelLocators()
            self._limbJnt0Index = 0
            self._limbJnt1Index = 1
            self._limbJnt2Index = 2
            self._limbJnt3Index = 3

    def _createMidLocator(self):
        midLoc = None
        firstInitLoc = self._initSkelLocators[self._limbJnt0Index]
        secondInitLoc = self._initSkelLocators[self._limbJnt1Index]
        thirdInitLoc = self._initSkelLocators[self._limbJnt2Index]

        aimVector = utils.getWorldPoint(self._initSkelLocators[-1]) - utils.getWorldPoint(self._initSkelLocators[0])
        midOriPlaneLocVector = TwoBoneIK.getPoleVector(firstInitLoc, secondInitLoc, thirdInitLoc)
        if utils.isParallel(aimVector, midOriPlaneLocVector) or round(midOriPlaneLocVector.length()) == 0.0:
            midOriPlaneLocVector = om.MVector.kZaxisVector
        midLocPos = utils.getWorldPoint(secondInitLoc) + (midOriPlaneLocVector.normal() * utils.getDistance(firstInitLoc, thirdInitLoc))

        midLoc = cmds.spaceLocator(n='{}_mid_oriPlane_loc'.format(self.shortName))[0]
        cmds.setAttr('{}.overrideEnabled'.format(midLoc), True)
        cmds.setAttr('{}.overrideColor'.format(midLoc), 6)
        cmds.xform(midLoc, t=list(midLocPos)[:3], ws=True)

        negAxisAttrNames = ['negateXAxis', 'negateZAxis', 'swapYZAxis']
        for attrName in negAxisAttrNames:
            cmds.addAttr(midLoc, ln=attrName, at='bool', dv=False, keyable=True)
            cmds.connectAttr('{}.{}'.format(midLoc, attrName), '{}.{}'.format(self._orientPlane, attrName))

        return midLoc

    def _buildInitJoints(self):
        if self._detectInbetweenJoints:
            super()._buildInitJoints()
            self._limbInitJoints = [self._initJoints[self._limbJnt0Index], self._initJoints[self._limbJnt1Index], self._initJoints[self._limbJnt2Index], self._initJoints[self._limbJnt3Index]]
            self._firstLimbInbInitJoints = utils.getInbetweenJoints(self._limbInitJoints[0], self._limbInitJoints[1])
            self._secondLimbInbInitJoints = utils.getInbetweenJoints(self._limbInitJoints[1], self._limbInitJoints[2])
            self._thirdLimbInbInitJoints = utils.getInbetweenJoints(self._limbInitJoints[2], self._limbInitJoints[3])
        else:
            super()._buildInitJoints()
            self._limbInitJoints = self._initJoints

    def build(self):
        super().build()
        self._buildControls()

    def _buildGroups(self):
        super()._buildGroups()
        self._controllerGrp = cmds.group(n='{}_ctrl_grp'.format(self.shortName), empty=True)
        cmds.parent(self._controllerGrp, self._topGrp)

    def _buildSystems(self):
        # Build IK
        ikJoints = utils.buildNewJointChain(self._limbInitJoints, searchStr='init', replaceStr='ik')
        self._ikSystem.joints = ikJoints
        self._ikSystem.build()
        self._ikSystem.setupStretch()
        if self._ikRootController:
            self._ikSystem.buildRootController()
        self._ikSystem.poleVectorPosition = cmds.xform(self._oriPlaneLocators[1], q=True, rp=True, ws=True)
        self._ikSystem.controllers[1].size = self._controllerSize * 0.3  # Set scale of pole vector controller

        # Build FK
        fkJoints = utils.buildNewJointChain(self._limbInitJoints, searchStr='init', replaceStr='fk')
        self._fkSystem.joints = fkJoints
        self._fkSystem.endController = True
        self._fkSystem.build()

        # Setup twist joint
        if self._firstLimbTwistSystem:
            fristLimbTwistJoints = utils.buildNewJointChain([self._limbInitJoints[0]]+self._firstLimbInbInitJoints+[self._limbInitJoints[1]], searchStr='init', replaceStr='firstLimbTwist')
            self._firstLimbTwistSystem.joints = fristLimbTwistJoints
            self._firstLimbTwistSystem.build()
            self._firstLimbTwistSystem.setupTwist()
            self._firstLimbTwistSystem.setupStretch()
            self._firstLimbTwistSystem.controllerShape = Controller.SHAPE.CIRCLE
            self._firstLimbTwistSystem.controllerSize = self._controllerSize * 0.9

        if self._secondLimbTwistSystem:
            secondLimbTwistJoints = utils.buildNewJointChain([self._limbInitJoints[1]]+self._secondLimbInbInitJoints+[self._limbInitJoints[2]], searchStr='init', replaceStr='secondLimbTwist')
            self._secondLimbTwistSystem.joints = secondLimbTwistJoints
            self._secondLimbTwistSystem.build()
            self._secondLimbTwistSystem.setupTwist()
            self._secondLimbTwistSystem.setupStretch()
            self._secondLimbTwistSystem.controllerShape = Controller.SHAPE.CIRCLE
            self._secondLimbTwistSystem.controllerSize = self._controllerSize * 0.9

        if self._thirdLimbTwistSystem:
            thirdLimbTwistJoints = utils.buildNewJointChain([self._limbInitJoints[2]]+self._thirdLimbInbInitJoints+[self._limbInitJoints[3]], searchStr='init', replaceStr='thirdLimbTwist')
            self._thirdLimbTwistSystem.joints = thirdLimbTwistJoints
            self._thirdLimbTwistSystem.build()
            self._thirdLimbTwistSystem.setupTwist()
            self._thirdLimbTwistSystem.setupStretch()
            self._thirdLimbTwistSystem.controllerShape = Controller.SHAPE.CIRCLE
            self._thirdLimbTwistSystem.controllerSize = self._controllerSize * 0.9

    def _connectSystems(self):
        self._blendJoints = utils.buildNewJointChain(self._limbInitJoints, searchStr='init', replaceStr='blend')
        utils.parentKeepHierarchy(self._blendJoints, self._systemGrp)
        cmds.hide(self._blendJoints[0])
        for ikJnt, fkJnt, blendJnt in zip(self._ikSystem.joints, self._fkSystem.joints, self._blendJoints):
            blendCnst = cmds.parentConstraint(ikJnt, fkJnt, blendJnt, mo=True)[0]
            cmds.setAttr('{}.interpType'.format(blendCnst), 2)
            self._blendConstraints.append(blendCnst)

        self._setupNonroll(self._blendJoints[0])

        if self._firstLimbTwistSystem:
            self._setupNonroll(self._blendJoints[1])
            blendJnt1LocalMtx = cmds.createNode('multMatrix', n='{}_local_multMtx'.format(self._blendJoints[1]))
            blendJnt1LocalDecMtx = cmds.createNode('decomposeMatrix', n='{}_local_decMtx'.format(self._blendJoints[1]))
            cmds.setAttr('{}.inputRotateOrder'.format(blendJnt1LocalDecMtx), 3)  # Set rotate order to xzy since the primary axis of rotation is the Y.
            cmds.connectAttr('{}.worldMatrix'.format(self._blendJoints[0]), '{}.matrixIn[0]'.format(blendJnt1LocalMtx))
            cmds.connectAttr('{}.worldInverseMatrix'.format(self._nonrollJoints[0]), '{}.matrixIn[1]'.format(blendJnt1LocalMtx))
            cmds.connectAttr('{}.matrixSum'.format(blendJnt1LocalMtx), '{}.inputMatrix'.format(blendJnt1LocalDecMtx))
            cmds.connectAttr('{}.outputRotateX'.format(blendJnt1LocalDecMtx), '{}.twist'.format(self._firstLimbTwistSystem.controllers[-1]))
            firstLimbTwistUnitConversion = cmds.listConnections('{}.twist'.format(self._firstLimbTwistSystem.controllers[-1]), destination=False)[0]
            cmds.setAttr('{}.conversionFactor'.format(firstLimbTwistUnitConversion), self._aimSign*cmds.getAttr('{}.conversionFactor'.format(firstLimbTwistUnitConversion)))
            cmds.parentConstraint(self._nonrollJoints[0], self._firstLimbTwistSystem.topGrp, mo=True)
            cmds.parentConstraint(self._blendJoints[0], self._firstLimbTwistSystem.controllers[0], mo=True)
            cmds.pointConstraint(self._firstLimbTwistSystem.controllers[0],
                               self._firstLimbTwistSystem.controllers[2],
                               self._firstLimbTwistSystem.controllers[1].zeroGrp,
                               mo=True)
            self._firstLimbTwistSystem.controllers[0].hide()
            self._firstLimbTwistSystem.controllers[-1].hide()
            self.addMembers(blendJnt1LocalMtx, blendJnt1LocalDecMtx)

        if self._secondLimbTwistSystem:
            self._setupNonroll(self._blendJoints[2])
            blendJnt2LocalMtx = cmds.createNode('multMatrix', n='{}_local_multMtx'.format(self._blendJoints[2]))
            blendJnt2LocalDecMtx = cmds.createNode('decomposeMatrix', n='{}_local_decMtx'.format(self._blendJoints[2]))
            cmds.setAttr('{}.inputRotateOrder'.format(blendJnt2LocalDecMtx), 3)
            cmds.connectAttr('{}.worldMatrix'.format(self._blendJoints[1]), '{}.matrixIn[0]'.format(blendJnt2LocalMtx))
            cmds.connectAttr('{}.worldInverseMatrix'.format(self._nonrollJoints[1]), '{}.matrixIn[1]'.format(blendJnt2LocalMtx))
            cmds.connectAttr('{}.matrixSum'.format(blendJnt2LocalMtx), '{}.inputMatrix'.format(blendJnt2LocalDecMtx))
            cmds.connectAttr('{}.outputRotateX'.format(blendJnt2LocalDecMtx), '{}.twist'.format(self._secondLimbTwistSystem.controllers[-1]))
            secondLimbTwistUnitConversion = cmds.listConnections('{}.twist'.format(self._secondLimbTwistSystem.controllers[-1]), destination=False)[0]
            cmds.setAttr('{}.conversionFactor'.format(secondLimbTwistUnitConversion), self._aimSign*cmds.getAttr('{}.conversionFactor'.format(secondLimbTwistUnitConversion)))
            cmds.parentConstraint(self._blendJoints[1], self._secondLimbTwistSystem.topGrp, mo=True)
            cmds.pointConstraint(self._secondLimbTwistSystem.controllers[0],
                               self._secondLimbTwistSystem.controllers[2],
                               self._secondLimbTwistSystem.controllers[1].zeroGrp,
                               mo=True)
            self._secondLimbTwistSystem.controllers[0].hide()
            self._secondLimbTwistSystem.controllers[-1].hide()
            self.addMembers(blendJnt2LocalMtx, blendJnt2LocalDecMtx)

        if self._thirdLimbTwistSystem:
            blendJnt3NonrollGrp = self._setupNonroll(self._blendJoints[3])
            blendJnt3LocalMtx = cmds.createNode('multMatrix', n='{}_local_multMtx'.format(self._blendJoints[3]))
            blendJnt3LocalDecMtx = cmds.createNode('decomposeMatrix', n='{}_local_decMtx'.format(self._blendJoints[3]))
            cmds.setAttr('{}.inputRotateOrder'.format(blendJnt3LocalDecMtx), 3)
            cmds.connectAttr('{}.worldMatrix'.format(self._blendJoints[-1]), '{}.matrixIn[0]'.format(blendJnt3LocalMtx))
            cmds.connectAttr('{}.worldInverseMatrix'.format(self._nonrollJoints[-1]), '{}.matrixIn[1]'.format(blendJnt3LocalMtx))
            cmds.connectAttr('{}.matrixSum'.format(blendJnt3LocalMtx), '{}.inputMatrix'.format(blendJnt3LocalDecMtx))
            cmds.connectAttr('{}.outputRotateX'.format(blendJnt3LocalDecMtx), '{}.twist'.format(self._thirdLimbTwistSystem.controllers[-1]))
            thirdLimbTwistUnitConversion = cmds.listConnections('{}.twist'.format(self._thirdLimbTwistSystem.controllers[-1]), destination=False)[0]
            cmds.setAttr('{}.conversionFactor'.format(thirdLimbTwistUnitConversion), self._aimSign*cmds.getAttr('{}.conversionFactor'.format(thirdLimbTwistUnitConversion)))
            cmds.parentConstraint(self._blendJoints[2], self._thirdLimbTwistSystem.topGrp, mo=True)
            cmds.parentConstraint(self._blendJoints[2], blendJnt3NonrollGrp, mo=True)
            cmds.parentConstraint(self._blendJoints[-1], self._thirdLimbTwistSystem.controllers[-1], mo=True)
            cmds.pointConstraint(self._thirdLimbTwistSystem.controllers[0],
                               self._thirdLimbTwistSystem.controllers[2],
                               self._thirdLimbTwistSystem.controllers[1].zeroGrp,
                               mo=True)
            self._thirdLimbTwistSystem.controllers[0].hide()
            self._thirdLimbTwistSystem.controllers[-1].hide()
            self.addMembers(blendJnt3LocalMtx, blendJnt3LocalDecMtx)

        self._sysJoints = [self._nonrollJoints[0]] + self._blendJoints[1:]  # The first joint should be non roll
        if self._firstLimbTwistSystem:
            self._sysJoints = self._firstLimbTwistSystem.joints[:-1] + self._blendJoints[1:]
        if self._secondLimbTwistSystem:
            self._sysJoints = self._sysJoints[:-3] + self._secondLimbTwistSystem.joints[:-1] + self._blendJoints[2:]
        if self._thirdLimbTwistSystem:
            self._sysJoints = self._sysJoints[:-2] + self._thirdLimbTwistSystem.joints[:-1] + [self._blendJoints[-1]]

    def _setupNonroll(self, blendJoint):
        nonrollGrp = cmds.createNode('transform', n=blendJoint.replace('_blend', '_nonroll_grp'))
        cmds.hide(nonrollGrp)
        cmds.matchTransform(nonrollGrp, blendJoint, pivots=True)

        nonrollJntStart = cmds.duplicate(blendJoint, n=blendJoint.replace('_blend', '_nonroll_start'), po=True)[0]
        nonrollJntEnd = cmds.duplicate(blendJoint, n=blendJoint.replace('_blend', '_nonroll_end'), po=True)[0]
        cmds.parent(nonrollJntEnd, nonrollJntStart)
        childJnt = cmds.listRelatives(blendJoint, children=True, type='joint')
        if childJnt:
            cmds.matchTransform(nonrollJntEnd, childJnt[0], position=True)
        else:
            cmds.setAttr('{}.{}'.format(nonrollJntEnd, 'translate{}'.format(self._aimAxis)), self._aimSign)

        nonrollIkh = cmds.ikHandle(startJoint=nonrollJntStart, endEffector=nonrollJntEnd, solver='ikRPsolver', n=blendJoint.replace('_blend', '_nonroll_ikh'))[0]
        for attrStr in ['poleVector' + axis for axis in 'XYZ']:
            cmds.setAttr('{}.{}'.format(nonrollIkh, attrStr), 0)

        cmds.pointConstraint(blendJoint, nonrollJntStart, mo=True)
        cmds.parentConstraint(blendJoint, nonrollIkh, mo=True)

        cmds.parent([nonrollJntStart, nonrollIkh], nonrollGrp)
        cmds.parent(nonrollGrp, self._systemGrp)

        self._nonrollJoints.append(nonrollJntStart)

        return nonrollGrp

    def _buildOutputs(self):
        initJoints = self._limbInitJoints
        if self._firstLimbTwistSystem:
            initJoints = [initJoints[0]] + self._firstLimbInbInitJoints + self._limbInitJoints[1:]
        if self._secondLimbTwistSystem:
            initJoints = initJoints[:-2] + self._secondLimbInbInitJoints + self._limbInitJoints[2:]
        if self._thirdLimbTwistSystem:
            initJoints = initJoints[:-1] + self._thirdLimbInbInitJoints + [self._limbInitJoints[-1]]
        self._outJoints = utils.buildNewJointChain(initJoints, searchStr='init', replaceStr='out')
        utils.parentKeepHierarchy(self._outJoints, self._outGrp)

    def _connectSkeleton(self):
        for outJnt in self._outJoints:
            skelJnt = outJnt.replace(self.shortName+'_out_', '')
            utils.removeConnections(skelJnt)
            cmds.parentConstraint(outJnt, skelJnt, mo=True)
            # cmds.scaleConstraint(outJnt, skelJnt, mo=True)

    def _buildControls(self):
        moduleCtrl = Controller('{}_module'.format(self.shortName), Controller.SHAPE.SPHERE)
        moduleCtrl.lockHideChannels(['translate', 'rotate', 'scale', 'visibility'])
        cmds.addAttr(moduleCtrl, ln='ik', at='double', min=0.0, max=1.0, dv=1.0, keyable=True)
        cmds.matchTransform(moduleCtrl.zeroGrp, self._blendJoints[-1], position=True)
        cmds.parentConstraint(self._blendJoints[-1], moduleCtrl.zeroGrp, mo=True)
        moduleCtrl.shapeOffset = om.MVector.kZnegAxisVector * 10

        fkIkRev = cmds.createNode('reverse', n='{}_fkIk_rev'.format(self.shortName))
        cmds.connectAttr('{}.ik'.format(moduleCtrl), '{}.visibility'.format(self._ikSystem.topGrp))
        cmds.connectAttr('{}.ik'.format(moduleCtrl), '{}.inputX'.format(fkIkRev))
        cmds.connectAttr('{}.outputX'.format(fkIkRev), '{}.visibility'.format(self._fkSystem.topGrp))
        for cnst in self._blendConstraints:
            ikWeightAttr = cmds.listConnections('{}.target[0].targetParentMatrix'.format(cnst))[0] + 'W0'
            cmds.connectAttr('{}.ik'.format(moduleCtrl), '{}.{}'.format(cnst, ikWeightAttr), f=True)
            fkWeightAttr = cmds.listConnections('{}.target[1].targetParentMatrix'.format(cnst))[0] + 'W1'
            cmds.connectAttr('{}.outputX'.format(fkIkRev), '{}.{}'.format(cnst, fkWeightAttr), f=True)

        cmds.parent(moduleCtrl.zeroGrp, self._controllerGrp)
        self._controllers.append(moduleCtrl)
        self.addMembers(moduleCtrl.allNodes)

        if self._firstLimbTwistSystem or self._secondLimbTwistSystem or self._thirdLimbTwistSystem:
            cmds.addAttr(moduleCtrl, ln='bendCtrlVis', at='bool', dv=False, keyable=True)
            moduleFirstTwistCtrl = Controller('{}_firstTwist'.format(self.shortName))
            cmds.matchTransform(moduleFirstTwistCtrl.zeroGrp, self._blendJoints[1], position=True)
            cmds.pointConstraint(self._blendJoints[1], moduleFirstTwistCtrl.zeroGrp, mo=False)
            oCnst = cmds.orientConstraint(self._blendJoints[0], self._blendJoints[1], moduleFirstTwistCtrl.zeroGrp, mo=False)[0]
            cmds.setAttr('{}.interpType'.format(oCnst), 2)
            cmds.parent(moduleFirstTwistCtrl.zeroGrp, self._controllerGrp)
            moduleFirstTwistCtrl.lockHideChannels(['rotate', 'scale', 'visibility'])
            cmds.connectAttr('{}.bendCtrlVis'.format(moduleCtrl), '{}.visibility'.format(moduleFirstTwistCtrl.zeroGrp))
            self._controllers.append(moduleFirstTwistCtrl)

            pvLineDecMtx = cmds.listConnections('{}.worldMatrix'.format(self._ikSystem.joints[1]), type='decomposeMatrix')[0]
            cmds.connectAttr('{}.worldMatrix'.format(moduleFirstTwistCtrl), '{}.inputMatrix'.format(pvLineDecMtx), f=True)

            moduleSecondTwistCtrl = Controller('{}_secondTwist'.format(self.shortName))
            cmds.matchTransform(moduleSecondTwistCtrl.zeroGrp, self._blendJoints[2], position=True)
            cmds.pointConstraint(self._blendJoints[2], moduleSecondTwistCtrl.zeroGrp, mo=False)
            oCnst = cmds.orientConstraint(self._blendJoints[1], self._blendJoints[2], moduleSecondTwistCtrl.zeroGrp, mo=False)[0]
            cmds.setAttr('{}.interpType'.format(oCnst), 2)
            cmds.parent(moduleSecondTwistCtrl.zeroGrp, self._controllerGrp)
            moduleSecondTwistCtrl.lockHideChannels(['rotate', 'scale', 'visibility'])
            cmds.connectAttr('{}.bendCtrlVis'.format(moduleCtrl), '{}.visibility'.format(moduleSecondTwistCtrl.zeroGrp))
            self._controllers.append(moduleSecondTwistCtrl)

            upAxis = list(set(['X', 'Y', 'Z']) - set(self._aimAxis))[0]
            if self._firstLimbTwistSystem:
                cmds.connectAttr('{}.bendCtrlVis'.format(moduleCtrl), '{}.visibility'.format(self._firstLimbTwistSystem.topGrp))
                cmds.parentConstraint(moduleFirstTwistCtrl, self._firstLimbTwistSystem.controllers[-1].zeroGrp, mo=True)
                cmds.aimConstraint(moduleFirstTwistCtrl,
                                self._firstLimbTwistSystem.controllers[1].zeroGrp,
                                aimVector=self._aimSign * utils.axisStrToVector(self._aimAxis),
                                upVector=utils.axisStrToVector(upAxis),
                                worldUpType='objectrotation',
                                worldUpVector=utils.axisStrToVector(upAxis),
                                worldUpObject=moduleFirstTwistCtrl)
            if self._secondLimbTwistSystem:
                cmds.connectAttr('{}.bendCtrlVis'.format(moduleCtrl), '{}.visibility'.format(self._secondLimbTwistSystem.topGrp))
                cmds.parentConstraint(moduleFirstTwistCtrl, self._secondLimbTwistSystem.controllers[0].zeroGrp, mo=True)
                cmds.parentConstraint(moduleSecondTwistCtrl, self._secondLimbTwistSystem.controllers[-1].zeroGrp, mo=True)
                cmds.aimConstraint(moduleFirstTwistCtrl,
                                self._secondLimbTwistSystem.controllers[1].zeroGrp,
                                aimVector=-self._aimSign * utils.axisStrToVector(self._aimAxis),
                                upVector=utils.axisStrToVector(upAxis),
                                worldUpType='objectrotation',
                                worldUpVector=utils.axisStrToVector(upAxis),
                                worldUpObject=moduleFirstTwistCtrl)
            if self._thirdLimbTwistSystem:
                cmds.connectAttr('{}.bendCtrlVis'.format(moduleCtrl), '{}.visibility'.format(self._thirdLimbTwistSystem.topGrp))
                cmds.parentConstraint(moduleSecondTwistCtrl, self._thirdLimbTwistSystem.controllers[0].zeroGrp, mo=True)
                cmds.aimConstraint(moduleSecondTwistCtrl,
                                self._thirdLimbTwistSystem.controllers[1].zeroGrp,
                                aimVector=-self._aimSign * utils.axisStrToVector(self._aimAxis),
                                upVector=utils.axisStrToVector(upAxis),
                                worldUpType='objectrotation',
                                worldUpVector=utils.axisStrToVector(upAxis),
                                worldUpObject=moduleSecondTwistCtrl)

        self._controllers[0].size = self._controllerSize * 0.1  # Set scale of module controller
        if self._firstLimbTwistSystem or self._secondLimbTwistSystem or self._thirdLimbTwistSystem:
            self._controllers[1].size = self._controllerSize * 0.9
            self._controllers[2].size = self._controllerSize * 0.9

    def attachTo(self, module, outJointIndex=-1000000):
        if module.__class__.__name__ == 'LimbBase':
            limbBaseCtrl = module.fkSystem.controllers[0]

            aimLoc = cmds.spaceLocator(n='{}_aim_loc'.format(limbBaseCtrl))[0]
            staticLoc = cmds.spaceLocator(n='{}_static_loc'.format(limbBaseCtrl))[0]
            for loc in [staticLoc, aimLoc]:
                cmds.matchTransform(loc, limbBaseCtrl.zeroGrp)
            cmds.parent([staticLoc, aimLoc], module.fkSystem.blackboxGrp)
            cnst = cmds.orientConstraint([aimLoc, staticLoc], limbBaseCtrl.zeroGrp, mo=True)[0]
            cmds.setAttr('{}.interpType'.format(cnst), 2)

            cmds.addAttr(limbBaseCtrl, ln='aim', at='float', min=0.0, max=1.0, dv=0.5, keyable=True)
            revNode = cmds.createNode('reverse', n='{}_aim_rev'.format(limbBaseCtrl))

            # ikWeightAttr = cmds.listConnections('{}.target[0].targetParentMatrix'.format(cnst))[0] + 'W0'
            # cmds.connectAttr('{}.aim'.format(limbBaseCtrl), '{}.{}'.format(cnst, ikWeightAttr))
            # fkWeightAttr = cmds.listConnections('{}.target[1].targetParentMatrix'.format(cnst))[0] + 'W1'
            # cmds.connectAttr('{}.outputX'.format(revNode), '{}.{}'.format(cnst, fkWeightAttr))
            cmds.connectAttr('{}.aim'.format(limbBaseCtrl), '{}.target[0].targetWeight'.format(cnst))
            cmds.connectAttr('{}.aim'.format(limbBaseCtrl), '{}.inputX'.format(revNode))
            cmds.connectAttr('{}.outputX'.format(revNode), '{}.target[1].targetWeight'.format(cnst))

            tempPoleVectorLoc = cmds.spaceLocator(n='tempPoleVector_loc')[0]
            tempPoleVectorLocPos = utils.getWorldPoint(limbBaseCtrl.zeroGrp) + (utils.getWorldPoint(self._ikSystem.poleVectorController) - utils.getWorldPoint(self._ikSystem.joints[1]))
            cmds.xform(tempPoleVectorLoc, t=list(tempPoleVectorLocPos)[:3], ws=True)
            upAxisInfo = utils.getAimAxisInfo(limbBaseCtrl.zeroGrp, tempPoleVectorLoc)
            cmds.delete(tempPoleVectorLoc)
            cmds.aimConstraint(
                self._ikSystem.ikHandleController, aimLoc,
                aimVector=self._aimSign*utils.axisStrToVector(self._aimAxis),
                upVector=upAxisInfo[0]*utils.axisStrToVector(upAxisInfo[1]),
                worldUpType='object',
                worldUpObject=self._ikSystem.poleVectorController,
                mo=True
            )

            self.addMembers(revNode)

            if self._ikRootController:
                ikStartObject = self._ikSystem.controllers[-1].zeroGrp
            else:
                ikStartObject = cmds.listRelatives(self._ikSystem.joints[0], parent=True)[0]
            cmds.parentConstraint(module.outJoints[-1], ikStartObject, mo=True)

            cmds.parentConstraint(module.outJoints[-1], self._fkSystem.controllers[0].zeroGrp, mo=True)

            self._parent = module
            self._parentOutJointID = outJointIndex
        else:
            super().attachTo(module, outJointIndex)

    def mirror(self, skeletonSearchStr='_l', skeletonReplaceStr='_r', mirrorTranslate=False):
        oppSideChar, oppSkelJoints = super().mirror(skeletonSearchStr, skeletonReplaceStr)
        oppMod = ThreeBoneLimb(self._name, oppSideChar, oppSkelJoints)
        oppMod.mirrorTranslate = mirrorTranslate
        oppMod.preBuild()
        oppMod.symmetrizeGuide()
        oppMod.build()
        oppMod.symmetrizeControllerShapes()
        oppMod.controllerColor = common.SYMMETRY_COLOR_TABLE.get(self._controllerColor)
        return oppMod
