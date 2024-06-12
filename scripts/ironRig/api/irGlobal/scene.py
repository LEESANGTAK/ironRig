import json
from collections import OrderedDict
from ...common import logger
from ..irMaster.globalMaster import GlobalMaster
from .factory import Factory


class Scene(object):
    def __init__(self):
        super().__init__()
        self._globalMaster = None
        self._modules = []
        self._masters = []
        self._spaceSwitchBuilders = []
        self._customProcedures = []

    @property
    def globalMaster(self):
        return self._globalMaster

    @globalMaster.setter
    def globalMaster(self, globalMaster):
        self._globalMaster = globalMaster

    def addModule(self, type, name, side, skeletonJoints, vertices=[]):
        mod = Factory.getModule(type, name, side, skeletonJoints)
        self._modules.append(mod)
        return mod

    def addMaster(self, type, name, side):
        mst = Factory.getMaster(type, name, side)
        self._masters.append(mst)
        return mst

    def addAttacher(self):
        pass

    def addSpaceSwitchBuilder(self):
        pass

    def addCustomProcedure(self):
        pass

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
            ("attachers", []),
            ("spaceSwitchBuilders", [spaceSwitchBuilders.serialize() for spaceSwitchBuilders in self._spaceSwitchBuilders]),
            ("customProcedures", []),
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

        # for spaceSwitchBuildersData in data["spaceSwitchBuilders"]:
        #     SpaceSwitcher(self).deserialize(spaceSwitchBuildersData)

        logger.info("Deserialization was complete.")
        return self._globalMaster
