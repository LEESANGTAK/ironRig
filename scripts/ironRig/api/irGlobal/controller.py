import os
import json
from maya.api import OpenMaya as om
from maya import cmds
from ... import utils
from ... import common


CONTROLLER_DIR = os.path.join(__file__.split("scripts")[0], "controllers")
SHAPE_FILES_TABLE = {
    'triangle': os.path.join(CONTROLLER_DIR, 'triangle.json'),
    'circle': os.path.join(CONTROLLER_DIR, 'circle.json'),
    'square': os.path.join(CONTROLLER_DIR, 'square.json'),
    'cube': os.path.join(CONTROLLER_DIR, 'cube.json'),
    'sphere': os.path.join(CONTROLLER_DIR, 'sphere.json'),
    'pentagon': os.path.join(CONTROLLER_DIR, 'pentagon.json'),
    'locator': os.path.join(CONTROLLER_DIR, 'locator.json'),
    'pin': os.path.join(CONTROLLER_DIR, 'pin.json'),
    'foot': os.path.join(CONTROLLER_DIR, 'foot.json'),
    'root': os.path.join(CONTROLLER_DIR, 'root.json'),
    'arrowQuad': os.path.join(CONTROLLER_DIR, 'arrowQuad.json'),
    'pyramid': os.path.join(CONTROLLER_DIR, 'pyramid.json'),
}
COLOR_VALUES_TABLE = {
    'red': (1.0, 0.0, 0.0),
    'lightRed': (1.0, 0.5, 0.5),
    'green': (0.0, 1.0, 0.0),
    'lightGreen': (0.5, 1.0, 0.5),
    'blue': (0.0, 0.0, 1.0),
    'skyBlue': (0.4, 0.8, 1.0),
    'darkBlue': (0.0, 0.1, 0.2),
    'yellow': (1.0, 1.0, 0.0),
    'orange': (1.0, 0.15, 0.0),
    'purple': (0.15, 0.0, 1.0),
    'black': (0.0, 0.0, 0.0),
}


class Shape:
    TRIANGLE = 'triangle'
    CIRCLE = 'circle'
    SQUARE = 'square'
    CUBE = 'cube'
    SPHERE = 'sphere'
    PENTAGON = 'pentagon'
    LOCATOR = 'locator'
    PIN = 'pin'
    FOOT = 'foot'
    ROOT = 'root'
    ARROW_QUAD = 'arrowQuad'
    PYRAMID = 'pyramid'


class Color:
    RED = 'red'
    LIGHTRED = 'lightRed'
    GREEN = 'green'
    LIGHTGREEN = 'lightGreen'
    BLUE = 'blue'
    SKYBLUE = 'skyBlue'
    DARKBLUE = 'darkBlue'
    YELLOW = 'yellow'
    ORANGE = 'orange'
    PURPLE = 'purple'
    BLACK = 'black'


class Side:
    TOP = 0
    BOTTOM = 1
    LEFT = 2
    RIGHT = 3
    FRONT = 4
    BACK = 5


class Direction:
    X = 0
    Y = 1
    Z = 2


