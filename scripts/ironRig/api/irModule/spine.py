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
        self.__ikSystem = SplineIK(self._prefix+'ik_', ikJoints, numControllers=2)
        if self._negateScaleX:
            self.__ikSystem.negateSclaeX = True
        self.__ikSystem.build()
        self.__ikSystem.setupAdvancedTwist()
        self.__ikSystem.setupStretch()
        self.__ikSystem.controllers()[0].hide()
        self.__ikSystem.controllers()[-1].name = 'chest_ctrl'.format(self._prefix)
        shapeOffset = utils.getDistance(self.__ikSystem.joints()[0], self.__ikSystem.joints()[1]) * (self.__ikSystem.aimSign() * utils.axisToVector(self.__ikSystem.aimAxis()))
        self.__ikSystem.controllers()[-1].shapeOffset = shapeOffset
        self.addSystems(self.__ikSystem)

        fkJoints = Spine.buildFKJoints(self._prefix, self._initJoints, 4)
        self.__fkSystem = FK(self._prefix+'fk_', fkJoints)
        if self._negateScaleX:
            self.__fkSystem.negateSclaeX = True
        self.__fkSystem.build()
        self.__fkSystem.controllers()[0].hide()
        for ctrl in self.__fkSystem.controllers():
            ctrl.lockChannels(channels=['translate', 'scale', 'visibility'])
        self.addSystems(self.__fkSystem)

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
        self.__fkSystem.controllers()[-1].constraint(self.__ikSystem.controllers()[-1].zeroGrp(), parent=True)

    def __buildControls(self):
        pelvisCtrl = Controller('pelvis_ctrl', Controller.SHAPE.CUBE)
        pelvisCtrl.matchTo(self.__ikSystem.joints()[1], position=True, rotation=True)
        pelvisCtrl.constraint(self.__ikSystem.controllers()[0].transform(), parent=True)
        shapeOffset = utils.getDistance(self.__ikSystem.joints()[0], self.__ikSystem.joints()[1]) * (-self.__ikSystem.aimSign() * utils.axisToVector(self.__ikSystem.aimAxis()))
        pelvisCtrl.shapeOffset = shapeOffset
        pm.parent(pelvisCtrl.zeroGrp(), self.__controllerGrp)
        pelvisCtrl.lockChannels(['scale', 'visibility'])
        self._controllers.append(pelvisCtrl)
        self.addMembers(pelvisCtrl.controllerNode())

    def _connectOutputs(self):
        for sysJnt, outJnt in zip(self.__ikSystem.joints(), self._outJoints):
            pm.pointConstraint(sysJnt, outJnt, mo=True)
            pm.orientConstraint(sysJnt, outJnt, mo=True)
            utils.connectTransform(sysJnt, outJnt, ['scale'], ['X', 'Y', 'Z'])
