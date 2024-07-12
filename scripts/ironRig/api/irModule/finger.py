from maya import cmds
from ... import utils
from ... import common
from ..irSystem.fk import FK
from .module import Module


class Finger(Module):
    def __init__(self, name='new', side=Module.SIDE.CENTER, skeletonJoints=[]):
        self._fkSystem = None
        self._curlStartIndex = 1
        super().__init__(name, side, skeletonJoints)

    @property
    def fkSystem(self):
        return self._fkSystem

    @property
    def curlStartIndex(self):
        return self._curlStartIndex

    @curlStartIndex.setter
    def curlStartIndex(self, val):
        self._curlStartIndex = val

    def _addSystems(self):
        self._fkSystem = FK(self._name, self._side)
        self._systems.append(self._fkSystem)
        super()._addSystems()

    def preBuild(self):
        super().preBuild()
        cmds.addAttr(self._oriPlaneLocators[1], ln='curl', at='float', dv=0.0, keyable=True)
        for initJnt in self._initJoints[self._curlStartIndex:]:
            cmds.connectAttr('{}.curl'.format(self._oriPlaneLocators[1]), '{}.rz'.format(initJnt))

    def _buildSystems(self):
        fkJoints = utils.buildNewJointChain(self._initJoints, searchStr='init', replaceStr='fk')
        self._fkSystem.joints = fkJoints
        self._fkSystem.build()

        self._sysJoints = self._fkSystem.joints

        super()._buildSystems()

    def _connectSystems(self):
        pass

    def rebuild(self):
        super().rebuild()
        if self._master.__class__.__name__ == 'FingersMaster':
            self._master.connectFingers()

    def mirror(self, skeletonSearchStr='_l', skeletonReplaceStr='_r', mirrorTranslate=False):
        oppSideChar, oppSkelJoints = super().mirror(skeletonSearchStr, skeletonReplaceStr)
        oppMod = Finger(self._name, oppSideChar, oppSkelJoints)
        oppMod.mirrorTranslate = mirrorTranslate
        oppMod.curlStartIndex = self._curlStartIndex
        oppMod.preBuild()
        oppMod.symmetrizeGuide()
        oppMod.build()
        oppMod.symmetrizeControllerShapes()
        oppMod.controllerColor = common.SYMMETRY_COLOR_TABLE.get(self._controllerColor)
        return oppMod

    def serialize(self):
        data = super().serialize()
        data['curlStartIndex'] = self._curlStartIndex
        return data

    def _setAttributesFromData(self, data):
        super()._setAttributesFromData(data)
        self._curlStartIndex = data.get('curlStartIndex')