class Controller(object):
    SIDE = Side
    SHAPE = Shape
    COLOR = Color
    DIRECTION = Direction
    ROTATE_MATRIX_INFO = {
        Direction.X: om.MMatrix(
            [0, -1, 0, 0,
            1, 0, 0, 0,
            0, 0, 1, 0,
            0, 0, 0, 1]
        ),
        Direction.Y: om.MMatrix(
            [1, 0, 0, 0,
            0, 1, 0, 0,
            0, 0, 1, 0,
            0, 0, 0, 1]
        ),
        Direction.Z: om.MMatrix(
            [1, 0, 0, 0,
            0, 0, 1, 0,
            0, -1, 0, 0,
            0, 0, 0, 1]
        )
    }

    def __init__(self, name='new', shape=SHAPE.CIRCLE, color=COLOR.YELLOW, size=1.0, direction=DIRECTION.X):
        self._name = name
        self._shape = shape
        self._color = color
        self._size = size
        self._direction = direction

        self._transform = None
        self._zeroGrp = None
        self._extraGrp = None
        self._controllerNode = None

        self._initCVsPosInfo = {}
        self._shapeOffset = [0, 0, 0]

        self._initController()

    def __str__(self):
        return self._transform

    def __repr__(self):
        return "ironRig.api.irGlobal.Controller('{}')".format(self._name)

    def __or__(self, other):
        cmds.parent(other.zeroGrp, self._transform)
        return other

    def __getattr__(self, name):
        return getattr(self._transform, name)

    @property
    def name(self):
        """
        :getter: Returns controller name.
        :setter: Set new name. Extra and zero group name will also change.
        """
        return self._name

    @name.setter
    def name(self, name):
        for crv in self.curves:
            cmds.rename(crv, '{0}Shape'.format(self._transform))
        self._transform = cmds.rename(self._transform, '{}_ctrl'.format(name))
        self._extraGrp = cmds.rename(self._extraGrp, '{0}_{1}'.format(self._transform, 'extra'))
        self._zeroGrp = cmds.rename(self._zeroGrp, '{0}_{1}'.format(self._transform, 'zero'))
        self._controllerNode = cmds.rename(self._controllerNode, '{0}_{1}'.format(self._transform, 'controller'))
        self._name = name

    @property
    def shape(self):
        return os.path.basename(self._shape).split('.')[0].capitalize()

    @shape.setter
    def shape(self, shape):
        self._shape = shape
        self._replaceShape()
        self._initCVsPosInfo = self._getCvsPosInfo(self.curves)
        self._transformCurve()

    @property
    def color(self):
        return self._color

    @color.setter
    def color(self, color):
        self._color = color
        self._updateColor()

    @property
    def size(self):
        return self._size

    @size.setter
    def size(self, val):
        self._size = val
        self._transformCurve()

    @property
    def direction(self):
        return self._direction

    @direction.setter
    def direction(self, direction):
        self._direction = direction
        self._transformCurve()

    @property
    def shapeOffset(self):
        return self._shapeOffset

    @shapeOffset.setter
    def shapeOffset(self, offset):
        self._shapeOffset = offset
        self._transformCurve()

    @property
    def zeroGrp(self):
        return self._zeroGrp

    @property
    def extraGrp(self):
        return self._extraGrp

    @property
    def curves(self):
        return cmds.listRelatives(self._transform, s=True)

    @property
    def controllerNode(self):
        return self._controllerNode

    @property
    def allNodes(self):
        return [self._transform, self._extraGrp, self._zeroGrp, self._controllerNode]

    def updateNames(self, searchStr, replaceStr):
        self._name = self._name.replace(searchStr, replaceStr)
        self._transform = self._transform.replace(searchStr, replaceStr)
        self._zeroGrp = self._zeroGrp.replace(searchStr, replaceStr)
        self._extraGrp = self._extraGrp.replace(searchStr, replaceStr)
        self._controllerNode = self._controllerNode.replace(searchStr, replaceStr)

    def symmetrize(self, sideChar):
        oppSideChar = common.SYMMETRY_CHAR_TABLE.get(sideChar)
        oppSideCtrl = self._transform.replace('_{}_'.format(sideChar), '_{}_'.format(oppSideChar))
        for crv, oppCrv in zip(self.curves, cmds.listRelatives(oppSideCtrl, s=True)):
            utils.symmetrizeCurve(crv, oppCrv)

    def _transformCurve(self):
        for shapeId, cvsPos in enumerate(self._initCVsPosInfo):
            for cvId, cvPos in enumerate(cvsPos):
                pos = om.MVector(cvPos) * self._size * Controller.ROTATE_MATRIX_INFO[self._direction] + om.MVector(self._shapeOffset)
                cmds.xform('{}.cv[{}]'.format(self.curves[shapeId], cvId), t=pos, os=True)

    def _initController(self):
        self._transform = cmds.createNode('transform', n=self._name+'_ctrl')
        self._controllerNode = cmds.createNode('controller', n='{}_controller'.format(self._name))
        cmds.connectAttr('{}.message'.format(self._transform), '{}.controllerObject'.format(self._controllerNode))

        self._createShapes()
        self._initCVsPosInfo = self._getCvsPosInfo(self.curves)
        self.size = self._size
        self.color = self._color

        self._zeroGrp = cmds.createNode('transform', n='{0}_{1}'.format(self._transform, 'zero'))
        self._extraGrp = cmds.createNode('transform', n='{0}_{1}'.format(self._transform, 'extra'))
        cmds.parent(self._transform, self._extraGrp)
        cmds.parent(self._extraGrp, self._zeroGrp)

        cmds.select(cl=True)

    def _createShapes(self):
        with open(SHAPE_FILES_TABLE.get(self._shape), 'r') as f:
            curveInfo = json.load(f)

        for shapeInfo in curveInfo.values():
            crvTrsf = cmds.curve(n='temp_crv', p=shapeInfo['cvPos'], degree=shapeInfo['degree'])
            if shapeInfo['form'] > 0:
                cmds.closeCurve(ch=False, preserveShape=False, replaceOriginal=True)
            cmds.parent(cmds.listRelatives(crvTrsf, s=True), self._transform, s=True, r=True)
            cmds.delete(crvTrsf)

        self._updateColor()
        cmds.select(cl=True)

    def _getCvsPosInfo(self, curves):
        cvsPosInfo = []
        for curve in curves:
            cvsPosInfo.append([cmds.pointPosition(cv, local=True) for cv in cmds.ls('{}.cv[*]'.format(curve), flatten=True)])
        return cvsPosInfo

    def alignShapeTo(self, targetPoint, side):
        bb = om.MFnDagNode(utils.getDagPath(self._transform)).boundingBox
        topPoint = bb.center + om.MVector([0, bb.height*0.5, 0])
        bottomPoint = bb.center + om.MVector([0, bb.height*-0.5, 0])
        leftPoint = bb.center + om.MVector([bb.width*0.5, 0, 0])
        rightPoint = bb.center + om.MVector([bb.width*-0.5, 0, 0])
        frontPoint = bb.center + om.MVector([0, 0, bb.width*0.5])
        backPoint = bb.center + om.MVector([0, 0, bb.width*-0.5])
        sideTable = {Side.TOP: topPoint,
                     Side.BOTTOM: bottomPoint,
                     Side.LEFT: leftPoint,
                     Side.RIGHT: rightPoint,
                     Side.FRONT: frontPoint,
                     Side.BACK: backPoint}

        sidePoint = sideTable[side]
        moveVector = targetPoint - sidePoint
        for curve in self.curves:
            cvsPoses = [cmds.pointPosition(cv, local=True) for cv in cmds.ls('{}.cv[*]'.format(curve), flatten=True)]
            for i, cvPos in enumerate(cvsPoses):
                cmds.xform('{}.cv[{}]'.format(curve, i), t=om.MVector(cvPos) + moveVector, os=True)

    def lockHideChannels(self, channels=['visibility'], axes=['X', 'Y', 'Z']):
        attrNames = list(set([ch + axis if ch in ['translate', 'rotate', 'scale'] else ch for ch in channels for axis in axes]))
        for attrName in attrNames:
            cmds.setAttr('{}.{}'.format(self._transform, attrName), lock=True)
            cmds.setAttr('{}.{}'.format(self._transform, attrName), keyable=False)

    def hide(self, value=True):
        for crv in self.curves:
            cmds.setAttr('{}.visibility'.format(crv), not value)

    def _replaceShape(self):
        self._removeCurves()
        self._createShapes()

    def _removeCurves(self):
        for crv in self.curves:
            cmds.delete(crv)

    def _updateColor(self):
        rgb = COLOR_VALUES_TABLE.get(self._color)
        for crv in self.curves:
            cmds.setAttr('{}.overrideEnabled'.format(crv), True)
            cmds.setAttr('{}.overrideRGBColors'.format(crv), True)
            cmds.setAttr('{}.overrideColorRGB'.format(crv), *rgb)

    @staticmethod
    def makeHierarchy(controllers):
        for parent, child in zip(controllers[:-1], controllers[1:]):
            cmds.parent(child.zeroGrp, parent)
