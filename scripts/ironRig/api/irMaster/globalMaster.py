import pymel.core as pm
from ..irGlobal import Controller
from .master import Master


class GlobalMaster(Master):
    def __init__(self, prefix='controlRig_', skeletonRoot=None, cogJoint=None):
        self.__mastersGrp = None

        super(GlobalMaster, self).__init__(prefix)

        self.__skeletonRoot = pm.PyNode(skeletonRoot)
        self.__cogJoint = pm.PyNode(cogJoint)
        self.__cogJoint.segmentScaleCompensate.set(False)
        self.__globalController = None
        self.__mainController = None
        self.__cogController = None

    def mainController(self):
        return self.__mainController

    def addModules(self, *args):
        modules = sum([module if isinstance(module, list) else [module] for module in args], [])
        for module in modules:
            self.set().forceElement(module.set())
            self._modulesGrp | module.topGrp()
        self._modules.extend(modules)

    def addMasters(self, *args):
        masters = sum([master if isinstance(master, list) else [master] for master in args], [])
        for master in masters:
            self.set().forceElement(master.set())
            self.__mastersGrp | master.topGrp()
        self._masters.extend(masters)

    def build(self):
        super(GlobalMaster, self).build()
        pm.parent([self._modulesGrp, self.__mastersGrp], self.__cogController)

    def _createGroups(self):
        super(GlobalMaster, self)._createGroups()
        self.__spaceSwtichGrp = pm.createNode('transform', n='spaceSwitches_grp'.format(self._prefix))
        self.__spaceSwtichGrp.hide()
        self.__mastersGrp = pm.createNode('transform', n='{}masters'.format(self._prefix))
        self._topGrp | self.__spaceSwtichGrp
        self._topGrp.rename('controlRig')

    def _buildSystems(self):
        pass

    def _buildControls(self):
        self.__globalController = Controller(name='global_ctrl', color=self._controllerColor, direction=Controller.DIRECTION.Y)
        GlobalMaster.setupGlobalScaleAttr(self.__globalController)
        self.__globalController.lockHideChannels(channels=['scale', 'visibility'], axes=['X', 'Y', 'Z'])
        self.__mainController = Controller(name='main_ctrl', color=self._controllerColor, direction=Controller.DIRECTION.Y)
        self.__mainController.lockHideChannels(channels=['scale', 'visibility'], axes=['X', 'Y', 'Z'])
        self.__cogController = Controller(name='cog_ctrl', shape=Controller.SHAPE.ARROW_QUAD, color=self._controllerColor, direction=Controller.DIRECTION.Y)
        self.__cogController.lockHideChannels(channels=['scale', 'visibility'], axes=['X', 'Y', 'Z'])
        pm.matchTransform(self.__cogController.zeroGrp(), self.__cogJoint, position=True)
        self._controllers = [self.__globalController, self.__mainController, self.__cogController]

        self.__globalController | self.__mainController | self.__cogController
        pm.parent(self.__globalController.zeroGrp(), self._topGrp)

        self.__globalController.scale >> self.__skeletonRoot.scale
        pm.parentConstraint(self.__mainController, self.__skeletonRoot, mo=True)

        self.addMembers(self.__globalController.controllerNode(), self.__mainController.controllerNode(), self.__cogController.controllerNode())

    def postBuild(self):
        super(GlobalMaster, self).postBuild()
        self.__globalController.color = Controller.COLOR.YELLOW
        self.__mainController.size = self._controllerSize * 0.85

    @staticmethod
    def setupGlobalScaleAttr(transform):
        pm.addAttr(transform, ln='globalScale', at='double', min=0.01, dv=1.0, keyable=True)
        for scaleAttr in [ch + axis for ch in 's' for axis in 'xyz']:
            transform.globalScale >> transform.attr(scaleAttr)
