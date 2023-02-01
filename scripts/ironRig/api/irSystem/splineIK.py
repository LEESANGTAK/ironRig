import pymel.core as pm
from maya import cmds
from ... import utils
from ..irGlobal import Controller
from .system import System


class CurveDegree:
    LINEAR = 1
    CUBIC = 3


class SplineIK(System):
    CURVE_DEGREE = CurveDegree

    def __init__(self, prefix='', joints=[], numControllers=2):
        super(SplineIK, self).__init__(prefix, joints)
        self.__numControllers = numControllers
        self.__curve = None
        self.__curveDegree = SplineIK.CURVE_DEGREE.CUBIC
        self.__curveSpans = None
        self.__curveJoints = None
        self.__ikHandle = None

    @property
    def curveDegree(self):
        return self.__curveDegree

    @curveDegree.setter
    def curveDegree(self, degree):
        self.__curveDegree = degree

    @property
    def curveSpans(self):
        return self.__curveSpans

    @curveSpans.setter
    def curveSpans(self, spans):
        self.__curveSpans = spans

    def ikHandle(self):
        return self.__ikHandle

    def _buildSystems(self):
        super(SplineIK, self)._buildSystems()
        self.__createCurveWithJoints()
        self.__ikHandle = pm.ikHandle(name='{}ikh'.format(self._prefix), solver='ikSplineSolver', sj=self._joints[0], ee=self._joints[-1], curve=self.__curve, createCurve=False, parentCurve=False)[0]
        pm.parent(self.__ikHandle, self._blbxGrp)
        self.__buildCurveBindJoints()

    def __createCurveWithJoints(self):
        editPoints = [pm.xform(jnt, q=True, rp=True, ws=True) for jnt in self._joints]
        crv = pm.curve(d=self.__curveDegree, editPoint=editPoints, n='{}crv'.format(self._prefix))
        spans = self.__numControllers-1
        if self.__curveSpans:
            spans = self.__curveSpans
        self.__curve = pm.rebuildCurve(crv, d=self.__curveDegree, spans=spans, keepRange=0, ch=False, replaceOriginal=True)[0]
        pm.parent(self.__curve, self._noTrsfGrp)

    def __buildCurveBindJoints(self):
        self.__curveJoints = utils.createJointsOnCurve(self.__curve, self.__numControllers, self._prefix)
        self.__orientCurveJoints()
        skinClst = pm.skinCluster(self.__curveJoints, self.__curve, mi=1, dr=4.0, tsb=True, omi=False, nw=True)
        crvJntsGrp = pm.group(self.__curveJoints, n='{}crvJnt_grp'.format(self._prefix))

        self.addMembers(skinClst)
        pm.parent(crvJntsGrp, self._blbxGrp)

    def __orientCurveJoints(self):
        for crvJnt in self.__curveJoints:
            crvJntPos = pm.xform(crvJnt, q=True, rp=True, ws=True)
            closestJnt = utils.findClosestObject(pm.dt.Point(crvJntPos), self._joints)
            pm.matchTransform(crvJnt, closestJnt, rot=True)

    def _buildControls(self):
        ctrls = []
        for crvJnt in self.__curveJoints:
            ctrl = Controller(name=crvJnt.replace('crvJnt', 'ctrl'), shape=Controller.SHAPE.CUBE, color=self.controllerColor)
            ctrl.lockHideChannels(['scale', 'visibility'])
            pm.matchTransform(ctrl.zeroGrp(), crvJnt, position=True, rotation=True)
            if self._negateScaleX:
                ctrl.zeroGrp().sx.set(-1)
            pm.parentConstraint(ctrl, crvJnt, mo=True)
            ctrls.append(ctrl)
            self.addMembers(ctrl.controllerNode())
        pm.parent([ctrl.zeroGrp() for ctrl in ctrls], self._controllerGrp)
        pm.orientConstraint(ctrls[-1], self._joints[-1], mo=True)
        self._controllers = ctrls

    def setupStretch(self):
        scaleCrv = pm.duplicate(self.__curve, n='{}_scale'.format(self.__curve))[0]
        crvInfo = pm.createNode('curveInfo', n='{}_curveInfo'.format(self.__curve))
        scaleCrvInfo = pm.createNode('curveInfo', n='{}_curveInfo'.format(scaleCrv))
        stretchRatioDiv = pm.createNode('multiplyDivide', n='{}stretchRatio_div'.format(self._prefix))
        stretchRatioDiv.operation.set(2)
        stertchOnOffBlend = pm.createNode('blendColors', n='{}stertchOnOff_blend'.format(self._prefix))
        stertchOnOffBlend.color2R.set(1)

        maxShrinkVal = 10.0
        shrinkValNormalize = pm.createNode('multDoubleLinear', n='{}shrinkValNormalize'.format(self._prefix))
        shrinkValNormalize.input2.set(1.0/maxShrinkVal)
        shrinkReverse = pm.createNode('reverse', n='{}shrinkRev'.format(self._prefix))
        shrinkValMult = pm.createNode('multDoubleLinear', n='{}shrinkValMult'.format(self._prefix))
        zeroScalePreventCond = pm.createNode('condition', n='{}zeroScalePrevent_cond'.format(self._prefix))
        zeroScalePreventCond.colorIfTrueR.set(0.001)

        pm.addAttr(self._controllers[-1], longName='stretchOnOff', attributeType='double', min=0.0, max=1.0, dv=1.0, keyable=True)
        pm.addAttr(self._controllers[-1], longName='shrink', attributeType='double', min=0.0, max=maxShrinkVal, dv=0.0, keyable=True)

        self.__curve.worldSpace >> crvInfo.inputCurve
        scaleCrv.worldSpace >> scaleCrvInfo.inputCurve

        crvInfo.arcLength >> stretchRatioDiv.input1X
        scaleCrvInfo.arcLength >> stretchRatioDiv.input2X

        self._controllers[-1].stretchOnOff >> stertchOnOffBlend.blender
        self._controllers[-1].shrink >> shrinkValNormalize.input1
        shrinkValNormalize.output >> shrinkReverse.inputX

        stretchRatioDiv.outputX >> stertchOnOffBlend.color1R
        stertchOnOffBlend.outputR >> shrinkValMult.input1

        shrinkReverse.outputX >> zeroScalePreventCond.firstTerm
        shrinkReverse.outputX >> zeroScalePreventCond.colorIfFalseR
        zeroScalePreventCond.outColorR >> shrinkValMult.input2

        for jnt in self._joints[:-1]:
            shrinkValMult.output >> jnt.attr('scale{}'.format(self._aimAxis))

        self.addMembers(crvInfo,
                        scaleCrvInfo,
                        stretchRatioDiv,
                        stertchOnOffBlend,
                        shrinkValNormalize,
                        shrinkReverse,
                        shrinkValMult,
                        zeroScalePreventCond)
        pm.parent(scaleCrv, self._blbxGrp)

    def setupTwist(self):
        pm.addAttr(self._controllers[-1], at='double', ln='twist', dv=0.0, keyable=True)
        self._controllers[-1].twist >> self.__ikHandle.twist

    def setupAdvancedTwist(self):
        aimAxisInfo = {'1X': 0,
                       '-1X': 1,
                       '1Y': 2,
                       '-1Y': 3,
                       '1Z': 4,
                       '-1Z': 5}
        self.__ikHandle.dTwistControlEnable.set(True)
        self.__ikHandle.dWorldUpType.set(4)
        self.__ikHandle.dForwardAxis.set(aimAxisInfo['{}{}'.format(self._aimSign, self._aimAxis)])
        self.__ikHandle.dWorldUpAxis.set(4)
        self.__ikHandle.dWorldUpVectorY.set(0)
        self.__ikHandle.dWorldUpVectorZ.set(-1)
        self.__ikHandle.dWorldUpVectorEndY.set(0)
        self.__ikHandle.dWorldUpVectorEndZ.set(-1)
        self._controllers[0].worldMatrix >> self.__ikHandle.dWorldUpMatrix
        self._controllers[-1].worldMatrix >> self.__ikHandle.dWorldUpMatrixEnd

    def setupHybridIK(self):
        for i in range(1, self.__numControllers):
            curCtrl = self._controllers[i]
            parentCtrl = self._controllers[i-1]
            pm.parent(curCtrl.zeroGrp(), parentCtrl.zeroGrp())
            pm.matchTransform(curCtrl.zeroGrp(), parentCtrl, pivots=True)
            pm.orientConstraint(parentCtrl, curCtrl.zeroGrp(), mo=True)

    def setupWave(self):
        crv = pm.duplicate(self.__curve, n='{0}wave_crv'.format(self._prefix))[0]

        blendshape = pm.blendShape(crv, self.__curve, n='{}_bs'.format(self.__curve), origin='local', frontOfChain=True)[0]
        blendshape.attr(crv.name()).set(1)

        sine, sineHandle = cmds.nonLinear(crv.name(), type='sine')  # If instanciate non-linear deformer as "PyNode", "Could not create desired MFn" warning is caused
        sineHandle = pm.PyNode(sineHandle)
        sineHandle.rename('{0}sineHandle'.format(self._prefix))
        sineHandle.dropoff.set(-1)
        sineHandle.highBound.set(0)

        numCVs = crv.numCVs()
        startPosition = pm.xform(crv.cv[0], q=True, t=True, ws=True)
        endPosition = pm.xform(crv.cv[numCVs-1], q=True, t=True, ws=True)

        aimVector = pm.dt.Point(endPosition) - pm.dt.Point(startPosition)
        scale = aimVector.length()

        aimVector.normalize()
        sceneUpVector = pm.dt.Vector(0.0, 1.0, 0.0)
        rightVector = aimVector ^ sceneUpVector
        otherVector = aimVector ^ rightVector

        matrixList = [
            otherVector.x, otherVector.y, otherVector.z, 0.0,
            -aimVector.x, -aimVector.y, -aimVector.z, 0.0,
            rightVector.x, rightVector.y, rightVector.z, 0.0,
            startPosition[0], startPosition[1], startPosition[2], 1.0
        ]
        sineHandleMatrix = pm.dt.Matrix(matrixList)

        pm.xform(sineHandle, matrix=sineHandleMatrix, ws=True)

        sineHandle.scale.set(scale, scale, scale)
        sineHandle.shear.set(0, 0, 0)

        self.__addWaveAttrs()

        sineHandleSpace = pm.createNode('transform', n='{}_zero'.format(sineHandle))
        pm.matchTransform(sineHandleSpace, sineHandle, pos=True, rot=True, scale=True)
        pm.parent(sineHandle, sineHandleSpace)

        cmds.connectAttr('{}.waveOnOff'.format(self._controllers[-1]), '{}.envelope'.format(sine))
        self._controllers[-1].waveOnOff >> blendshape.attr(crv.name())
        self._controllers[-1].waveAmplitude >> sineHandle.amplitude
        self._controllers[-1].waveLength >> sineHandle.wavelength
        self._controllers[-1].waveOffset >> sineHandle.offset
        self._controllers[-1].waveOrient >> sineHandle.rotateY

        self.addMembers(blendshape)
        pm.parent(crv, sineHandleSpace, self._blbxGrp)

    def __addWaveAttrs(self):
        ATTRIBUTES_INFO=[
            {'waveOnOff': {'type': 'double', 'defaultValue': 0.0, 'keyable': True}},
            {'waveAmplitude': {'type': 'double', 'defaultValue': 0.1, 'keyable': True}},
            {'waveLength': {'type': 'double', 'defaultValue': 1.0, 'keyable': True}},
            {'waveOffset': {'type': 'double', 'defaultValue': 0.0, 'keyable': True}},
            {'waveOrient': {'type': 'double', 'defaultValue': 0.0, 'keyable': True}},
        ]
        # Add dvider
        pm.addAttr(self._controllers[-1], ln='wave', at='enum', en='---------------:')
        pm.setAttr('{}.{}'.format(self._controllers[-1], 'wave'), channelBox=True)

        # Add attributes
        for attrInfo in ATTRIBUTES_INFO:
            for attrName, attrProperties in attrInfo.items():
                pm.addAttr(self._controllers[-1], ln=attrName, at=attrProperties['type'], dv=attrProperties['defaultValue'], keyable=attrProperties['keyable'])

        # Set default value
        self._controllers[-1].waveOnOff.setRange(0, 1)

    def setupDynamic(self):
        # Nodes setup
        timeNode = pm.PyNode('time1')

        rebuildCrv = pm.createNode('rebuildCurve', n='{0}_rebuildCrv'.format(self.__curve))
        rebuildCrv.degree.set(1)
        rebuildCrv.smooth.set(-3)
        rebuildCrv.endKnots.set(1)
        rebuildCrv.keepRange.set(0)
        rebuildCrv.keepControlPoints.set(True)
        rebuildCrv.keepEndPoints.set(True)
        rebuildCrv.keepTangents.set(False)
        rebuildCrvShape = pm.createNode('nurbsCurve', n='{0}_rebuildCrvShape'.format(self.__curve))

        hairSystem = pm.createNode('hairSystem')
        hairSystem.getTransform().rename('{0}hairSystem'.format(self._prefix))
        hairSystem.active.set(1)
        hairSystem.hairsPerClump.set(1)
        hairSystem.clumpWidth.set(0)
        hairSystem.stretchResistance.set(200)
        hairSystem.compressionResistance.set(200)
        hairSystem.stiffnessScale[1].stiffnessScale_FloatValue.set(1)

        follicle = pm.createNode('follicle', n='{0}follicle'.format(self._prefix))
        follicle.restPose.set(1)
        follicle.startDirection.set(1)
        follicle.degree.set(3)

        dynCrv =  pm.duplicate(self.__curve, n='{0}dyn_crv'.format(self._prefix))[0]

        enableCond = pm.createNode('condition', n='{0}_dynEnable_cond'.format(self._prefix))
        enableCond.secondTerm.set(1)
        enableCond.colorIfTrueR.set(3)

        nucleus = self.__getNucleus()
        nucleus.spaceScale.set(0.05)

        # DG
        self.__addDynAttrs()
        timeNode.outTime >> nucleus.currentTime
        timeNode.outTime >> hairSystem.currentTime

        nucleus.startFrame >> hairSystem.startFrame

        outputObjectsId = SplineIK.findMultiAttributeEmptyIndex(nucleus, 'outputObjects')
        nucleus.outputObjects[outputObjectsId] >> hairSystem.nextState

        inputActiveId = SplineIK.findMultiAttributeEmptyIndex(nucleus, 'inputActive')
        hairSystem.currentState >> nucleus.inputActive[inputActiveId]

        inputActiveStartId = SplineIK.findMultiAttributeEmptyIndex(nucleus, 'inputActiveStart')
        hairSystem.startState >> nucleus.inputActiveStart[inputActiveStartId]

        hairSystem.outputHair[0] >> follicle.currentPosition
        follicle.outHair >> hairSystem.inputHair[0]

        self.__curve.worldSpace >> rebuildCrv.inputCurve
        pm.connectAttr('{}.outputCurve'.format(rebuildCrv), '{}.create'.format(rebuildCrvShape))  # If use ">>" operator, "Could not create desired MFn" warning is caused
        rebuildCrvShape.local >> follicle.startPosition
        self.__curve.getTransform().worldMatrix >> follicle.startPositionMatrix

        follicle.outCurve >> dynCrv.create

        dynCrv.worldSpace >> self.__ikHandle.inCurve

        self._controllers[-1].enable >> nucleus.enable
        self._controllers[-1].enable >> hairSystem.active
        self._controllers[-1].enable >> enableCond.firstTerm
        enableCond.outColorR >> hairSystem.simulationMethod

        self._controllers[-1].startFrame >> nucleus.startFrame
        self._controllers[-1].subSteps >> nucleus.subSteps
        self._controllers[-1].bendResistance >> hairSystem.bendResistance
        self._controllers[-1].stiffness >> hairSystem.stiffness
        self._controllers[-1].damp >> hairSystem.damp
        self._controllers[-1].drag >> hairSystem.drag
        self._controllers[-1].startCurveAttract >> hairSystem.startCurveAttract
        self._controllers[-1].attractionDamp >> hairSystem.attractionDamp

        self.__setupBakeLocators(dynCrv)

        # Cleanup
        self.addMembers(rebuildCrv, enableCond)
        pm.parent(follicle.getTransform(), self._blbxGrp)
        pm.parent(rebuildCrvShape.getTransform(), nucleus, hairSystem.getTransform(), self._noTrsfGrp)

    def __getNucleus(self):
        nucleusNode = None

        nucleusNodes = pm.ls(type='nucleus')
        for node in nucleusNodes:
            if node.name() == self._prefix:
                nucleusNode = node
                break

        if not nucleusNode:
            nucleusNode = pm.createNode('nucleus', n='{}nucleus'.format(self._prefix))

        return nucleusNode

    def __addDynAttrs(self):
        ATTRIBUTES_INFO=[
            {'enable': {'type': 'bool', 'defaultValue': False, 'keyable': True}},
            {'startFrame': {'type': 'long', 'defaultValue': 100000, 'keyable': True}},
            {'subSteps': {'type': 'long', 'defaultValue': 3, 'keyable': True}},
            {'bendResistance': {'type': 'double', 'range':[0, 1000], 'defaultValue': 0.1, 'keyable': True}},
            {'stiffness': {'type': 'double', 'range':[0, 1000], 'defaultValue': 0.1, 'keyable': True}},
            {'damp': {'type': 'double', 'range':[0, 1000], 'defaultValue': 0.1, 'keyable': True}},
            {'drag': {'type': 'double', 'range':[0, 1000], 'defaultValue': 0.05, 'keyable': True}},
            {'startCurveAttract': {'type': 'double', 'range':[0, 1000], 'defaultValue': 1.0, 'keyable': True}},
            {'attractionDamp': {'type': 'double', 'range':[0, 1], 'defaultValue': 0.0, 'keyable': True}},
        ]

        # Add dvider
        pm.addAttr(self._controllers[-1], ln='dynamic', at='enum', en='---------------:')
        pm.setAttr('{}.{}'.format(self._controllers[-1], 'dynamic'), channelBox=True)

        # Add attributes
        for attrInfo in ATTRIBUTES_INFO:
            for attrName, attrProperties in attrInfo.items():
                if attrProperties.has_key('range'):
                    pm.addAttr(self._controllers[-1], ln=attrName, at=attrProperties['type'], min=attrProperties['range'][0], max=attrProperties['range'][1], dv=attrProperties['defaultValue'], keyable=attrProperties['keyable'])
                else:
                    pm.addAttr(self._controllers[-1], ln=attrName, at=attrProperties['type'], dv=attrProperties['defaultValue'], keyable=attrProperties['keyable'])

    @staticmethod
    def findMultiAttributeEmptyIndex(node, attribute):
        node = pm.PyNode(node)
        id = 0
        while node.attr(attribute)[id].isConnected():
            id += 1
        return id

    def __setupBakeLocators(self, dynCrv):
        crvMaxRange = dynCrv.maxValue.get()
        for ctrl in self._controllers:
            ctrlPnt = pm.xform(ctrl, q=True, rp=True, ws=True)
            closestPnt = self.__curve.closestPoint(ctrlPnt, space='world')
            param = self.__curve.getParamAtPoint(closestPnt, space='world')
            pointOnCrvInfo = pm.createNode('pointOnCurveInfo', n='{}_pntOnCrvInfo'.format(ctrl))
            dynCrv.worldSpace >> pointOnCrvInfo.inputCurve
            pointOnCrvInfo.parameter.set(param * crvMaxRange)
            bakeLoc = pm.spaceLocator(n='{}_bake_loc'.format(ctrl))
            bakeLocAnchor = pm.group(bakeLoc, n='{}_anchor'.format(bakeLoc))
            pointOnCrvInfo.result.position >> bakeLocAnchor.translate

            closestJnt = utils.findClosestObject(pm.xform(bakeLocAnchor, q=True, rp=True, ws=True), self._joints)
            if closestJnt == self._joints[-1]:
                closestJnt = self._joints[-1].getParent()
            pm.orientConstraint(closestJnt, bakeLocAnchor, mo=False)

            self.addMembers(pointOnCrvInfo)
            pm.parent(bakeLocAnchor, self._noTrsfGrp)

    def setCurveWeightsArc(self):
        skinClst = utils.getSkinCluster(self.__curve)
        pm.skinPercent(skinClst, self.__curve.cv[1], transformValue=[(self.__curveJoints[1], 0.3)], prw=0)
        pm.skinPercent(skinClst, self.__curve.cv[-2], transformValue=[(self.__curveJoints[-2], 0.3)], prw=0)
