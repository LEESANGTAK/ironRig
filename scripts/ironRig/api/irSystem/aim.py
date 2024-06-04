from maya.api import OpenMaya as om
from maya import cmds
from ..irGlobal import Controller
from .system import System
from ... import utils


class Aim(System):
    def __init__(self, name='new', side=System.SIDE.CENTER, joints=[]):
        super(Aim, self).__init__(name, side, System.TYPE.AIM_SYSTEM, joints)

        self._isSingleJoint = False
        self._origJoints = None
        self._aimLoc = None

        if len(joints) == 1:
            self._isSingleJoint = True
            self._origJoints = joints
            self._addEndJoint()

    @property
    def joints(self):
        if self._isSingleJoint:
            return self._origJoints
        else:
            return self._joints

    @joints.setter
    def joints(self, joints):
        self._joints = joints

    def _addEndJoint(self):
        endJoint = cmds.createNode('joint', n='{}_end'.format(self._joints[0]))
        endJntPos = utils.getWorldPoint(self._joints[0]) + (om.MVector.kZaxisVector * 3)
        cmds.xform(endJoint, t=endJntPos, ws=True)
        cmds.parent(endJoint, self._joints[0])
        self._joints.insert(1, endJoint)

    def _buildSystems(self):
        super(Aim, self)._buildSystems()
        aimVec = utils.getWorldPoint(self._joints[1]) - utils.getWorldPoint(self._joints[0])
        self._aimLoc = cmds.spaceLocator(n='{}_aim_loc'.format(self.longName))[0]
        cmds.xform(self._aimLoc, t=list(utils.getWorldPoint(self._joints[0]) + (aimVec * 3))[:-1], ws=True)
        cmds.parent(self._aimLoc, self._blbxGrp)

        upLoc =  cmds.spaceLocator(n='{}_up_loc'.format(self.longName))[0]
        cmds.matchTransform(upLoc, self._joints[0])
        cmds.parent(upLoc, self._joints[0])
        cmds.setAttr('{}.translate'.format(upLoc), 0, 1, 0)
        cmds.parent(upLoc, self._blbxGrp)

        self.addMembers(cmds.aimConstraint(
            self._aimLoc,
            self._joints[0],
            aimVector=self._aimSign * utils.axisStrToVector(self._aimAxis),
            upVector=[0, 1, 0],
            worldUpType='object',
            worldUpObject=upLoc
        ))

        self.addMembers(self._aimLoc, upLoc)

    def _buildControls(self):
        aimCtrl = Controller('{}_aim_ctrl'.format(self.longName), Controller.SHAPE.LOCATOR)
        cmds.matchTransform(aimCtrl.zeroGrp, self._aimLoc, position=True)
        if self._negateScaleX:
            cmds.setAttr('{}.sx'.format(aimCtrl.zeroGrp), -1)
        self.addMembers(cmds.pointConstraint(aimCtrl, self._aimLoc, mo=True))
        aimCtrl.lockHideChannels(['rotate', 'scale', 'visibility'], ['X', 'Y', 'Z'])

        self._controllers.append(aimCtrl)
        cmds.parent(aimCtrl.zeroGrp, self._controllerGrp)

        self.addMembers(aimCtrl.allNodes)
