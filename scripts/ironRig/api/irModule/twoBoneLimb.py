from maya.api import OpenMaya as om
from maya import cmds
from ... import utils
from ..irGlobal import Controller
from ..irSystem import TwoBoneIK
from ..irSystem import FK
from ..irSystem import SplineIK
from .module import Module


class TwoBoneLimb(Module):
    def __init__(self, prefix='', joints=[]):
        super(TwoBoneLimb, self).__init__(prefix, joints)

        self.__upperLimbInbJoints = None
        self.__lowerLimbInbJoints = None

        self.__limbJnt0Index = None
        self.__limbJnt1Index = None
        self.__limbJnt2Index = None

        self.__initLimbJoints = None
        self.__initUpperLimbInbJoints = None
        self.__initLowerLimbInbJoints = None

        self.__ikSystem = None
        self.__fkSystem = None
        self.__upperTwistSystem = None
        self.__lowerTwistSystem = None
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
        self.__upperLimbInbJoints = utils.getInbetweenJoints(self._skelJoints[0], self._skelJoints[1])
        self.__lowerLimbInbJoints = utils.getInbetweenJoints(self._skelJoints[1], self._skelJoints[2])
        super(TwoBoneLimb, self).preBuild()

    def _buildInitSkelLocators(self):
        initSkelLocs = []

        skelJoints = [self._skelJoints[0]] + self.__upperLimbInbJoints + [self._skelJoints[1]] + self.__lowerLimbInbJoints + [self.skelJoints[2]]

        self.__limbJnt0Index = skelJoints.index(self._skelJoints[0])
        self.__limbJnt1Index = skelJoints.index(self._skelJoints[1])
        self.__limbJnt2Index = skelJoints.index(self._skelJoints[2])

        for skelJnt in skelJoints:
            initSkelLoc = cmds.spaceLocator(n='{}init_{}_loc'.format(self._name, skelJnt))
            cmds.matchTransform(initSkelLoc, skelJnt, position=True)
            initSkelLoc.hide()
            initSkelLocs.append(initSkelLoc)
        self._initSkelLocators = initSkelLocs
        cmds.parent(self._initSkelLocators, self._initGrp)

    def _buildInitJoints(self):
        super(TwoBoneLimb, self)._buildInitJoints()
        self.__initLimbJoints = [self._initJoints[self.__limbJnt0Index], self._initJoints[self.__limbJnt1Index], self._initJoints[self.__limbJnt2Index]]
        self.__initUpperLimbInbJoints = utils.getInbetweenJoints(self.__initLimbJoints[0], self.__initLimbJoints[1])
        self.__initLowerLimbInbJoints = utils.getInbetweenJoints(self.__initLimbJoints[1], self.__initLimbJoints[2])

    def build(self):
        super(TwoBoneLimb, self).build()
        self.__buildControls()

    def _buildInitJointsWithSkelJoints(self):
        # Get skeleton joints including inbetween joints
        self.__upperLimbInbJoints = utils.getInbetweenJoints(self._skelJoints[0], self._skelJoints[1])
        self.__lowerLimbInbJoints = utils.getInbetweenJoints(self._skelJoints[1], self._skelJoints[2])
        skelJoints = [self._skelJoints[0]] + self.__upperLimbInbJoints + [self._skelJoints[1]] + self.__lowerLimbInbJoints + [self.skelJoints[2]]

        # Create init joints with skeleton joints
        initJoints = []
        for skelJnt in skelJoints:
            initJnt = cmds.createNode('joint', n='{}init_{}'.format(self._name, skelJnt))
            cmds.matchTransform(initJnt, skelJnt, position=True, rotation=True)
            initJoints.append(initJnt)

        utils.makeHierarchy(initJoints)

        cmds.parent(initJoints[0], self._initGrp)
        cmds.makeIdentity(initJoints[0], apply=True)

        self._initJoints = initJoints

        # Get init joints information
        self.__limbJnt0Index = skelJoints.index(self._skelJoints[0])
        self.__limbJnt1Index = skelJoints.index(self._skelJoints[1])
        self.__limbJnt2Index = skelJoints.index(self._skelJoints[2])

        self.__initLimbJoints = [self._initJoints[self.__limbJnt0Index], self._initJoints[self.__limbJnt1Index], self._initJoints[self.__limbJnt2Index]]
        self.__initUpperLimbInbJoints = utils.getInbetweenJoints(self.__initLimbJoints[0], self.__initLimbJoints[1])
        self.__initLowerLimbInbJoints = utils.getInbetweenJoints(self.__initLimbJoints[1], self.__initLimbJoints[2])

    def _buildGroups(self):
        super(TwoBoneLimb, self)._buildGroups()
        self.__controllerGrp = cmds.group(n='{}ctrl_grp'.format(self._name), empty=True)
        cmds.parent(self.__controllerGrp, self._topGrp)

    def _buildSystems(self):
        ikJoints = utils.buildNewJointChain(self.__initLimbJoints, searchStr='init', replaceStr='ik')

        # Find pole vector controller position
        if self._oriPlaneLocators:
            poleVecCtrlPos = cmds.xform(self._oriPlaneLocators[1], q=True, rp=True, ws=True)
        else:
            poleVector = TwoBoneIK.getPoleVector(self.__initLimbJoints[0], self.__initLimbJoints[1], self.__initLimbJoints[2])
            poleVecCtrlPos = utils.getWorldPoint(self.__initLimbJoints[1]) + (poleVector * utils.getDistance(self.__initLimbJoints[0], self.__initLimbJoints[2]))
        self.__ikSystem = TwoBoneIK(self._name+'ik_', ikJoints, poleVecCtrlPos)

        if self._negateScaleX:
            self.__ikSystem.negateSclaeX = True
        self.__ikSystem.build()
        self.__ikSystem.setupStretch()
        if self.__ikStartController:
            self.__ikSystem.buildStartController()
        self.__ikSystem.controllerSize = 5
        self.addSystems(self.__ikSystem)

        fkJoints = utils.buildNewJointChain(self.__initLimbJoints, searchStr='init', replaceStr='fk')
        self.__fkSystem = FK(self._name+'fk_', fkJoints)
        self.__fkSystem.endController = True
        if self._negateScaleX:
            self.__fkSystem.negateSclaeX = True
        self.__fkSystem.build()
        self.__fkSystem.controllerSize = 5
        self.addSystems(self.__fkSystem)

        if self.__upperLimbInbJoints:
            upperTwistJoints = utils.buildNewJointChain([self.__initLimbJoints[0]]+self.__initUpperLimbInbJoints+[self.__initLimbJoints[1]], searchStr='init', replaceStr='upTwist')
            self.__upperTwistSystem = SplineIK(self._name+'upTwist_', upperTwistJoints, 3)
            self.__upperTwistSystem.curveSpans = 1
            self.__upperTwistSystem.build()
            self.__upperTwistSystem.setupTwist()
            self.__upperTwistSystem.setupStretch()
            self.__upperTwistSystem.controllerShape = Controller.SHAPE.CIRCLE
            self.__upperTwistSystem.controllerSize = 5
            self.addSystems(self.__upperTwistSystem)

        if self.__lowerLimbInbJoints:
            lowerTwistJoints = utils.buildNewJointChain([self.__initLimbJoints[1]]+self.__initLowerLimbInbJoints+[self.__initLimbJoints[2]], searchStr='init', replaceStr='lowTwist')
            self.__lowerTwistSystem = SplineIK(self._name+'lowTwist_', lowerTwistJoints, 3)
            self.__lowerTwistSystem.curveSpans = 1
            self.__lowerTwistSystem.build()
            self.__lowerTwistSystem.setupTwist()
            self.__lowerTwistSystem.setupStretch()
            self.__lowerTwistSystem.controllerShape = Controller.SHAPE.CIRCLE
            self.__lowerTwistSystem.controllerSize = 5
            self.addSystems(self.__lowerTwistSystem)

    def _connectSystems(self):
        self.__blendJoints = utils.buildNewJointChain(self.__initLimbJoints, searchStr='init', replaceStr='blend')
        utils.parentKeepHierarchy(self.__blendJoints, self._systemGrp)
        self.__blendJoints[0].hide()
        for ikJnt, fkJnt, blendJnt in zip(self.__ikSystem.joints, self.__fkSystem.joints, self.__blendJoints):
            blendCnst = cmds.parentConstraint(ikJnt, fkJnt, blendJnt, mo=True)
            blendCnst.interpType.set(2)
            self.__blendConstraints.append(blendCnst)

        self.__setupNonroll(self.__blendJoints[0])

        if self.__upperTwistSystem:
            self.__setupNonroll(self.__blendJoints[1])
            blendJnt1LocalMtx = cmds.createNode('multMatrix', n='{}_local_multMtx'.format(self.__blendJoints[1]))
            blendJnt1LocalDecMtx = cmds.createNode('decomposeMatrix', n='{}_local_decMtx'.format(self.__blendJoints[1]))
            blendJnt1LocalDecMtx.inputRotateOrder.set(3)  # Set rotate order to xzy since the primary axis of rotation is the Y.
            self.__blendJoints[0].worldMatrix >> blendJnt1LocalMtx.matrixIn[0]
            self.__nonrollJoints[0].worldInverseMatrix >> blendJnt1LocalMtx.matrixIn[1]
            blendJnt1LocalMtx.matrixSum >> blendJnt1LocalDecMtx.inputMatrix
            blendJnt1LocalDecMtx.outputRotateX >> self.__upperTwistSystem.controllers[-1].twist
            upTwistUnitConversion = self.__upperTwistSystem.controllers[-1].twist.inputs()[0]
            upTwistUnitConversion.conversionFactor.set(self._aimSign * upTwistUnitConversion.conversionFactor.get())
            cmds.parentConstraint(self.__nonrollJoints[0], self.__upperTwistSystem.topGrp, mo=True)
            self.addMembers(blendJnt1LocalMtx, blendJnt1LocalDecMtx)
            cmds.parentConstraint(self.__blendJoints[0], self.__upperTwistSystem.controllers[0], mo=True)
            cmds.pointConstraint(self.__upperTwistSystem.controllers[0],
                               self.__upperTwistSystem.controllers[2],
                               self.__upperTwistSystem.controllers[1].zeroGrp,
                               mo=True)
            self.__upperTwistSystem.controllers[0].hide()

        if self.__lowerTwistSystem:
            blendJnt2NonrollGrp = self.__setupNonroll(self.__blendJoints[2])
            blendJnt2LocalMtx = cmds.createNode('multMatrix', n='{}_local_multMtx'.format(self.__blendJoints[2]))
            blendJnt2LocalDecMtx = cmds.createNode('decomposeMatrix', n='{}_local_decMtx'.format(self.__blendJoints[2]))
            blendJnt2LocalDecMtx.inputRotateOrder.set(3)
            self.__blendJoints[-1].worldMatrix >> blendJnt2LocalMtx.matrixIn[0]
            self.__nonrollJoints[-1].worldInverseMatrix >> blendJnt2LocalMtx.matrixIn[1]
            blendJnt2LocalMtx.matrixSum >> blendJnt2LocalDecMtx.inputMatrix
            blendJnt2LocalDecMtx.outputRotateX >> self.__lowerTwistSystem.controllers[-1].twist
            lowTwistUnitConversion = self.__lowerTwistSystem.controllers[-1].twist.inputs()[0]
            lowTwistUnitConversion.conversionFactor.set(self._aimSign * lowTwistUnitConversion.conversionFactor.get())
            cmds.parentConstraint(self.__blendJoints[1], self.__lowerTwistSystem.topGrp, mo=True)
            cmds.parentConstraint(self.__blendJoints[1], blendJnt2NonrollGrp, mo=True)
            self.addMembers(blendJnt2LocalMtx, blendJnt2LocalDecMtx)
            cmds.parentConstraint(self.__blendJoints[-1], self.__lowerTwistSystem.controllers[-1], mo=True)
            cmds.pointConstraint(self.__lowerTwistSystem.controllers[0],
                               self.__lowerTwistSystem.controllers[2],
                               self.__lowerTwistSystem.controllers[1].zeroGrp,
                               mo=True)
            self.__lowerTwistSystem.controllers[-1].hide()

        self._sysJoints = [self.__nonrollJoints[0]] + self.__blendJoints[1:]
        if self.__upperTwistSystem:
            self._sysJoints = self.__upperTwistSystem.joints[:-1] + self.__blendJoints[1:]
        if self.__lowerTwistSystem:
            self._sysJoints = self._sysJoints[:-2] + self.__lowerTwistSystem.joints[:-1] + [self.__blendJoints[-1]]

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
        initJoints = self.__initLimbJoints
        if self.__upperTwistSystem:
            initJoints = [self.__initLimbJoints[0]] + self.__initUpperLimbInbJoints + self.__initLimbJoints[1:]
        if self.__lowerTwistSystem:
            initJoints = initJoints[:-1] + self.__initLowerLimbInbJoints + [self.__initLimbJoints[-1]]
        self._outJoints = utils.buildNewJointChain(initJoints, searchStr='init', replaceStr='out')
        utils.parentKeepHierarchy(self._outJoints, self._outGrp)

    def _connectSkeleton(self):
        for outJnt in self._outJoints:
            skelJnt = outJnt.replace(self._name+'out_', '')
            utils.removeConnections(skelJnt)
            cmds.parentConstraint(outJnt, skelJnt, mo=True)
            cmds.scaleConstraint(outJnt, skelJnt, mo=True)
            # for axis in 'XYZ':
            #     outJnt.attr('scale'+axis) >> skelJnt.attr('scale'+axis)

    def __buildControls(self):
        moduleCtrl = Controller('{}module_ctrl'.format(self._name), Controller.SHAPE.SPHERE)
        moduleCtrl.lockHideChannels(['translate', 'rotate', 'scale', 'visibility'])
        cmds.addAttr(moduleCtrl, ln='ik', at='double', min=0.0, max=1.0, dv=1.0, keyable=True)
        cmds.matchTransform(moduleCtrl.zeroGrp, self.__blendJoints[-1], position=True)
        cmds.parentConstraint(self.__blendJoints[-1], moduleCtrl.zeroGrp, mo=True)
        moduleCtrl.shapeOffset = om.MVector.kZnegAxisVector * 10

        fkIkRev = cmds.createNode('reverse', n='{}fkIk_rev'.format(self._name))
        moduleCtrl.ik >> self.__ikSystem.topGrp.visibility
        moduleCtrl.ik >> fkIkRev.inputX
        fkIkRev.outputX >> self.__fkSystem.topGrp.visibility
        for cnst in self.__blendConstraints:
            moduleCtrl.ik >> cnst.target[0].targetWeight
            fkIkRev.outputX >> cnst.target[1].targetWeight

        cmds.parent(moduleCtrl.zeroGrp, self.__controllerGrp)
        self._controllers.append(moduleCtrl)
        self.addMembers(moduleCtrl.allNodes)

        if self.__upperTwistSystem or self.__lowerTwistSystem:
            cmds.addAttr(moduleCtrl, ln='bendCtrlVis', at='bool', dv=False, keyable=True)
            moduleTwistCtrl = Controller('{}twist_ctrl'.format(self._name))
            cmds.matchTransform(moduleTwistCtrl.zeroGrp, self.__blendJoints[1], position=True)
            cmds.pointConstraint(self.__blendJoints[1], moduleTwistCtrl.zeroGrp, mo=False)
            oCnst = cmds.orientConstraint(self.__blendJoints[0], self.__blendJoints[1], moduleTwistCtrl.zeroGrp, mo=False)
            oCnst.interpType.set(2)
            pvLineDecMtx = self.__ikSystem.joints[1].worldMatrix.outputs(type='decomposeMatrix')[0]
            moduleTwistCtrl.worldMatrix >> pvLineDecMtx.inputMatrix
            cmds.parent(moduleTwistCtrl.zeroGrp, self.__controllerGrp)
            moduleTwistCtrl.lockHideChannels(['rotate', 'scale', 'visibility'])
            moduleCtrl.bendCtrlVis >> moduleTwistCtrl.zeroGrp.visibility
            self._controllers.append(moduleTwistCtrl)

            upAxis = list(set(['X', 'Y', 'Z']) - set(self._aimAxis))[0]
            if self.__upperTwistSystem:
                moduleCtrl.bendCtrlVis >> self.__upperTwistSystem.topGrp.visibility
                cmds.parentConstraint(moduleTwistCtrl, self.__upperTwistSystem.controllers[-1].zeroGrp, mo=True)
                cmds.aimConstraint(moduleTwistCtrl,
                                self.__upperTwistSystem.controllers[1].zeroGrp,
                                aimVector=self._aimSign * utils.axisStrToVector(self._aimAxis),
                                upVector=utils.axisStrToVector(upAxis),
                                worldUpType='objectrotation',
                                worldUpVector=utils.axisStrToVector(upAxis),
                                worldUpObject=moduleTwistCtrl)
                self.__upperTwistSystem.controllers[-1].hide()
            if self.__lowerTwistSystem:
                moduleCtrl.bendCtrlVis >> self.__lowerTwistSystem.topGrp.visibility
                cmds.parentConstraint(moduleTwistCtrl, self.__lowerTwistSystem.controllers[0].zeroGrp, mo=True)
                cmds.aimConstraint(moduleTwistCtrl,
                                self.__lowerTwistSystem.controllers[1].zeroGrp,
                                aimVector=-self._aimSign * utils.axisStrToVector(self._aimAxis),
                                upVector=utils.axisStrToVector(upAxis),
                                worldUpType='objectrotation',
                                worldUpVector=utils.axisStrToVector(upAxis),
                                worldUpObject=moduleTwistCtrl)
                self.__lowerTwistSystem.controllers[0].hide()

    def postBuild(self):
        super(TwoBoneLimb, self).postBuild()

        if self.__upperTwistSystem:
            self.__upperTwistSystem.controllerColor = tuple(om.MVector(self._controllerColor) + 0.5)
        if self.__lowerTwistSystem:
            self.__lowerTwistSystem.controllerColor = tuple(om.MVector(self._controllerColor) + 0.5)
        if self.__upperTwistSystem or self.__lowerTwistSystem:
            self._controllers[1].color = tuple(om.MVector(self._controllerColor) + 0.5)

        self._controllers[0].size = self._controllerSize * 0.1  # Set scale of module controller
        self.__ikSystem.controllers[1].size = self._controllerSize * 0.3  # Set scale of pole vector controller
        if self.__upperTwistSystem:
            self.__upperTwistSystem.controllerSize = self._controllerSize * 0.9
        if self.__lowerTwistSystem:
            self.__lowerTwistSystem.controllerSize = self._controllerSize * 0.9
        if self.__upperTwistSystem or self.__lowerTwistSystem:
            self._controllers[1].size = self._controllerSize * 0.9

    def attachTo(self, module):
        if module.__class__.__name__ == 'LimbBase':
            limbBaseCtrl = module.fkSystem().controllers[0]

            aimLoc = cmds.spaceLocator(n='{}_aim_loc'.format(limbBaseCtrl))
            staticLoc = cmds.spaceLocator(n='{}_static_loc'.format(limbBaseCtrl))
            for loc in [staticLoc, aimLoc]:
                cmds.matchTransform(loc, limbBaseCtrl.zeroGrp)
            cmds.parent([staticLoc, aimLoc], module.fkSystem().blackboxGrp)
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
            super(TwoBoneLimb, self).attachTo(module)
