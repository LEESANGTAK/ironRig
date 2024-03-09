import os
import json
import pymel.core as pm


CONTROLLER_DIR = os.path.join(__file__.split("scripts")[0], "controllers")


class Side:
    TOP = 0
    BOTTOM = 1
    LEFT = 2
    RIGHT = 3
    FRONT = 4
    BACK = 5


class Shape:
    TRIANGLE = os.path.join(CONTROLLER_DIR, 'triangle.json')
    CIRCLE = os.path.join(CONTROLLER_DIR, 'circle.json')
    SQUARE = os.path.join(CONTROLLER_DIR, 'square.json')
    CUBE = os.path.join(CONTROLLER_DIR, 'cube.json')
    SPHERE = os.path.join(CONTROLLER_DIR, 'sphere.json')
    PENTAGON = os.path.join(CONTROLLER_DIR, 'pentagon.json')
    LOCATOR = os.path.join(CONTROLLER_DIR, 'locator.json')
    PIN = os.path.join(CONTROLLER_DIR, 'pin.json')
    FOOT = os.path.join(CONTROLLER_DIR, 'foot.json')
    ROOT = os.path.join(CONTROLLER_DIR, 'root.json')
    ARROW_QUAD = os.path.join(CONTROLLER_DIR, 'arrowQuad.json')
    PYRAMID = os.path.join(CONTROLLER_DIR, 'pyramid.json')


class Color:
    RED = (1.0, 0.0, 0.0)
    LIGHTRED = (1.0, 0.5, 0.5)
    GREEN = (0.0, 1.0, 0.0)
    LIGHTGREEN = (0.5, 1.0, 0.5)
    BLUE = (0.0, 0.0, 1.0)
    SKYBLUE = (0.4, 0.8, 1.0)
    DARKBLUE = (0.0, 0.1, 0.2)
    YELLOW = (1.0, 1.0, 0.0)
    ORANGE = (1.0, 0.15, 0.0)
    PURPLE = (0.15, 0.0, 1.0)
    BLACK = (0.0, 0.0, 0.0)


class Direction:
    X = 0
    Y = 1
    Z = 2


