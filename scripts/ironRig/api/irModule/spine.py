import pymel.core as pm
from ... import utils
from ..irGlobal import Controller
from ..irSystem import FK
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
        self.__controllerGrp = pm.group(n='{}ctrl_grp'.format(self._prefix), empty=True)
        pm.parent(self.__controllerGrp, self._topGrp)

    def build(self):
        super(Spine, self).build()
        self.__buildControls()

    def _buildSystems(self):
        ikJoints = utils.buildNewJointChain(self._initJoints, searchStr='init', replaceStr='ik')
        self.__ikSystem = SplineIK(self._prefix+'ik_', ikJoints, numControllers=4)
        if self._negateScaleX:
            self.__ikSystem.negateSclaeX = True
        self.__ikSystem.build()
        self.__ikSystem.setupAdvancedTwist()
        self.__ikSystem.setupStretch()
        self.__ikSystem.setupHybridIK()
        self.__ikSystem.controllers()[0].hide()
        self.__ikSystem.controllers()[-1].name = 'chest_ctrl'.format(self._prefix)
        utils.removeConnections(self.__ikSystem.controllers()[1].zeroGrp())
        for ctrl in self.__ikSystem.controllers()[1:-1]:
            ctrl.shape = Controller.SHAPE.CIRCLE
        shapeOffset = (self.__ikSystem.aimSign() * utils.axisToVector(self.__ikSystem.aimAxis())) * utils.getDistance(self.__ikSystem.joints()[int(len(self.__ikSystem.joints())*0.5)], self.__ikSystem.joints()[-1])
        self.__ikSystem.controllers()[-1].shapeOffset = shapeOffset
        self.addSystems(self.__ikSystem)

        # fkJoints = Spine.buildFKJoints(self._prefix, self._initJoints, 4)
        # self.__fkSystem = FK(self._prefix+'fk_', fkJoints)
        # if self._negateScaleX:
        #     self.__fkSystem.negateSclaeX = True
        # self.__fkSystem.build()
        # self.__fkSystem.controllers()[0].hide()
        # for ctrl in self.__fkSystem.controllers():
        #     ctrl.lockHideChannels(channels=['translate', 'scale', 'visibility'])
        # self.addSystems(self.__fkSystem)

        self._sysJoints = self.__ikSystem.joints()

    @staticmethod
    def buildFKJoints(prefix, joints, numFKJoints):
        fkJnts = []

        startJntPnt = pm.dt.Point(pm.xform(joints[0], q=True, rp=True, ws=True))
        endJntPnt = pm.dt.Point(pm.xform(joints[-1], q=True, rp=True, ws=True))
        startToEndJntVec = endJntPnt - startJntPnt
        fkJntSegments = numFKJoints - 1
        increment = 1.0 / fkJntSegments
        for i in range(numFKJoints):
            fkJnt = pm.createNode('joint', n='{}{:02d}_fk'.format(prefix, i))
            fkJntPos = pm.dt.Vector(startJntPnt) + startToEndJntVec * (increment * i)
            pm.xform(fkJnt, t=fkJntPos, ws=True)
            closestJnt = utils.findClosestObject(fkJntPos, joints)
            pm.matchTransform(fkJnt, closestJnt, rotation=True)
            fkJnts.append(fkJnt)

        utils.makeHierarchy(fkJnts)

        return fkJnts

    def _connectSystems(self):
        pass
        # pm.parentConstraint(self.__fkSystem.controllers()[-1], self.__ikSystem.controllers()[-1].zeroGrp(), mo=True)

    def __buildControls(self):
        pelvisCtrl = Controller('pelvis_ctrl', Controller.SHAPE.CUBE)
        pm.matchTransform(pelvisCtrl.zeroGrp(), self.__ikSystem.joints()[1], position=True, rotation=True)
        pm.parentConstraint(pelvisCtrl, self.__ikSystem.controllers()[0], mo=True)
        shapeOffset = utils.getDistance(self.__ikSystem.joints()[0], self.__ikSystem.joints()[1]) * (-self.__ikSystem.aimSign() * utils.axisToVector(self.__ikSystem.aimAxis()))
        pelvisCtrl.shapeOffset = shapeOffset
        pm.parent(pelvisCtrl.zeroGrp(), self.__controllerGrp)
        pelvisCtrl.lockHideChannels(['scale', 'visibility'])
        self._controllers.append(pelvisCtrl)
        self.addMembers(pelvisCtrl.controllerNode())
        shapeOffset = -(self.__ikSystem.aimSign() * utils.axisToVector(self.__ikSystem.aimAxis())) * utils.getDistance(self.__ikSystem.joints()[int(len(self.__ikSystem.joints())*0.5)], self.__ikSystem.joints()[0])
        pelvisCtrl.shapeOffset = shapeOffset
