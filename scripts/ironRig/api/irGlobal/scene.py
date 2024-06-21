import json
from collections import OrderedDict
from ..irMaster.globalMaster import GlobalMaster
from .spaceSwitchBuilder import SpaceSwitchBuilder
from .customScript import CustomScript
from .factory import Factory
from ...common import logger


class Scene(object):
    def __init__(self):
        super().__init__()
        self._globalMaster = None
        self._modules = []
        self._masters = []
        self._spaceSwitchBuilders = []
        self._customScripts = []

    @property
    def globalMaster(self):
        return self._globalMaster

    def addGlobalMaster(self, rootJoint, buildRootController=False):
        self._globalMaster = GlobalMaster(rootJoint, buildRootController)
        return self._globalMaster

    def addModule(self, type='', name='', side='', skeletonJoints=[], vertices=[]):
        mod = Factory.getModule(type, name, side, skeletonJoints)
        self._modules.append(mod)
        return mod

    def addMaster(self, type='', name='', side=''):
        mst = Factory.getMaster(type, name, side)
        self._masters.append(mst)
        return mst

    def addSpaceSwitchBuilder(self, drivenController='', driverControllers='', defaultDriverController=''):
        ssb = SpaceSwitchBuilder(drivenController, driverControllers, defaultDriverController)
        self._spaceSwitchBuilders.append(ssb)
        return ssb

    def addCustomScript(self, name='', code=''):
        cs = CustomScript(name, code)
        self._customScripts.append(cs)
        return cs

    def saveToFile(self, filename):
        with open(filename, "w") as f:
            f.write(json.dumps(self.serialize(), indent=4))
        logger.info("Saving file to '{}' was successful.".format(filename))

    def buildFromFile(self, filename):
        with open(filename, "r") as f:
            data = json.load(f)
            globalMst = self.deserialize(data)
        logger.info("Building a rig from '{}' was successful.".format(filename))
        return globalMst

    def serialize(self):
        return OrderedDict([
            ("globalMaster", self._globalMaster.serialize()),
            ("modules", [module.serialize() for module in self._modules]),
            ("masters", [master.serialize() for master in self._masters]),
            ("spaceSwitchBuilders", [spaceSwitchBuilders.serialize() for spaceSwitchBuilders in self._spaceSwitchBuilders]),
            ("customScripts", [CustomScript.serialize() for CustomScript in self._customScripts]),
        ])

    def deserialize(self, data, hashmap={}):
        globalMasterData = data['globalMaster']
        self._globalMaster = GlobalMaster(globalMasterData.get('rootJoint'), globalMasterData.get('buildRootController'))
        self._globalMaster.build()

        for moduleData in data["modules"]:
            mod = self.addModule(
                moduleData.get('type'),
                moduleData.get('name'),
                moduleData.get('side'),
                moduleData.get('skeletonJoints')
            )
            mod.deserialize(moduleData, hashmap)
            self._globalMaster.addModules(mod)

        for masterData in data["masters"]:
            mst = self.addMaster(
                masterData.get('type'),
                masterData.get('name'),
                masterData.get('side')
            )
            mst.deserialize(masterData, hashmap)
            self._globalMaster.addMasters(mst)

        for spaceSwitchBuildersData in data["spaceSwitchBuilders"]:
            ssb = self.addSpaceSwitchBuilder()
            ssb.deserialize(spaceSwitchBuildersData, hashmap)
            self._globalMaster.addSpaceSwitchBuilder(ssb)

        for customScriptData in data["customScripts"]:
            cs = CustomScript(customScriptData.get('name'))
            cs.deserialize(customScriptData, hashmap)
            self._globalMaster.addCustomScripts(cs)

        logger.info("Deserialization was complete.")
        return self._globalMaster
