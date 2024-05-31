from maya.api import OpenMaya as om
from maya import cmds
from ... import utils
from ..irGlobal import Controller
from ..irSystem import SplineIK
from .module import Module


class Spine(Module):
    def __init__(self, prefix='', joints=[]):
        super(Spine, self).__init__(prefix, joints)
        self.__ikSystem = None
        self.__fkSystem = None

    def ikSystem(self):
        return self.__ikSystem

    def fkSystem(self):
        return self.__fkSystem

    def _buildGroups(self):
        super(Spine, self)._buildGroups()
        self.__controllerGrp = cmds.group(n='{}ctrl_grp'.format(self.longName), empty=True)
        cmds.parent(self.__controllerGrp, self._topGrp)

    def build(self):
        super(Spine, self).build()
        self.__buildControls()

    def _buildSystems(self):
        ikJoints = utils.buildNewJointChain(self._initJoints, searchStr='init', replaceStr='ik')
        self.__ikSystem = SplineIK(self.longName+'ik_', ikJoints, numControllers=4)
        if self._negateScaleX:
            self.__ikSystem.negateScaleX = True
        self.__ikSystem.build()
        self.__ikSystem.setupAdvancedTwist()
        self.__ikSystem.setupStretch()
        self.__ikSystem.setupHybridIK()
        self.__ikSystem.controllers[0].hide()
        self.__ikSystem.controllers[-1].name = 'chest_ctrl'.format(self.longName)
        utils.removeConnections(self.__ikSystem.controllers[1].zeroGrp)
        for ctrl in self.__ikSystem.controllers[1:-1]:
            ctrl.shape = Controller.SHAPE.CIRCLE
        shapeOffset = (self.__ikSystem.aimSign * utils.axisStrToVector(self.__ikSystem.aimAxis())) * utils.getDistance(self.__ikSystem.joints[int(len(self.__ikSystem.joints)*0.5)], self.__ikSystem.joints[-1])
        self.__ikSystem.controllers[-1].shapeOffset = shapeOffset
        self._addSystems(self.__ikSystem)

        # fkJoints = Spine.buildFKJoints(self._prefix, self._initJoints, 4)
        # self.__fkSystem = FK(self._prefix+'fk_', fkJoints)
        # if self._negateScaleX:
        #     self.__fkSystem.negateSclaeX = True
        # self.__fkSystem.build()
        # self.__fkSystem.controllers[0].hide()
        # for ctrl in self.__fkSystem.controllers:
        #     ctrl.lockHideChannels(channels=['translate', 'scale', 'visibility'])
        # self.addSystems(self.__fkSystem)

        self._sysJoints = self.__ikSystem.joints

    @staticmethod
    def buildFKJoints(prefix, joints, numFKJoints):
        fkJnts = []

        startJntPnt = om.MPoint(cmds.xform(joints[0], q=True, rp=True, ws=True))
        endJntPnt = om.MPoint(cmds.xform(joints[-1], q=True, rp=True, ws=True))
        startToEndJntVec = endJntPnt - startJntPnt
        fkJntSegments = numFKJoints - 1
        increment = 1.0 / fkJntSegments
        for i in range(numFKJoints):
            fkJnt = cmds.createNode('joint', n='{}{:02d}_fk'.format(prefix, i))
            fkJntPos = om.MVector(startJntPnt) + startToEndJntVec * (increment * i)
            cmds.xform(fkJnt, t=fkJntPos, ws=True)
            closestJnt = utils.findClosestObject(fkJntPos, joints)
            cmds.matchTransform(fkJnt, closestJnt, rotation=True)
            fkJnts.append(fkJnt)

        utils.makeHierarchy(fkJnts)

        return fkJnts

    def _connectSystems(self):
        pass
        # cmds.parentConstraint(self.__fkSystem.controllers[-1], self.__ikSystem.controllers[-1].zeroGrp, mo=True)

    def __buildControls(self):
        pelvisCtrl = Controller('pelvis_ctrl', Controller.SHAPE.CUBE)
        cmds.matchTransform(pelvisCtrl.zeroGrp, self.__ikSystem.joints[1], position=True, rotation=True)
        cmds.parentConstraint(pelvisCtrl, self.__ikSystem.controllers[0], mo=True)
        pelvisCtrl.shapeOffset = utils.getDistance(self.__ikSystem.joints[0], self.__ikSystem.joints[1]) * (-self.__ikSystem.aimSign * utils.axisStrToVector(self.__ikSystem.aimAxis()))
        cmds.parent(pelvisCtrl.zeroGrp, self.__controllerGrp)
        pelvisCtrl.lockHideChannels(['scale', 'visibility'])
        self._controllers.append(pelvisCtrl)
        self.addMembers(pelvisCtrl.allNodes)
        pelvisCtrl.shapeOffset = -(self.__ikSystem.aimSign * utils.axisStrToVector(self.__ikSystem.aimAxis())) * utils.getDistance(self.__ikSystem.joints[int(len(self.__ikSystem.joints)*0.5)], self.__ikSystem.joints[0])

        upBodyCtrl = Controller('upBody_ctrl', Controller.SHAPE.ARROW_QUAD, direction=Controller.DIRECTION.Y)
        cmds.matchTransform(upBodyCtrl.zeroGrp, self._initJoints[0], position=True)
        cmds.parent(self._topGrp.getChildren(), upBodyCtrl)
        self._topGrp | upBodyCtrl.zeroGrp
        self._controllers.append(upBodyCtrl)
        self.addMembers(upBodyCtrl.allNodes)
