from maya.api import OpenMaya as om
from maya import cmds
from ... import utils
from ..irGlobal import Controller
from ..irSystem import TwoBoneIK
from ..irSystem import ThreeBoneIK
from ..irSystem import FK
from ..irSystem import SplineIK
from .module import Module


class ThreeBoneLimb(Module):
    def __init__(self, prefix='', joints=[]):
        super(ThreeBoneLimb, self).__init__(prefix, joints)

        self.__firstLimbInbSkelJoints = None
        self.__secondLimbInbSkelJoints = None
        self.__thirdLimbInbSkelJoints = None

        self.__limbJnt0Index = None
        self.__limbJnt1Index = None
        self.__limbJnt2Index = None
        self.__limbJnt3Index = None

        self.__limbInitJoints = None
        self.__firstLimbInbInitJoints = None
        self.__secondLimbInbInitJoints = None
        self.__thirdLimbInbInitJoints = None

        self.__ikSystem = None
        self.__fkSystem = None
        self.__firstLimbTwistSystem = None
        self.__secondLimbTwistSystem = None
        self.__thirdLimbTwistSystem = None
        self.__blendJoints = None
        self.__nonrollJoints = []
        self.__blendConstraints = []

        self.__ikStartController = False

    @property
    def ikStartController(self):
        return self.__ikStartController

    @ikStartController.setter
    def ikStartController(self, val):
        self.__ikStartController = val

    def ikSystem(self):
        return self.__ikSystem

    def fkSystem(self):
        return self.__fkSystem

    def preBuild(self):
        self.__firstLimbInbSkelJoints = utils.getInbetweenJoints(self._skelJoints[0], self._skelJoints[1])
        self.__secondLimbInbSkelJoints = utils.getInbetweenJoints(self._skelJoints[1], self._skelJoints[2])
        self.__thirdLimbInbSkelJoints = utils.getInbetweenJoints(self._skelJoints[2], self._skelJoints[3])
        super(ThreeBoneLimb, self).preBuild()

    def _buildInitSkelLocators(self):
        initSkelLocs = []

        skelJoints = [self._skelJoints[0]] + self.__firstLimbInbSkelJoints + [self._skelJoints[1]] + self.__secondLimbInbSkelJoints + [self.skelJoints[2]] + self.__thirdLimbInbSkelJoints + [self.skelJoints[3]]

        self.__limbJnt0Index = skelJoints.index(self._skelJoints[0])
        self.__limbJnt1Index = skelJoints.index(self._skelJoints[1])
        self.__limbJnt2Index = skelJoints.index(self._skelJoints[2])
        self.__limbJnt3Index = skelJoints.index(self._skelJoints[3])

        for skelJnt in skelJoints:
            initSkelLoc = cmds.spaceLocator(n='{}init_{}_loc'.format(self.shortName, skelJnt))
            cmds.matchTransform(initSkelLoc, skelJnt, position=True)
            initSkelLoc.hide()
            initSkelLocs.append(initSkelLoc)
        self._initSkelLocators = initSkelLocs
        cmds.parent(self._initSkelLocators, self._initGrp)

    def _createMidLocator(self):
        midLoc = None
        firstInitLoc = self._initSkelLocators[self.__limbJnt0Index]
        secondInitLoc = self._initSkelLocators[self.__limbJnt1Index]
        thirdInitLoc = self._initSkelLocators[self.__limbJnt2Index]

        aimVector = utils.getWorldPoint(self._initSkelLocators[-1]) - utils.getWorldPoint(self._initSkelLocators[0])
        midOriPlaneLocVector = TwoBoneIK.getPoleVector(firstInitLoc, secondInitLoc, thirdInitLoc)
        if utils.isParallel(aimVector, midOriPlaneLocVector) or round(midOriPlaneLocVector.length()) == 0.0:
            midOriPlaneLocVector = om.MVector.kZaxisVector
        midLocPos = utils.getWorldPoint(secondInitLoc) + (midOriPlaneLocVector.normal() * utils.getDistance(firstInitLoc, thirdInitLoc))

        midLoc = cmds.spaceLocator(n='{}mid_oriPlane_loc'.format(self.shortName))
        midLoc.overrideEnabled.set(True)
        midLoc.overrideColor.set(6)
        cmds.xform(midLoc, t=midLocPos, ws=True)

        negAxisAttrNames = ['negateXAxis', 'negateZAxis', 'swapYZAxis']
        for attrName in negAxisAttrNames:
            cmds.addAttr(midLoc, ln=attrName, at='bool', dv=False, keyable=True)
            midLoc.attr(attrName) >> self._orientPlane.attr(attrName)

        return midLoc

    def _buildInitJoints(self):
        super(ThreeBoneLimb, self)._buildInitJoints()
        self.__limbInitJoints = [self._initJoints[self.__limbJnt0Index], self._initJoints[self.__limbJnt1Index], self._initJoints[self.__limbJnt2Index], self._initJoints[self.__limbJnt3Index]]
        self.__firstLimbInbInitJoints = utils.getInbetweenJoints(self.__limbInitJoints[0], self.__limbInitJoints[1])
        self.__secondLimbInbInitJoints = utils.getInbetweenJoints(self.__limbInitJoints[1], self.__limbInitJoints[2])
        self.__thirdLimbInbInitJoints = utils.getInbetweenJoints(self.__limbInitJoints[2], self.__limbInitJoints[3])

    def build(self):
        super(ThreeBoneLimb, self).build()
        self.__buildControls()

    def _buildGroups(self):
        super(ThreeBoneLimb, self)._buildGroups()
        self.__controllerGrp = cmds.group(n='{}ctrl_grp'.format(self.shortName), empty=True)
        cmds.parent(self.__controllerGrp, self._topGrp)

    def _buildSystems(self):
        ikJoints = utils.buildNewJointChain(self.__limbInitJoints, searchStr='init', replaceStr='ik')
        poleVecCtrlPos = cmds.xform(self._oriPlaneLocators[1], q=True, rp=True, ws=True)
        self.__ikSystem = ThreeBoneIK(self.shortName+'ik_', ikJoints, poleVecCtrlPos)

        if self._negateScaleX:
            self.__ikSystem.negateScaleX = True
        self.__ikSystem.build()
        self.__ikSystem.setupStretch()
        if self.__ikStartController:
            self.__ikSystem.buildStartController()
        self._addSystems(self.__ikSystem)

        fkJoints = utils.buildNewJointChain(self.__limbInitJoints, searchStr='init', replaceStr='fk')
        self.__fkSystem = FK(self.shortName+'fk_', fkJoints)
        self.__fkSystem.endController = True
        if self._negateScaleX:
            self.__fkSystem.negateScaleX = True
        self.__fkSystem.build()
        self._addSystems(self.__fkSystem)

        if self.__firstLimbInbSkelJoints:
            fristLimbTwistJoints = utils.buildNewJointChain([self.__limbInitJoints[0]]+self.__firstLimbInbInitJoints+[self.__limbInitJoints[1]], searchStr='init', replaceStr='firstLimbTwist')
            self.__firstLimbTwistSystem = SplineIK(self.shortName+'firstLimbTwist_', fristLimbTwistJoints, 3)
            self.__firstLimbTwistSystem.curveSpans = 1
            self.__firstLimbTwistSystem.build()
            self.__firstLimbTwistSystem.setupTwist()
            self.__firstLimbTwistSystem.setupStretch()
            self.__firstLimbTwistSystem.controllerShape = Controller.SHAPE.CIRCLE
            self.__firstLimbTwistSystem.controllerSize = 5
            self._addSystems(self.__firstLimbTwistSystem)

        if self.__secondLimbInbSkelJoints:
            secondLimbTwistJoints = utils.buildNewJointChain([self.__limbInitJoints[1]]+self.__secondLimbInbInitJoints+[self.__limbInitJoints[2]], searchStr='init', replaceStr='secondLimbTwist')
            self.__secondLimbTwistSystem = SplineIK(self.shortName+'secondLimbTwist_', secondLimbTwistJoints, 3)
            self.__secondLimbTwistSystem.curveSpans = 1
            self.__secondLimbTwistSystem.build()
            self.__secondLimbTwistSystem.setupTwist()
            self.__secondLimbTwistSystem.setupStretch()
            self.__secondLimbTwistSystem.controllerShape = Controller.SHAPE.CIRCLE
            self.__secondLimbTwistSystem.controllerSize = 5
            self._addSystems(self.__secondLimbTwistSystem)

        if self.__thirdLimbInbSkelJoints:
            thirdLimbTwistJoints = utils.buildNewJointChain([self.__limbInitJoints[2]]+self.__thirdLimbInbInitJoints+[self.__limbInitJoints[3]], searchStr='init', replaceStr='thirdLimbTwist')
            self.__thirdLimbTwistSystem = SplineIK(self.shortName+'thirdLimbTwist_', thirdLimbTwistJoints, 3)
            self.__thirdLimbTwistSystem.curveSpans = 1
            self.__thirdLimbTwistSystem.build()
            self.__thirdLimbTwistSystem.setupTwist()
            self.__thirdLimbTwistSystem.setupStretch()
            self.__thirdLimbTwistSystem.controllerShape = Controller.SHAPE.CIRCLE
            self.__thirdLimbTwistSystem.controllerSize = 5
            self._addSystems(self.__thirdLimbTwistSystem)

    def _connectSystems(self):
        self.__blendJoints = utils.buildNewJointChain(self.__limbInitJoints, searchStr='init', replaceStr='blend')
        utils.parentKeepHierarchy(self.__blendJoints, self._systemGrp)
        self.__blendJoints[0].hide()
        for ikJnt, fkJnt, blendJnt in zip(self.__ikSystem.joints, self.__fkSystem.joints, self.__blendJoints):
            blendCnst = cmds.parentConstraint(ikJnt, fkJnt, blendJnt, mo=True)
            blendCnst.interpType.set(2)
            self.__blendConstraints.append(blendCnst)

        self.__setupNonroll(self.__blendJoints[0])

        if self.__firstLimbTwistSystem:
            self.__setupNonroll(self.__blendJoints[1])
            blendJnt1LocalMtx = cmds.createNode('multMatrix', n='{}_local_multMtx'.format(self.__blendJoints[1]))
            blendJnt1LocalDecMtx = cmds.createNode('decomposeMatrix', n='{}_local_decMtx'.format(self.__blendJoints[1]))
            blendJnt1LocalDecMtx.inputRotateOrder.set(3)  # Set rotate order to xzy since the primary axis of rotation is the Y.
            self.__blendJoints[0].worldMatrix >> blendJnt1LocalMtx.matrixIn[0]
            self.__nonrollJoints[0].worldInverseMatrix >> blendJnt1LocalMtx.matrixIn[1]
            blendJnt1LocalMtx.matrixSum >> blendJnt1LocalDecMtx.inputMatrix
            blendJnt1LocalDecMtx.outputRotateX >> self.__firstLimbTwistSystem.controllers[-1].twist
            firstLimbTwistUnitConversion = self.__firstLimbTwistSystem.controllers[-1].twist.inputs()[0]
            firstLimbTwistUnitConversion.conversionFactor.set(self._aimSign * firstLimbTwistUnitConversion.conversionFactor.get())
            cmds.parentConstraint(self.__nonrollJoints[0], self.__firstLimbTwistSystem.topGrp, mo=True)
            cmds.parentConstraint(self.__blendJoints[0], self.__firstLimbTwistSystem.controllers[0], mo=True)
            cmds.pointConstraint(self.__firstLimbTwistSystem.controllers[0],
                               self.__firstLimbTwistSystem.controllers[2],
                               self.__firstLimbTwistSystem.controllers[1].zeroGrp,
                               mo=True)
            self.__firstLimbTwistSystem.controllers[0].hide()
            self.__firstLimbTwistSystem.controllers[-1].hide()
            self.addMembers(blendJnt1LocalMtx, blendJnt1LocalDecMtx)

        if self.__secondLimbTwistSystem:
            self.__setupNonroll(self.__blendJoints[2])
            blendJnt2LocalMtx = cmds.createNode('multMatrix', n='{}_local_multMtx'.format(self.__blendJoints[2]))
            blendJnt2LocalDecMtx = cmds.createNode('decomposeMatrix', n='{}_local_decMtx'.format(self.__blendJoints[2]))
            blendJnt2LocalDecMtx.inputRotateOrder.set(3)
            self.__blendJoints[1].worldMatrix >> blendJnt2LocalMtx.matrixIn[0]
            self.__nonrollJoints[1].worldInverseMatrix >> blendJnt2LocalMtx.matrixIn[1]
            blendJnt2LocalMtx.matrixSum >> blendJnt2LocalDecMtx.inputMatrix
            blendJnt2LocalDecMtx.outputRotateX >> self.__secondLimbTwistSystem.controllers[-1].twist
            secondLimbTwistUnitConversion = self.__secondLimbTwistSystem.controllers[-1].twist.inputs()[0]
            secondLimbTwistUnitConversion.conversionFactor.set(self._aimSign * secondLimbTwistUnitConversion.conversionFactor.get())
            cmds.parentConstraint(self.__blendJoints[1], self.__secondLimbTwistSystem.topGrp, mo=True)
            cmds.pointConstraint(self.__secondLimbTwistSystem.controllers[0],
                               self.__secondLimbTwistSystem.controllers[2],
                               self.__secondLimbTwistSystem.controllers[1].zeroGrp,
                               mo=True)
            self.__secondLimbTwistSystem.controllers[0].hide()
            self.__secondLimbTwistSystem.controllers[-1].hide()
            self.addMembers(blendJnt2LocalMtx, blendJnt2LocalDecMtx)

        if self.__thirdLimbTwistSystem:
            blendJnt3NonrollGrp = self.__setupNonroll(self.__blendJoints[3])
            blendJnt3LocalMtx = cmds.createNode('multMatrix', n='{}_local_multMtx'.format(self.__blendJoints[3]))
            blendJnt3LocalDecMtx = cmds.createNode('decomposeMatrix', n='{}_local_decMtx'.format(self.__blendJoints[3]))
            blendJnt3LocalDecMtx.inputRotateOrder.set(3)
            self.__blendJoints[-1].worldMatrix >> blendJnt3LocalMtx.matrixIn[0]
            self.__nonrollJoints[-1].worldInverseMatrix >> blendJnt3LocalMtx.matrixIn[1]
            blendJnt3LocalMtx.matrixSum >> blendJnt3LocalDecMtx.inputMatrix
            blendJnt3LocalDecMtx.outputRotateX >> self.__thirdLimbTwistSystem.controllers[-1].twist
            thirdLimbTwistUnitConversion = self.__thirdLimbTwistSystem.controllers[-1].twist.inputs()[0]
            thirdLimbTwistUnitConversion.conversionFactor.set(self._aimSign * thirdLimbTwistUnitConversion.conversionFactor.get())
            cmds.parentConstraint(self.__blendJoints[2], self.__thirdLimbTwistSystem.topGrp, mo=True)
            cmds.parentConstraint(self.__blendJoints[2], blendJnt3NonrollGrp, mo=True)
            cmds.parentConstraint(self.__blendJoints[-1], self.__thirdLimbTwistSystem.controllers[-1], mo=True)
            cmds.pointConstraint(self.__thirdLimbTwistSystem.controllers[0],
                               self.__thirdLimbTwistSystem.controllers[2],
                               self.__thirdLimbTwistSystem.controllers[1].zeroGrp,
                               mo=True)
            self.__thirdLimbTwistSystem.controllers[0].hide()
            self.__thirdLimbTwistSystem.controllers[-1].hide()
            self.addMembers(blendJnt3LocalMtx, blendJnt3LocalDecMtx)

        self._sysJoints = [self.__nonrollJoints[0]] + self.__blendJoints[1:]  # The first joint should be non roll
        if self.__firstLimbTwistSystem:
            self._sysJoints = self.__firstLimbTwistSystem.joints[:-1] + self.__blendJoints[1:]
        if self.__secondLimbTwistSystem:
            self._sysJoints = self._sysJoints[:-3] + self.__secondLimbTwistSystem.joints[:-1] + self.__blendJoints[2:]
        if self.__thirdLimbTwistSystem:
            self._sysJoints = self._sysJoints[:-2] + self.__thirdLimbTwistSystem.joints[:-1] + [self.__blendJoints[-1]]

    def __setupNonroll(self, blendJoint):
        nonrollGrp = cmds.createNode('transform', n=blendJoint.replace('_blend', '_nonroll_grp'))
        nonrollGrp.hide()
        cmds.matchTransform(nonrollGrp, blendJoint, pivots=True)

        nonrollJntStart = cmds.duplicate(blendJoint, n=blendJoint.replace('_blend', '_nonroll_start'), po=True)[0]
        nonrollJntEnd = cmds.duplicate(blendJoint, n=blendJoint.replace('_blend', '_nonroll_end'), po=True)[0]
        nonrollJntStart | nonrollJntEnd
        childJnt = blendJoint.getChildren(type='joint')
        if childJnt:
            cmds.matchTransform(nonrollJntEnd, childJnt[0], position=True)
        else:
            nonrollJntEnd.attr('translate{}'.format(self._aimAxis)).set(self._aimSign)

        nonrollIkh = cmds.ikHandle(startJoint=nonrollJntStart, endEffector=nonrollJntEnd, solver='ikRPsolver', n=blendJoint.replace('_blend', '_nonroll_ikh'))[0]
        for attrStr in ['poleVector' + axis for axis in 'XYZ']:
            nonrollIkh.attr(attrStr).set(0)

        cmds.pointConstraint(blendJoint, nonrollJntStart, mo=True)
        cmds.parentConstraint(blendJoint, nonrollIkh, mo=True)

        cmds.parent([nonrollJntStart, nonrollIkh], nonrollGrp)
        cmds.parent(nonrollGrp, self._systemGrp)

        self.__nonrollJoints.append(nonrollJntStart)

        return nonrollGrp

    def _buildOutputs(self):
        initJoints = self.__limbInitJoints
        if self.__firstLimbTwistSystem:
            initJoints = [initJoints[0]] + self.__firstLimbInbInitJoints + self.__limbInitJoints[1:]
        if self.__secondLimbTwistSystem:
            initJoints = initJoints[:-2] + self.__secondLimbInbInitJoints + self.__limbInitJoints[2:]
        if self.__thirdLimbTwistSystem:
            initJoints = initJoints[:-1] + self.__thirdLimbInbInitJoints + [self.__limbInitJoints[-1]]
        self._outJoints = utils.buildNewJointChain(initJoints, searchStr='init', replaceStr='out')
        utils.parentKeepHierarchy(self._outJoints, self._outGrp)

    def _connectSkeleton(self):
        for outJnt in self._outJoints:
            skelJnt = outJnt.replace(self.shortName+'out_', '')
            utils.removeConnections(skelJnt)
            cmds.parentConstraint(outJnt, skelJnt, mo=True)
            cmds.scaleConstraint(outJnt, skelJnt, mo=True)
            # for axis in 'XYZ':
            #     outJnt.attr('scale'+axis) >> skelJnt.attr('scale'+axis)

    def __buildControls(self):
        moduleCtrl = Controller('{}module_ctrl'.format(self.shortName), Controller.SHAPE.SPHERE)
        moduleCtrl.lockHideChannels(['translate', 'rotate', 'scale', 'visibility'])
        cmds.addAttr(moduleCtrl, ln='ik', at='double', min=0.0, max=1.0, dv=1.0, keyable=True)
        cmds.matchTransform(moduleCtrl.zeroGrp, self.__blendJoints[-1], position=True)
        cmds.parentConstraint(self.__blendJoints[-1], moduleCtrl.zeroGrp, mo=True)
        moduleCtrl.shapeOffset = om.MVector.kZnegAxisVector * 10

        fkIkRev = cmds.createNode('reverse', n='{}fkIk_rev'.format(self.shortName))
        moduleCtrl.ik >> self.__ikSystem.topGrp.visibility
        moduleCtrl.ik >> fkIkRev.inputX
        fkIkRev.outputX >> self.__fkSystem.topGrp.visibility
        for cnst in self.__blendConstraints:
            moduleCtrl.ik >> cnst.target[0].targetWeight
            fkIkRev.outputX >> cnst.target[1].targetWeight

        cmds.parent(moduleCtrl.zeroGrp, self.__controllerGrp)
        self._controllers.append(moduleCtrl)
        self.addMembers(moduleCtrl.allNodes)

        if self.__firstLimbTwistSystem or self.__secondLimbTwistSystem or self.__thirdLimbTwistSystem:
            cmds.addAttr(moduleCtrl, ln='bendCtrlVis', at='bool', dv=False, keyable=True)
            moduleFirstTwistCtrl = Controller('{}firstTwist_ctrl'.format(self.shortName))
            cmds.matchTransform(moduleFirstTwistCtrl.zeroGrp, self.__blendJoints[1], position=True)
            cmds.pointConstraint(self.__blendJoints[1], moduleFirstTwistCtrl.zeroGrp, mo=False)
            oCnst = cmds.orientConstraint(self.__blendJoints[0], self.__blendJoints[1], moduleFirstTwistCtrl.zeroGrp, mo=False)
            oCnst.interpType.set(2)
            cmds.parent(moduleFirstTwistCtrl.zeroGrp, self.__controllerGrp)
            moduleFirstTwistCtrl.lockHideChannels(['rotate', 'scale', 'visibility'])
            moduleCtrl.bendCtrlVis >> moduleFirstTwistCtrl.zeroGrp.visibility
            self._controllers.append(moduleFirstTwistCtrl)

            pvLineDecMtx = self.__ikSystem.joints[1].worldMatrix.outputs(type='decomposeMatrix')[0]
            moduleFirstTwistCtrl.worldMatrix >> pvLineDecMtx.inputMatrix

            moduleSecondTwistCtrl = Controller('{}secondTwist_ctrl'.format(self.shortName))
            cmds.matchTransform(moduleSecondTwistCtrl.zeroGrp, self.__blendJoints[2], position=True)
            cmds.pointConstraint(self.__blendJoints[2], moduleSecondTwistCtrl.zeroGrp, mo=False)
            oCnst = cmds.orientConstraint(self.__blendJoints[1], self.__blendJoints[2], moduleSecondTwistCtrl.zeroGrp, mo=False)
            oCnst.interpType.set(2)
            cmds.parent(moduleSecondTwistCtrl.zeroGrp, self.__controllerGrp)
            moduleSecondTwistCtrl.lockHideChannels(['rotate', 'scale', 'visibility'])
            moduleCtrl.bendCtrlVis >> moduleSecondTwistCtrl.zeroGrp.visibility
            self._controllers.append(moduleSecondTwistCtrl)

            upAxis = list(set(['X', 'Y', 'Z']) - set(self._aimAxis))[0]
            if self.__firstLimbTwistSystem:
                moduleCtrl.bendCtrlVis >> self.__firstLimbTwistSystem.topGrp.visibility
                cmds.parentConstraint(moduleFirstTwistCtrl, self.__firstLimbTwistSystem.controllers[-1].zeroGrp, mo=True)
                cmds.aimConstraint(moduleFirstTwistCtrl,
                                self.__firstLimbTwistSystem.controllers[1].zeroGrp,
                                aimVector=self._aimSign * utils.axisStrToVector(self._aimAxis),
                                upVector=utils.axisStrToVector(upAxis),
                                worldUpType='objectrotation',
                                worldUpVector=utils.axisStrToVector(upAxis),
                                worldUpObject=moduleFirstTwistCtrl)
            if self.__secondLimbTwistSystem:
                moduleCtrl.bendCtrlVis >> self.__secondLimbTwistSystem.topGrp.visibility
                cmds.parentConstraint(moduleFirstTwistCtrl, self.__secondLimbTwistSystem.controllers[0].zeroGrp, mo=True)
                cmds.parentConstraint(moduleSecondTwistCtrl, self.__secondLimbTwistSystem.controllers[-1].zeroGrp, mo=True)
                cmds.aimConstraint(moduleFirstTwistCtrl,
                                self.__secondLimbTwistSystem.controllers[1].zeroGrp,
                                aimVector=-self._aimSign * utils.axisStrToVector(self._aimAxis),
                                upVector=utils.axisStrToVector(upAxis),
                                worldUpType='objectrotation',
                                worldUpVector=utils.axisStrToVector(upAxis),
                                worldUpObject=moduleFirstTwistCtrl)
            if self.__thirdLimbTwistSystem:
                moduleCtrl.bendCtrlVis >> self.__thirdLimbTwistSystem.topGrp.visibility
                cmds.parentConstraint(moduleSecondTwistCtrl, self.__thirdLimbTwistSystem.controllers[0].zeroGrp, mo=True)
                cmds.aimConstraint(moduleSecondTwistCtrl,
                                self.__thirdLimbTwistSystem.controllers[1].zeroGrp,
                                aimVector=-self._aimSign * utils.axisStrToVector(self._aimAxis),
                                upVector=utils.axisStrToVector(upAxis),
                                worldUpType='objectrotation',
                                worldUpVector=utils.axisStrToVector(upAxis),
                                worldUpObject=moduleSecondTwistCtrl)

    def postBuild(self):
        super(ThreeBoneLimb, self).postBuild()

        if self.__firstLimbTwistSystem:
            self.__firstLimbTwistSystem.controllerColor = tuple(om.MVector(self._controllerColor) + 0.5)
        if self.__secondLimbTwistSystem:
            self.__secondLimbTwistSystem.controllerColor = tuple(om.MVector(self._controllerColor) + 0.5)
        if self.__thirdLimbTwistSystem:
            self.__thirdLimbTwistSystem.controllerColor = tuple(om.MVector(self._controllerColor) + 0.5)
        if self.__firstLimbTwistSystem or self.__secondLimbTwistSystem or self.__thirdLimbTwistSystem:
            self._controllers[1].color = tuple(om.MVector(self._controllerColor) + 0.5)
            self._controllers[2].color = tuple(om.MVector(self._controllerColor) + 0.5)

        self._controllers[0].size = self._controllerSize * 0.1  # Set scale of module controller
        self.__ikSystem.controllers[1].size = self._controllerSize * 0.3  # Set scale of pole vector controller
        if self.__firstLimbTwistSystem:
            self.__firstLimbTwistSystem.controllerSize = self._controllerSize * 0.9
        if self.__secondLimbTwistSystem:
            self.__secondLimbTwistSystem.controllerSize = self._controllerSize * 0.9
        if self.__thirdLimbTwistSystem:
            self.__thirdLimbTwistSystem.controllerSize = self._controllerSize * 0.9
        if self.__firstLimbTwistSystem or self.__secondLimbTwistSystem or self.__thirdLimbTwistSystem:
            self._controllers[1].size = self._controllerSize * 0.9
            self._controllers[2].size = self._controllerSize * 0.9

    def attachTo(self, module):
        if module.__class__.__name__ == 'LimbBase':
            limbBaseCtrl = module.fkSystem.controllers[0]

            aimLoc = cmds.spaceLocator(n='{}_aim_loc'.format(limbBaseCtrl))
            staticLoc = cmds.spaceLocator(n='{}_static_loc'.format(limbBaseCtrl))
            for loc in [staticLoc, aimLoc]:
                cmds.matchTransform(loc, limbBaseCtrl.zeroGrp)
            cmds.parent([staticLoc, aimLoc], module.fkSystem.blackboxGrp)
            cnst = cmds.orientConstraint([aimLoc, staticLoc], limbBaseCtrl.zeroGrp, mo=True)
            cnst.interpType.set(2)

            cmds.addAttr(limbBaseCtrl, ln='aim', at='float', min=0.0, max=1.0, dv=0.5, keyable=True)
            revNode = cmds.createNode('reverse', n='{}_aim_rev'.format(limbBaseCtrl))
            limbBaseCtrl.aim >> cnst.target[0].targetWeight
            limbBaseCtrl.aim >> revNode.inputX
            revNode.outputX >> cnst.target[1].targetWeight

            tempPoleVectorLoc = cmds.spaceLocator(n='tempPoleVector_loc')
            tempPoleVectorLocPos = utils.getWorldPoint(limbBaseCtrl.zeroGrp) + (utils.getWorldPoint(self.__ikSystem.poleVectorController) - utils.getWorldPoint(self.__ikSystem.joints[1]))
            cmds.xform(tempPoleVectorLoc, t=tempPoleVectorLocPos, ws=True)
            upAxisInfo = utils.getAimAxisInfo(limbBaseCtrl.zeroGrp, tempPoleVectorLoc)
            cmds.delete(tempPoleVectorLoc)
            cmds.aimConstraint(
                self.__ikSystem.ikHandleController, aimLoc,
                aimVector=self._aimSign*utils.axisStrToVector(self._aimAxis),
                upVector=upAxisInfo[0]*utils.axisStrToVector(upAxisInfo[1]),
                worldUpType='object',
                worldUpObject=self.__ikSystem.poleVectorController,
                mo=True
            )

            self.addMembers(revNode)

            if self.__ikStartController:
                ikStartObject = self.__ikSystem.controllers[-1].zeroGrp
            else:
                ikStartObject = self.__ikSystem.joints[0].getParent()
            cmds.parentConstraint(module.outJoints[-1], ikStartObject, mo=True)

            cmds.parentConstraint(module.outJoints[-1], self.__fkSystem.controllers[0].zeroGrp, mo=True)
        else:
            super(ThreeBoneLimb, self).attachTo(module)
