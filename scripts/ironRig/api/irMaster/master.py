from maya import cmds
from ... import utils
from ..irGlobal import Container
from ..irGlobal import Controller


class Master(Container):
    """
    Master contains modules, controllers.
    Master controller controls modules behavior.
    """
    def __init__(self, prefix=''):
        super(Master, self).__init__(prefix)

        self._modules = []
        self._masters = []
        self._modulesGrp = None

        self._controllers = []

        self._controllerColor = Controller.COLOR.GREEN
        self._controllerSize = 1

        self._createGroups()

    @property
    def controllerColor(self):
        return self._controllerColor

    @controllerColor.setter
    def controllerColor(self, color):
        self._controllerColor = color

    @property
    def controllerSize(self):
        return self._controllerSize

    @controllerSize.setter
    def controllerSize(self, size):
        self._controllerSize = size

    def _createGroups(self):
        self._topGrp.rename('{}master'.format(self.shortName))
        self._modulesGrp = cmds.createNode('transform', n='{}modules'.format(self.shortName))
        self._topGrp | self._modulesGrp

    def addModules(self, *args):
        modules = sum([module if isinstance(module, list) else [module] for module in args], [])
        for module in modules:
            if not module in self._modules:
                self._modules.append(module)
                module.master = self

    def removeModules(self, *args):
        modules = sum([module if isinstance(module, list) else [module] for module in args], [])
        for module in modules:
            if module in self._modules:
                self._modules.remove(module)
                module.master = None

    def build(self):
        self._buildSystems()
        self._buildControls()

    def _buildSystems(self):
        for module in self._modules:
            self.set.forceElement(module.set)
            self._modulesGrp | module.topGrp

    def _buildControls(self):
        raise NotImplementedError()

    def postBuild(self):
        for ctrl in self._controllers:
            ctrl.color = self._controllerColor
            ctrl.size = self._controllerSize

    def attachTo(self, module):
        closestOutJnt = utils.findClosestObject(cmds.xform(self._topGrp, q=True, rp=True, ws=True), module.outJoints)
        cmds.matchTransform(self._topGrp, closestOutJnt, pivots=True)
        cmds.parentConstraint(closestOutJnt, self._topGrp, mo=True)
        closestOutJnt.scale >> self._topGrp.scale
        outJnts = []
        for module in self._modules:
            outJnts.extend(module.outJoints)
        for outJnt in outJnts:
            scaleMult = outJnt.inputs(type='multiplyDivide')[0]
            closestOutJnt.scale >> scaleMult.input2

    def delete(self):
        for module in self._modules:
            module.remove()
        for master in self._masters:
            master.remove()
        self._modules = []
        self._masters = []
        self._controllers = []
        super(Master, self).delete()
