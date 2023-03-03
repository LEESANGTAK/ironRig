import pymel.core as pm
from ... import utils
from ..irGlobal import Controller
from .system import System


class FK(System):
    def __init__(self, prefix='', joints=[]):
        super(FK, self).__init__(prefix, joints)

        self.__endController = False

    @property
    def endController(self):
        return self.__endController

    @endController.setter
    def endController(self, val):
        self.__endController = val

    def _buildControls(self):
        ctrls = []

        # Create controllers
        for jnt in self._joints:
            if jnt == self._joints[-1] and not self.__endController:
                break
            ctrl = Controller('{}_ctrl'.format(jnt))
            ctrl.direction = utils.axisToVector(self._aimAxis)
            pm.matchTransform(ctrl.zeroGrp(), jnt, position=True, rotation=True)
            if self._negateScaleX and utils.getWorldPoint(ctrl).x < 0.0:
                ctrl.zeroGrp().sx.set(-1)
            pm.parentConstraint(ctrl, jnt, mo=True)
            ctrl.scale >> jnt.scale
            ctrl.lockHideChannels(['scale', 'visibility'], ['X', 'Y', 'Z'])
            ctrls.append(ctrl)
            self.addMembers(ctrl.controllerNode())

        utils.makeHierarchy(ctrls)

        self._controllerGrp | ctrls[0].zeroGrp()

        self._controllers = ctrls
