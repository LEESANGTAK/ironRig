import pymel.core as pm
from ... import utils
from ..irGlobal import Container
from ..irGlobal import Controller


class Master(Container):
    """
    Master contains modules, controllers.
    Master controls modules behavior.
    """
    def __init__(self, prefix=''):
        super(Master, self).__init__(prefix)
        self._modules = []
        self._masters = []
        self._modulesGrp = None

        self._controllers = []

        self._controllerColor = Controller.COLOR.GREEN
        self._controllerScale = 1

        self._createGroups()

    @property
    def controllerColor(self):
        return self._controllerColor

    @controllerColor.setter
    def controllerColor(self, color):
        self._controllerColor = color

    @property
    def controllerScale(self):
        return self._controllerScale

    @controllerScale.setter
    def controllerScale(self, scale):
        self._controllerScale = scale

    def _createGroups(self):
        self._topGrp.rename('{}master'.format(self._prefix))
        self._modulesGrp = pm.createNode('transform', n='{}modules'.format(self._prefix))
        self._topGrp | self._modulesGrp

    def addModules(self, *args):
        modules = sum([module if isinstance(module, list) else [module] for module in args], [])
        self._modules.extend(modules)

    def build(self):
        self._buildSystems()
        self._buildControls()

    def _buildSystems(self):
        for module in self._modules:
            self.set().forceElement(module.set())
            self._modulesGrp | module.topGrp()

    def _buildControls(self):
        raise NotImplementedError()

    def postBuild(self):
        for ctrl in self._controllers:
            ctrl.color = self._controllerColor
            ctrl.scale = self._controllerScale

    def attachTo(self, module):
        closestOutJnt = utils.findClosestObject(pm.xform(self._topGrp, q=True, rp=True, ws=True), module.outJoints())
        pm.matchTransform(self._topGrp, closestOutJnt, pivots=True)
        pm.parentConstraint(closestOutJnt, self._topGrp, mo=True)

    def remove(self):
        for module in self._modules:
            module.remove()
        for master in self._masters:
            master.remove()
        self._modules = []
        self._masters = []
        self._controllers = []
        super(Master, self).remove()
