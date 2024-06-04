from maya import cmds
from ... import utils
from ..irGlobal import Container
from ..irGlobal import Controller


class Master(Container):
    """
    Master contains modules, controllers.
    Master controller controls modules behavior.
    """
    def __init__(self, name=''):
        super(Master, self).__init__(name)

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
        self._topGrp = cmds.rename(self._topGrp, '{}_master'.format(self.shortName))
        self._modulesGrp = cmds.createNode('transform', n='{}_modules'.format(self.shortName))
        cmds.parent(self._modulesGrp, self._topGrp)

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
            cmds.sets(module.set, forceElement=self.set)
            cmds.parent(module.topGrp, self._modulesGrp)

    def _buildControls(self):
        raise NotImplementedError()

    def postBuild(self):
        raise NotImplementedError()

    def attachTo(self, module):
        closestOutJnt = utils.findClosestObject(cmds.xform(self._topGrp, q=True, rp=True, ws=True), module.outJoints)
        cmds.matchTransform(self._topGrp, closestOutJnt, pivots=True)
        cmds.parentConstraint(closestOutJnt, self._topGrp, mo=True)
        cmds.connectAttr('{}.scale'.format(closestOutJnt), '{}.scale'.format(self._topGrp))
        outJnts = []
        for module in self._modules:
            outJnts.extend(module.outJoints)
        for outJnt in outJnts:
            scaleMult = cmds.listConnections(outJnt, destination=False, type='multiplyDivide')[0]
            cmds.connectAttr('{}.scale'.format(closestOutJnt), '{}.input2'.format(scaleMult))

    def delete(self):
        for module in self._modules:
            module.delete()
        for master in self._masters:
            master.delete()
        self._modules = []
        self._masters = []
        self._controllers = []
        super(Master, self).delete()
