from maya import cmds
from .system import System
from ... import utils
from ..irGlobal.controller import Controller


class Single(System):
    def __init__(self, name='new', side=System.SIDE.CENTER, joints=[]):
        super().__init__(name, side, System.TYPE.SINGLE_SYSTEM, joints)

    def _getAimAxisInfo(self):
        pass

    def _buildSystems(self):
        cmds.parent(self._joints, self._blbxGrp)

    def _buildControls(self):
        ctrls = []

        for i, jnt in enumerate(self._joints):
            ctrl = Controller('{}_{:02d}'.format(self.shortName, i), color=Controller.COLOR.SKYBLUE)
            cmds.matchTransform(ctrl.zeroGrp, jnt, position=True, rotation=True)
            if self._mirrorTranslate and utils.getWorldPoint(ctrl).x < 0.0:
                cmds.setAttr('{}.zeroGrp'.format(ctrl), -1)
            cmds.parentConstraint(ctrl, jnt, mo=True)
            cmds.connectAttr('{}.scale'.format(ctrl), '{}.scale'.format(jnt))
            ctrl.lockHideChannels(['visibility'])
            ctrls.append(ctrl)
            self.addMembers(ctrl.allNodes)

        cmds.parent([ctrl.zeroGrp for ctrl in ctrls], self._controllerGrp)
        self._controllers = ctrls
