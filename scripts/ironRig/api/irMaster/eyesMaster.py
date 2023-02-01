import pymel.core as pm
from ... import utils
from ..irGlobal import Controller
from .master import Master


class EyesMaster(Master):
    def __init__(self, prefix=''):
        super(EyesMaster, self).__init__(prefix)

        self.__controller = None

    def controller(self):
        return self.__controller

    def _buildControls(self):
        self.__controller = Controller('{}ctrl'.format(self._prefix), Controller.SHAPE.LOCATOR, Controller.COLOR.GREEN, self._modules[0].controllerSize*2)
        self.__controller.lockChannels(['visibility'])
        modulesAimCtrlZeroGrps = [eyeModule.aimSystem().controllers()[0].zeroGrp() for eyeModule in self._modules]
        aimCtrlsCenterPnt = utils.getCenterVector(modulesAimCtrlZeroGrps)
        pm.xform(self.__controller.zeroGrp(), t=aimCtrlsCenterPnt, ws=True)
        for aimCtrlZeroGrp in modulesAimCtrlZeroGrps:
            self.__controller.constraint(aimCtrlZeroGrp, parent=True)

        self._topGrp | self.__controller.zeroGrp()
        self.addMembers(self.__controller.controllerNode())
