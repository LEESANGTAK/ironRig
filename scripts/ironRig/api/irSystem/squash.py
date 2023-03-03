from maya import cmds
import pymel.core as pm
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
        ffdNodes = pm.lattice(self.__vertices, dv=(5, 5, 5), oc=True, n='{}ffd'.format(self._prefix))
        # ffdNodes[0].outsideLattice.set(1)
        ffdBottomYPos = pm.xform(ffdNodes[1].pt[2][0][2], q=True, t=True, ws=True)[1]
        self.__ffd = ffdNodes[1]

        squash, self.__squashHandle = cmds.nonLinear(ffdNodes[1].name(), type='squash', n='{}squash'.format(self._prefix))
        cmds.setAttr('{}.lowBound'.format(squash), 0)
        cmds.setAttr('{}.highBound'.format(squash), 2)
        cmds.matchTransform(self.__squashHandle, ffdNodes[1].name(), scale=True)
        cmds.setAttr('{}.ty'.format(self.__squashHandle), ffdBottomYPos)

        sideBend, self.__sideBendHandle = cmds.nonLinear(ffdNodes[1].name(), type='bend', n='{}side_bend'.format(self._prefix))
        cmds.setAttr('{}.lowBound'.format(sideBend), 0)
        cmds.matchTransform(self.__sideBendHandle, ffdNodes[1].name(), scale=True)
        cmds.setAttr('{}.ty'.format(self.__sideBendHandle), ffdBottomYPos)

        forwardBend, self.__forwardBendHandle = cmds.nonLinear(ffdNodes[1].name(), type='bend', n='{}forward_bend'.format(self._prefix))
        cmds.setAttr('{}.lowBound'.format(forwardBend), 0)
        cmds.matchTransform(self.__forwardBendHandle, ffdNodes[1].name(), scale=True)
        cmds.setAttr('{}.ty'.format(self.__forwardBendHandle), ffdBottomYPos)
        cmds.setAttr('{}.ry'.format(self.__forwardBendHandle), -90)

        pm.parent(ffdNodes[1:]+[self.__squashHandle, self.__sideBendHandle, self.__forwardBendHandle], self._blbxGrp)

    def _buildControls(self):
        ctrl = Controller('{}ctrl'.format(self._prefix), Controller.SHAPE.PYRAMID, Controller.COLOR.GREEN, direction=Controller.DIRECTION.Y)
        ffdtopPos = pm.xform(self.__ffd.pt[2][4][2], q=True, t=True, ws=True)
        pm.xform(ctrl.zeroGrp(), t=ffdtopPos, ws=True)
        ctrl.shapeOffset = [0.0, 4.0, 0.0]

        squashScalerMult = pm.createNode('multDoubleLinear', n='{}squash_mult'.format(self._prefix))
        squashScalerMult.input2.set(0.017)
        ctrl.ty >> squashScalerMult.input1
        cmds.connectAttr('{}.output'.format(squashScalerMult), '{}.factor'.format(self.__squashHandle))
        cmds.connectAttr('{}.tx'.format(ctrl), '{}.curvature'.format(self.__sideBendHandle))
        cmds.connectAttr('{}.tz'.format(ctrl), '{}.curvature'.format(self.__forwardBendHandle))

        self._controllerGrp | ctrl.zeroGrp()
        self._controllers.append(ctrl)
        self.addMembers(squashScalerMult, ctrl.controllerNode())

    def remove(self):
        self._controllers = []
        try:
            pm.delete(self.members())
        except:
            pass
        pm.delete(self._topGrp)
