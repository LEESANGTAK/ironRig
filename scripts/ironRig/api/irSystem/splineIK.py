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

    def __init__(self, name='new', side=System.SIDE.CENTER, joints=[], numControllers=2):
        super(SplineIK, self).__init__(name, side, System.TYPE.SPLINE_SYSTEM, joints)
        self._numControllers = numControllers
        self._curve = None
        self._curveDegree = SplineIK.CURVE_DEGREE.CUBIC
        self._curveSpans = None
        self._curveJoints = None
        self._ikHandle = None
        self._follicle = None

    @property
    def curveDegree(self):
        return self._curveDegree

    @curveDegree.setter
    def curveDegree(self, degree):
        self._curveDegree = degree

    @property
    def curveSpans(self):
        return self._curveSpans

    @curveSpans.setter
    def curveSpans(self, spans):
        self._curveSpans = spans

    @property
    def dynLock(self):
        return cmds.getAttr('{}.pointLock'.format(self._follicle))

    @dynLock.setter
    def dynLock(self, val):
        cmds.setAttr('{}.pointLock'.format(self._follicle), val)

    @property
    def ikHandle(self):
        return self._ikHandle

    def _buildSystems(self):
        super(SplineIK, self)._buildSystems()
        self._createCurveWithJoints()
        # Store rotation of the end joint
        endJntRo = cmds.xform(self._joints[-1], q=True, ro=True, ws=True)

        self._ikHandle = cmds.ikHandle(name='{}_ikh'.format(self.shortName), solver='ikSplineSolver', sj=self._joints[0], ee=self._joints[-1], curve=self._curve, createCurve=False, parentCurve=False)[0]

        # Restore end joint rotation after appling spline ik handle
        cmds.xform(self._joints[-1], ro=endJntRo, ws=True)
        cmds.makeIdentity(self._joints[-1], apply=True)

        cmds.parent(self._ikHandle, self._blbxGrp)
        self._buildCurveBindJoints()

    def _createCurveWithJoints(self):
        editPoints = [cmds.xform(jnt, q=True, rp=True, ws=True) for jnt in self._joints]
        crv = cmds.curve(d=1, editPoint=editPoints, n='{}_crv'.format(self.shortName))
        spans = self._numControllers-1
        if self._curveSpans:
            spans = self._curveSpans
        self._curve = cmds.rebuildCurve(crv, d=self._curveDegree, spans=spans, keepRange=0, ch=False, replaceOriginal=True)[0]
        cmds.parent(self._curve, self._noTrsfGrp)

    def _buildCurveBindJoints(self):
        self._curveJoints = utils.createJointsOnCurve(self._curve, self._numControllers, self.shortName)
        self._orientCurveJoints()
        skinClst = cmds.skinCluster(self._curveJoints, self._curve, mi=1, dr=4.0, tsb=True, omi=False, nw=True)
        crvJntsGrp = cmds.group(self._curveJoints, n='{}_crvJnt_grp'.format(self.shortName))

        self.addMembers(skinClst)
        cmds.parent(crvJntsGrp, self._blbxGrp)

    def _orientCurveJoints(self):
        for crvJnt in self._curveJoints:
            crvJntPos = cmds.xform(crvJnt, q=True, rp=True, ws=True)
            closestJnt = utils.findClosestObject(om.MPoint(crvJntPos), self._joints)
            cmds.matchTransform(crvJnt, closestJnt, rot=True)

    def _buildControls(self):
        ctrls = []
        for crvJnt in self._curveJoints:
            ctrl = Controller(name=crvJnt.replace('crvJnt', 'ctrl'), shape=Controller.SHAPE.CUBE, color=self.controllerColor)
            ctrl.lockHideChannels(['scale', 'visibility'])
            cmds.matchTransform(ctrl.zeroGrp, crvJnt, position=True, rotation=True)
            if self._negateScaleX:
                cmds.setAttr('{}.sx'.format(ctrl.zeroGrp), -1)
            cmds.parentConstraint(ctrl, crvJnt, mo=True)
            ctrls.append(ctrl)
            self.addMembers(ctrl.allNodes)
        cmds.parent([ctrl.zeroGrp for ctrl in ctrls], self._controllerGrp)
        #cmds.orientConstraint(ctrls[-1], self._joints[-1], mo=True)
        cmds.connectAttr('{}.rotate'.format(ctrls[-1]), '{}.rotate'.format(self._joints[-1]))  # Joint can't rotate when dynamic applied if drive using constraint
        self._controllers = ctrls

    def setupStretch(self):
        scaleCrv = cmds.duplicate(self._curve, n='{}_scale'.format(self._curve))[0]
        crvInfo = cmds.createNode('curveInfo', n='{}_curveInfo'.format(self._curve))
        scaleCrvInfo = cmds.createNode('curveInfo', n='{}_curveInfo'.format(scaleCrv))
        stretchRatioDiv = cmds.createNode('multiplyDivide', n='{}_stretchRatio_div'.format(self.shortName))
        cmds.setAttr('{}.operation'.format(stretchRatioDiv), 2)
        stertchOnOffBlend = cmds.createNode('blendColors', n='{}_stertchOnOff_blend'.format(self.shortName))
        cmds.setAttr('{}.color2R'.format(stertchOnOffBlend), 1)

        maxShrinkVal = 10.0
        shrinkValNormalize = cmds.createNode('multDoubleLinear', n='{}_shrinkValNormalize'.format(self.shortName))
        cmds.setAttr('{}.input2'.format(shrinkValNormalize), 1.0/maxShrinkVal)
        shrinkReverse = cmds.createNode('reverse', n='{}_shrinkRev'.format(self.shortName))
        shrinkValMult = cmds.createNode('multDoubleLinear', n='{}_shrinkValMult'.format(self.shortName))
        zeroScalePreventCond = cmds.createNode('condition', n='{}_zeroScalePrevent_cond'.format(self.shortName))
        cmds.setAttr('{}.colorIfTrueR'.format(zeroScalePreventCond), 0.001)

        cmds.addAttr(self._controllers[-1], longName='stretchOnOff', attributeType='double', min=0.0, max=1.0, dv=1.0, keyable=True)
        cmds.addAttr(self._controllers[-1], longName='shrink', attributeType='double', min=0.0, max=maxShrinkVal, dv=0.0, keyable=True)

        cmds.connectAttr('{}.worldSpace'.format(self._curve), '{}.inputCurve'.format(crvInfo))
        cmds.connectAttr('{}.worldSpace'.format(scaleCrv), '{}.inputCurve'.format(scaleCrvInfo))

        cmds.connectAttr('{}.arcLength'.format(crvInfo), '{}.input1X'.format(stretchRatioDiv))
        cmds.connectAttr('{}.arcLength'.format(scaleCrvInfo), '{}.input2X'.format(stretchRatioDiv))

        cmds.connectAttr('{}.stretchOnOff'.format(self._controllers[-1]), '{}.blender'.format(stertchOnOffBlend))
        cmds.connectAttr('{}.shrink'.format(self._controllers[-1]), '{}.input1'.format(shrinkValNormalize))
        cmds.connectAttr('{}.output'.format(shrinkValNormalize), '{}.inputX'.format(shrinkReverse))

        cmds.connectAttr('{}.outputX'.format(stretchRatioDiv), '{}.color1R'.format(stertchOnOffBlend))
        cmds.connectAttr('{}.outputR'.format(stertchOnOffBlend), '{}.input1'.format(shrinkValMult))

        cmds.connectAttr('{}.outputX'.format(shrinkReverse), '{}.firstTerm'.format(zeroScalePreventCond))
        cmds.connectAttr('{}.outputX'.format(shrinkReverse), '{}.colorIfFalseR'.format(zeroScalePreventCond))
        cmds.connectAttr('{}.outColorR'.format(zeroScalePreventCond), '{}.input2'.format(shrinkValMult))

        for jnt in self._joints[:-1]:
            cmds.connectAttr('{}.output'.format(shrinkValMult), '{}.{}'.format(jnt, 'scale{}'.format(self._aimAxis)))

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
        cmds.connectAttr('{}.twist'.format(self._controllers[-1]), '{}.twist'.format(self._ikHandle))

    def setupAdvancedTwist(self):
        aimAxisInfo = {'1X': 0,
                       '-1X': 1,
                       '1Y': 2,
                       '-1Y': 3,
                       '1Z': 4,
                       '-1Z': 5}
        cmds.setAttr('{}.dTwistControlEnable'.format(self._ikHandle), True)
        cmds.setAttr('{}.dWorldUpType'.format(self._ikHandle), 4)
        cmds.setAttr('{}.dForwardAxis'.format(self._ikHandle), aimAxisInfo['{}{}'.format(self._aimSign, self._aimAxis)])
        cmds.setAttr('{}.dWorldUpAxis'.format(self._ikHandle), 4)
        cmds.setAttr('{}.dWorldUpVectorY'.format(self._ikHandle), 0)
        cmds.setAttr('{}.dWorldUpVectorZ'.format(self._ikHandle), -1)
        cmds.setAttr('{}.dWorldUpVectorEndY'.format(self._ikHandle), 0)
        cmds.setAttr('{}.dWorldUpVectorEndZ'.format(self._ikHandle), -1)
        cmds.connectAttr('{}.worldMatrix'.format(self._controllers[0]), '{}.dWorldUpMatrix'.format(self._ikHandle))
        cmds.connectAttr('{}.worldMatrix'.format(self._controllers[-1]), '{}.dWorldUpMatrixEnd'.format(self._ikHandle))

    def setupHybridIK(self):
        for i in range(1, self._numControllers):
            curCtrl = self._controllers[i]
            parentCtrl = self._controllers[i-1]
            cmds.parent(curCtrl.zeroGrp, parentCtrl.zeroGrp)
            cmds.matchTransform(curCtrl.zeroGrp, parentCtrl, pivots=True)
            cmds.orientConstraint(parentCtrl, curCtrl.zeroGrp, mo=True)

    def setupWave(self):
        crv = cmds.duplicate(self._curve, n='{0}_wave_crv'.format(self.shortName))[0]

        blendshape = cmds.blendShape(crv, self._curve, n='{}_bs'.format(self._curve), origin='local', frontOfChain=True)[0]
        cmds.setAttr('{}.{}'.format(blendshape, crv), 1)

        sine, sineHandle = cmds.nonLinear(crv, type='sine')  # If instanciate non-linear deformer as "PyNode", "Could not create desired MFn" warning is caused
        cmds.setAttr('{}.dropoff'.format(sine), -1)
        cmds.setAttr('{}.highBound'.format(sine), 0)
        cmds.rename(sineHandle, '{0}_sineHandle'.format(self.shortName))

        numCVs = cmds.getAttr("{}.spans".format(crv)) + cmds.getAttr("{}.degree".format(crv))
        startPosition = cmds.xform('{}.cv[{}]'.format(crv, 0), q=True, t=True, ws=True)
        endPosition = cmds.xform('{}.cv[{}]'.format(crv, numCVs-1), q=True, t=True, ws=True)

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

        cmds.setAttr('{}.scale'.format(sineHandle), scale, scale, scale)
        cmds.setAttr('{}.shear'.format(sineHandle), 0, 0, 0)

        self._addWaveAttrs()

        sineHandleSpace = cmds.createNode('transform', n='{}_zero'.format(sineHandle))
        cmds.matchTransform(sineHandleSpace, sineHandle, pos=True, rot=True, scale=True)
        cmds.parent(sineHandle, sineHandleSpace)

        cmds.connectAttr('{}.waveOnOff'.format(self._controllers[-1]), '{}.envelope'.format(sine))
        cmds.connectAttr('{}.waveOnOff'.format(self._controllers[-1]), '{}.{}'.format(blendshape, crv))
        cmds.connectAttr('{}.waveAmplitude'.format(self._controllers[-1]), '{}.amplitude'.format(sineHandle))
        cmds.connectAttr('{}.waveLength'.format(self._controllers[-1]), '{}.wavelength'.format(sineHandle))
        cmds.connectAttr('{}.waveOffset'.format(self._controllers[-1]), '{}.offset'.format(sineHandle))
        cmds.connectAttr('{}.waveOrient'.format(self._controllers[-1]), '{}.rotateY'.format(sineHandle))

        self.addMembers(blendshape)
        cmds.parent(crv, sineHandleSpace, self._blbxGrp)

    def _addWaveAttrs(self):
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
        utils.setRange('{}.waveOnOff'.format(self._controllers[-1]), 0, 1)

    def setupDynamic(self):
        # Nodes setup
        timeNode = 'time1'

        rebuildCrv = cmds.createNode('rebuildCurve', n='{0}_rebuildCrv'.format(self._curve))
        cmds.setAttr('{}.degree'.format(rebuildCrv), 1)
        cmds.setAttr('{}.smooth'.format(rebuildCrv), -3)
        cmds.setAttr('{}.endKnots'.format(rebuildCrv), 1)
        cmds.setAttr('{}.keepRange'.format(rebuildCrv), 0)
        cmds.setAttr('{}.keepControlPoints'.format(rebuildCrv), True)
        cmds.setAttr('{}.keepEndPoints'.format(rebuildCrv), True)
        cmds.setAttr('{}.keepTangents'.format(rebuildCrv), False)
        rebuildCrvShape = cmds.createNode('nurbsCurve', n='{0}_rebuildCrvShape'.format(self._curve))

        hairSystem = cmds.createNode('hairSystem')
        cmds.setAttr('{}.active'.format(hairSystem), 1)
        cmds.setAttr('{}.hairsPerClump'.format(hairSystem), 1)
        cmds.setAttr('{}.clumpWidth'.format(hairSystem), 0)
        cmds.setAttr('{}.stretchResistance'.format(hairSystem), 200)
        cmds.setAttr('{}.compressionResistance'.format(hairSystem), 200)
        cmds.setAttr('{}.stiffnessScale[1].stiffnessScale_FloatValue'.format(hairSystem), 1)
        cmds.rename(utils.getParent(hairSystem), '{0}_hairSystem'.format(self.shortName))

        self._follicle = cmds.createNode('follicle')
        cmds.setAttr('{}.restPose'.format(self._follicle), 1)
        cmds.setAttr('{}.startDirection'.format(self._follicle), 1)
        cmds.setAttr('{}.degree'.format(self._follicle), 3)
        cmds.getAttr('{}.pointLock'.format(self._follicle))
        cmds.rename(utils.getParent(self._follicle), '{0}_follicle'.format(self.shortName))

        dynCrv =  cmds.duplicate(self._curve, n='{0}_dyn_crv'.format(self.shortName))[0]

        enableCond = cmds.createNode('condition', n='{0}_dynEnable_cond'.format(self.shortName))
        cmds.setAttr('{}.secondTerm'.format(enableCond), 1)
        cmds.setAttr('{}.colorIfTrueR'.format(enableCond), 3)

        nucleus = self._getNucleus()
        cmds.setAttr('{}.spaceScale'.format(nucleus), 0.05)

        # DG
        self._addDynAttrs()
        cmds.connectAttr('{}.outTime'.format(timeNode), '{}.currentTime'.format(nucleus))
        cmds.connectAttr('{}.outTime'.format(timeNode), '{}.currentTime'.format(hairSystem))

        cmds.connectAttr('{}.startFrame'.format(nucleus), '{}.startFrame'.format(hairSystem))

        outputObjectsId = SplineIK.findMultiAttributeEmptyIndex(nucleus, 'outputObjects')
        cmds.connectAttr('{}.outputObjects[{}]'.format(nucleus, outputObjectsId), '{}.nextState'.format(hairSystem))

        inputActiveId = SplineIK.findMultiAttributeEmptyIndex(nucleus, 'inputActive')
        cmds.connectAttr('{}.currentState'.format(hairSystem), '{}.inputActive[{}]'.format(nucleus, inputActiveId))

        inputActiveStartId = SplineIK.findMultiAttributeEmptyIndex(nucleus, 'inputActiveStart')
        cmds.connectAttr('{}.startState'.format(hairSystem), '{}.inputActiveStart[{}]'.format(nucleus, inputActiveStartId))

        cmds.connectAttr('{}.outputHair[0]'.format(hairSystem), '{}.currentPosition'.format(self._follicle))
        cmds.connectAttr('{}.outHair'.format(self._follicle), '{}.inputHair[0]'.format(hairSystem))

        cmds.connectAttr('{}.worldSpace'.format(self._curve), '{}.inputCurve'.format(rebuildCrv))
        cmds.connectAttr('{}.outputCurve'.format(rebuildCrv), '{}.create'.format(rebuildCrvShape))  # If use ">>" operator, "Could not create desired MFn" warning is caused
        cmds.connectAttr('{}.local'.format(rebuildCrvShape), '{}.startPosition'.format(self._follicle))
        cmds.connectAttr('{}.worldMatrix'.format(utils.getTransform(self._curve)), '{}.startPositionMatrix'.format(self._follicle))

        cmds.connectAttr('{}.outCurve'.format(self._follicle), '{}.create'.format(dynCrv))

        cmds.connectAttr('{}.worldSpace'.format(dynCrv), '{}.inCurve'.format(self._ikHandle))

        cmds.connectAttr('{}.enable'.format(self._controllers[-1]), '{}.enable'.format(nucleus))
        cmds.connectAttr('{}.enable'.format(self._controllers[-1]), '{}.active'.format(hairSystem))
        cmds.connectAttr('{}.enable'.format(self._controllers[-1]), '{}.firstTerm'.format(enableCond))
        cmds.connectAttr('{}.outColorR'.format(enableCond), '{}.simulationMethod'.format(hairSystem))

        cmds.connectAttr('{}.startFrame'.format(self._controllers[-1]), '{}.startFrame'.format(nucleus))
        cmds.connectAttr('{}.subSteps'.format(self._controllers[-1]), '{}.subSteps'.format(nucleus))
        cmds.connectAttr('{}.bendResistance'.format(self._controllers[-1]), '{}.bendResistance'.format(hairSystem))
        cmds.connectAttr('{}.stiffness'.format(self._controllers[-1]), '{}.stiffness'.format(hairSystem))
        cmds.connectAttr('{}.damp'.format(self._controllers[-1]), '{}.damp'.format(hairSystem))
        cmds.connectAttr('{}.drag'.format(self._controllers[-1]), '{}.drag'.format(hairSystem))
        cmds.connectAttr('{}.startCurveAttract'.format(self._controllers[-1]), '{}.startCurveAttract'.format(hairSystem))
        cmds.connectAttr('{}.attractionDamp'.format(self._controllers[-1]), '{}.attractionDamp'.format(hairSystem))

        self._setupBakeLocators(dynCrv)

        # Cleanup
        self.addMembers(rebuildCrv, enableCond)
        cmds.parent(utils.getTransform(self._follicle), self._blbxGrp)
        cmds.parent(utils.getTransform(rebuildCrvShape), nucleus, utils.getTransform(hairSystem), self._noTrsfGrp)

    def _getNucleus(self):
        nucleusNode = None

        nucleusNodes = cmds.ls(type='nucleus')
        for node in nucleusNodes:
            if node == self.shortName:
                nucleusNode = node
                break

        if not nucleusNode:
            nucleusNode = cmds.createNode('nucleus', n='{}_nucleus'.format(self.shortName))

        return nucleusNode

    def _addDynAttrs(self):
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
        while utils.isConnectable('{}.{}[{}]'.format(node, attribute, id)):
            id += 1
        return id

    def _setupBakeLocators(self, dynCrv):
        crvMaxRange = cmds.getAttr('{}.maxValue'.format(dynCrv))
        fnCrv = om.MFnNurbsCurve(utils.getDagPath(self._curve))
        for ctrl in self._controllers:
            ctrlPnt = cmds.xform(ctrl, q=True, rp=True, ws=True)
            closestPnt = fnCrv.closestPoint(ctrlPnt, space=om.MSpace.kWorld)
            param = fnCrv.getParamAtPoint(closestPnt, space=om.MSpace.kWorld)
            pointOnCrvInfo = cmds.createNode('pointOnCurveInfo', n='{}_pntOnCrvInfo'.format(ctrl))
            cmds.connectAttr('{}.worldSpace'.format(dynCrv), '{}.inputCurve'.format(pointOnCrvInfo))
            cmds.setAttr('{}.parameter'.format(pointOnCrvInfo), param * crvMaxRange)
            bakeLoc = cmds.spaceLocator(n='{}_bake_loc'.format(ctrl))
            bakeLocAnchor = cmds.group(bakeLoc, n='{}_anchor'.format(bakeLoc))
            cmds.connectAttr('{}.result.position'.format(pointOnCrvInfo), '{}.translate'.format(bakeLocAnchor))

            closestJnt = utils.findClosestObject(cmds.xform(bakeLocAnchor, q=True, rp=True, ws=True), self._joints)
            if closestJnt == self._joints[-1]:
                closestJnt = utils.getParent(self._joints[-1])
            cmds.orientConstraint(closestJnt, bakeLocAnchor, mo=False)

            self.addMembers(pointOnCrvInfo)
            cmds.parent(bakeLocAnchor, self._noTrsfGrp)

    def setCurveWeightsArc(self):
        skinClst = utils.getSkinCluster(self._curve)
        cmds.skinPercent(skinClst, '{}.cv[1]'.format(self._curve), transformValue=[(self._curveJoints[1], 0.3)], prw=0)
        cmds.skinPercent(skinClst, '{}.cv[-2]'.format(self._curve), transformValue=[(self._curveJoints[-2], 0.3)], prw=0)
