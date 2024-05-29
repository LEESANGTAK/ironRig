from maya.api import OpenMaya as om
from maya import cmds
from ... import utils
from ..irGlobal import Controller
from .system import System


class RibbonIK(System):
    def __init__(self, prefix='', joints=[], numControllers=2):
        super(RibbonIK, self).__init__(prefix, joints)
        self.__numControllers = numControllers
        self.__surface = None
        self.__surfaceJoints = None

    def _buildSystems(self):
        super(RibbonIK, self)._buildSystems()
        self.__createSurfaceWithJoints()
        self.__attachJointsToSurface()
        self.__buildSurfaceBindJoints()

    def __createSurfaceWithJoints(self):
        profileCurve = cmds.curve(degree=1, editPoint=[(0.0, 0.0, -0.5), (0.0, 0.0, 0.5)], n='profile_crv')
        profileCurves = []
        for jnt in self._joints:
            dupProfileCrv = profileCurve.duplicate()
            cmds.xform(dupProfileCrv, matrix=jnt.worldMatrix.get(), ws=True)
            profileCurves.append(dupProfileCrv)
        self.__surface = cmds.loft(profileCurves, ch=False)

        spans = self.__numControllers-1
        self.__surface = cmds.rebuildSurface(self.__surface, su=spans, du=3, sv=1, dv=1, keepRange=0, ch=False, replaceOriginal=True)[0]

        cmds.delete([profileCurve] + profileCurves)
        cmds.parent(self.__surface, self._noTrsfGrp)

    def __attachJointsToSurface(self):
        folScaleDecMtx = cmds.createNode('decomposeMatrix', n='{}folScale_decMtx'.format(self._name))
        self._topGrp.worldMatrix >> folScaleDecMtx.inputMatrix

        for joint in self._joints:
            jntPoint = om.MPoint(cmds.xform(joint, q=True, t=True, ws=True))
            closestPoint, paramU, paramV = self.__surface.closestPoint(jntPoint, space='world')
            fol = cmds.createNode('follicle')
            folTransform = fol.getTransform()
            folTransform.rename('{}_fol'.format(joint))
            fol.parameterU.set(paramU)
            fol.parameterV.set(paramV)
            self.__surface.local >> fol.inputSurface
            self.__surface.worldMatrix >> fol.inputWorldMatrix
            fol.outTranslate >> folTransform.translate
            fol.outRotate >> folTransform.rotate
            folScaleDecMtx.outputScale >> folTransform.scale
            cmds.parentConstraint(folTransform, joint, mo=True)
            cmds.parent(folTransform, self._noTrsfGrp)

    def __buildSurfaceBindJoints(self):
        self.__surfaceJoints = utils.createJointsOnSurface(self.__surface, self.__numControllers, self._name)
        self.__orientSurfaceJoints()
        skinClst = cmds.skinCluster(self.__surfaceJoints, self.__surface, mi=1, dr=4.0, tsb=True, omi=False, nw=True)
        srfcJntsGrp = cmds.group(self.__surfaceJoints, n='{}srfcJnt_grp'.format(self._name))

        self.addMembers(skinClst)
        cmds.parent(srfcJntsGrp, self._blbxGrp)

    def __orientSurfaceJoints(self):
        for srfcJnt in self.__surfaceJoints:
            srfcJntPos = cmds.xform(srfcJnt, q=True, rp=True, ws=True)
            closestJnt = utils.findClosestObject(om.MPoint(srfcJntPos), self._joints)
            cmds.matchTransform(srfcJnt, closestJnt, rot=True)

    def _buildControls(self):
        ctrls = []
        for srfcJnt in self.__surfaceJoints:
            ctrl = Controller(name=srfcJnt.replace('srfcJnt', 'ctrl'), shape=Controller.SHAPE.CUBE, color=self.controllerColor)
            ctrl.lockHideChannels(['scale', 'visibility'])
            cmds.matchTransform(ctrl.zeroGrp, srfcJnt, position=True, rotation=True)
            if self._negateScaleX:
                ctrl.zeroGrp.sx.set(-1)
            cmds.parentConstraint(ctrl, srfcJnt, mo=True)
            ctrls.append(ctrl)
            self.addMembers(ctrl.allNodes)
        cmds.parent([ctrl.zeroGrp for ctrl in ctrls], self._controllerGrp)
        self._controllers = ctrls

    def setupHybridIK(self):
        for i in range(1, self.__numControllers):
            curCtrl = self._controllers[i]
            parentCtrl = self._controllers[i-1]
            cmds.parent(curCtrl.zeroGrp, parentCtrl.zeroGrp)
            cmds.matchTransform(curCtrl.zeroGrp, parentCtrl, pivots=True)
            cmds.orientConstraint(parentCtrl, curCtrl.zeroGrp, mo=True)

    def setupWave(self):
        srfc = cmds.duplicate(self.__surface, n='{0}wave_srfc'.format(self._name))[0]

        blendshape = cmds.blendShape(srfc, self.__surface, origin='local', frontOfChain=True)[0]
        blendshape.attr(srfc.name()).set(1)

        sine, sineHandle = cmds.nonLinear(srfc, type='sine')
        sineHandle.rename('{0}sineHandle'.format(self._name))
        sineHandle.dropoff.set(-1)
        sineHandle.highBound.set(0)

        startPoint = srfc.getPointAtParam(0.0, 0.5, space='world')
        endPoint = srfc.getPointAtParam(1.0, 0.5, space='world')

        aimVector = endPoint - startPoint
        scale = aimVector.length()

        aimVector.normalize()
        sceneUpVector = om.MVector(0.0, 1.0, 0.0)
        rightVector = aimVector ^ sceneUpVector
        otherVector = aimVector ^ rightVector

        matrixList = [
            otherVector.x, otherVector.y, otherVector.z, 0.0,
            -aimVector.x, -aimVector.y, -aimVector.z, 0.0,
            rightVector.x, rightVector.y, rightVector.z, 0.0,
            startPoint.x, startPoint.y, startPoint.z, 1.0
        ]
        sineHandleMatrix = om.MMatrix(matrixList)

        cmds.xform(sineHandle, matrix=sineHandleMatrix, ws=True)

        sineHandle.scale.set(scale, scale, scale)
        sineHandle.shear.set(0, 0, 0)

        self.__addWaveAttrs()

        sineHandleSpace = cmds.createNode('transform', n='{}_zero'.format(sineHandle))
        cmds.matchTransform(sineHandleSpace, sineHandle, pos=True, rot=True, scale=True)
        cmds.parent(sineHandle, sineHandleSpace)

        self._controllers[-1].waveOnOff >> sine.envelope
        self._controllers[-1].waveOnOff >> blendshape.attr(srfc.name())
        self._controllers[-1].waveAmplitude >> sineHandle.amplitude
        self._controllers[-1].waveLength >> sineHandle.wavelength
        self._controllers[-1].waveOffset >> sineHandle.offset
        self._controllers[-1].waveOrient >> sineHandle.rotateY

        self.addMembers(blendshape)
        cmds.parent(srfc, sineHandleSpace, self._blbxGrp)

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
