import pymel.core as pm
from ... import utils
from ..irGlobal import Controller
from .master import Master


class GlobalMaster(Master):
    def __init__(self, rootJoint, buildRootController=False):
        self._mastersGrp = None

        super(GlobalMaster, self).__init__(prefix='controlRig_',)

        self._rootJoint = pm.PyNode(rootJoint)
        self._globalController = None
        self._mainController = None
        self._buildRootController=buildRootController

    def mainController(self):
        return self._mainController

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
            self._mastersGrp | master.topGrp()
        self._masters.extend(masters)

    def build(self):
        super(GlobalMaster, self).build()
        pm.parent([self._modulesGrp, self._mastersGrp], self._mainController)

        # for jnt in self._rootJoint.getChildren(type='joint'):
        #     jnt.segmentScaleCompensate.set(False)

    def _createGroups(self):
        super(GlobalMaster, self)._createGroups()
        self._spaceSwtichGrp = pm.createNode('transform', n='spaceSwitches_grp'.format(self._prefix))
        self._spaceSwtichGrp.hide()
        self._mastersGrp = pm.createNode('transform', n='{}masters'.format(self._prefix))
        self._topGrp | self._spaceSwtichGrp
        self._topGrp.rename('controlRig')

    def _buildSystems(self):
        pass

    def _buildControls(self):
        self._globalController = Controller(name='global_ctrl', color=Controller.COLOR.YELLOW, direction=Controller.DIRECTION.Y)
        GlobalMaster.setupGlobalScaleAttr(self._globalController)
        self._globalController.lockHideChannels(channels=['scale', 'visibility'], axes=['X', 'Y', 'Z'])
        self._mainController = Controller(name='main_ctrl', color=Controller.COLOR.DARKBLUE, direction=Controller.DIRECTION.Y, size=0.9)
        self._mainController.lockHideChannels(channels=['scale', 'visibility'], axes=['X', 'Y', 'Z'])
        self.setupVisibilityAttr(self._mainController)
        self._controllers = [self._globalController, self._mainController]

        self._globalController | self._mainController
        pm.parent(self._globalController.zeroGrp(), self._topGrp)

        self.addMembers(self._globalController.controllerNode(), self._mainController.controllerNode())

        if self._buildRootController:
            rootCtrl = Controller(name='root_ctrl', color=Controller.COLOR.GREEN, shape=Controller.SHAPE.TRIANGLE, direction=Controller.DIRECTION.Y)
            pm.parentConstraint(rootCtrl, self._rootJoint, mo=True)
            pm.parent(rootCtrl.zeroGrp(), self._globalController)
            self.addMembers(rootCtrl.controllerNode())

        pm.parentConstraint(self._globalController, self._rootJoint, mo=True)
        self._globalController.scale >> self._rootJoint.scale

    def postBuild(self):
        super(GlobalMaster, self).postBuild()
        self._globalController.color = Controller.COLOR.YELLOW
        self._mainController.size = self._controllerSize * 0.85

    @staticmethod
    def setupGlobalScaleAttr(globalController):
        pm.addAttr(globalController, ln='globalScale', at='double', min=0.01, dv=1.0, keyable=True)
        for scaleAttr in [ch + axis for ch in 's' for axis in 'xyz']:
            globalController.globalScale >> globalController.attr(scaleAttr)

    def setupVisibilityAttr(self, mainController):
        geoLayer = pm.createNode('displayLayer', n='geo_layer')
        pm.addAttr(mainController, ln='geometryVis', at='enum', en='Normal:Template:Reference', dv=2, keyable=True)
        pm.setAttr(mainController.geometryVis, channelBox=True)
        mainController.geometryVis >> geoLayer.displayType
        geoLayer.addMembers(utils.getMeshesFromJoints(pm.ls(self._rootJoint, dag=True, type='joint')))
