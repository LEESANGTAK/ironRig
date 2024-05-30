from maya.api import OpenMaya as om
from maya import cmds
from ... import utils
from ..irGlobal import Controller
from .system import System


class RibbonIK(System):
    def __init__(self, name='new', side=System.SIDE.LEFT, type=System.TYPE.RIBBON_SYSTEM, joints=[], numControllers=2):
        super(RibbonIK, self).__init__(name, side, type, joints)
        self._numControllers = numControllers
        self._surface = None
        self._surfaceJoints = None

    def _buildSystems(self):
        super(RibbonIK, self)._buildSystems()
        self._createSurfaceWithJoints()
        self._attachJointsToSurface()
        self._buildSurfaceBindJoints()

    def _createSurfaceWithJoints(self):
        profileCurve = cmds.curve(degree=1, editPoint=[(0.0, 0.0, -0.5), (0.0, 0.0, 0.5)], n='profile_crv')
        profileCurves = []
        for jnt in self._joints:
            dupProfileCrv = cmds.duplicate(profileCurve)[0]
            cmds.xform(dupProfileCrv, matrix=cmds.getAttr('{}.worldMatrix'.format(jnt)), ws=True)
            profileCurves.append(dupProfileCrv)
        self._surface = cmds.loft(profileCurves, ch=False)

        spans = self._numControllers-1
        self._surface = cmds.rebuildSurface(self._surface, su=spans, du=3, sv=1, dv=1, keepRange=0, ch=False, replaceOriginal=True)[0]

        cmds.delete([profileCurve] + profileCurves)
        cmds.parent(self._surface, self._noTrsfGrp)

    def _attachJointsToSurface(self):
        folScaleDecMtx = cmds.createNode('decomposeMatrix', n='{}folScale_decMtx'.format(self._name))
        cmds.connectAttr('{}.worldMatrix'.format(self._topGrp), '{}.inputMatrix'.format(folScaleDecMtx))

        for joint in self._joints:
            jntPoint = om.MPoint(cmds.xform(joint, q=True, t=True, ws=True))
            fnSrfc = om.MFnNurbsSurface(utils.getDagPath(self._surface))
            closestPoint, paramU, paramV = fnSrfc.closestPoint(jntPoint, space=om.MSpace.kWorld)
            fol = cmds.createNode('follicle')
            folTransform = utils.getParent(fol)
            cmds.setAttr('{}.parameterU'.format(fol), paramU)
            cmds.setAttr('{}.parameterV'.format(fol), paramV)
            cmds.connectAttr('{}.local'.format(self._surface), '{}.inputSurface'.format(fol))
            cmds.connectAttr('{}.worldMatrix'.format(self._surface), '{}.inputWorldMatrix'.format(fol))
            cmds.connectAttr('{}.outTranslate'.format(fol), '{}.translate'.format(folTransform))
            cmds.connectAttr('{}.outRotate'.format(fol), '{}.rotate'.format(folTransform))
            cmds.connectAttr('{}.outputScale'.format(folScaleDecMtx), '{}.scale'.format(folTransform))
            folTransform = cmds.rename(folTransform, '{}_fol'.format(joint))
            cmds.parentConstraint(folTransform, joint, mo=True)
            cmds.parent(folTransform, self._noTrsfGrp)

    def _buildSurfaceBindJoints(self):
        self._surfaceJoints = utils.createJointsOnSurface(self._surface, self._numControllers, self._name)
        self._orientSurfaceJoints()
        skinClst = cmds.skinCluster(self._surfaceJoints, self._surface, mi=1, dr=4.0, tsb=True, omi=False, nw=True)
        srfcJntsGrp = cmds.group(self._surfaceJoints, n='{}srfcJnt_grp'.format(self._name))

        self.addMembers(skinClst)
        cmds.parent(srfcJntsGrp, self._blbxGrp)

    def _orientSurfaceJoints(self):
        for srfcJnt in self._surfaceJoints:
            srfcJntPos = cmds.xform(srfcJnt, q=True, rp=True, ws=True)
            closestJnt = utils.findClosestObject(om.MPoint(srfcJntPos), self._joints)
            cmds.matchTransform(srfcJnt, closestJnt, rot=True)

    def _buildControls(self):
        ctrls = []
        for srfcJnt in self._surfaceJoints:
            ctrl = Controller(name=srfcJnt.replace('srfcJnt', 'ctrl'), shape=Controller.SHAPE.CUBE, color=self.controllerColor)
            ctrl.lockHideChannels(['scale', 'visibility'])
            cmds.matchTransform(ctrl.zeroGrp, srfcJnt, position=True, rotation=True)
            if self._negateScaleX:
                cmds.setAttr('{}.sx'.format(ctrl.zeroGrp), -1)
            cmds.parentConstraint(ctrl, srfcJnt, mo=True)
            ctrls.append(ctrl)
            self.addMembers(ctrl.allNodes)
        cmds.parent([ctrl.zeroGrp for ctrl in ctrls], self._controllerGrp)
        self._controllers = ctrls

    def setupHybridIK(self):
        for i in range(1, self._numControllers):
            curCtrl = self._controllers[i]
            parentCtrl = self._controllers[i-1]
            cmds.parent(curCtrl.zeroGrp, parentCtrl.zeroGrp)
            cmds.matchTransform(curCtrl.zeroGrp, parentCtrl, pivots=True)
            cmds.orientConstraint(parentCtrl, curCtrl.zeroGrp, mo=True)

    def setupWave(self):
        srfc = cmds.duplicate(self._surface, n='{0}wave_srfc'.format(self._name))[0]

        blendshape = cmds.blendShape(srfc, self._surface, origin='local', frontOfChain=True)[0]
        cmds.setAttr('{}.{}'.format(blendshape, srfc), 1)

        sine, sineHandle = cmds.nonLinear(srfc, type='sine')
        cmds.rename(sineHandle, '{0}sineHandle'.format(self._name))
        cmds.setAttr('{}.dropoff'.format(sineHandle), -1)
        cmds.setAttr('{}.highBound'.format(sineHandle), 0)

        fnSrfc = om.MFnNurbsSurface(utils.getDagPath(srfc))
        startPoint = fnSrfc.getPointAtParam(0.0, 0.5, space=om.MSpace.kWorld)
        endPoint = fnSrfc.getPointAtParam(1.0, 0.5, space=om.MSpace.kWorld)

        aimVector = endPoint - startPoint
        scale = aimVector.length()

        aimVector.normalize()
        sceneUpVector = om.MVector.kYaxisVector
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

        cmds.setAttr('{}.scale'.format(sineHandle), scale, scale, scale)
        cmds.setAttr('{}.shear'.format(sineHandle), 0, 0, 0)

        self._addWaveAttrs()

        sineHandleSpace = cmds.createNode('transform', n='{}_zero'.format(sineHandle))
        cmds.matchTransform(sineHandleSpace, sineHandle, pos=True, rot=True, scale=True)
        cmds.parent(sineHandle, sineHandleSpace)

        cmds.connectAttr('{}.waveOnOff'.format(self._controllers[-1]), '{}.envelope'.format(sine))
        cmds.connectAttr('{}.waveOnOff'.format(self._controllers[-1]), '{}.{}'.format(blendshape, srfc))
        cmds.connectAttr('{}.waveAmplitude'.format(self._controllers[-1]), '{}.amplitude'.format(sineHandle))
        cmds.connectAttr('{}.waveLength'.format(self._controllers[-1]), '{}.wavelength'.format(sineHandle))
        cmds.connectAttr('{}.waveOffset'.format(self._controllers[-1]), '{}.offset'.format(sineHandle))
        cmds.connectAttr('{}.waveOrient'.format(self._controllers[-1]), '{}.rotateY'.format(sineHandle))

        self.addMembers(blendshape)
        cmds.parent(srfc, sineHandleSpace, self._blbxGrp)

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