from collections import OrderedDict
from maya import cmds
from ... import utils
from ..irGlobal.controller import Controller
from .master import Master


class GlobalMaster(Master):
    def __init__(self, rootJoint, buildRootController=False):
        super().__init__(name='controlRig')

        self._spaceSwitchBuilders = []
        self._rootJoint = rootJoint
        self._globalController = None
        self._mainController = None
        self._rootController = None
        self._buildRootController = buildRootController

    @property
    def mainController(self):
        return self._mainController

    def addModules(self, *args):
        modules = sum([module if isinstance(module, list) else [module] for module in args], [])
        for module in modules:
            cmds.sets(module.set, forceElement=self.set)
            cmds.parent(module.topGrp, self._modulesGrp)
            module.master = self
        self._modules.extend(modules)

    def addMasters(self, *args):
        masters = sum([master if isinstance(master, list) else [master] for master in args], [])
        for master in masters:
            cmds.sets(master.set, forceElement=self.set)
            cmds.parent(master.topGrp, self._mastersGrp)
        self._masters.extend(masters)

    def addSpaceSwitchBuilder(self, *args):
        spaceSwitchBuilders = sum([spaceSwitchBuilder if isinstance(spaceSwitchBuilder, list) else [spaceSwitchBuilder] for spaceSwitchBuilder in args], [])
        self._spaceSwitchBuilders.extend(spaceSwitchBuilders)

    def build(self):
        super().build()
        cmds.parent([self._modulesGrp, self._mastersGrp], self._mainController)
        self._set = cmds.rename(self._set, 'controlRig_sets')
        for jnt in cmds.listRelatives(self._rootJoint, children=True, type='joint'):
            cmds.setAttr('{}.segmentScaleCompensate'.format(jnt), False)

    def _buildGroups(self):
        super()._buildGroups()
        self._spaceSwtichGrp = cmds.createNode('transform', n='spaceSwitches_grp')
        cmds.hide(self._spaceSwtichGrp)
        self._mastersGrp = cmds.createNode('transform', n='{}_masters'.format(self._name))
        self._modulesGrp = cmds.rename(self._modulesGrp, '{}_modules'.format(self._name))
        self._topGrp = cmds.rename(self._topGrp, 'controlRig')
        cmds.parent(self._spaceSwtichGrp, self._topGrp)

    def _buildSystems(self):
        pass

    def _buildControls(self):
        self._globalController = Controller(name='global', color=Controller.COLOR.YELLOW, size=30, direction=Controller.DIRECTION.Y)
        GlobalMaster.setupGlobalScaleAttr(self._globalController)
        self._globalController.lockHideChannels(channels=['scale', 'visibility'], axes=['X', 'Y', 'Z'])

        self._mainController = Controller(name='main', color=Controller.COLOR.DARKBLUE, size=25, direction=Controller.DIRECTION.Y)
        self._mainController.lockHideChannels(channels=['scale', 'visibility'], axes=['X', 'Y', 'Z'])
        self.setupVisibilityAttr(self._mainController)

        self._controllers = [self._globalController, self._mainController]

        cmds.parent(self._mainController.zeroGrp, self._globalController)
        cmds.parent(self._globalController.zeroGrp, self._topGrp)

        self.addMembers(self._globalController.allNodes, self._mainController.allNodes)

        if self._buildRootController:
            self._rootController = Controller(name='root', color=Controller.COLOR.GREEN, shape=Controller.SHAPE.TRIANGLE, size=20, direction=Controller.DIRECTION.Y)
            cmds.parentConstraint(self._rootController, self._rootJoint, mo=True)
            cmds.parent(self._rootController.zeroGrp, self._globalController)
            self.addMembers(self._rootController.allNodes)
        else:
            cmds.parentConstraint(self._globalController, self._rootJoint, mo=True)
        cmds.connectAttr('{}.scale'.format(self._globalController), '{}.scale'.format(self._rootJoint))

    @staticmethod
    def setupGlobalScaleAttr(globalController):
        cmds.addAttr(globalController, ln='globalScale', at='double', min=0.01, dv=1.0, keyable=True)
        for scaleAttr in [ch + axis for ch in 's' for axis in 'xyz']:
            cmds.connectAttr('{}.globalScale'.format(globalController), '{}.{}'.format(globalController, scaleAttr))

    def setupVisibilityAttr(self, mainController):
        geoLayer = cmds.createNode('displayLayer', n='geo_layer')
        cmds.addAttr(mainController, ln='geometryVis', at='enum', en='Normal:Template:Reference', dv=2, keyable=True)
        cmds.setAttr('{}.geometryVis'.format(mainController), channelBox=True)
        cmds.connectAttr('{}.geometryVis'.format(mainController), '{}.displayType'.format(geoLayer))
        cmds.editDisplayLayerMembers(geoLayer, utils.getMeshesFromJoints(cmds.ls(self._rootJoint, dag=True, type='joint')))

    def serialize(self):
        return OrderedDict([
            ('id', self._id),
            ('rootJoint', self._rootJoint),
            ('buildRootController', self._buildRootController),
            ('controllers', [ctrl.serialize() for ctrl in [self._globalController, self._mainController, self._rootController]])
        ])

    def deserialize(self, data, hashmap={}):
        hashmap[data.get('id')] = self
        self._id = data.get('id')

        self.build()

        # Set controllers shapes
        for ctrl, ctrlData in zip([self._globalController, self._mainController, self._rootController], data.get('controllers')):
            ctrl.deserialize(ctrlData, hashmap)
