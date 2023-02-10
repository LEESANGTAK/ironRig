import pymel.core as pm
from ... import utils
from ..irGlobal import Container
from ..irGlobal import Controller
from ..irSystem import TwoBoneIK


class Module(Container):
    """
    Module contains geometry, initial joints, systems(IK|FK|Spline etc...), controllers, outputs.
    Module controls modules relationship.

    :param Container: _description_
    :type Container: _type_
    """
    def __init__(self, prefix='', skeletonJoints=None):
        super(Module, self).__init__(prefix)

        self._geoGrp = None
        self._outGrp = None
        self._systemGrp = None

        self._skelJoints = [pm.PyNode(jnt) for jnt in skeletonJoints]
        self._skelJoints.sort(key=lambda jnt: len(jnt.getAllParents()))
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

        self.__globalController = False

        self._controllerSize = 1
        self._controllerColor = Controller.COLOR.YELLOW

    @property
    def skelJoints(self):
        return self._skelJoints

    @skelJoints.setter
    def skelJoints(self, skeletonJoints):
        self._skelJoints = [pm.PyNode(jnt) for jnt in skeletonJoints]

    @property
    def negateScaleX(self):
        return self._negateScaleX

    @negateScaleX.setter
    def negateScaleX(self, val):
        self._negateScaleX = val

    @property
    def globalController(self):
        return self.__globalController

    @globalController.setter
    def globalController(self, val):
        self.__globalController = val

    def outJoints(self):
        return self._outJoints

    def controllers(self):
        return self._controllers

    @property
    def controllerSize(self):
        return self._controllerSize

    @controllerSize.setter
    def controllerSize(self, size):
        self._controllerSize = size

    @property
    def controllerColor(self):
        return self._controllerColor

    @controllerColor.setter
    def controllerColor(self, color):
        self._controllerColor = color

    def preBuild(self):
        """Build initial joints and objects(locator, mesh, ...) from skeleton joints.
        """
        self._buildGroups()
        self._buildInitSkelLocators()
        self._buildOrientPlane()
        self._buildInitJoints()

        pm.matchTransform(self._oriPlaneLocators[1], self._initJoints[0], rotation=True)
        pm.select(self._oriPlaneLocators[1], r=True)

    def _buildGroups(self):
        """Build groups that module's child groups.
        """
        self._topGrp.rename('{}module'.format(self._prefix))
        self._geoGrp = pm.group(n='{}geo_grp'.format(self._prefix), empty=True)
        self._geoGrp.hide()
        self._initGrp = pm.group(n='{}init_grp'.format(self._prefix), empty=True)
        self._systemGrp = pm.group(n='{}sys_grp'.format(self._prefix), empty=True)
        self._outGrp = pm.group(n='{}out_grp'.format(self._prefix), empty=True)
        self._outGrp.hide()
        pm.parent(self._geoGrp, self._initGrp, self._systemGrp, self._outGrp, self._topGrp)

    def _buildInitSkelLocators(self):
        initSkelLocs = []
        for skelJnt in self._skelJoints:
            initSkelLoc = pm.spaceLocator(n='{}init_{}_loc'.format(self._prefix, skelJnt))
            pm.matchTransform(initSkelLoc, skelJnt, position=True, rotation=True)
            initSkelLoc.hide()
            initSkelLocs.append(initSkelLoc)
        self._initSkelLocators = initSkelLocs
        pm.parent(self._initSkelLocators, self._initGrp)

    def _buildOrientPlane(self):
        pluginName = 'orientPlane'
        if not pm.pluginInfo(pluginName, q=True, loaded=True):
            pm.loadPlugin(pluginName)

        self._orientPlane = pm.createNode(pluginName, n='{}orientPlane'.format(self._prefix))
        self.addMembers(self._orientPlane)

        startLoc = pm.spaceLocator(n='{}start_oriPlane_loc'.format(self._prefix))
        pm.matchTransform(startLoc, self._initSkelLocators[0], position=True)
        midLoc = self._createMidLocator()
        endLoc = pm.spaceLocator(n='{}end_oriPlane_loc'.format(self._prefix))
        pm.matchTransform(endLoc, self._initSkelLocators[-1], position=True)
        self._oriPlaneLocators = [startLoc, midLoc, endLoc]
        pm.parent(self._oriPlaneLocators, self._initGrp)
        for oriPlaneLoc in self._oriPlaneLocators:
            utils.makeGroup(oriPlaneLoc, '{}_zero'.format(oriPlaneLoc))

        startLoc.worldPosition >> self._orientPlane.planePoint01
        midLoc.worldPosition >> self._orientPlane.planePoint02
        endLoc.worldPosition >> self._orientPlane.planePoint03

        startToMidLine = Module.__buildOriPlaneLine('{}startToMid_oriPlane_line'.format(self._prefix), startLoc, midLoc)
        midToEndLine = Module.__buildOriPlaneLine('{}midToEnd_oriPlane_line'.format(self._prefix), midLoc, endLoc)
        endToStartLine = Module.__buildOriPlaneLine('{}endToStart_oriPlane_line'.format(self._prefix), endLoc, startLoc)
        pm.parent([startToMidLine, midToEndLine, endToStartLine], self._initGrp)

        for index, initSkelLoc in enumerate(self._initSkelLocators):
            initSkelLoc.worldPosition >> self._orientPlane.initPoints[index]

    def _createMidLocator(self):
        midLoc = None

        aimVector = utils.getWorldPoint(self._initSkelLocators[-1]) - utils.getWorldPoint(self._initSkelLocators[0])
        if len(self._initSkelLocators) <= 2:
            midOriPlaneLocVector = pm.dt.Vector.zAxis
            if utils.isParallel(aimVector, midOriPlaneLocVector):
                midOriPlaneLocVector = pm.dt.Vector.xNegAxis
            midLocPos = utils.getWorldPoint(self._initSkelLocators[0]) + (midOriPlaneLocVector * utils.getDistance(self._initSkelLocators[0], self._initSkelLocators[-1]))
        else:
            midInitSkelLoc = self._initSkelLocators[int(len(self._initSkelLocators)*0.5)]
            midOriPlaneLocVector = TwoBoneIK.getPoleVector(self._initSkelLocators[0], midInitSkelLoc, self._initSkelLocators[-1])
            if utils.isParallel(aimVector, midOriPlaneLocVector) or round(midOriPlaneLocVector.length()) == 0.0:
                midOriPlaneLocVector = pm.dt.Vector.zAxis
                if self.__class__.__name__ == 'String':
                    midOriPlaneLocVector = pm.dt.Vector.xAxis
            midLocPos = utils.getWorldPoint(midInitSkelLoc) + (midOriPlaneLocVector.normal() * utils.getDistance(self._initSkelLocators[0], self._initSkelLocators[-1]))

        midLoc = pm.spaceLocator(n='{}mid_oriPlane_loc'.format(self._prefix))
        midLoc.overrideEnabled.set(True)
        midLoc.overrideColor.set(6)
        pm.xform(midLoc, t=midLocPos, ws=True)

        negAxisAttrNames = ['negateXAxis', 'negateZAxis', 'swapYZAxis']
        for attrName in negAxisAttrNames:
            pm.addAttr(midLoc, ln=attrName, at='bool', dv=False, keyable=True)
            midLoc.attr(attrName) >> self._orientPlane.attr(attrName)

        return midLoc

    @staticmethod
    def __buildOriPlaneLine(name, oriPlaneLoc1, oriPlaneLoc2):
        line = None

        line = pm.curve(n=name, d=1, p=[(0, 0, 0), (0, 1, 0)])
        line.inheritsTransform.set(False)
        line.overrideEnabled.set(True)
        line.overrideDisplayType.set(2)

        oriPlaneLoc1.worldPosition >> line.controlPoints[0]
        oriPlaneLoc2.worldPosition >> line.controlPoints[1]

        return line

    def _buildInitJoints(self):
        initJoints = []
        for index, initSkelLoc in enumerate(self._initSkelLocators):
            initJnt = pm.createNode('joint', n=initSkelLoc.replace('_loc', ''))
            initJnt.segmentScaleCompensate.set(False)
            initJnt.displayLocalAxis.set(True)
            self._initGrp | initJnt
            initJoints.append(initJnt)

        utils.makeHierarchy(initJoints)

        for index, initJnt in enumerate(initJoints):
            if index == 0:
                parentMatrixAttr = self._initGrp.worldMatrix
            else:
                parentMatrixAttr = self._orientPlane.outMatrices[index-1]
            curOutMtxAttr = self._orientPlane.outMatrices[index]
            parentInvMtx = pm.createNode('inverseMatrix', n='{}invMtx'.format(utils.getCleanName(parentMatrixAttr.name())))
            multMtx = pm.createNode('multMatrix', n='{}local_multMtx'.format(utils.getCleanName(curOutMtxAttr.name())))
            decMtx = pm.createNode('decomposeMatrix', n='{}decMtx'.format(utils.getCleanName(curOutMtxAttr.name())))
            self.addMembers(parentInvMtx, multMtx, decMtx)

            parentMatrixAttr >> parentInvMtx.inputMatrix
            curOutMtxAttr >> multMtx.matrixIn[0]
            parentInvMtx.outputMatrix >> multMtx.matrixIn[1]
            multMtx.matrixSum >> decMtx.inputMatrix

            decMtx.outputTranslate >> initJnt.translate
            decMtx.outputRotate >> initJnt.jointOrient
            decMtx.outputScale >> initJnt.scale

        self._initJoints = initJoints

    def symmeterizeGuide(self):
        searchStr = '_R'
        replaceStr = '_L'
        if '_L' in self._prefix:
            searchStr = '_L'
            replaceStr = '_R'

        for loc in self._oriPlaneLocators:
            symLoc = pm.PyNode(loc.replace(searchStr, replaceStr))
            symLocPos = symLoc.getTranslation(space='world')
            loc.setTranslation((-symLocPos[0], symLocPos[1], symLocPos[2]), space='world')

    def build(self):
        """Build module with joints and objects from the initialize step.
        """
        self.__cleanupSkelJoints()
        if not self._initJoints:
            self._buildGroups()
            self._buildInitJointsWithSkelJoints()
        self._getAimAxisInfo()
        self._buildSystems()
        self._connectSystems()
        self._buildOutputs()
        self._connectOutputs()
        self._connectSkeleton()
        pm.matchTransform(self._topGrp, self._skelJoints[0], pivots=True)
        if self.__globalController:
            self.__buildGlobalController()
        self._initGrp.hide()

    def __cleanupSkelJoints(self):
        limitAttrs = ['scaleMinX', 'scaleMaxX', 'scaleMinY', 'scaleMaxY', 'scaleMinZ', 'scaleMaxZ',
                      'shearMinXY', 'shearMaxXY', 'shearMinXZ', 'shearMaxXZ', 'shearMinYZ', 'shearMaxYZ',
                      'rotateMinX', 'rotateMaxX', 'rotateMinY', 'rotateMaxY', 'rotateMinZ', 'rotateMaxZ',
                      'translateMinX', 'translateMaxX', 'translateMinY', 'translateMaxY', 'translateMinZ', 'translateMaxZ']
        for skelJnt in self._skelJoints:
            for attr in limitAttrs:
                skelJnt.setLimited(attr, False)

    def _buildInitJointsWithSkelJoints(self):
        initJoints = []
        for skelJnt in self._skelJoints:
            initJnt = pm.createNode('joint', n='{}init_{}'.format(self._prefix, skelJnt))
            pm.matchTransform(initJnt, skelJnt, position=True, rotation=True)
            initJoints.append(initJnt)

        utils.makeHierarchy(initJoints)

        pm.parent(initJoints[0], self._initGrp)
        pm.makeIdentity(initJoints[0], apply=True)

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
        raise NotImplementedError()

    def addSystems(self, *args):
        """Add systems to a module.
        """
        systems = sum([system if isinstance(system, list) else [system] for system in args], [])
        for system in systems:
            self.set().forceElement(system.set())
            pm.parent(system.topGrp(), self._systemGrp)
        self._systems.extend(systems)

    def _connectSystems(self):
        """Connects systems of a module.
        """
        raise NotImplementedError()

    def _buildOutputs(self):
        """Build output joints and attributes.
        """
        # Output joints
        self._outJoints = utils.buildNewJointChain(self._initJoints, searchStr='init', replaceStr='out')
        utils.parentKeepHierarchy(self._outJoints, self._outGrp)

        # Output attributes

    def _connectOutputs(self):
        """Connects system joints and attributes to the output joints and attributes of a module.
        """
        for sysJnt, outJnt in zip(self._sysJoints, self._outJoints):
            pm.pointConstraint(sysJnt, outJnt, mo=True)
            pm.orientConstraint(sysJnt, outJnt, mo=True)
            scaleMult = pm.createNode('multiplyDivide', n='{}_scale_mult'.format(outJnt))
            sysJnt.scale >> scaleMult.input1
            for axis in 'XYZ':
                scaleMult.attr('output'+axis) >> outJnt.attr('scale'+axis)
            self.addMembers(scaleMult)

    def _connectSkeleton(self):
        """Connects to the skeleton joints and attributes.
        """
        for outJnt, skelJnt in zip(self._outJoints, self._skelJoints):
            utils.removeConnections(skelJnt)
            pm.parentConstraint(outJnt, skelJnt, mo=True)

    def __buildGlobalController(self):
        modGlobalCtrl = Controller('{}global_ctrl'.format(self._prefix),
                                   Controller.SHAPE.CUBE,
                                   Controller.COLOR.LIGHTGREEN,
                                   utils.getDistance(self._initJoints[0], self._initJoints[-1]))
        pm.matchTransform(modGlobalCtrl.zeroGrp(), self._initJoints[0], position=True, rotation=True)
        modGlobalCtrl.lockHideChannels(['scale', 'visibility'], 'XYZ')
        self._topGrp | modGlobalCtrl.zeroGrp()
        pm.parent([self._geoGrp, self._initGrp, self._systemGrp, self._outGrp], modGlobalCtrl)

    def postBuild(self):
        """Edit controllers states of color and shape.
        """
        allCtrls = []
        for system in self._systems:
            allCtrls.extend(system.controllers())
        for ctrl in self._controllers:
            allCtrls.append(ctrl)

        for ctrl in allCtrls:
            ctrl.color = self._controllerColor
            ctrl.size = self._controllerSize

    def attachTo(self, module):
        """Attach a module to the other module.

        :param module: Other module.
        :type module: Module
        """
        parentSpace =  None
        if module.__class__.__name__ == 'Spine':
            allModuleCtrls = module.ikSystem().controllers() + module.controllers()
            parentSpace = utils.findClosestController(utils.getWorldPoint(self._topGrp), allModuleCtrls)
        else:
            parentSpace = utils.findClosestObject(pm.xform(self._topGrp, q=True, rp=True, ws=True), module.outJoints())
        pm.matchTransform(self._topGrp, parentSpace, pivots=True)
        utils.removeConnections(self._topGrp)
        pm.parentConstraint(parentSpace, self._topGrp, mo=True)
        parentSpace.scale >> self._topGrp.scale
        for outJnt in self._outJoints:
            scaleMult = outJnt.inputs(type='multiplyDivide')[0]
            parentSpace.scale >> scaleMult.input2

    def remove(self):
        """Remove all nodes realted with a module.
        """
        if self._outJoints:
            attrs = [ch + axis for ch in 'trs' for axis in 'xyz']
            for outJnt in self._outJoints:
                for attrStr in attrs:
                    outJnt.attr(attrStr).disconnect()
            for skelJnt in self._skelJoints:
                skelJnt.scale.set(1.0, 1.0, 1.0)

        if self._systems:
            for system in self._systems:
                system.remove()

        self._systems = []
        self._controllers = []
        super(Module, self).remove()
