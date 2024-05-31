from maya import cmds
from ..irGlobal import Controller
from .system import System


class Squash(System):
    def __init__(self, name='new', side=System.SIDE.CENTER, vertices=[]):
        super(Squash, self).__init__(name, side, System.TYPE.SQUASH_SYSTEM)

        self._vertices = vertices
        self._ffd = None
        self._squashHandle = None
        self._sideBendHandle = None
        self._forwardBendHandle = None

    def build(self):
        self._buildSystems()
        self._buildControls()

    def _buildSystems(self):
        ffdNodes = cmds.lattice(self._vertices, dv=(5, 5, 5), oc=True, n='{}ffd'.format(self.longName))
        self._ffd = ffdNodes[1]
        ffdBottomYPos = cmds.xform('{}.pt[2][0][2]'.format(self._ffd), q=True, t=True, ws=True)[1]

        squash, self._squashHandle = cmds.nonLinear(self._ffd, type='squash', n='{}squash'.format(self.longName))
        cmds.setAttr('{}.lowBound'.format(squash), 0)
        cmds.setAttr('{}.highBound'.format(squash), 2)
        cmds.matchTransform(self._squashHandle, self._ffd, scale=True)
        cmds.setAttr('{}.ty'.format(self._squashHandle), ffdBottomYPos)

        sideBend, self._sideBendHandle = cmds.nonLinear(self._ffd, type='bend', n='{}side_bend'.format(self.longName))
        cmds.setAttr('{}.lowBound'.format(sideBend), 0)
        cmds.matchTransform(self._sideBendHandle, self._ffd, scale=True)
        cmds.setAttr('{}.ty'.format(self._sideBendHandle), ffdBottomYPos)

        forwardBend, self._forwardBendHandle = cmds.nonLinear(self._ffd, type='bend', n='{}forward_bend'.format(self.longName))
        cmds.setAttr('{}.lowBound'.format(forwardBend), 0)
        cmds.matchTransform(self._forwardBendHandle, self._ffd, scale=True)
        cmds.setAttr('{}.ty'.format(self._forwardBendHandle), ffdBottomYPos)
        cmds.setAttr('{}.ry'.format(self._forwardBendHandle), -90)

        cmds.parent(ffdNodes[1:]+[self._squashHandle, self._sideBendHandle, self._forwardBendHandle], self._blbxGrp)

    def _buildControls(self):
        ctrl = Controller('{}ctrl'.format(self.longName), Controller.SHAPE.PYRAMID, Controller.COLOR.GREEN, direction=Controller.DIRECTION.Y)
        ffdTopPos = cmds.xform('{}.pt[2][4][2]'.format(self._ffd), q=True, t=True, ws=True)
        cmds.xform(ctrl.zeroGrp, t=ffdTopPos, ws=True)
        ctrl.shapeOffset = [0.0, 4.0, 0.0]
        ctrl.lockHideChannels(['rotate', 'scale', 'visibility'])

        squashScalerMult = cmds.createNode('multDoubleLinear', n='{}squash_mult'.format(self.longName))
        cmds.connectAttr('{}.ty'.format(ctrl), '{}.input1'.format(squashScalerMult))
        cmds.connectAttr('{}.output'.format(squashScalerMult), '{}.factor'.format(self._squashHandle))
        cmds.connectAttr('{}.tx'.format(ctrl), '{}.curvature'.format(self._sideBendHandle))
        cmds.connectAttr('{}.tz'.format(ctrl), '{}.curvature'.format(self._forwardBendHandle))
        cmds.setAttr('{}.input2'.format(squashScalerMult), 0.05) .set()
        cmds.setAttr('{}.conversionFactor'.format(cmds.listConnections('{}.tx'.format(ctrl))[0]), 0.05)
        cmds.setAttr('{}.conversionFactor'.format(cmds.listConnections('{}.tz'.format(ctrl))[0]), 0.05)

        cmds.parent(ctrl.zeroGrp, self._controllerGrp)
        self._controllers.append(ctrl)
        self.addMembers(squashScalerMult, ctrl.allNodes)

    def delete(self):
        self._controllers = []
        try:
            cmds.delete(self.members)
        except:
            pass
        cmds.delete(self._topGrp)
