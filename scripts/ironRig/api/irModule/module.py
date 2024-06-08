from maya.api import OpenMaya as om
from maya import cmds
from ... import utils
from ..irGlobal import Container
from ..irGlobal import Controller
from ..irSystem import TwoBoneIK
from ... import common


PLUGIN_NAME = 'orientPlane'
if not cmds.pluginInfo(PLUGIN_NAME, q=True, loaded=True):
    cmds.loadPlugin(PLUGIN_NAME)



class Module(Container):
    """
    Module contains geometry, initial joints, systems(IK|FK|Spline etc...), controllers, outputs.
    Module controller controls systems relationship.
    """
    def __init__(self, name='new', side=Container.SIDE.CENTER, skeletonJoints=[]):
        super(Module, self).__init__(name, side, Container.TYPE.MODULE)

        self._geoGrp = None
        self._outGrp = None
        self._systemGrp = None

        self._skelJoints = skeletonJoints
        self._initSkelLocators = None
        self._oriPlaneLocators = None
        self._orientPlane = None
        self._initJoints = None
        self._sysJoints = None
        self._outJoints = None

        self._aimSign = None
        self._aimAxis = None
        self._negateScaleX = False
        self._systems = []
        self._controllers = []

        self._globalController = False

        self._controllerSize = 1
        self._controllerColor = Controller.COLOR.YELLOW

        self._master = None

        self._buildGroups()
        self._addSystems()

    @property
    def skelJoints(self):
        return self._skelJoints

    @skelJoints.setter
    def skelJoints(self, skeletonJoints):
        self._skelJoints = skeletonJoints

    @property
    def negateScaleX(self):
        return self._negateScaleX

    @negateScaleX.setter
    def negateScaleX(self, val):
        self._negateScaleX = val
        for sys in self._systems:
            sys.negateScaleX = self._negateScaleX

    @property
    def globalController(self):
        return self._globalController

    @globalController.setter
    def globalController(self, val):
        self._globalController = val

    @property
    def outJoints(self):
        return self._outJoints

    @property
    def controllers(self):
        return self._controllers

    @property
    def controllerSize(self):
        return self._controllerSize

    @controllerSize.setter
    def controllerSize(self, size):
        self._controllerSize = size
        for ctrl in self._allControllers():
            ctrl.size = self._controllerSize

    @property
    def controllerColor(self):
        return self._controllerColor

    @controllerColor.setter
    def controllerColor(self, color):
        self._controllerColor = color
        for ctrl in self._allControllers():
            ctrl.color = self._controllerColor

    @property
    def master(self):
        return self._master

    @master.setter
    def master(self, master):
        self._master = master

    def _buildGroups(self):
        """Build groups that module's child groups.
        """
        self._geoGrp = cmds.group(n='{}_geo_grp'.format(self.shortName), empty=True)
        self._initGrp = cmds.group(n='{}_init_grp'.format(self.shortName), empty=True)
        self._outGrp = cmds.group(n='{}_out_grp'.format(self.shortName), empty=True)
        self._systemGrp = cmds.group(n='{}_sys_grp'.format(self.shortName), empty=True)
        cmds.parent([self._geoGrp, self._initGrp, self._outGrp, self._systemGrp], self._topGrp)

    def _addSystems(self):
        """Add systems and set properties.
        """
        common.logger.debug('{}._addSystems()'.format(self.longName))

        for system in self._systems:
            cmds.sets(system.set, forceElement=self.set)
            cmds.parent(system.topGrp, self._systemGrp)

    def preBuild(self):
        """Build initialize objects.
        """
        self._skelJoints.sort(key=lambda jnt: len(utils.getAllParents(jnt)))
        self._buildInitSkelLocators()
        self._buildOrientPlane()
        self._buildInitJoints()

        # cmds.matchTransform(self._oriPlaneLocators[1], self._initJoints[0], rotation=True)
        cmds.select(self._oriPlaneLocators[1], r=True)

    def _buildInitSkelLocators(self):
        initSkelLocs = []
        for skelJnt in self._skelJoints:
            initSkelLoc = cmds.spaceLocator(n='{}_init_{}_loc'.format(self.shortName, skelJnt))[0]
            cmds.matchTransform(initSkelLoc, skelJnt, position=True, rotation=True)
            cmds.hide(initSkelLoc)
            initSkelLocs.append(initSkelLoc)
        self._initSkelLocators = initSkelLocs
        cmds.parent(self._initSkelLocators, self._initGrp)

    def _buildOrientPlane(self):
        self._orientPlane = cmds.createNode('orientPlane', n='{}_orientPlane'.format(self.shortName))
        self.addMembers(self._orientPlane)

        startLoc = cmds.spaceLocator(n='{}_start_oriPlane_loc'.format(self.shortName))[0]
        cmds.matchTransform(startLoc, self._initSkelLocators[0], position=True)
        midLoc = self._createMidLocator()
        endLoc = cmds.spaceLocator(n='{}_end_oriPlane_loc'.format(self.shortName))[0]
        cmds.matchTransform(endLoc, self._initSkelLocators[-1], position=True)
        self._oriPlaneLocators = [startLoc, midLoc, endLoc]
        cmds.parent(self._oriPlaneLocators, self._initGrp)
        for oriPlaneLoc in self._oriPlaneLocators:
            utils.makeGroup(oriPlaneLoc, '{}_zero'.format(oriPlaneLoc))

        cmds.connectAttr('{}.worldPosition'.format(startLoc), '{}.planePoint01'.format(self._orientPlane))
        cmds.connectAttr('{}.worldPosition'.format(midLoc), '{}.planePoint02'.format(self._orientPlane))
        cmds.connectAttr('{}.worldPosition'.format(endLoc), '{}.planePoint03'.format(self._orientPlane))

        startToMidLine = Module._buildOriPlaneLine('{}_startToMid_oriPlane_line'.format(self.shortName), startLoc, midLoc)
        midToEndLine = Module._buildOriPlaneLine('{}_midToEnd_oriPlane_line'.format(self.shortName), midLoc, endLoc)
        endToStartLine = Module._buildOriPlaneLine('{}_endToStart_oriPlane_line'.format(self.shortName), endLoc, startLoc)
        cmds.parent([startToMidLine, midToEndLine, endToStartLine], self._initGrp)

        for index, initSkelLoc in enumerate(self._initSkelLocators):
            cmds.connectAttr('{}.worldPosition'.format(initSkelLoc), '{}.initPoints[{}]'.format(self._orientPlane, index))

    def _createMidLocator(self):
        midLoc = None

        aimVector = utils.getWorldPoint(self._initSkelLocators[-1]) - utils.getWorldPoint(self._initSkelLocators[0])
        if len(self._initSkelLocators) <= 2:
            midOriPlaneLocVector = om.MVector.kZnegAxisVector
            if utils.isParallel(aimVector, midOriPlaneLocVector):
                midOriPlaneLocVector = om.MVector.kYaxisVector
            midLocPos = utils.getWorldPoint(self._initSkelLocators[0]) + (midOriPlaneLocVector * utils.getDistance(self._initSkelLocators[0], self._initSkelLocators[-1]))
        else:
            midInitSkelLoc = self._initSkelLocators[int(len(self._initSkelLocators)*0.5)]
            midOriPlaneLocVector = TwoBoneIK.getPoleVector(self._initSkelLocators[0], midInitSkelLoc, self._initSkelLocators[-1])
            if utils.isParallel(aimVector, midOriPlaneLocVector) or round(midOriPlaneLocVector.length()) == 0.0:
                if utils.isSameDirection(aimVector, om.MVector.kZaxisVector):
                    midOriPlaneLocVector = om.MVector.kYaxisVector
                else:
                    midOriPlaneLocVector = om.MVector.kYnegAxisVector
            midLocPos = utils.getWorldPoint(midInitSkelLoc) + (midOriPlaneLocVector.normal() * utils.getDistance(self._initSkelLocators[0], self._initSkelLocators[-1]))

        midLoc = cmds.spaceLocator(n='{}_mid_oriPlane_loc'.format(self.shortName))[0]
        cmds.setAttr('{}.overrideEnabled'.format(midLoc), True)
        cmds.setAttr('{}.overrideColor'.format(midLoc), 14)
        cmds.xform(midLoc, t=list(midLocPos)[:3], ws=True)

        negAxisAttrNames = ['negateXAxis', 'negateZAxis', 'swapYZAxis']
        for attrName in negAxisAttrNames:
            cmds.addAttr(midLoc, ln=attrName, at='bool', dv=False, keyable=True)
            cmds.connectAttr('{}.{}'.format(midLoc, attrName), '{}.{}'.format(self._orientPlane, attrName))

        return midLoc

    @staticmethod
    def _buildOriPlaneLine(name, oriPlaneLoc1, oriPlaneLoc2):
        line = None

        line = cmds.curve(n=name, d=1, p=[(0, 0, 0), (0, 1, 0)])
        cmds.setAttr('{}.inheritsTransform'.format(line), False)
        cmds.setAttr('{}.overrideEnabled'.format(line), True)
        cmds.setAttr('{}.overrideDisplayType'.format(line), 2)

        cmds.connectAttr('{}.worldPosition'.format(oriPlaneLoc1), '{}.controlPoints[0]'.format(line))
        cmds.connectAttr('{}.worldPosition'.format(oriPlaneLoc2), '{}.controlPoints[1]'.format(line))

        return line

    def _buildInitJoints(self):
        initJoints = []
        for index, initSkelLoc in enumerate(self._initSkelLocators):
            initJnt = cmds.createNode('joint', n=initSkelLoc.replace('_loc', ''))
            cmds.setAttr('{}.segmentScaleCompensate'.format(initJnt), False)
            cmds.setAttr('{}.displayLocalAxis'.format(initJnt), True)
            cmds.parent(initJnt, self._initGrp)
            initJoints.append(initJnt)

        utils.makeHierarchy(initJoints)

        for index, initJnt in enumerate(initJoints):
            if index == 0:
                parentMatrixAttr = '{}.worldMatrix'.format(self._initGrp)
            else:
                parentMatrixAttr = '{}.outMatrices[{}]'.format(self._orientPlane, index-1)
            curOutMtxAttr = '{}.outMatrices[{}]'.format(self._orientPlane, index)
            parentInvMtx = cmds.createNode('inverseMatrix', n='{}invMtx'.format(utils.getCleanName(parentMatrixAttr)))
            multMtx = cmds.createNode('multMatrix', n='{}local_multMtx'.format(utils.getCleanName(curOutMtxAttr)))
            decMtx = cmds.createNode('decomposeMatrix', n='{}decMtx'.format(utils.getCleanName(curOutMtxAttr)))
            self.addMembers(parentInvMtx, multMtx, decMtx)

            cmds.connectAttr(parentMatrixAttr, '{}.inputMatrix'.format(parentInvMtx))
            cmds.connectAttr(curOutMtxAttr, '{}.matrixIn[0]'.format(multMtx))
            cmds.connectAttr('{}.outputMatrix'.format(parentInvMtx), '{}.matrixIn[1]'.format(multMtx))
            cmds.connectAttr('{}.matrixSum'.format(multMtx), '{}.inputMatrix'.format(decMtx))

            cmds.connectAttr('{}.outputTranslate'.format(decMtx), '{}.translate'.format(initJnt))
            cmds.connectAttr('{}.outputRotate'.format(decMtx), '{}.jointOrient'.format(initJnt))
            cmds.connectAttr('{}.outputScale'.format(decMtx), '{}.scale'.format(initJnt))

        self._initJoints = initJoints

    def symmetrizeGuide(self, jointAxis=True):
        oppSideChar = common.SYMMETRY_CHAR_TABLE.get(self._side)
        oppSideOriPlaneLocators = [loc.replace('_{}_'.format(self._side), '_{}_'.format(oppSideChar)) for loc in self._oriPlaneLocators]

        # Symmetrize plane locators
        for loc, oppSideLoc in zip(self._oriPlaneLocators, oppSideOriPlaneLocators):
            oppSideLocPos = cmds.xform(oppSideLoc, q=True, t=True, ws=True)
            cmds.xform(loc, t=(-oppSideLocPos[0], oppSideLocPos[1], oppSideLocPos[2]), ws=True)

        if jointAxis:
            # Symmetrize joint axis
            revNegXAxisVal = 1-int(cmds.getAttr('{}.negateXAxis'.format(oppSideOriPlaneLocators[1])))
            cmds.setAttr('{}.negateXAxis'.format(self._oriPlaneLocators[1]), revNegXAxisVal)
            revNegZAxisVal = 1-int(cmds.getAttr('{}.negateZAxis'.format(oppSideOriPlaneLocators[1])))
            cmds.setAttr('{}.negateZAxis'.format(self._oriPlaneLocators[1]), revNegZAxisVal)

    def symmetrizeControllerShapes(self):
        for ctrl in self._allControllers():
            ctrl.symmetrizeShapes(self._side)

    def build(self):
        """Build module with joints and objects from the initialize step.
        """
        self._cleanupSkelJoints()
        if not self._initJoints:
            self._buildInitJointsWithSkelJoints()
        self._getAimAxisInfo()
        self._buildSystems()
        self._connectSystems()
        self._buildOutputs()
        self._connectOutputs()
        self._connectSkeleton()
        cmds.matchTransform(self._topGrp, self._skelJoints[0], pivots=True)

        if self._globalController:
            self._buildGlobalController()

        cmds.hide(self._initGrp)
        cmds.hide(self._geoGrp)
        cmds.hide(self._outGrp)

    def _cleanupSkelJoints(self):
        # Disalbe transform limits
        for skelJnt in self._skelJoints:
            cmds.transformLimits(
                skelJnt,
                etx=(False, False), ety=(False, False), etz=(False, False),
                erx=(False, False), ery=(False, False), erz=(False, False),
                esx=(False, False), esy=(False, False), esz=(False, False),
            )

    def _buildInitJointsWithSkelJoints(self):
        common.logger.debug('{}._buildInitJointsWithSkelJoints()'.format(self.longName))

        initJoints = []
        for skelJnt in self._skelJoints:
            initJnt = cmds.createNode('joint', n='{}_init_{}'.format(self.shortName, skelJnt))
            cmds.matchTransform(initJnt, skelJnt, position=True, rotation=True)
            initJoints.append(initJnt)

        utils.makeHierarchy(initJoints)

        cmds.parent(initJoints[0], self._initGrp)
        cmds.makeIdentity(initJoints[0], apply=True)

        self._initJoints = initJoints

    def _getAimAxisInfo(self):
        if len(self._skelJoints) == 1:
            self._aimSign = 1
            self._aimAxis = 'Z'
        else:
            self._aimSign, self._aimAxis = utils.getAimAxisInfo(self._initJoints[0], self._initJoints[1])

    def _buildSystems(self):
        """Create systems and set systems state.
        """
        common.logger.debug('{}._buildSystems()'.format(self.longName))

        raise NotImplementedError()

    def _connectSystems(self):
        """Connects systems of a module.
        """
        common.logger.debug('{}._connectSystems()'.format(self.longName))

        raise NotImplementedError()

    def _buildOutputs(self):
        """Build output joints and attributes.
        """
        common.logger.debug('{}._buildOutputs()'.format(self.longName))

        # Output joints
        self._outJoints = utils.buildNewJointChain(self._initJoints, searchStr='init', replaceStr='out')
        utils.parentKeepHierarchy(self._outJoints, self._outGrp)

        # Output attributes

    def _connectOutputs(self):
        """Connects system joints and attributes to the output joints and attributes of a module.
        """
        common.logger.debug('{}._connectOutputs()'.format(self.longName))

        for sysJnt, outJnt in zip(self._sysJoints, self._outJoints):
            cmds.pointConstraint(sysJnt, outJnt, mo=True)
            cmds.orientConstraint(sysJnt, outJnt, mo=True)

            scaleMult = cmds.createNode('multiplyDivide', n='{}_scale_mult'.format(outJnt))
            cmds.connectAttr('{}.scale'.format(sysJnt), '{}.input1'.format(scaleMult))
            cmds.connectAttr('{}.scale'.format(self._topGrp), '{}.input2'.format(scaleMult))
            for axis in 'XYZ':
                cmds.connectAttr('{}.{}'.format(scaleMult, 'output'+axis), '{}.{}'.format(outJnt, 'scale'+axis))
            self.addMembers(scaleMult)

    def _connectSkeleton(self):
        """Connects to the skeleton joints and attributes.
        """
        common.logger.debug('{}._connectSkeleton()'.format(self.longName))

        for outJnt, skelJnt in zip(self._outJoints, self._skelJoints):
            utils.removeConnections(skelJnt)
            cmds.parentConstraint(outJnt, skelJnt, mo=True)
            # cmds.scaleConstraint(outJnt, skelJnt, mo=True)
            # for axis in 'XYZ':
            #     outJnt.attr('scale'+axis) >> skelJnt.attr('scale'+axis)

    def _buildGlobalController(self):
        common.logger.debug('{}._buildGlobalController()'.format(self.longName))

        modGlobalCtrl = Controller('{}_global'.format(self.shortName),
                                   Controller.SHAPE.CUBE,
                                   Controller.COLOR.LIGHTGREEN,
                                   utils.getDistance(self._initJoints[0], self._initJoints[-1]))
        cmds.matchTransform(modGlobalCtrl.zeroGrp, self._initJoints[0], position=True, rotation=True)
        modGlobalCtrl.lockHideChannels(['scale', 'visibility'], 'XYZ')
        cmds.parent(modGlobalCtrl.zeroGrp, self._topGrp)
        cmds.parent([self._geoGrp, self._initGrp, self._outGrp, self._systemGrp], modGlobalCtrl)

    def postBuild(self):
        """Run custom procedures.
        """
        common.logger.debug('{}.postBuild()'.format(self.longName))
        raise NotImplementedError()

    def attachTo(self, module, outJointIndex=-1000000):
        """Attach a module to the other module.
        """
        common.logger.debug('{}.attachTo()'.format(self.longName))

        parentSpace = None
        if outJointIndex > -1000000:
            parentSpace = module.outJoints[outJointIndex]
        else:
            parentSpace = utils.findClosestObject(utils.getWorldPoint(self._topGrp), module.outJoints)

        cmds.matchTransform(self._topGrp, parentSpace, pivots=True)
        utils.removeConnections(self._topGrp)
        cmds.parentConstraint(parentSpace, self._topGrp, mo=True)
        if module.__class__.__name__ != 'Spine':
            cmds.connectAttr('{}.scale'.format(parentSpace), '{}.scale'.format(self._topGrp))

    def delete(self):
        """Remove all nodes realted with a module.
        """
        common.logger.debug('{}.delete()'.format(self.longName))

        if self._outJoints:
            for outJnt in self._outJoints:
                for attrStr in 'trs':
                    utils.disconnectAttr('{}.{}'.format(outJnt, attrStr))

            attrs = [ch + axis for ch in 'trs' for axis in 'xyz']
            for outJnt in self._outJoints:
                for attrStr in attrs:
                    utils.disconnectAttr('{}.{}'.format(outJnt, attrStr))

            for skelJnt in self._skelJoints:
                cmds.setAttr('{}.scale'.format(skelJnt), 1.0, 1.0, 1.0)

        if self._systems:
            for system in self._systems:
                system.delete()

        self._systems = []
        self._controllers = []
        super(Module, self).delete()

        if self._master:
            self._master.removeModules(self)

    def _allControllers(self):
        allCtrls = []
        for system in self._systems:
            allCtrls.extend(system.controllers)
        for ctrl in self._controllers:
            allCtrls.append(ctrl)
        return allCtrls