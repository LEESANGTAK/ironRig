import pymel.core as pm
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
            initSkelLoc = pm.spaceLocator(n='{}init_{}_loc'.format(self._prefix, skelJnt))
            pm.matchTransform(initSkelLoc, skelJnt, position=True)
            initSkelLoc.hide()
            initSkelLocs.append(initSkelLoc)
        self._initSkelLocators = initSkelLocs
        pm.parent(self._initSkelLocators, self._initGrp)

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
            initJnt = pm.createNode('joint', n='{}init_{}'.format(self._prefix, skelJnt))
            pm.matchTransform(initJnt, skelJnt, position=True, rotation=True)
            initJoints.append(initJnt)

        utils.makeHierarchy(initJoints)

        pm.parent(initJoints[0], self._initGrp)
        pm.makeIdentity(initJoints[0], apply=True)

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
        self.__controllerGrp = pm.group(n='{}ctrl_grp'.format(self._prefix), empty=True)
        pm.parent(self.__controllerGrp, self._topGrp)

    def _buildSystems(self):
        ikJoints = utils.buildNewJointChain(self.__initLimbJoints, searchStr='init', replaceStr='ik')

        # Find pole vector controller position
        if self._oriPlaneLocators:
            poleVecCtrlPos = pm.xform(self._oriPlaneLocators[1], q=True, rp=True, ws=True)
        else:
            poleVector = TwoBoneIK.getPoleVector(self.__initLimbJoints[0], self.__initLimbJoints[1], self.__initLimbJoints[2])
            poleVecCtrlPos = utils.getWorldPoint(self.__initLimbJoints[1]) + (poleVector * utils.getDistance(self.__initLimbJoints[0], self.__initLimbJoints[2]))
        self.__ikSystem = TwoBoneIK(self._prefix+'ik_', ikJoints, poleVecCtrlPos)

        if self._negateScaleX:
            self.__ikSystem.negateSclaeX = True
        self.__ikSystem.build()
        self.__ikSystem.setupStretch()
        if self.__ikStartController:
            self.__ikSystem.buildStartController()
        self.__ikSystem.controllerScale = 5
        self.addSystems(self.__ikSystem)

        fkJoints = utils.buildNewJointChain(self.__initLimbJoints, searchStr='init', replaceStr='fk')
        self.__fkSystem = FK(self._prefix+'fk_', fkJoints)
        self.__fkSystem.endController = True
        if self._negateScaleX:
            self.__fkSystem.negateSclaeX = True
        self.__fkSystem.build()
        self.__fkSystem.controllerScale = 5
        self.addSystems(self.__fkSystem)

        if self.__upperLimbInbJoints:
            upperTwistJoints = utils.buildNewJointChain([self.__initLimbJoints[0]]+self.__initUpperLimbInbJoints+[self.__initLimbJoints[1]], searchStr='init', replaceStr='upTwist')
            self.__upperTwistSystem = SplineIK(self._prefix+'upTwist_', upperTwistJoints, 3)
            self.__upperTwistSystem.curveSpans = 1
            self.__upperTwistSystem.build()
            self.__upperTwistSystem.setupTwist()
            self.__upperTwistSystem.setupStretch()
            self.__upperTwistSystem.controllerShape = Controller.SHAPE.CIRCLE
            self.__upperTwistSystem.controllerScale = 5
            self.addSystems(self.__upperTwistSystem)

        if self.__lowerLimbInbJoints:
            lowerTwistJoints = utils.buildNewJointChain([self.__initLimbJoints[1]]+self.__initLowerLimbInbJoints+[self.__initLimbJoints[2]], searchStr='init', replaceStr='lowTwist')
            self.__lowerTwistSystem = SplineIK(self._prefix+'lowTwist_', lowerTwistJoints, 3)
            self.__lowerTwistSystem.curveSpans = 1
            self.__lowerTwistSystem.build()
            self.__lowerTwistSystem.setupTwist()
            self.__lowerTwistSystem.setupStretch()
            self.__lowerTwistSystem.controllerShape = Controller.SHAPE.CIRCLE
            self.__lowerTwistSystem.controllerScale = 5
            self.addSystems(self.__lowerTwistSystem)

    def _connectSystems(self):
        self.__blendJoints = utils.buildNewJointChain(self.__initLimbJoints, searchStr='init', replaceStr='blend')
        utils.parentKeepHierarchy(self.__blendJoints, self._systemGrp)
        self.__blendJoints[0].hide()
        for ikJnt, fkJnt, blendJnt in zip(self.__ikSystem.joints(), self.__fkSystem.joints(), self.__blendJoints):
            blendCnst = pm.parentConstraint(ikJnt, fkJnt, blendJnt, mo=True)
            blendCnst.interpType.set(2)
            self.__blendConstraints.append(blendCnst)

        self.__setupNonroll(self.__blendJoints[0])

        if self.__upperTwistSystem:
            self.__setupNonroll(self.__blendJoints[1])
            blendJnt1LocalMtx = pm.createNode('multMatrix', n='{}_local_multMtx'.format(self.__blendJoints[1]))
            blendJnt1LocalDecMtx = pm.createNode('decomposeMatrix', n='{}_local_decMtx'.format(self.__blendJoints[1]))
            self.__blendJoints[0].worldMatrix >> blendJnt1LocalMtx.matrixIn[0]
            self.__nonrollJoints[0].worldInverseMatrix >> blendJnt1LocalMtx.matrixIn[1]
            blendJnt1LocalMtx.matrixSum >> blendJnt1LocalDecMtx.inputMatrix
            blendJnt1LocalDecMtx.outputRotateX >> self.__upperTwistSystem.controllers()[-1].transform().twist
            upTwistUnitConversion = self.__upperTwistSystem.controllers()[-1].transform().twist.inputs()[0]
            upTwistUnitConversion.conversionFactor.set(self._aimSign * upTwistUnitConversion.conversionFactor.get())
            pm.parentConstraint(self.__nonrollJoints[0], self.__upperTwistSystem.topGrp(), mo=True)
            self.addMembers(blendJnt1LocalMtx, blendJnt1LocalDecMtx)
            pm.parentConstraint(self.__blendJoints[0], self.__upperTwistSystem.controllers()[0].transform(), mo=True)
            pm.pointConstraint(self.__upperTwistSystem.controllers()[0].transform(),
                               self.__upperTwistSystem.controllers()[2].transform(),
                               self.__upperTwistSystem.controllers()[1].zeroGrp(),
                               mo=True)
            self.__upperTwistSystem.controllers()[0].hide()

        if self.__lowerTwistSystem:
            blendJnt2NonrollGrp = self.__setupNonroll(self.__blendJoints[2])
            blendJnt2LocalMtx = pm.createNode('multMatrix', n='{}_local_multMtx'.format(self.__blendJoints[2]))
            blendJnt2LocalDecMtx = pm.createNode('decomposeMatrix', n='{}_local_decMtx'.format(self.__blendJoints[2]))
            self.__blendJoints[-1].worldMatrix >> blendJnt2LocalMtx.matrixIn[0]
            self.__nonrollJoints[-1].worldInverseMatrix >> blendJnt2LocalMtx.matrixIn[1]
            blendJnt2LocalMtx.matrixSum >> blendJnt2LocalDecMtx.inputMatrix
            blendJnt2LocalDecMtx.outputRotateX >> self.__lowerTwistSystem.controllers()[-1].transform().twist
            lowTwistUnitConversion = self.__lowerTwistSystem.controllers()[-1].transform().twist.inputs()[0]
            lowTwistUnitConversion.conversionFactor.set(self._aimSign * lowTwistUnitConversion.conversionFactor.get())
            pm.parentConstraint(self.__blendJoints[1], self.__lowerTwistSystem.topGrp(), mo=True)
            pm.parentConstraint(self.__blendJoints[1], blendJnt2NonrollGrp, mo=True)
            self.addMembers(blendJnt2LocalMtx, blendJnt2LocalDecMtx)
            pm.parentConstraint(self.__blendJoints[-1], self.__lowerTwistSystem.controllers()[-1].transform(), mo=True)
            pm.pointConstraint(self.__lowerTwistSystem.controllers()[0].transform(),
                               self.__lowerTwistSystem.controllers()[2].transform(),
                               self.__lowerTwistSystem.controllers()[1].zeroGrp(),
                               mo=True)
            self.__lowerTwistSystem.controllers()[-1].hide()

    def __setupNonroll(self, blendJoint):
        nonrollGrp = pm.createNode('transform', n=blendJoint.replace('_blend', '_nonroll_grp'))
        nonrollGrp.hide()
        pm.matchTransform(nonrollGrp, blendJoint, pivots=True)

        nonrollJntStart = pm.duplicate(blendJoint, n=blendJoint.replace('_blend', '_nonroll_start'), po=True)[0]
        nonrollJntEnd = pm.duplicate(blendJoint, n=blendJoint.replace('_blend', '_nonroll_end'), po=True)[0]
        nonrollJntStart | nonrollJntEnd
        childJnt = blendJoint.getChildren(type='joint')
        if childJnt:
            pm.matchTransform(nonrollJntEnd, childJnt[0], position=True)
        else:
            nonrollJntEnd.attr('translate{}'.format(self._aimAxis)).set(self._aimSign)

        nonrollIkh = pm.ikHandle(startJoint=nonrollJntStart, endEffector=nonrollJntEnd, solver='ikRPsolver', n=blendJoint.replace('_blend', '_nonroll_ikh'))[0]
        for attrStr in ['poleVector' + axis for axis in 'XYZ']:
            nonrollIkh.attr(attrStr).set(0)

        pm.pointConstraint(blendJoint, nonrollJntStart, mo=True)
        pm.parentConstraint(blendJoint, nonrollIkh, mo=True)

        pm.parent([nonrollJntStart, nonrollIkh], nonrollGrp)
        pm.parent(nonrollGrp, self._systemGrp)

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

    def _connectOutputs(self):
        systemJoints = [self.__nonrollJoints[0]] + self.__blendJoints[1:]
        if self.__upperTwistSystem:
            systemJoints = self.__upperTwistSystem.joints()[:-1] + self.__blendJoints[1:]
        if self.__lowerTwistSystem:
            systemJoints = systemJoints[:-2] + self.__lowerTwistSystem.joints()[:-1] + [self.__blendJoints[-1]]

        for sysJnt, outJnt in zip(systemJoints, self._outJoints):
            pm.pointConstraint(sysJnt, outJnt, mo=True)
            pm.orientConstraint(sysJnt, outJnt, mo=True)
            utils.connectTransform(sysJnt, outJnt, ['scale'], ['X', 'Y', 'Z'])

    def _connectSkeleton(self):
        for outJnt in self._outJoints:
            skelJnt = outJnt.replace(self._prefix+'out_', '')
            pm.parentConstraint(outJnt, skelJnt, mo=True)

    def __buildControls(self):
        moduleCtrl = Controller('{}module_ctrl'.format(self._prefix), Controller.SHAPE.SPHERE)
        moduleCtrl.lockChannels(['translate', 'rotate', 'scale', 'visibility'])
        pm.addAttr(moduleCtrl.transform(), ln='ik', at='double', min=0.0, max=1.0, dv=1.0, keyable=True)
        pm.parentConstraint(self.__blendJoints[-1], moduleCtrl.zeroGrp(), mo=False)
        moduleCtrl.shapeOffset = [0, self._aimSign*-10, 0]

        fkIkRev = pm.createNode('reverse', n='{}fkIk_rev'.format(self._prefix))
        moduleCtrl.transform().ik >> self.__ikSystem.topGrp().visibility
        moduleCtrl.transform().ik >> fkIkRev.inputX
        fkIkRev.outputX >> self.__fkSystem.topGrp().visibility
        for cnst in self.__blendConstraints:
            moduleCtrl.transform().ik >> cnst.target[0].targetWeight
            fkIkRev.outputX >> cnst.target[1].targetWeight

        pm.parent(moduleCtrl.zeroGrp(), self.__controllerGrp)
        self._controllers.append(moduleCtrl)
        self.addMembers(moduleCtrl.controllerNode())

        if self.__upperTwistSystem or self.__lowerTwistSystem:
            pm.addAttr(moduleCtrl.transform(), ln='bendCtrlVis', at='bool', dv=False, keyable=True)
            moduleTwistCtrl = Controller('{}twist_ctrl'.format(self._prefix))
            moduleTwistCtrl.matchTo(self.__blendJoints[1], position=True)
            pm.pointConstraint(self.__blendJoints[1], moduleTwistCtrl.zeroGrp(), mo=False)
            oCnst = pm.orientConstraint(self.__blendJoints[0], self.__blendJoints[1], moduleTwistCtrl.zeroGrp(), mo=False)
            oCnst.interpType.set(2)
            pvLineDecMtx = self.__ikSystem.joints()[1].worldMatrix.outputs(type='decomposeMatrix')[0]
            moduleTwistCtrl.transform().worldMatrix >> pvLineDecMtx.inputMatrix
            pm.parent(moduleTwistCtrl.zeroGrp(), self.__controllerGrp)
            self._controllers.append(moduleTwistCtrl)

            upAxis = list(set(['X', 'Y', 'Z']) - set(self._aimAxis))[0]
            if self.__upperTwistSystem:
                moduleCtrl.transform().bendCtrlVis >> self.__upperTwistSystem.topGrp().visibility
                moduleTwistCtrl.constraint(self.__upperTwistSystem.controllers()[-1].zeroGrp(), parent=True)
                pm.aimConstraint(moduleTwistCtrl.transform(),
                                self.__upperTwistSystem.controllers()[1].zeroGrp(),
                                aimVector=self._aimSign * utils.axisToVector(self._aimAxis),
                                upVector=utils.axisToVector(upAxis),
                                worldUpType='objectrotation',
                                worldUpVector=utils.axisToVector(upAxis),
                                worldUpObject=moduleTwistCtrl.transform())
                self.__upperTwistSystem.controllers()[-1].hide()
            if self.__lowerTwistSystem:
                moduleCtrl.transform().bendCtrlVis >> self.__lowerTwistSystem.topGrp().visibility
                moduleTwistCtrl.constraint(self.__lowerTwistSystem.controllers()[0].zeroGrp(), parent=True)
                pm.aimConstraint(moduleTwistCtrl.transform(),
                                self.__lowerTwistSystem.controllers()[1].zeroGrp(),
                                aimVector=-self._aimSign * utils.axisToVector(self._aimAxis),
                                upVector=utils.axisToVector(upAxis),
                                worldUpType='objectrotation',
                                worldUpVector=utils.axisToVector(upAxis),
                                worldUpObject=moduleTwistCtrl.transform())
                self.__lowerTwistSystem.controllers()[0].hide()

    def postBuild(self):
        super(TwoBoneLimb, self).postBuild()

        if self.__upperTwistSystem:
            self.__upperTwistSystem.controllerColor = tuple(pm.dt.Vector(self._controllerColor) + 0.5)
        if self.__lowerTwistSystem:
            self.__lowerTwistSystem.controllerColor = tuple(pm.dt.Vector(self._controllerColor) + 0.5)
        if self.__upperTwistSystem or self.__lowerTwistSystem:
            self._controllers[1].color = tuple(pm.dt.Vector(self._controllerColor) + 0.5)

        self._controllers[0].scale = self._controllerScale * 0.1  # Set scale of module controller
        self.__ikSystem.controllers()[1].scale = self._controllerScale * 0.3  # Set scale of pole vector controller
        if self.__upperTwistSystem:
            self.__upperTwistSystem.controllerScale = self._controllerScale * 0.9
        if self.__lowerTwistSystem:
            self.__lowerTwistSystem.controllerScale = self._controllerScale * 0.9
        if self.__upperTwistSystem or self.__lowerTwistSystem:
            self._controllers[1].scale = self._controllerScale * 0.9
