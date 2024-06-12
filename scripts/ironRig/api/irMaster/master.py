from collections import OrderedDict
from maya import cmds
from ... import utils
from ..irGlobal.container import Container
from ..irGlobal.controller import Controller


class Master(Container):
    """
    Master contains modules, controllers.
    Master controller controls modules behavior.
    """
    def __init__(self, name='', side=Container.SIDE.CENTER):
        super().__init__(name, side, Container.TYPE.MASTER)

        self._parent = None
        self._parentOutJointID = -1000000

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

    def attachTo(self, module, outJointIndex=-1000000):
        # Connect top group with a parent space out joint
        parentSpace = None
        if outJointIndex > -1000000:
            parentSpace = module.outJoints[outJointIndex]
        else:
            parentSpace = utils.findClosestObject(utils.getWorldPoint(self._topGrp), module.outJoints)
        cmds.matchTransform(self._topGrp, parentSpace, pivots=True)
        cmds.parentConstraint(parentSpace, self._topGrp, mo=True)
        cmds.connectAttr('{}.scale'.format(parentSpace), '{}.scale'.format(self._topGrp))

        # Connect scale of parent sapce out joint to out jotins in modules
        outJnts = []
        for module in self._modules:
            outJnts.extend(module.outJoints)
        for outJnt in outJnts:
            scaleMult = cmds.listConnections(outJnt, destination=False, type='multiplyDivide')[0]
            cmds.connectAttr('{}.scale'.format(parentSpace), '{}.input2'.format(scaleMult), f=True)

        self._parent = module
        self._parentOutJointID = outJointIndex

    def delete(self):
        for module in self._modules:
            module.delete()
        for master in self._masters:
            master.delete()
        self._modules = []
        self._masters = []
        self._controllers = []
        super().delete()

    def serialize(self):
        parentId = self._parent.id if self._parent else -1
        return OrderedDict([
            ('id', self._id),
            ('type', self.__class__.__name__),
            ('parentID', parentId),
            ('parentOutJointID', self._parentOutJointID),
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
            mods.append(hashmap.get(modData.get('id')))
        self._modules = mods

        self.build()

        # Set controllers shapes
        self.controllerSize = data.get('controllerSize')
        self.controllerColor = data.get('controllerColor')
        for ctrl, ctrlData in zip(self._controllers, data.get('controllers')):
            ctrl.deserialize(ctrlData)

        # Attach to parent module
        parentID = data.get('parentID')
        if parentID:
            parent = hashmap.get(parentID)
            self.attachTo(parent, data.get('parentOutJointID'))
