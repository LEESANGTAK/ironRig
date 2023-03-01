import pymel.core as pm
from ..irGlobal import Controller
from .master import Master


class GlobalMaster(Master):
    def __init__(self, rootJoint=None):
        self.__mastersGrp = None

        super(GlobalMaster, self).__init__(prefix='controlRig_',)

        self.__rootJoint = pm.PyNode(rootJoint)
        self.__globalController = None
        self.__mainController = None

    def mainController(self):
        return self.__mainController

    def addModules(self, *args):
        modules = sum([module if isinstance(module, list) else [module] for module in args], [])
        for module in modules:
            self.set().forceElement(module.set())
            self._modulesGrp | module.topGrp()
            module.master = self
        self._modules.extend(modules)

    def addMasters(self, *args):
        masters = sum([master if isinstance(master, list) else [master] for master in args], [])
        for master in masters:
            self.set().forceElement(master.set())
            self.__mastersGrp | master.topGrp()
        self._masters.extend(masters)

    def build(self):
        super(GlobalMaster, self).build()
        pm.parent([self._modulesGrp, self.__mastersGrp], self.__mainController)

        for jnt in self.__rootJoint.getChildren(type='joint'):
            jnt.segmentScaleCompensate.set(False)

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
        self._controllers = [self.__globalController, self.__mainController]

        self.__globalController | self.__mainController
        pm.parent(self.__globalController.zeroGrp(), self._topGrp)

        pm.parentConstraint(self.__mainController, self.__rootJoint, mo=True)
        self.__globalController.scale >> self.__rootJoint.scale

        self.addMembers(self.__globalController.controllerNode(), self.__mainController.controllerNode())

    def postBuild(self):
        super(GlobalMaster, self).postBuild()
        self.__globalController.color = Controller.COLOR.YELLOW
        self.__mainController.size = self._controllerSize * 0.85

    @staticmethod
    def setupGlobalScaleAttr(transform):
        pm.addAttr(transform, ln='globalScale', at='double', min=0.01, dv=1.0, keyable=True)
        for scaleAttr in [ch + axis for ch in 's' for axis in 'xyz']:
            transform.globalScale >> transform.attr(scaleAttr)
