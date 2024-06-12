from maya import cmds
from ... import utils
from ..irGlobal.controller import Controller
from .master import Master


class EyesMaster(Master):
    def __init__(self, name='', side=Master.SIDE.CENTER):
        super().__init__(name, side)

        self._controller = None

    @property
    def controller(self):
        return self._controller

    def _buildControls(self):
        self._controller = Controller('{}'.format(self.shortName), Controller.SHAPE.LOCATOR, Controller.COLOR.GREEN, self._modules[0].controllerSize*2)
        self._controller.lockHideChannels(['visibility'])
        modulesAimCtrlZeroGrps = [eyeModule.aimSystem.controllers[0].zeroGrp for eyeModule in self._modules]
        aimCtrlsCenterPnt = utils.getCenterVector(modulesAimCtrlZeroGrps)
        cmds.xform(self._controller.zeroGrp, t=aimCtrlsCenterPnt, ws=True)
        for aimCtrlZeroGrp in modulesAimCtrlZeroGrps:
            cmds.parentConstraint(self._controller, aimCtrlZeroGrp, mo=True)

        cmds.parent(self._controller.zeroGrp, self._topGrp)
        self.addMembers(self._controller.allNodes)
