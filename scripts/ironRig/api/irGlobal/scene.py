import json
from collections import OrderedDict
from .container import Container
from ..irMaster.globalMaster import GlobalMaster
from .spaceSwitchBuilder import SpaceSwitchBuilder
from .customScript import CustomScript
from .factory import Factory
from ...common import logger


class Scene(object):
    def __init__(self):
        super().__init__()
        self._preCustomScripts = []
        self._globalMaster = None
        self._modules = []
        self._masters = []
        self._spaceSwitchBuilders = []
        self._postCustomScripts = []

        self._hashmap = {}

    @property
    def globalMaster(self):
        return self._globalMaster

    @property
    def hashmap(self):
        return self._hashmap

    def addPreCustomScript(self, name='', code=''):
        cs = CustomScript(name, code)
        self._preCustomScripts.append(cs)
        return cs

    def addGlobalMaster(self, rootJoint, buildRootController=False):
        self._globalMaster = GlobalMaster(rootJoint, buildRootController)
        return self._globalMaster

    def addModule(self, type='', name='', side=Container.SIDE.LEFT, skeletonJoints=[], vertices=[]):
        mod = Factory.getModule(type, name, side, skeletonJoints)
        mod.scene = self
        mod.master = self._globalMaster
        self._modules.append(mod)
        return mod

    def removeModule(self, name='', side=Container.SIDE.LEFT):
        """Rmove a module from the scene completely.

        :param name: name of a module to remove, defaults to ''
        :param side: side character of a module to remove, defaults to Container.SIDE.LEFT
        """
        mod = self.findModule(name, side)
        spaceSwitchBuilders = mod.clear()
        if spaceSwitchBuilders:
            for ssb in spaceSwitchBuilders:
                self._spaceSwitchBuilders.remove(ssb)
        self._modules.remove(mod)

    def findModule(self, name='', side=Container.SIDE.LEFT):
        for mod in self._modules:
            if name == mod.name and side == mod.side:
                return mod
        return None

    def mirrorModule(self, name='', side=Container.SIDE.LEFT, skeletonSearchStr='_l', skeletonReplaceStr='_r', mirrorTranslate=False):
        mod = self.findModule(name, side)
        oppMod = mod.mirror(skeletonSearchStr, skeletonReplaceStr, mirrorTranslate)
        self._modules.append(oppMod)
        return oppMod

    def addMaster(self, type='', name='', side=Container.SIDE.LEFT):
        mst = Factory.getMaster(type, name, side)
        mst.scene = self
        self._masters.append(mst)
        return mst

    def addSpaceSwitchBuilder(self, drivenController='', driverControllers='', defaultDriverController=''):
        ssb = SpaceSwitchBuilder(drivenController, driverControllers, defaultDriverController)
        self._spaceSwitchBuilders.append(ssb)
        return ssb

    def findSpaceSwitchBuilder(self, drivenControllerName=''):
        for ssb in self._spaceSwitchBuilders:
            if drivenControllerName == ssb.drivenController.name:
                return ssb
        return None

    def addPostCustomScript(self, name='', code=''):
        cs = CustomScript(name, code)
        self._postCustomScripts.append(cs)
        return cs

    def findCustomScript(self, name):
        for cs in self._preCustomScripts + self._postCustomScripts:
            if name == cs.name:
                return cs
        return None

    def saveToFile(self, filename):
        with open(filename, "w") as f:
            f.write(json.dumps(self.serialize(), indent=4))
        logger.info("Saving file to '{}' is done successfully.".format(filename))

    def buildFromFile(self, filename):
        self.clear()

        with open(filename, "r") as f:
            data = json.load(f)
            globalMst = self.deserialize(data)
        logger.info("Building a rig from '{}' is done successfully".format(filename))
        return globalMst

    def clear(self):
        self._preCustomScripts.clear()
        self._globalMaster = None
        self._modules.clear()
        self._masters.clear()
        self._spaceSwitchBuilders.clear()
        self._postCustomScripts.clear()
        self._hashmap.clear()

    def serialize(self):
        return OrderedDict([
            ("preCustomScripts", [preCustomScript.serialize() for preCustomScript in self._preCustomScripts]),
            ("globalMaster", self._globalMaster.serialize() if self._globalMaster else {}),
            ("modules", [module.serialize() for module in self._modules]),
            ("masters", [master.serialize() for master in self._masters]),
            ("spaceSwitchBuilders", [spaceSwitchBuilders.serialize() for spaceSwitchBuilders in self._spaceSwitchBuilders]),
            ("postCustomScripts", [postCustomScript.serialize() for postCustomScript in self._postCustomScripts]),
        ])

    def deserialize(self, data):
        # Process pre-build custom scripts
        for preCustomScriptData in data["preCustomScripts"]:
            cs = self.addPreCustomScript(preCustomScriptData.get('name'))
            cs.deserialize(preCustomScriptData, self._hashmap)

        # Add global master and build
        globalMasterData = data['globalMaster']
        if globalMasterData:
            self._globalMaster = self.addGlobalMaster(globalMasterData.get('rootJoint'), globalMasterData.get('buildRootController'))
            self._globalMaster.deserialize(globalMasterData, self._hashmap)

        # Add modules, masters and build
        for moduleData in data["modules"]:
            mod = self.addModule(
                moduleData.get('type'),
                moduleData.get('name'),
                moduleData.get('side'),
                moduleData.get('skeletonJoints')
            )
            mod.deserialize(moduleData, self._hashmap)

        for masterData in data["masters"]:
            mst = self.addMaster(
                masterData.get('type'),
                masterData.get('name'),
                masterData.get('side')
            )
            mst.deserialize(masterData, self._hashmap)
            self._globalMaster.addMasters(mst)

        # Add space switch builder
        for spaceSwitchBuildersData in data["spaceSwitchBuilders"]:
            ssb = self.addSpaceSwitchBuilder()
            ssb.deserialize(spaceSwitchBuildersData, self._hashmap)
            self._globalMaster.addSpaceSwitchBuilder(ssb)

        # Process post-build custom scripts
        for postCustomScriptData in data["postCustomScripts"]:
            cs = self.addPostCustomScript(postCustomScriptData.get('name'))
            cs.deserialize(postCustomScriptData, self._hashmap)
