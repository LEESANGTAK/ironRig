from maya.api import OpenMaya as om
from maya import cmds
from ... import utils
from ..irGlobal import Controller
from .system import System


class CurveDegree:
    LINEAR = 1
    CUBIC = 3

class DynLock:
    BASE = 1
    BOTH = 3


class SplineIK(System):
    CURVE_DEGREE = CurveDegree
    DYNAMIC_LOCK = DynLock

    def __init__(self, prefix='', joints=[], numControllers=2):
        super(SplineIK, self).__init__(prefix, joints)
        self.__numControllers = numControllers
        self.__curve = None
        self.__curveDegree = SplineIK.CURVE_DEGREE.CUBIC
        self.__curveSpans = None
        self.__curveJoints = None
        self.__ikHandle = None
        self.__follicle = None

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

    @property
    def dynLock(self):
        return self.__follicle.pointLock.get()

    @dynLock.setter
    def dynLock(self, val):
        self.__follicle.pointLock.set(val)

    def ikHandle(self):
        return self.__ikHandle

    def _buildSystems(self):
        super(SplineIK, self)._buildSystems()
        self.__createCurveWithJoints()
        # Store rotation of the end joint
        endJntRo = cmds.xform(self._joints[-1], q=True, ro=True, ws=True)

        self.__ikHandle = cmds.ikHandle(name='{}ikh'.format(self._name), solver='ikSplineSolver', sj=self._joints[0], ee=self._joints[-1], curve=self.__curve, createCurve=False, parentCurve=False)[0]

        # Restore end joint rotation after appling spline ik handle
        cmds.xform(self._joints[-1], ro=endJntRo, ws=True)
        cmds.makeIdentity(self._joints[-1], apply=True)

        cmds.parent(self.__ikHandle, self._blbxGrp)
        self.__buildCurveBindJoints()

    def __createCurveWithJoints(self):
        editPoints = [cmds.xform(jnt, q=True, rp=True, ws=True) for jnt in self._joints]
        crv = cmds.curve(d=1, editPoint=editPoints, n='{}crv'.format(self._name))
        spans = self.__numControllers-1
        if self.__curveSpans:
            spans = self.__curveSpans
        self.__curve = cmds.rebuildCurve(crv, d=self.__curveDegree, spans=spans, keepRange=0, ch=False, replaceOriginal=True)[0]
        cmds.parent(self.__curve, self._noTrsfGrp)

    def __buildCurveBindJoints(self):
        self.__curveJoints = utils.createJointsOnCurve(self.__curve, self.__numControllers, self._name)
        self.__orientCurveJoints()
        skinClst = cmds.skinCluster(self.__curveJoints, self.__curve, mi=1, dr=4.0, tsb=True, omi=False, nw=True)
        crvJntsGrp = cmds.group(self.__curveJoints, n='{}crvJnt_grp'.format(self._name))

        self.addMembers(skinClst)
        cmds.parent(crvJntsGrp, self._blbxGrp)

    def __orientCurveJoints(self):
        for crvJnt in self.__curveJoints:
            crvJntPos = cmds.xform(crvJnt, q=True, rp=True, ws=True)
            closestJnt = utils.findClosestObject(om.MPoint(crvJntPos), self._joints)
            cmds.matchTransform(crvJnt, closestJnt, rot=True)

    def _buildControls(self):
        ctrls = []
        for crvJnt in self.__curveJoints:
            ctrl = Controller(name=crvJnt.replace('crvJnt', 'ctrl'), shape=Controller.SHAPE.CUBE, color=self.controllerColor)
            ctrl.lockHideChannels(['scale', 'visibility'])
            cmds.matchTransform(ctrl.zeroGrp, crvJnt, position=True, rotation=True)
            if self._negateScaleX:
                ctrl.zeroGrp.sx.set(-1)
            cmds.parentConstraint(ctrl, crvJnt, mo=True)
            ctrls.append(ctrl)
            self.addMembers(ctrl.allNodes)
        cmds.parent([ctrl.zeroGrp for ctrl in ctrls], self._controllerGrp)
        #cmds.orientConstraint(ctrls[-1], self._joints[-1], mo=True)
        ctrls[-1].rotate >> self._joints[-1].rotate  # Joint can't rotate when dynamic applied if drive using constraint
        self._controllers = ctrls

    def setupStretch(self):
        scaleCrv = cmds.duplicate(self.__curve, n='{}_scale'.format(self.__curve))[0]
        crvInfo = cmds.createNode('curveInfo', n='{}_curveInfo'.format(self.__curve))
        scaleCrvInfo = cmds.createNode('curveInfo', n='{}_curveInfo'.format(scaleCrv))
        stretchRatioDiv = cmds.createNode('multiplyDivide', n='{}stretchRatio_div'.format(self._name))
        stretchRatioDiv.operation.set(2)
        stertchOnOffBlend = cmds.createNode('blendColors', n='{}stertchOnOff_blend'.format(self._name))
        stertchOnOffBlend.color2R.set(1)

        maxShrinkVal = 10.0
        shrinkValNormalize = cmds.createNode('multDoubleLinear', n='{}shrinkValNormalize'.format(self._name))
        shrinkValNormalize.input2.set(1.0/maxShrinkVal)
        shrinkReverse = cmds.createNode('reverse', n='{}shrinkRev'.format(self._name))
        shrinkValMult = cmds.createNode('multDoubleLinear', n='{}shrinkValMult'.format(self._name))
        zeroScalePreventCond = cmds.createNode('condition', n='{}zeroScalePrevent_cond'.format(self._name))
        zeroScalePreventCond.colorIfTrueR.set(0.001)

        cmds.addAttr(self._controllers[-1], longName='stretchOnOff', attributeType='double', min=0.0, max=1.0, dv=1.0, keyable=True)
        cmds.addAttr(self._controllers[-1], longName='shrink', attributeType='double', min=0.0, max=maxShrinkVal, dv=0.0, keyable=True)

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
        cmds.parent(scaleCrv, self._blbxGrp)

    def setupTwist(self):
        cmds.addAttr(self._controllers[-1], at='double', ln='twist', dv=0.0, keyable=True)
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
            cmds.parent(curCtrl.zeroGrp, parentCtrl.zeroGrp)
            cmds.matchTransform(curCtrl.zeroGrp, parentCtrl, pivots=True)
            cmds.orientConstraint(parentCtrl, curCtrl.zeroGrp, mo=True)

    def setupWave(self):
        crv = cmds.duplicate(self.__curve, n='{0}wave_crv'.format(self._name))[0]

        blendshape = cmds.blendShape(crv, self.__curve, n='{}_bs'.format(self.__curve), origin='local', frontOfChain=True)[0]
        blendshape.attr(crv.name()).set(1)

        sine, sineHandle = cmds.nonLinear(crv.name(), type='sine')  # If instanciate non-linear deformer as "PyNode", "Could not create desired MFn" warning is caused
        sineHandle.rename('{0}sineHandle'.format(self._name))
        cmds.setAttr('{}.dropoff'.format(sine), -1)
        cmds.setAttr('{}.highBound'.format(sine), 0)

        numCVs = crv.numCVs()
        startPosition = cmds.xform(crv.cv[0], q=True, t=True, ws=True)
        endPosition = cmds.xform(crv.cv[numCVs-1], q=True, t=True, ws=True)

        aimVector = om.MPoint(endPosition) - om.MPoint(startPosition)
        scale = aimVector.length()

        aimVector.normalize()
        sceneUpVector = om.MVector(0.0, 1.0, 0.0)
        rightVector = aimVector ^ sceneUpVector
        otherVector = aimVector ^ rightVector

        matrixList = [
            otherVector.x, otherVector.y, otherVector.z, 0.0,
            -aimVector.x, -aimVector.y, -aimVector.z, 0.0,
            rightVector.x, rightVector.y, rightVector.z, 0.0,
            startPosition[0], startPosition[1], startPosition[2], 1.0
        ]
        sineHandleMatrix = om.MMatrix(matrixList)

        cmds.xform(sineHandle, matrix=sineHandleMatrix, ws=True)

        sineHandle.scale.set(scale, scale, scale)
        sineHandle.shear.set(0, 0, 0)

        self.__addWaveAttrs()

        sineHandleSpace = cmds.createNode('transform', n='{}_zero'.format(sineHandle))
        cmds.matchTransform(sineHandleSpace, sineHandle, pos=True, rot=True, scale=True)
        cmds.parent(sineHandle, sineHandleSpace)

        cmds.connectAttr('{}.waveOnOff'.format(self._controllers[-1]), '{}.envelope'.format(sine))
        self._controllers[-1].waveOnOff >> blendshape.attr(crv.name())
        self._controllers[-1].waveAmplitude >> sineHandle.amplitude
        self._controllers[-1].waveLength >> sineHandle.wavelength
        self._controllers[-1].waveOffset >> sineHandle.offset
        self._controllers[-1].waveOrient >> sineHandle.rotateY

        self.addMembers(blendshape)
        cmds.parent(crv, sineHandleSpace, self._blbxGrp)

    def __addWaveAttrs(self):
        ATTRIBUTES_INFO=[
            {'waveOnOff': {'type': 'double', 'defaultValue': 0.0, 'keyable': True}},
            {'waveAmplitude': {'type': 'double', 'defaultValue': 0.1, 'keyable': True}},
            {'waveLength': {'type': 'double', 'defaultValue': 1.0, 'keyable': True}},
            {'waveOffset': {'type': 'double', 'defaultValue': 0.0, 'keyable': True}},
            {'waveOrient': {'type': 'double', 'defaultValue': 0.0, 'keyable': True}},
        ]
        # Add dvider
        cmds.addAttr(self._controllers[-1], ln='wave', at='enum', en='---------------:')
        cmds.setAttr('{}.{}'.format(self._controllers[-1], 'wave'), channelBox=True)

        # Add attributes
        for attrInfo in ATTRIBUTES_INFO:
            for attrName, attrProperties in attrInfo.items():
                cmds.addAttr(self._controllers[-1], ln=attrName, at=attrProperties['type'], dv=attrProperties['defaultValue'], keyable=attrProperties['keyable'])

        # Set default value
        self._controllers[-1].waveOnOff.setRange(0, 1)

    def setupDynamic(self):
        # Nodes setup
        timeNode = 'time1'

        rebuildCrv = cmds.createNode('rebuildCurve', n='{0}_rebuildCrv'.format(self.__curve))
        rebuildCrv.degree.set(1)
        rebuildCrv.smooth.set(-3)
        rebuildCrv.endKnots.set(1)
        rebuildCrv.keepRange.set(0)
        rebuildCrv.keepControlPoints.set(True)
        rebuildCrv.keepEndPoints.set(True)
        rebuildCrv.keepTangents.set(False)
        rebuildCrvShape = cmds.createNode('nurbsCurve', n='{0}_rebuildCrvShape'.format(self.__curve))

        hairSystem = cmds.createNode('hairSystem')
        hairSystem.getTransform().rename('{0}hairSystem'.format(self._name))
        hairSystem.active.set(1)
        hairSystem.hairsPerClump.set(1)
        hairSystem.clumpWidth.set(0)
        hairSystem.stretchResistance.set(200)
        hairSystem.compressionResistance.set(200)
        hairSystem.stiffnessScale[1].stiffnessScale_FloatValue.set(1)

        self.__follicle = cmds.createNode('follicle')
        self.__follicle.getTransform().rename('{0}follicle'.format(self._name))
        self.__follicle.restPose.set(1)
        self.__follicle.startDirection.set(1)
        self.__follicle.degree.set(3)
        self.__follicle.pointLock.get()

        dynCrv =  cmds.duplicate(self.__curve, n='{0}dyn_crv'.format(self._name))[0]

        enableCond = cmds.createNode('condition', n='{0}dynEnable_cond'.format(self._name))
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

        hairSystem.outputHair[0] >> self.__follicle.currentPosition
        self.__follicle.outHair >> hairSystem.inputHair[0]

        self.__curve.worldSpace >> rebuildCrv.inputCurve
        cmds.connectAttr('{}.outputCurve'.format(rebuildCrv), '{}.create'.format(rebuildCrvShape))  # If use ">>" operator, "Could not create desired MFn" warning is caused
        rebuildCrvShape.local >> self.__follicle.startPosition
        self.__curve.getTransform().worldMatrix >> self.__follicle.startPositionMatrix

        self.__follicle.outCurve >> dynCrv.create

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
        cmds.parent(self.__follicle.getTransform(), self._blbxGrp)
        cmds.parent(rebuildCrvShape.getTransform(), nucleus, hairSystem.getTransform(), self._noTrsfGrp)

    def __getNucleus(self):
        nucleusNode = None

        nucleusNodes = cmds.ls(type='nucleus')
        for node in nucleusNodes:
            if node.name() == self._name:
                nucleusNode = node
                break

        if not nucleusNode:
            nucleusNode = cmds.createNode('nucleus', n='{}nucleus'.format(self._name))

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
        cmds.addAttr(self._controllers[-1], ln='dynamic', at='enum', en='---------------:')
        cmds.setAttr('{}.{}'.format(self._controllers[-1], 'dynamic'), channelBox=True)

        # Add attributes
        for attrInfo in ATTRIBUTES_INFO:
            for attrName, attrProperties in attrInfo.items():
                if 'range' in attrProperties:
                    cmds.addAttr(self._controllers[-1], ln=attrName, at=attrProperties['type'], min=attrProperties['range'][0], max=attrProperties['range'][1], dv=attrProperties['defaultValue'], keyable=attrProperties['keyable'])
                else:
                    cmds.addAttr(self._controllers[-1], ln=attrName, at=attrProperties['type'], dv=attrProperties['defaultValue'], keyable=attrProperties['keyable'])

    @staticmethod
    def findMultiAttributeEmptyIndex(node, attribute):
        id = 0
        while node.attr(attribute)[id].isConnected():
            id += 1
        return id

    def __setupBakeLocators(self, dynCrv):
        crvMaxRange = dynCrv.maxValue.get()
        for ctrl in self._controllers:
            ctrlPnt = cmds.xform(ctrl, q=True, rp=True, ws=True)
            closestPnt = self.__curve.closestPoint(ctrlPnt, space='world')
            param = self.__curve.getParamAtPoint(closestPnt, space='world')
            pointOnCrvInfo = cmds.createNode('pointOnCurveInfo', n='{}_pntOnCrvInfo'.format(ctrl))
            dynCrv.worldSpace >> pointOnCrvInfo.inputCurve
            pointOnCrvInfo.parameter.set(param * crvMaxRange)
            bakeLoc = cmds.spaceLocator(n='{}_bake_loc'.format(ctrl))
            bakeLocAnchor = cmds.group(bakeLoc, n='{}_anchor'.format(bakeLoc))
            pointOnCrvInfo.result.position >> bakeLocAnchor.translate

            closestJnt = utils.findClosestObject(cmds.xform(bakeLocAnchor, q=True, rp=True, ws=True), self._joints)
            if closestJnt == self._joints[-1]:
                closestJnt = self._joints[-1].getParent()
            cmds.orientConstraint(closestJnt, bakeLocAnchor, mo=False)

            self.addMembers(pointOnCrvInfo)
            cmds.parent(bakeLocAnchor, self._noTrsfGrp)

    def setCurveWeightsArc(self):
        skinClst = utils.getSkinCluster(self.__curve)
        cmds.skinPercent(skinClst, self.__curve.cv[1], transformValue=[(self.__curveJoints[1], 0.3)], prw=0)
        cmds.skinPercent(skinClst, self.__curve.cv[-2], transformValue=[(self.__curveJoints[-2], 0.3)], prw=0)
