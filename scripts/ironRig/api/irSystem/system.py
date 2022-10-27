import pymel.core as pm
from ... import utils
from ..irGlobal import Container
from ..irGlobal import Controller


class System(Container):
    """
    System contains joint, joint driving system, controller.
    """
    def __init__(self, prefix='', joints=[]):
        super(System, self).__init__(prefix)

        self._blbxGrp = None
        self._noTrsfGrp = None
        self._controllerGrp = None

        self._aimSign = None
        self._aimAxis = None
        self._joints = [pm.PyNode(jnt) for jnt in joints]
        self._negateScaleX = False
        self._controllers = []

        self.__controllerColor = Controller.COLOR.YELLOW
        self.__controllerShape = Controller.SHAPE.CIRCLE
        self.__controllerScale = 10

        self.__createGroups()

    def __createGroups(self):
        self._topGrp.rename('{}system'.format(self._prefix))
        self._blbxGrp = pm.createNode('transform', n='{}blbx_grp'.format(self._prefix))
        self._blbxGrp.v.set(False)
        self._noTrsfGrp = pm.createNode('transform', n='{}noTrsf_grp'.format(self._prefix))
        self._noTrsfGrp.inheritsTransform.set(False)
        self._controllerGrp = pm.createNode('transform', n='{}ctrl_grp'.format(self._prefix))

        self._blbxGrp | self._noTrsfGrp
        pm.parent(self._blbxGrp, self._controllerGrp, self._topGrp)

    def aimSign(self):
        return self._aimSign

    def aimAxis(self):
        return self._aimAxis

    def joints(self):
        return self._joints

    def controllers(self):
        return self._controllers

    @property
    def negateSclaeX(self):
        return self._negateScaleX

    @negateSclaeX.setter
    def negateSclaeX(self, val):
        self._negateScaleX = val

    @property
    def controllerShape(self):
        return self.__controllerShape

    @controllerShape.setter
    def controllerShape(self, shape):
        self.__controllerShape = shape
        for ctrl in self._controllers:
            ctrl.shape = self.__controllerShape

    @property
    def controllerScale(self):
        return self.__controllerScale

    @controllerScale.setter
    def controllerScale(self, scale):
        self.__controllerScale = scale
        for ctrl in self._controllers:
            ctrl.scale = self.__controllerScale

    @property
    def controllerColor(self):
        return self.__controllerColor

    @controllerColor.setter
    def controllerColor(self, color):
        self.__controllerColor = color
        for ctrl in self._controllers:
            ctrl.color = self.__controllerColor

    def build(self):
        self._getAimAxisInfo()
        self._buildSystems()
        self._buildControls()

    def _getAimAxisInfo(self):
        self._aimSign, self._aimAxis = utils.getAimAxisInfo(self._joints[0], self._joints[1])

    def _buildSystems(self):
        self._blbxGrp | self._joints[0]
        pm.matchTransform(self._topGrp, self._joints[0], pivots=True)

    def _buildControls(self):
        raise NotImplementedError()

    def remove(self):
        attrs = [ch + axis for ch in 'trs' for axis in 'xyz']
        for jnt in self._joints:
            for attrStr in attrs:
                jnt.attr(attrStr).disconnect()
        self._controllers = []
        super(System, self).remove()
