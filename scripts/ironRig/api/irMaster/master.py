from collections import OrderedDict
from maya import cmds
from ... import utils
from ..irGlobal.container import Container
from ..irGlobal.controller import Controller


class Master(Container):
    """
    Master contains modules, controllers.
    Master controller controls modules.
    """
    def __init__(self, name='', side=Container.SIDE.CENTER):
        super().__init__(name, side, Container.TYPE.MASTER)

        self._modules = []
        self._masters = []
        self._modulesGrp = None

        self._controllers = []

        self._controllerColor = Controller.COLOR.GREEN
        self._controllerSize = 1

        self._set = cmds.createNode('objectSet', n='{}_set'.format(self.longName))
        self._buildGroups()

    def __repr__(self):
        return "irMaster.{}('{}')".format(self.__class__.__name__, self.longName)

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

    def addModules(self, *args):
        modules = sum([module if isinstance(module, list) else [module] for module in args], [])
        for module in modules:
            if not module in self._modules:
                cmds.sets(module.set, forceElement=self._set)
                cmds.parent(module.topGrp, self._modulesGrp)
                module.master = self
                self._modules.append(module)

    def removeModules(self, *args):
        modules = sum([module if isinstance(module, list) else [module] for module in args], [])
        for module in modules:
            if module in self._modules:
                self._modules.remove(module)
                module.master = None

    def build(self):
        self._buildSystems()
        self._buildControls()

    def _buildGroups(self):
        self._topGrp = cmds.createNode('transform', n='{}_master'.format(self.shortName))
        self._modulesGrp = cmds.createNode('transform', n='{}_modules'.format(self.shortName))
        cmds.parent(self._modulesGrp, self._topGrp)

    def _buildSystems(self):
        pass
        # for module in self._modules:
        #     cmds.sets(module.set, forceElement=self._set)
        #     cmds.parent(module.topGrp, self._modulesGrp)

    def _buildControls(self):
        raise NotImplementedError()

    def postBuild(self):
        raise NotImplementedError()

    def attachTo(self, parentModule, parentModuleOutJointIndex=-1000000):
        # Connect top group with a parent space out joint
        parentSpace = None
        if parentModuleOutJointIndex > -1000000:
            parentSpace = parentModule.outJoints[parentModuleOutJointIndex]
        else:
            parentSpace = utils.findClosestObject(utils.getWorldPoint(self._topGrp), parentModule.outJoints)
        cmds.matchTransform(self._topGrp, parentSpace, pivots=True)
        cnst = cmds.parentConstraint(parentSpace, self._topGrp, mo=True)[0]
        cmds.connectAttr('{}.scale'.format(parentSpace), '{}.scale'.format(self._topGrp))

        # Connect scale of parent sapce out joint to out jotins in modules
        outJnts = []
        for mod in self._modules:
            outJnts.extend(mod.outJoints)
        outJntConnections = []
        for outJnt in outJnts:
            scaleMult = cmds.listConnections(outJnt, destination=False, type='multiplyDivide')[0]
            cmds.connectAttr('{}.scale'.format(parentSpace), '{}.input2'.format(scaleMult), f=True)
            outJntConnections.append(('{}.scale'.format(parentSpace), '{}.input2'.format(scaleMult)))

        self._attachInfo['nodes'] = [cnst]
        self._attachInfo['connections'] = [('{}.scale'.format(parentSpace), '{}.scale'.format(self._topGrp))] + outJntConnections

        super().attachTo(parentModule, parentModuleOutJointIndex)

    def clear(self):
        for module in self._modules:
            module.clear()
        for master in self._masters:
            master.clear()
        self._modules = []
        self._masters = []
        self._controllers = []
        super().clear()

    def serialize(self):
        parentModuleID = self._parentModule.id if self._parentModule else 0
        return OrderedDict([
            ('id', self._id),
            ('type', self.__class__.__name__),
            ('parentModuleID', parentModuleID),
            ('parentModuleOutJointIndex', self._parentModuleOutJointIndex),
            ('name', self._name),
            ('side', self._side),
            ('modules', [mod.serialize() for mod in self._modules]),
            ('controllerSize', self._controllerSize),
            ('controllerColor', self._controllerColor),
            ('controllers', [ctrl.serialize() for ctrl in self._controllers]),
        ])

    def deserialize(self, data, hashmap={}):
        super().deserialize(data, hashmap)

        mods = []
        for modData in data.get('modules'):
            modID = modData.get('id')
            mods.append(hashmap.get(modID))
        self.addModules(mods)

        self.build()

        # Attach to parent module
        parentModuleID = data.get('parentModuleID')
        if parentModuleID:
            parentModule = hashmap.get(parentModuleID)
            self.attachTo(parentModule, data.get('parentModuleOutJointIndex'))

        # Set controllers shapes
        self._controllerSize = data.get('controllerSize')
        self._controllerColor = data.get('controllerColor')
        for ctrl, ctrlData in zip(self._controllers, data.get('controllers')):
            ctrl.deserialize(ctrlData, hashmap)
