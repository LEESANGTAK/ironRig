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

    @property
    def globalMaster(self):
        return self._globalMaster

    def addPreCustomScript(self, name='', code=''):
        cs = CustomScript(name, code)
        self._preCustomScripts.append(cs)
        return cs

    def addGlobalMaster(self, rootJoint, buildRootController=False):
        self._globalMaster = GlobalMaster(rootJoint, buildRootController)
        return self._globalMaster

    def addModule(self, type='', name='', side=Container.SIDE.LEFT, skeletonJoints=[], vertices=[]):
        mod = Factory.getModule(type, name, side, skeletonJoints)
        self._modules.append(mod)
        return mod

    def mirrorModule(self, name='', side=Container.SIDE.LEFT, skeletonSearchStr='_l', skeletonReplaceStr='_r', mirrorTranslate=False):
        mod = self.getModule(name, side)
        oppMod = mod.mirror(skeletonSearchStr, skeletonReplaceStr, mirrorTranslate)
        self._modules.append(oppMod)
        return oppMod

    def removeModule(self, name='', side=Container.SIDE.LEFT):
        self._modules.remove(self.getModule(name, side))

    def getModule(self, name='', side=Container.SIDE.LEFT):
        for mod in self._modules:
            if name == mod.name and side == mod.side:
                return mod
        return None

    def addMaster(self, type='', name='', side=Container.SIDE.LEFT):
        mst = Factory.getMaster(type, name, side)
        self._masters.append(mst)
        return mst

    def addSpaceSwitchBuilder(self, drivenController='', driverControllers='', defaultDriverController=''):
        ssb = SpaceSwitchBuilder(drivenController, driverControllers, defaultDriverController)
        self._spaceSwitchBuilders.append(ssb)
        return ssb

    def addPostCustomScript(self, name='', code=''):
        cs = CustomScript(name, code)
        self._postCustomScripts.append(cs)
        return cs

    def getCustomScript(self, name):
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

    def serialize(self):
        return OrderedDict([
            ("preCustomScripts", [preCustomScript.serialize() for preCustomScript in self._preCustomScripts]),
            ("globalMaster", self._globalMaster.serialize() if self._globalMaster else {}),
            ("modules", [module.serialize() for module in self._modules]),
            ("masters", [master.serialize() for master in self._masters]),
            ("spaceSwitchBuilders", [spaceSwitchBuilders.serialize() for spaceSwitchBuilders in self._spaceSwitchBuilders]),
            ("postCustomScripts", [postCustomScript.serialize() for postCustomScript in self._postCustomScripts]),
        ])

    def deserialize(self, data, hashmap={}):
        # Process pre-build custom scripts
        for preCustomScriptData in data["preCustomScripts"]:
            cs = self.addPreCustomScript(preCustomScriptData.get('name'))
            cs.deserialize(preCustomScriptData, hashmap)

        # Add global master and build
        globalMasterData = data['globalMaster']
        if globalMasterData:
            globalMaster = self.addGlobalMaster(globalMasterData.get('rootJoint'), globalMasterData.get('buildRootController'))
            globalMaster.deserialize(globalMasterData, hashmap)

        # Add modules, masters and build
        for moduleData in data["modules"]:
            mod = self.addModule(
                moduleData.get('type'),
                moduleData.get('name'),
                moduleData.get('side'),
                moduleData.get('skeletonJoints')
            )
            mod.deserialize(moduleData, hashmap)
            globalMaster.addModules(mod)

        for masterData in data["masters"]:
            mst = self.addMaster(
                masterData.get('type'),
                masterData.get('name'),
                masterData.get('side')
            )
            mst.deserialize(masterData, hashmap)
            globalMaster.addMasters(mst)

        # Add space switch builder
        for spaceSwitchBuildersData in data["spaceSwitchBuilders"]:
            ssb = self.addSpaceSwitchBuilder()
            ssb.deserialize(spaceSwitchBuildersData, hashmap)
            globalMaster.addSpaceSwitchBuilder(ssb)

        # Process post-build custom scripts
        for postCustomScriptData in data["postCustomScripts"]:
            cs = self.addPostCustomScript(postCustomScriptData.get('name'))
            cs.deserialize(postCustomScriptData, hashmap)
