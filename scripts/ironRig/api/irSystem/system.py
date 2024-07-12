from maya import cmds
from ... import utils
from ..irGlobal.container import Container
from ..irGlobal.controller import Controller
from ...common import logger


class System(Container):
    """
    System contains joints, joint driving systems, controllers.
    """
    def __init__(self, name='new', side=Container.SIDE.CENTER, type=Container.TYPE.FK_SYSTEM, joints=[]):
        super().__init__(name, side, type)

        self._blbxGrp = None
        self._noTrsfGrp = None
        self._controllerGrp = None

        self._aimSign = None
        self._aimAxis = None
        self._mirrorTranslate = False
        self._joints = joints or []
        self._controllers = []

        self._controllerColor = Controller.COLOR.YELLOW
        self._controllerShape = Controller.SHAPE.CIRCLE
        self._controllerSize = 10

    def __repr__(self):
        return "irSystem.{}('{}')".format(self.__class__.__name__, self.longName)

    @property
    def aimSign(self):
        return self._aimSign

    @property
    def aimAxis(self):
        return self._aimAxis

    @property
    def blackboxGrp(self):
        return self._blbxGrp

    @property
    def joints(self):
        return self._joints

    @joints.setter
    def joints(self, joints):
        self._joints = joints

    @property
    def controllers(self):
        return self._controllers

    @property
    def mirrorTranslate(self):
        return self._mirrorTranslate

    @mirrorTranslate.setter
    def mirrorTranslate(self, val):
        self._mirrorTranslate = val

    @property
    def controllerShape(self):
        return self._controllerShape

    @controllerShape.setter
    def controllerShape(self, shape):
        self._controllerShape = shape
        for ctrl in self._controllers:
            ctrl.shape = self._controllerShape

    @property
    def controllerSize(self):
        return self._controllerSize

    @controllerSize.setter
    def controllerSize(self, size):
        self._controllerSize = size
        for ctrl in self._controllers:
            ctrl.size = self._controllerSize

    @property
    def controllerColor(self):
        return self._controllerColor

    @controllerColor.setter
    def controllerColor(self, color):
        self._controllerColor = color
        for ctrl in self._controllers:
            ctrl.color = self._controllerColor

    def build(self):
        self._set = cmds.createNode('objectSet', n='{}_set'.format(self.longName))
        self._buildGroups()
        self._getAimAxisInfo()
        self._buildSystems()
        self._buildControls()

    def _buildGroups(self):
        self._topGrp = cmds.createNode('transform', n='{}_grp'.format(self.longName))
        self._blbxGrp = cmds.createNode('transform', n='{}_blbx_grp'.format(self.longName))
        cmds.setAttr('{}.visibility'.format(self._blbxGrp), False)
        self._noTrsfGrp = cmds.createNode('transform', n='{}_noTrsf_grp'.format(self.longName))
        cmds.setAttr('{}.inheritsTransform'.format(self._noTrsfGrp), False)
        self._controllerGrp = cmds.createNode('transform', n='{}_ctrl_grp'.format(self.longName))

        cmds.parent(self._noTrsfGrp, self._blbxGrp)
        cmds.parent(self._blbxGrp, self._controllerGrp, self._topGrp)

        self.addMembers(self._topGrp, self._blbxGrp, self._noTrsfGrp, self._controllerGrp)

    def _getAimAxisInfo(self):
        if len(self._joints) == 1:
            self._aimSign = 1
            self._aimAxis = 'Z'
        else:
            self._aimSign, self._aimAxis = utils.getAimAxisInfo(self._joints[0], self._joints[1])

    def _buildSystems(self):
        logger.debug('{}._buildSystems()'.format(self.longName))

        cmds.parent(self._joints[0], self._blbxGrp)
        cmds.matchTransform(self._topGrp, self._joints[0], pivots=True)
        self.addMembers(self._joints)

    def _buildControls(self):
        raise NotImplementedError()

    def clear(self):
        attrs = [ch + axis for ch in 'trs' for axis in 'xyz']
        for jnt in self._joints:
            for attrStr in attrs:
                utils.disconnectAttr('{}.{}'.format(jnt, attrStr))
        self._controllers = []
        super().clear()

    def _updateMembersName(self, oldStr, newStr):
        super()._updateMembersName(oldStr, newStr)
        self._blbxGrp = self._blbxGrp.replace(oldStr, newStr)
        self._noTrsfGrp = self._noTrsfGrp.replace(oldStr, newStr)
        self._controllerGrp = self._controllerGrp.replace(oldStr, newStr)
        self._joints = [jnt.replace(oldStr, newStr) for jnt in self._joints]
        for ctrl in self._controllers:
            ctrl.updateNames(oldStr, newStr)
