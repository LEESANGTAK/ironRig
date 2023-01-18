from ... import utils
from ..irGlobal import Controller
from .system import System


class FK(System):
    def __init__(self, prefix='new_fk_', joints=[]):
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
            ctrl.matchTo(jnt, position=True, rotation=True)
            if self._negateScaleX and utils.getWorldPoint(ctrl.transform()).x < 0.0:
                ctrl.zeroGrp().sx.set(-1)
            ctrl.constraint(jnt, parent=True)
            ctrl.connect(jnt, scale=True)
            ctrl.lockChannels(['scale', 'visibility'], ['X', 'Y', 'Z'])
            ctrls.append(ctrl)
            self.addMembers(ctrl.controllerNode())

        utils.makeHierarchy(ctrls)

        self._controllerGrp | ctrls[0].zeroGrp()

        self._controllers = ctrls
