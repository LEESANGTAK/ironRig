from maya import cmds
from ... import utils
from ..irGlobal.controller import Controller
from .system import System


class FK(System):
    def __init__(self, name='new', side=System.SIDE.CENTER, joints=[]):
        super().__init__(name, side, System.TYPE.FK_SYSTEM, joints)
        self._endController = False

    @property
    def endController(self):
        return self._endController

    @endController.setter
    def endController(self, val):
        self._endController = val

    def _buildControls(self):
        ctrls = []

        for i, jnt in enumerate(self._joints):
            if jnt == self._joints[-1] and not self._endController:
                break
            ctrl = Controller('{}_{:02d}'.format(self.shortName, i))
            ctrl.direction = utils.axisStrToEnum(self._aimAxis)
            cmds.matchTransform(ctrl.zeroGrp, jnt, position=True, rotation=True)
            self.addMembers(cmds.parentConstraint(ctrl, jnt, mo=True))
            cmds.connectAttr('{}.scale'.format(ctrl), '{}.scale'.format(jnt))
            ctrl.lockHideChannels(['scale', 'visibility'], ['X', 'Y', 'Z'])
            ctrls.append(ctrl)
            self.addMembers(ctrl.allNodes)

        for ctrl in ctrls:
            if self._mirrorTranslate and utils.getWorldPoint(ctrl).x < 0.0:
                cmds.setAttr('{}.sx'.format(ctrl.zeroGrp), -1)

        Controller.makeHierarchy(ctrls)
        cmds.parent(ctrls[0].zeroGrp, self._controllerGrp)
        self._controllers = ctrls
