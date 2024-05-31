"""
Author: Tak
Contact: ta-note.com
Created: 10/15/2022

Test codes:
pluginName = 'orientPlane'
testFile = r"C:\programs_env\maya\modules\ironRig\test\testOrientPlaneNode.ma"

# Load plugin
pm.openFile(testFile, f=True)

# Unload plugin
pm.newFile(f=True)
pm.unloadPlugin(pluginName)
"""

from maya import OpenMayaMPx
from maya import OpenMaya


class OrientPlane(OpenMayaMPx.MPxNode):
    name = 'orientPlane'
    id = OpenMaya.MTypeId(0x00002738)

    aNegXAxis = OpenMaya.MObject()
    aNegYAxis = OpenMaya.MObject()
    aNegZAxis = OpenMaya.MObject()

    aSwapYZAxis = OpenMaya.MObject()

    aPlanePoint01X = OpenMaya.MObject()
    aPlanePoint01Y = OpenMaya.MObject()
    aPlanePoint01Z = OpenMaya.MObject()
    aPlanePoint01 = OpenMaya.MObject()

    aPlanePoint02X = OpenMaya.MObject()
    aPlanePoint02Y = OpenMaya.MObject()
    aPlanePoint02Z = OpenMaya.MObject()
    aPlanePoint02 = OpenMaya.MObject()

    aPlanePoint03X = OpenMaya.MObject()
    aPlanePoint03Y = OpenMaya.MObject()
    aPlanePoint03Z = OpenMaya.MObject()
    aPlanePoint03 = OpenMaya.MObject()

    aInitPointsX = OpenMaya.MObject()
    aInitPointsY = OpenMaya.MObject()
    aInitPointsZ = OpenMaya.MObject()
    aInitPoints = OpenMaya.MObject()

    aNormalX = OpenMaya.MObject()
    aNormalY = OpenMaya.MObject()
    aNormalZ = OpenMaya.MObject()
    aNormal = OpenMaya.MObject()

    aOutMatrices = OpenMaya.MObject()

    @classmethod
    def create(cls):
        return OpenMayaMPx.asMPxPtr(cls())

    @classmethod
    def initialize(cls):
        fnNumAttr = OpenMaya.MFnNumericAttribute()
        fnMatrixAttr = OpenMaya.MFnMatrixAttribute()

        cls.aNegXAxis = fnNumAttr.create('negateXAxis', 'negateXAxis', OpenMaya.MFnNumericData.kBoolean, False)
        cls.addAttribute(cls.aNegXAxis)

        cls.aNegYAxis = fnNumAttr.create('negateYAxis', 'negateYAxis', OpenMaya.MFnNumericData.kBoolean, False)
        cls.addAttribute(cls.aNegYAxis)

        cls.aNegZAxis = fnNumAttr.create('negateZAxis', 'negateZAxis', OpenMaya.MFnNumericData.kBoolean, False)
        cls.addAttribute(cls.aNegZAxis)

        cls.aSwapYZAxis = fnNumAttr.create('swapYZAxis', 'swapYZAxis', OpenMaya.MFnNumericData.kBoolean, False)
        cls.addAttribute(cls.aSwapYZAxis)

        cls.aPlanePoint01X = fnNumAttr.create('planePoint01X', 'planePoint01X', OpenMaya.MFnNumericData.kDouble)
        cls.aPlanePoint01Y = fnNumAttr.create('planePoint01Y', 'planePoint01Y', OpenMaya.MFnNumericData.kDouble)
        cls.aPlanePoint01Z = fnNumAttr.create('planePoint01Z', 'planePoint01Z', OpenMaya.MFnNumericData.kDouble)
        cls.aPlanePoint01 = fnNumAttr.create('planePoint01', 'planePoint01', cls.aPlanePoint01X, cls.aPlanePoint01Y, cls.aPlanePoint01Z)
        cls.addAttribute(cls.aPlanePoint01)

        cls.aPlanePoint02X = fnNumAttr.create('planePoint02X', 'planePoint02X', OpenMaya.MFnNumericData.kDouble)
        cls.aPlanePoint02Y = fnNumAttr.create('planePoint02Y', 'planePoint02Y', OpenMaya.MFnNumericData.kDouble)
        cls.aPlanePoint02Z = fnNumAttr.create('planePoint02Z', 'planePoint02Z', OpenMaya.MFnNumericData.kDouble)
        cls.aPlanePoint02 = fnNumAttr.create('planePoint02', 'planePoint02', cls.aPlanePoint02X, cls.aPlanePoint02Y, cls.aPlanePoint02Z)
        cls.addAttribute(cls.aPlanePoint02)

        cls.aPlanePoint03X = fnNumAttr.create('planePoint03X', 'planePoint03X', OpenMaya.MFnNumericData.kDouble)
        cls.aPlanePoint03Y = fnNumAttr.create('planePoint03Y', 'planePoint03Y', OpenMaya.MFnNumericData.kDouble)
        cls.aPlanePoint03Z = fnNumAttr.create('planePoint03Z', 'planePoint03Z', OpenMaya.MFnNumericData.kDouble)
        cls.aPlanePoint03 = fnNumAttr.create('planePoint03', 'planePoint03', cls.aPlanePoint03X, cls.aPlanePoint03Y, cls.aPlanePoint03Z)
        cls.addAttribute(cls.aPlanePoint03)

        cls.aInitPointsX = fnNumAttr.create('initPointsX', 'initPointsX', OpenMaya.MFnNumericData.kDouble)
        cls.aInitPointsY = fnNumAttr.create('initPointsY', 'initPointsY', OpenMaya.MFnNumericData.kDouble)
        cls.aInitPointsZ = fnNumAttr.create('initPointsZ', 'initPointsZ', OpenMaya.MFnNumericData.kDouble)
        cls.aInitPoints = fnNumAttr.create('initPoints', 'initPoints', cls.aInitPointsX, cls.aInitPointsY, cls.aInitPointsZ)
        fnNumAttr.setArray(True)
        fnNumAttr.setDisconnectBehavior(OpenMaya.MFnAttribute.kDelete)
        cls.addAttribute(cls.aInitPoints)

        cls.aNormalX = fnNumAttr.create('normalX', 'normalX', OpenMaya.MFnNumericData.kDouble)
        cls.aNormalY = fnNumAttr.create('normalY', 'normalY', OpenMaya.MFnNumericData.kDouble)
        cls.aNormalZ = fnNumAttr.create('normalZ', 'normalZ', OpenMaya.MFnNumericData.kDouble)
        cls.aNormal = fnNumAttr.create('normal', 'normal', cls.aNormalX, cls.aNormalY, cls.aNormalZ)
        fnNumAttr.setStorable(False)
        fnNumAttr.setWritable(False)
        cls.addAttribute(cls.aNormal)

        cls.aOutMatrices = fnMatrixAttr.create('outMatrices', 'outMatrices')
        fnMatrixAttr.setStorable(False)
        fnMatrixAttr.setWritable(False)
        fnMatrixAttr.setArray(True)
        fnMatrixAttr.setUsesArrayDataBuilder(True)
        fnMatrixAttr.setDisconnectBehavior(OpenMaya.MFnAttribute.kDelete)
        cls.addAttribute(cls.aOutMatrices)

        cls.attributeAffects(cls.aPlanePoint01, cls.aNormal)
        cls.attributeAffects(cls.aPlanePoint02, cls.aNormal)
        cls.attributeAffects(cls.aPlanePoint03, cls.aNormal)

        cls.attributeAffects(cls.aNegXAxis, cls.aOutMatrices)
        cls.attributeAffects(cls.aNegYAxis, cls.aOutMatrices)
        cls.attributeAffects(cls.aNegZAxis, cls.aOutMatrices)
        cls.attributeAffects(cls.aSwapYZAxis, cls.aOutMatrices)
        cls.attributeAffects(cls.aPlanePoint01, cls.aOutMatrices)
        cls.attributeAffects(cls.aPlanePoint02, cls.aOutMatrices)
        cls.attributeAffects(cls.aPlanePoint03, cls.aOutMatrices)
        cls.attributeAffects(cls.aInitPoints, cls.aOutMatrices)

    def compute(self, plug, dataBlock):
        if plug == self.aNormal:
            normal = self._buildNormal(dataBlock)
            normalAttrHandle = dataBlock.outputValue(self.aNormal)
            normalAttrHandle.set3Double(normal.x, normal.y, normal.z)
        elif plug == self.aOutMatrices:
            negXAxis = dataBlock.inputValue(self.aNegXAxis).asBool()
            negYAxis = dataBlock.inputValue(self.aNegYAxis).asBool()
            negZAxis = dataBlock.inputValue(self.aNegZAxis).asBool()

            swapYZAxis = dataBlock.inputValue(self.aSwapYZAxis).asBool()

            initPointsHandle = dataBlock.inputArrayValue(self.aInitPoints)
            numElements = initPointsHandle.elementCount()
            outMatricesHandle = dataBlock.outputArrayValue(self.aOutMatrices)
            planePnt01 = dataBlock.inputValue(self.aPlanePoint01).asDouble3()
            planePnt01 = OpenMaya.MPoint(*planePnt01)
            for index in range(numElements):
                initPointsHandle.jumpToElement(index)
                curPoint = initPointsHandle.inputValue().asDouble3()
                curPoint = OpenMaya.MPoint(*curPoint)
                projCurPoint = OrientPlane.getProjPointOnPlane(curPoint, planePnt01, self._buildNormal(dataBlock))

                # If current init point is the end point, the previous point is the next point since there is no next point.
                if OrientPlane.isEndElement(index, numElements):
                    initPointsHandle.jumpToElement(index-1)
                else:
                    initPointsHandle.jumpToElement(index+1)
                nextPoint = initPointsHandle.inputValue().asDouble3()
                nextPoint = OpenMaya.MPoint(*nextPoint)
                projNextPoint = OrientPlane.getProjPointOnPlane(nextPoint, planePnt01, self._buildNormal(dataBlock))

                aimVector = projNextPoint - projCurPoint
                # If current init point is the end point, negate vector since vector aim to previous point
                if OrientPlane.isEndElement(index, numElements):
                    aimVector *= -1
                normalVector = self._buildNormal(dataBlock)  # Up vector is the normal vector of a plane
                upVector = normalVector ^ aimVector

                # Normalize vectors for prevent scale and shear issues.
                aimVector.normalize()
                normalVector.normalize()
                upVector.normalize()

                if negXAxis:
                    aimVector *= -1
                    normalVector *= -1
                if negYAxis:
                    normalVector *= -1
                    upVector *= -1
                if negZAxis:
                    upVector *= -1
                    normalVector *= -1
                if swapYZAxis:
                    normalVector, upVector = upVector, normalVector
                    normalVector *= -1

                matrix = OrientPlane.buildMatrix(aimVector, upVector, normalVector, projCurPoint, swapYZAxis)

                # Output element in array could be not exists. Add array element using array data builder.
                OrientPlane.jumpToElement(outMatricesHandle, index)

                outMatricesHandle.outputValue().setMMatrix(matrix)
        else:
            return OpenMaya.kUnknownParameter

        # Clean up output output plug for prevent recalculating.
        dataBlock.setClean(plug)

    def _buildNormal(self, dataBlock):
        normal = None

        planePnt01 = dataBlock.inputValue(self.aPlanePoint01).asDouble3()
        planePnt01 = OpenMaya.MPoint(*planePnt01)
        planePnt02 = dataBlock.inputValue(self.aPlanePoint02).asDouble3()
        planePnt02 = OpenMaya.MPoint(*planePnt02)
        planePnt03 = dataBlock.inputValue(self.aPlanePoint03).asDouble3()
        planePnt03 = OpenMaya.MPoint(*planePnt03)

        normal = (planePnt01 - planePnt02) ^ (planePnt03 - planePnt02)
        normal.normalize()

        return normal

    @staticmethod
    def isEndElement(index, numElements):
        return index == numElements-1

    @staticmethod
    def getProjPointOnPlane(sourcePoint, planePoint, planeNormal):
        projectedPoint = OpenMaya.MPoint()

        sourceToPlanePointVector = planePoint - sourcePoint
        projectedPoint = sourcePoint + ( planeNormal * (sourceToPlanePointVector * planeNormal) )

        return projectedPoint

    @staticmethod
    def buildMatrix(xAxisVector, yAxisVector, zAxisVector, point, swapYZAxis):
        matrix = OpenMaya.MMatrix()
        matrixLs = [xAxisVector.x, xAxisVector.y, xAxisVector.z, 0.0,
                    yAxisVector.x, yAxisVector.y, yAxisVector.z, 0.0,
                    zAxisVector.x, zAxisVector.y, zAxisVector.z, 0.0,
                    point.x, point.y, point.z, 1.0]
        OpenMaya.MScriptUtil.createMatrixFromList(matrixLs, matrix)
        return matrix

    @staticmethod
    def jumpToElement(dataHandle, index):
        try:
            dataHandle.jumpToElement(index)
        except:
            builder = dataHandle.builder()
            builder.addElement(index)
            dataHandle.set(builder)
            dataHandle.jumpToElement(index)


def initializePlugin(obj):
    fnPlugin = OpenMayaMPx.MFnPlugin(obj, 'Tak', '1.0', 'Any')
    try:
        fnPlugin.registerNode(OrientPlane.name,
                              OrientPlane.id,
                              OrientPlane.create,
                              OrientPlane.initialize)
    except:
        OpenMaya.MGlobal.displayError('Failed to register node: {}'.format(OrientPlane.name))


def uninitializePlugin(obj):
    fnPlugin = OpenMayaMPx.MFnPlugin(obj)
    try:
        fnPlugin.deregisterNode(OrientPlane.id)
    except:
        OpenMaya.MGlobal.displayError('Failed to deregister node: {}'.format(OrientPlane.name))
