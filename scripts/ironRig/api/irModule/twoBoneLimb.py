from maya.api import OpenMaya as om
from maya import cmds
from ... import utils
from ... import common
from ..irGlobal.controller import Controller
from ..irSystem.twoBoneIK import TwoBoneIK
from ..irSystem.fk import FK
from ..irSystem.splineIK import SplineIK
from .module import Module


class TwoBoneLimb(Module):
    def __init__(self, name='new', side=Module.SIDE.CENTER, skeletonJoints=[], detectInbetweenJoints=False):
        self._detectInbetweenJoints = detectInbetweenJoints

        self._upperLimbInbJoints = None
        self._lowerLimbInbJoints = None

        self._limbJnt0Index = None
        self._limbJnt1Index = None
        self._limbJnt2Index = None

        self._initLimbJoints = None
        self._initUpperLimbInbJoints = None
        self._initLowerLimbInbJoints = None

        self._ikSystem = None
        self._fkSystem = None
        self._upperTwistSystem = None
        self._lowerTwistSystem = None
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
        self._ikSystem = TwoBoneIK(self._name, self._side)
        self._systems.append(self._ikSystem)

        self._fkSystem = FK(self._name, self._side)
        self._fkSystem.endController = True
        self._systems.append(self._fkSystem)

        if self._detectInbetweenJoints:
            self._upperLimbInbJoints = utils.getInbetweenJoints(self._skelJoints[0], self._skelJoints[1])
            if self._upperLimbInbJoints:
                self._upperTwistSystem = SplineIK(self._name+'UpTwist', self._side)
                self._upperTwistSystem.numberOfControllers = 3
                self._upperTwistSystem.curveSpans = 1
                self._systems.append(self._upperTwistSystem)
            self._lowerLimbInbJoints = utils.getInbetweenJoints(self._skelJoints[1], self._skelJoints[2])
            if self._lowerLimbInbJoints:
                self._lowerTwistSystem = SplineIK(self._name+'lowTwist', self._side)
                self._lowerTwistSystem.numberOfControllers = 3
                self._lowerTwistSystem.curveSpans = 1
                self._systems.append(self._lowerTwistSystem)

        super()._addSystems()

    def _buildInitSkelLocators(self):
        if self._detectInbetweenJoints:
            initSkelLocs = []

            skelJoints = [self._skelJoints[0]] + self._upperLimbInbJoints + [self._skelJoints[1]] + self._lowerLimbInbJoints + [self.skelJoints[2]]

            self._limbJnt0Index = skelJoints.index(self._skelJoints[0])
            self._limbJnt1Index = skelJoints.index(self._skelJoints[1])
            self._limbJnt2Index = skelJoints.index(self._skelJoints[2])

            for skelJnt in skelJoints:
                initSkelLoc = cmds.spaceLocator(n='{}_init_{}_loc'.format(self.shortName, skelJnt))[0]
                cmds.matchTransform(initSkelLoc, skelJnt, position=True)
                cmds.hide(initSkelLoc)
                initSkelLocs.append(initSkelLoc)
            self._initSkelLocators = initSkelLocs
            cmds.parent(self._initSkelLocators, self._initGrp)
        else:
            super()._buildInitSkelLocators()

    def _buildInitJoints(self):
        if self._detectInbetweenJoints:
            super()._buildInitJoints()
            self._initLimbJoints = [self._initJoints[self._limbJnt0Index], self._initJoints[self._limbJnt1Index], self._initJoints[self._limbJnt2Index]]
            self._initUpperLimbInbJoints = utils.getInbetweenJoints(self._initLimbJoints[0], self._initLimbJoints[1])
            self._initLowerLimbInbJoints = utils.getInbetweenJoints(self._initLimbJoints[1], self._initLimbJoints[2])
        else:
            super()._buildInitJoints()
            self._initLimbJoints = self._initJoints

    def build(self):
        super().build()
        self._buildControls()

    def _buildInitJointsWithSkelJoints(self):
        if self._detectInbetweenJoints:
            # Get skeleton joints including inbetween joints
            skelJoints = [self._skelJoints[0]] + self._upperLimbInbJoints + [self._skelJoints[1]] + self._lowerLimbInbJoints + [self.skelJoints[2]]

            # Create init joints with skeleton joints
            initJoints = []
            for skelJnt in skelJoints:
                initJnt = cmds.createNode('joint', n='{}_init_{}'.format(self.shortName, skelJnt))
                cmds.matchTransform(initJnt, skelJnt, position=True, rotation=True)
                initJoints.append(initJnt)

            utils.makeHierarchy(initJoints)

            cmds.parent(initJoints[0], self._initGrp)
            cmds.makeIdentity(initJoints[0], apply=True)

            self._initJoints = initJoints

            # Get init joints information
            self._limbJnt0Index = skelJoints.index(self._skelJoints[0])
            self._limbJnt1Index = skelJoints.index(self._skelJoints[1])
            self._limbJnt2Index = skelJoints.index(self._skelJoints[2])

            self._initLimbJoints = [self._initJoints[self._limbJnt0Index], self._initJoints[self._limbJnt1Index], self._initJoints[self._limbJnt2Index]]
            self._initUpperLimbInbJoints = utils.getInbetweenJoints(self._initLimbJoints[0], self._initLimbJoints[1])
            self._initLowerLimbInbJoints = utils.getInbetweenJoints(self._initLimbJoints[1], self._initLimbJoints[2])
        else:
            super()._buildInitJointsWithSkelJoints()

    def _buildGroups(self):
        super()._buildGroups()
        self._controllerGrp = cmds.group(n='{}_ctrl_grp'.format(self.shortName), empty=True)
        cmds.parent(self._controllerGrp, self._topGrp)

    def _buildSystems(self):
        # Build IK
        ikJoints = utils.buildNewJointChain(self._initLimbJoints, searchStr='init', replaceStr='ik')
        self._ikSystem.joints = ikJoints
        self._ikSystem.build()
        self._ikSystem.setupStretch()
        if self._ikRootController:
            self._ikSystem.buildRootController()
        self._ikSystem.controllerSize = 5

        # Set pole vector controller position
        if self._oriPlaneLocators:
            poleVecCtrlPos = cmds.xform(self._oriPlaneLocators[1], q=True, rp=True, ws=True)
        else:
            poleVector = TwoBoneIK.getPoleVector(self._initLimbJoints[0], self._initLimbJoints[1], self._initLimbJoints[2])
            poleVecCtrlPos = utils.getWorldPoint(self._initLimbJoints[1]) + (poleVector * utils.getDistance(self._initLimbJoints[0], self._initLimbJoints[2]))
        self._ikSystem.poleVectorPosition = poleVecCtrlPos
        self._ikSystem.controllers[1].size = self._controllerSize * 0.3  # Set scale of pole vector controller

        # Build FK
        fkJoints = utils.buildNewJointChain(self._initLimbJoints, searchStr='init', replaceStr='fk')
        self._fkSystem.joints = fkJoints
        self._fkSystem.build()
        self._fkSystem.controllerSize = 5

        # Setup twist joints
        if self._upperTwistSystem:
            upperTwistJoints = utils.buildNewJointChain([self._initLimbJoints[0]]+self._initUpperLimbInbJoints+[self._initLimbJoints[1]], searchStr='init', replaceStr='upTwist')
            self._upperTwistSystem.joints = upperTwistJoints
            self._upperTwistSystem.build()
            self._upperTwistSystem.setupTwist()
            self._upperTwistSystem.setupStretch()
            self._upperTwistSystem.controllerShape = Controller.SHAPE.CIRCLE
            self._upperTwistSystem.controllerSize = self._controllerSize * 0.9

        if self._lowerTwistSystem:
            lowerTwistJoints = utils.buildNewJointChain([self._initLimbJoints[1]]+self._initLowerLimbInbJoints+[self._initLimbJoints[2]], searchStr='init', replaceStr='lowTwist')
            self._lowerTwistSystem.joints = lowerTwistJoints
            self._lowerTwistSystem.build()
            self._lowerTwistSystem.setupTwist()
            self._lowerTwistSystem.setupStretch()
            self._lowerTwistSystem.controllerShape = Controller.SHAPE.CIRCLE
            self._lowerTwistSystem.controllerSize = self._controllerSize * 0.9

    def _connectSystems(self):
        self._blendJoints = utils.buildNewJointChain(self._initLimbJoints, searchStr='init', replaceStr='blend')
        utils.parentKeepHierarchy(self._blendJoints, self._systemGrp)
        cmds.hide(self._blendJoints[0])
        for ikJnt, fkJnt, blendJnt in zip(self._ikSystem.joints, self._fkSystem.joints, self._blendJoints):
            blendCnst = cmds.parentConstraint(ikJnt, fkJnt, blendJnt, mo=True)[0]
            cmds.setAttr('{}.interpType'.format(blendCnst), 2)
            self._blendConstraints.append(blendCnst)

        self._setupNonroll(self._blendJoints[0])

        # Connect twist systems
        if self._upperTwistSystem:
            self._setupNonroll(self._blendJoints[1])
            blendJnt1LocalMtx = cmds.createNode('multMatrix', n='{}_local_multMtx'.format(self._blendJoints[1]))
            blendJnt1LocalDecMtx = cmds.createNode('decomposeMatrix', n='{}_local_decMtx'.format(self._blendJoints[1]))
            cmds.setAttr('{}.inputRotateOrder'.format(blendJnt1LocalDecMtx), 3)  # Set rotate order to xzy since the primary axis of rotation is the Y.
            cmds.connectAttr('{}.worldMatrix'.format(self._blendJoints[0]), '{}.matrixIn[0]'.format(blendJnt1LocalMtx))
            cmds.connectAttr('{}.worldInverseMatrix'.format(self._nonrollJoints[0]), '{}.matrixIn[1]'.format(blendJnt1LocalMtx))
            cmds.connectAttr('{}.matrixSum'.format(blendJnt1LocalMtx), '{}.inputMatrix'.format(blendJnt1LocalDecMtx))
            cmds.connectAttr('{}.outputRotateX'.format(blendJnt1LocalDecMtx), '{}.twist'.format(self._upperTwistSystem.controllers[-1]))
            upTwistUnitConversion = cmds.listConnections('{}.twist'.format(self._upperTwistSystem.controllers[-1]), destination=False)[0]
            cmds.setAttr('{}.conversionFactor'.format(upTwistUnitConversion), self._aimSign*cmds.getAttr('{}.conversionFactor'.format(upTwistUnitConversion)))
            cmds.parentConstraint(self._nonrollJoints[0], self._upperTwistSystem.topGrp, mo=True)
            self.addMembers(blendJnt1LocalMtx, blendJnt1LocalDecMtx)
            cmds.parentConstraint(self._blendJoints[0], self._upperTwistSystem.controllers[0], mo=True)
            cmds.pointConstraint(self._upperTwistSystem.controllers[0],
                               self._upperTwistSystem.controllers[2],
                               self._upperTwistSystem.controllers[1].zeroGrp,
                               mo=True)
            self._upperTwistSystem.controllers[0].hide()

        if self._lowerTwistSystem:
            blendJnt2NonrollGrp = self._setupNonroll(self._blendJoints[2])
            blendJnt2LocalMtx = cmds.createNode('multMatrix', n='{}_local_multMtx'.format(self._blendJoints[2]))
            blendJnt2LocalDecMtx = cmds.createNode('decomposeMatrix', n='{}_local_decMtx'.format(self._blendJoints[2]))
            cmds.setAttr('{}.inputRotateOrder'.format(blendJnt2LocalDecMtx), 3)
            cmds.connectAttr('{}.worldMatrix'.format(self._blendJoints[-1]), '{}.matrixIn[0]'.format(blendJnt2LocalMtx))
            cmds.connectAttr('{}.worldInverseMatrix'.format(self._nonrollJoints[-1]), '{}.matrixIn[1]'.format(blendJnt2LocalMtx))
            cmds.connectAttr('{}.matrixSum'.format(blendJnt2LocalMtx), '{}.inputMatrix'.format(blendJnt2LocalDecMtx))
            cmds.connectAttr('{}.outputRotateX'.format(blendJnt2LocalDecMtx), '{}.twist'.format(self._lowerTwistSystem.controllers[-1]))
            lowTwistUnitConversion = cmds.listConnections('{}.twist'.format(self._lowerTwistSystem.controllers[-1]), destination=False)[0]
            cmds.setAttr('{}.conversionFactor'.format(lowTwistUnitConversion), self._aimSign*cmds.getAttr('{}.conversionFactor'.format(lowTwistUnitConversion)))
            cmds.parentConstraint(self._blendJoints[1], self._lowerTwistSystem.topGrp, mo=True)
            cmds.parentConstraint(self._blendJoints[1], blendJnt2NonrollGrp, mo=True)
            self.addMembers(blendJnt2LocalMtx, blendJnt2LocalDecMtx)
            cmds.parentConstraint(self._blendJoints[-1], self._lowerTwistSystem.controllers[-1], mo=True)
            cmds.pointConstraint(self._lowerTwistSystem.controllers[0],
                               self._lowerTwistSystem.controllers[2],
                               self._lowerTwistSystem.controllers[1].zeroGrp,
                               mo=True)
            self._lowerTwistSystem.controllers[-1].hide()

        self._sysJoints = [self._nonrollJoints[0]] + self._blendJoints[1:]
        if self._upperTwistSystem:
            self._sysJoints = self._upperTwistSystem.joints[:-1] + self._blendJoints[1:]
        if self._lowerTwistSystem:
            self._sysJoints = self._sysJoints[:-2] + self._lowerTwistSystem.joints[:-1] + [self._blendJoints[-1]]

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
        initJoints = self._initLimbJoints
        if self._upperTwistSystem:
            initJoints = [self._initLimbJoints[0]] + self._initUpperLimbInbJoints + self._initLimbJoints[1:]
        if self._lowerTwistSystem:
            initJoints = initJoints[:-1] + self._initLowerLimbInbJoints + [self._initLimbJoints[-1]]
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

        if self._upperTwistSystem or self._lowerTwistSystem:
            cmds.addAttr(moduleCtrl, ln='bendCtrlVis', at='bool', dv=False, keyable=True)
            moduleTwistCtrl = Controller('{}_twist'.format(self.shortName))
            cmds.matchTransform(moduleTwistCtrl.zeroGrp, self._blendJoints[1], position=True)
            cmds.pointConstraint(self._blendJoints[1], moduleTwistCtrl.zeroGrp, mo=False)
            oCnst = cmds.orientConstraint(self._blendJoints[0], self._blendJoints[1], moduleTwistCtrl.zeroGrp, mo=False)[0]
            cmds.setAttr('{}.interpType'.format(oCnst), 2)
            pvLineDecMtx = cmds.listConnections('{}.worldMatrix'.format(self._ikSystem.joints[1]), type='decomposeMatrix')[0]
            cmds.connectAttr('{}.worldMatrix'.format(moduleTwistCtrl), '{}.inputMatrix'.format(pvLineDecMtx), f=True)
            cmds.parent(moduleTwistCtrl.zeroGrp, self._controllerGrp)
            moduleTwistCtrl.lockHideChannels(['rotate', 'scale', 'visibility'])
            cmds.connectAttr('{}.bendCtrlVis'.format(moduleCtrl), '{}.visibility'.format(moduleTwistCtrl.zeroGrp))
            self._controllers.append(moduleTwistCtrl)

            upAxis = list(set(['X', 'Y', 'Z']) - set(self._aimAxis))[0]
            if self._upperTwistSystem:
                cmds.connectAttr('{}.bendCtrlVis'.format(moduleCtrl), '{}.visibility'.format(self._upperTwistSystem.topGrp))
                cmds.parentConstraint(moduleTwistCtrl, self._upperTwistSystem.controllers[-1].zeroGrp, mo=True)
                cmds.aimConstraint(moduleTwistCtrl,
                                self._upperTwistSystem.controllers[1].zeroGrp,
                                aimVector=self._aimSign * utils.axisStrToVector(self._aimAxis),
                                upVector=utils.axisStrToVector(upAxis),
                                worldUpType='objectrotation',
                                worldUpVector=utils.axisStrToVector(upAxis),
                                worldUpObject=moduleTwistCtrl)
                self._upperTwistSystem.controllers[-1].hide()
            if self._lowerTwistSystem:
                cmds.connectAttr('{}.bendCtrlVis'.format(moduleCtrl), '{}.visibility'.format(self._lowerTwistSystem.topGrp))
                cmds.parentConstraint(moduleTwistCtrl, self._lowerTwistSystem.controllers[0].zeroGrp, mo=True)
                cmds.aimConstraint(moduleTwistCtrl,
                                self._lowerTwistSystem.controllers[1].zeroGrp,
                                aimVector=-self._aimSign * utils.axisStrToVector(self._aimAxis),
                                upVector=utils.axisStrToVector(upAxis),
                                worldUpType='objectrotation',
                                worldUpVector=utils.axisStrToVector(upAxis),
                                worldUpObject=moduleTwistCtrl)
                self._lowerTwistSystem.controllers[0].hide()

        self._controllers[0].size = self._controllerSize * 0.1  # Set scale of module controller
        if self._upperTwistSystem or self._lowerTwistSystem:
            self._controllers[1].size = self._controllerSize * 0.9

    def attachTo(self, module):
        if module.__class__.__name__ == 'LimbBase':
            limbBaseCtrl = module.fkRootController

            aimLoc = cmds.spaceLocator(n='{}_aim_loc'.format(limbBaseCtrl))[0]
            staticLoc = cmds.spaceLocator(n='{}_static_loc'.format(limbBaseCtrl))[0]
            for loc in [staticLoc, aimLoc]:
                cmds.matchTransform(loc, limbBaseCtrl.zeroGrp)
            cmds.parent([staticLoc, aimLoc], module.fkSystem.blackboxGrp)
            cnst = cmds.orientConstraint([aimLoc, staticLoc], limbBaseCtrl.zeroGrp, mo=True)[0]
            cmds.setAttr('{}.interpType'.format(cnst), 2)

            cmds.addAttr(limbBaseCtrl, ln='aim', at='float', min=0.0, max=1.0, dv=0.5, keyable=True)
            revNode = cmds.createNode('reverse', n='{}_aim_rev'.format(limbBaseCtrl))
            cmds.connectAttr('{}.aim'.format(limbBaseCtrl), '{}.target[0].targetWeight'.format(cnst), f=True)
            cmds.connectAttr('{}.aim'.format(limbBaseCtrl), '{}.inputX'.format(revNode))
            cmds.connectAttr('{}.outputX'.format(revNode), '{}.target[1].targetWeight'.format(cnst), f=True)

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
        else:
            super().attachTo(module)

    def mirror(self, skeletonSearchStr='_l', skeletonReplaceStr='_r', mirrorTranslate=False):
        oppSideChar, oppSkelJoints = super().mirror(skeletonSearchStr, skeletonReplaceStr)
        oppMod = TwoBoneLimb(self._name, oppSideChar, oppSkelJoints)
        oppMod.mirrorTranslate = mirrorTranslate
        oppMod.preBuild()
        oppMod.symmetrizeGuide()
        oppMod.build()
        oppMod.symmetrizeControllerShapes()
        oppMod.controllerColor = common.SYMMETRY_COLOR_TABLE.get(self._controllerColor)
        return oppMod