class Controller(object):
    """Provides interface to the animator to control ring.
    """
    SIDE = Side
    SHAPE = Shape
    COLOR = Color
    DIRECTION = Direction
    ROTATE_MATRIX_INFO = {
        Direction.X: pm.dt.Matrix(
            [0, -1, 0, 0],
            [1, 0, 0, 0],
            [0, 0, 1, 0],
            [0, 0, 0, 1]
        ),
        Direction.Y: pm.dt.Matrix(
            [1, 0, 0, 0],
            [0, 1, 0, 0],
            [0, 0, 1, 0],
            [0, 0, 0, 1]
        ),
        Direction.Z: pm.dt.Matrix(
            [1, 0, 0, 0],
            [0, 0, 1, 0],
            [0, -1, 0, 0],
            [0, 0, 0, 1]
        )
    }

    def __init__(self, name='new_ctrl', shape=SHAPE.CIRCLE, color=COLOR.YELLOW, size=1.0, direction=DIRECTION.X):
        self.__name = name
        self.__shape = shape
        self.__color = color
        self.__size = size
        self.__direction = direction
        self.__type = None
        self.__side = None

        self.__curves = []
        self.__transform = None
        self.__zeroGrp = None
        self.__extraGrp = None
        self.__controllerNode = None

        self.__initCVsPosInfo = {}
        self.__shapeOffset = [0, 0, 0]

        self.__initController()

    def __str__(self):
        return self.__transform.name()

    def __repr__(self):
        return "ironRig.api.irGlobal.Controller('{}')".format(self.__name)

    def __or__(self, other):
        pm.parent(other.zeroGrp(), self.__transform)
        return other

    def __getattr__(self, name):
        return getattr(self.__transform, name)

    @property
    def name(self):
        """
        :getter: Returns controller name.
        :setter: Set new name. Extra and zero group name will also change.
        """
        return self.__name

    @name.setter
    def name(self, name):
        self.__transform.rename(name)
        for crv in self.__curves:
            crv.rename('{0}Shape'.format(self.__transform))
        self.__extraGrp.rename('{0}{1}'.format(name, '_extra'))
        self.__zeroGrp.rename('{0}{1}'.format(name, '_zero'))
        self.__name = name

    @property
    def shape(self):
        return os.path.basename(self.__shape).split('.')[0].capitalize()

    @shape.setter
    def shape(self, shape):
        self.__shape = shape
        self.__replaceShape()
        self.__initCVsPosInfo = self.__getCvsPosInfo(self.__curves)
        self.__update()

    @property
    def color(self):
        return self.__color

    @color.setter
    def color(self, color):
        self.__color = color
        for crv in self.__curves:
            crv.overrideEnabled.set(True)
            crv.overrideRGBColors.set(True)
            crv.overrideColorRGB.set(self.__color)

    @property
    def size(self):
        return self.__size

    @size.setter
    def size(self, val):
        self.__size = val
        self.__transformCurve()

    @property
    def direction(self):
        return self.__direction

    @direction.setter
    def direction(self, direction):
        self.__direction = direction
        self.__transformCurve()

    @property
    def shapeOffset(self):
        return self.__shapeOffset

    @shapeOffset.setter
    def shapeOffset(self, offset):
        self.__shapeOffset = offset
        self.__transformCurve()

    def zeroGrp(self):
        return self.__zeroGrp

    def extraGrp(self):
        return self.__extraGrp

    def curves(self):
        return self.__curves

    def controllerNode(self):
        return self.__controllerNode

    def __transformCurve(self):
        for shape, cvsPos in self.__initCVsPosInfo.items():
            for i, cvPos in enumerate(cvsPos):
                shape.cv[i].setPosition(pm.dt.Vector(cvPos) * self.__size * Controller.ROTATE_MATRIX_INFO[self.__direction] + pm.dt.Vector(self.__shapeOffset))
            shape.updateCurve()

    def __initController(self):
        self.__transform = pm.createNode('transform', n=self.__name)
        self.__controllerNode = pm.createNode('controller', n='{}_controller'.format(self.__name))
        self.__transform.message >> self.__controllerNode.controllerObject

        self.__createShapes()
        self.__initCVsPosInfo = self.__getCvsPosInfo(self.__curves)

        self.__zeroGrp = pm.group(self.__transform, n='{0}{1}'.format(self.__name, '_zero'), empty=True)
        self.__extraGrp = pm.group(self.__transform, n='{0}{1}'.format(self.__name, '_extra'), empty=True)
        self.__zeroGrp | self.__extraGrp | self.__transform

        self.__update()

    def __createShapes(self):
        with open(self.__shape, 'r') as f:
            curveInfo = json.load(f)

        for shapeInfo in curveInfo.values():
            crvTrsf = pm.curve(n=self.__name, p=shapeInfo['cvPos'], degree=shapeInfo['degree'])
            self.__curves.extend(crvTrsf.getShapes())
            if shapeInfo['form'] > 0:
                pm.closeCurve(ch=False, preserveShape=False, replaceOriginal=True)
            pm.parent(crvTrsf.getShape(), self.__transform, s=True, r=True)
            pm.delete(crvTrsf)

    def __getCvsPosInfo(self, curves):
        cvsPosInfo = {}
        for curve in curves:
            cvsPosInfo[curve] = [cv.getPosition() for cv in curve.cv]
        return cvsPosInfo

    def __update(self):
        self.name = self.__name
        self.color = self.__color
        self.size = self.__size
        self.direction = self.__direction
        pm.select(cl=True)

    def alignShapeTo(self, targetPoint, side):
        bb = self.__transform.getBoundingBox(space='world')
        topPoint = bb.center() + pm.dt.Vector([0, bb.height()*0.5, 0])
        bottomPoint = bb.center() + pm.dt.Vector([0, bb.height()*-0.5, 0])
        leftPoint = bb.center() + pm.dt.Vector([bb.width()*0.5, 0, 0])
        rightPoint = bb.center() + pm.dt.Vector([bb.width()*-0.5, 0, 0])
        frontPoint = bb.center() + pm.dt.Vector([0, 0, bb.width()*0.5])
        backPoint = bb.center() + pm.dt.Vector([0, 0, bb.width()*-0.5])
        sideTable = {Side.TOP: topPoint,
                     Side.BOTTOM: bottomPoint,
                     Side.LEFT: leftPoint,
                     Side.RIGHT: rightPoint,
                     Side.FRONT: frontPoint,
                     Side.BACK: backPoint}

        sidePoint = sideTable[side]
        moveVector = targetPoint - sidePoint
        for curve in self.__curves:
            cvsPoses = [cv.getPosition(space='world') for cv in curve.cv]
            for i, cvPos in enumerate(cvsPoses):
                curve.cv[i].setPosition(pm.dt.Vector(cvPos) + moveVector, space='world')
            curve.updateCurve()

    def lockHideChannels(self, channels=['visibility'], axes=['X', 'Y', 'Z']):
        attrNames = list(set([ch + axis if ch in ['translate', 'rotate', 'scale'] else ch for ch in channels for axis in axes]))
        for attrName in attrNames:
            self.__transform.attr(attrName).lock()
            self.__transform.attr(attrName).setKeyable(False)

    def hide(self):
        for crv in self.__curves:
            crv.hide()

    def __replaceShape(self):
        if self.__curves:
            self.__removeCurves()

        self.__createShapes()
        for crv in self.__curves:
            pm.parent(crv, self.__transform, s=True, r=True)

    def __removeCurves(self):
        for crv in self.__curves:
            pm.delete(crv)
        self.__curves = []
