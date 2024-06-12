import json
from collections import OrderedDict
from ...common import logger
from ..irMaster.globalMaster import GlobalMaster
from .moduleFactory import ModuleFactory


class Scene(object):
    def __init__(self):
        super().__init__()
        self._globalMaster = None
        self._modules = []
        self._masters = []
        self._spaceSwitchBuilders = []

    @property
    def globalMaster(self):
        return self._globalMaster

    @globalMaster.setter
    def globalMaster(self, globalMaster):
        self._globalMaster = globalMaster

    def addModule(self, module):
        self._modules.append(module)

    def addMaster(self, master):
        self._masters.append(master)

    def addSpaceSwitcher(self, spaceSwitcher):
        self._spaceSwitchBuilders.append(spaceSwitcher)

    def removeModules(self, modules):
        if modules in self._modules:
            self._modules.remove(modules)

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
        ])

    def deserialize(self, data):
        globalMasterData = data['globalMaster']
        globalMst = GlobalMaster(globalMasterData.get('rootJoint'), globalMasterData.get('buildRootController'))
        globalMst.build()

        for moduleData in data["modules"]:
            mod = ModuleFactory.getModule(
                moduleData.get('type'),
                moduleData.get('name'),
                moduleData.get('side'),
                moduleData.get('skeletonJoints')
            )
            mod.deserialize(moduleData)

        # for masterData in data["masters"]:
        #     Master(self).deserialize(masterData)

        # for spaceSwitchBuildersData in data["spaceSwitchBuilders"]:
        #     SpaceSwitcher(self).deserialize(spaceSwitchBuildersData)

        logger.info("Deserialization was complete.")
        return globalMst
