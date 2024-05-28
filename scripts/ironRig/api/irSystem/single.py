from maya import cmds
from .system import System
from ... import utils
from ..irGlobal import Controller


class Single(System):
    def __init__(self, prefix='', joints=[]):
        super(Single, self).__init__(prefix, joints)

    def _getAimAxisInfo(self):
        pass

    def _buildSystems(self):
        cmds.parent(self._joints, self._blbxGrp)

    def _buildControls(self):
        ctrls = []

        for jnt in self._joints:
            ctrl = Controller('{}_ctrl'.format(jnt), color=Controller.COLOR.SKYBLUE)
            cmds.matchTransform(ctrl.zeroGrp, jnt, position=True, rotation=True)
            if self._negateScaleX and utils.getWorldPoint(ctrl).x < 0.0:
                ctrl.zeroGrp.sx.set(-1)
            cmds.parentConstraint(ctrl, jnt, mo=True)
            ctrl.scale >> jnt.scale
            ctrl.lockHideChannels(['visibility'])
            ctrls.append(ctrl)
            self.addMembers(ctrl.controllerNode)

        cmds.parent([ctrl.zeroGrp for ctrl in ctrls], self._controllerGrp)

        self._controllers = ctrls
