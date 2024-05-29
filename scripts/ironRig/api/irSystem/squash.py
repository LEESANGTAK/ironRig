from maya import cmds
from ..irGlobal import Controller
from .system import System


class Squash(System):
    def __init__(self, prefix='', vertices=[]):
        super(Squash, self).__init__(prefix)

        self.__vertices = vertices
        self.__ffd = None
        self.__squashHandle = None
        self.__sideBendHandle = None
        self.__forwardBendHandle = None

    def build(self):
        self._buildSystems()
        self._buildControls()

    def _buildSystems(self):
        ffdNodes = cmds.lattice(self.__vertices, dv=(5, 5, 5), oc=True, n='{}ffd'.format(self._name))
        self.__ffd = ffdNodes[1]
        ffdBottomYPos = cmds.xform(self.__ffd.pt[2][0][2], q=True, t=True, ws=True)[1]

        squash, self.__squashHandle = cmds.nonLinear(self.__ffd.name(), type='squash', n='{}squash'.format(self._name))
        cmds.setAttr('{}.lowBound'.format(squash), 0)
        cmds.setAttr('{}.highBound'.format(squash), 2)
        cmds.matchTransform(self.__squashHandle, self.__ffd.name(), scale=True)
        cmds.setAttr('{}.ty'.format(self.__squashHandle), ffdBottomYPos)

        sideBend, self.__sideBendHandle = cmds.nonLinear(self.__ffd.name(), type='bend', n='{}side_bend'.format(self._name))
        cmds.setAttr('{}.lowBound'.format(sideBend), 0)
        cmds.matchTransform(self.__sideBendHandle, self.__ffd.name(), scale=True)
        cmds.setAttr('{}.ty'.format(self.__sideBendHandle), ffdBottomYPos)

        forwardBend, self.__forwardBendHandle = cmds.nonLinear(self.__ffd.name(), type='bend', n='{}forward_bend'.format(self._name))
        cmds.setAttr('{}.lowBound'.format(forwardBend), 0)
        cmds.matchTransform(self.__forwardBendHandle, self.__ffd.name(), scale=True)
        cmds.setAttr('{}.ty'.format(self.__forwardBendHandle), ffdBottomYPos)
        cmds.setAttr('{}.ry'.format(self.__forwardBendHandle), -90)

        cmds.parent(ffdNodes[1:]+[self.__squashHandle, self.__sideBendHandle, self.__forwardBendHandle], self._blbxGrp)

    def _buildControls(self):
        ctrl = Controller('{}ctrl'.format(self._name), Controller.SHAPE.PYRAMID, Controller.COLOR.GREEN, direction=Controller.DIRECTION.Y)
        ffdTopPos = cmds.xform(self.__ffd.pt[2][4][2], q=True, t=True, ws=True)
        cmds.xform(ctrl.zeroGrp, t=ffdTopPos, ws=True)
        ctrl.shapeOffset = [0.0, 4.0, 0.0]
        ctrl.lockHideChannels(['rotate', 'scale', 'visibility'])

        squashScalerMult = cmds.createNode('multDoubleLinear', n='{}squash_mult'.format(self._name))
        ctrl.ty >> squashScalerMult.input1
        cmds.connectAttr('{}.output'.format(squashScalerMult), '{}.factor'.format(self.__squashHandle))
        cmds.connectAttr('{}.tx'.format(ctrl), '{}.curvature'.format(self.__sideBendHandle))
        cmds.connectAttr('{}.tz'.format(ctrl), '{}.curvature'.format(self.__forwardBendHandle))
        squashScalerMult.input2.set(0.05)
        ctrl.tx.outputs()[0].conversionFactor.set(0.05)
        ctrl.tz.outputs()[0].conversionFactor.set(0.05)

        self._controllerGrp | ctrl.zeroGrp
        self._controllers.append(ctrl)
        self.addMembers(squashScalerMult, ctrl.allNodes)

    def delete(self):
        self._controllers = []
        try:
            cmds.delete(self.members)
        except:
            pass
        cmds.delete(self._topGrp)
