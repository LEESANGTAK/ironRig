import pymel.core as pm
from ..irGlobal import Controller
from ... import utils
from .system import System


class Aim(System):
    def __init__(self, prefix='', joints=[]):
        super(Aim, self).__init__(prefix, joints)

        self.__isSingleJoint = False
        self.__origJoints = None
        self.__aimLoc = None

        if len(joints) == 1:
            self.__isSingleJoint = True
            self.__origJoints = joints
            self.__addEndJoint()

    def __addEndJoint(self):
        endJoint = pm.createNode('joint', n='{}_end'.format(self._joints[0]))
        endJntPos = utils.getWorldPoint(self._joints[0]) + (pm.dt.Vector.zAxis * 3)
        pm.xform(endJoint, t=endJntPos, ws=True)
        self._joints[0] | endJoint
        self._joints.insert(1, endJoint)

    def joints(self):
        if self.__isSingleJoint:
            return self.__origJoints
        else:
            return self._joints

    def _buildSystems(self):
        super(Aim, self)._buildSystems()
        aimVec = utils.getWorldPoint(self._joints[1]) - utils.getWorldPoint(self._joints[0])
        self.__aimLoc = pm.spaceLocator(n='{}aim_loc'.format(self._prefix))
        pm.xform(self.__aimLoc, t=utils.getWorldPoint(self._joints[0])+aimVec*3, ws=True)
        self._blbxGrp | self.__aimLoc

        upLoc =  pm.spaceLocator(n='{}up_loc'.format(self._prefix))
        pm.matchTransform(upLoc, self._joints[0])
        self._joints[0] | upLoc
        upLoc.translate.set(0, 1, 0)
        self._blbxGrp | upLoc

        pm.aimConstraint(self.__aimLoc,
                         self._joints[0],
                         aimVector=self._aimSign*utils.axisStrToVector(self._aimAxis),
                         upVector=[0, 1, 0],
                         worldUpType='object',
                         worldUpObject=upLoc)

    def _buildControls(self):
        aimCtrl = Controller('{}aim_ctrl'.format(self._prefix), Controller.SHAPE.LOCATOR)
        pm.matchTransform(aimCtrl.zeroGrp(), self.__aimLoc, position=True)
        if self._negateScaleX:
            aimCtrl.zeroGrp().sx.set(-1)
        pm.pointConstraint(aimCtrl, self.__aimLoc, mo=True)
        aimCtrl.lockHideChannels(['rotate', 'scale', 'visibility'], ['X', 'Y', 'Z'])

        self._controllers.append(aimCtrl)
        self._controllerGrp | aimCtrl.zeroGrp()

        self.addMembers(aimCtrl.controllerNode())
