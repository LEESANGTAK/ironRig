"""
Author: TAK
Website: https://ta-note.com
Description:
Calcualtes jiggling point 'outPosition' attribute with values of 'goalPosition' attribute.
"""

from maya import OpenMayaMPx
from maya import OpenMaya


class TakJigglePoint(OpenMayaMPx.MPxNode):
    NAME = "takJigglePoint"
    ID = OpenMaya.MTypeId(0x00002737)

    WEIGHT = OpenMaya.MObject()
    TIME = OpenMaya.MObject()
    DAMP = OpenMaya.MObject()
    STIFFNESS = OpenMaya.MObject()
    PARENT_INV_MATRIX = OpenMaya.MObject()
    GOAL_POSITON = OpenMaya.MObject()
    OUT_POSITON = OpenMaya.MObject()

    @classmethod
    def creator(cls):
        """Return node instance.
        """
        return OpenMayaMPx.asMPxPtr(TakJigglePoint())

    @classmethod
    def initialize(cls):
        """Set up node attributes.
        """
        unitAttrFn = OpenMaya.MFnUnitAttribute()
        numAttrFn = OpenMaya.MFnNumericAttribute()
        matrixAttrFn = OpenMaya.MFnMatrixAttribute()

        cls.WEIGHT = numAttrFn.create("weight", "weight", OpenMaya.MFnNumericData.kFloat, 0.0)
        numAttrFn.setKeyable(True)
        numAttrFn.setMin(0.0)
        numAttrFn.setMax(1.0)
        cls.addAttribute(cls.WEIGHT)

        cls.TIME = unitAttrFn.create("time", "time", OpenMaya.MFnUnitAttribute.kTime, 0.0)
        cls.addAttribute(cls.TIME)

        cls.DAMP = numAttrFn.create("damp", "damp", OpenMaya.MFnNumericData.kFloat, 0.1)
        numAttrFn.setKeyable(True)
        numAttrFn.setMin(0.0)
        numAttrFn.setMax(1.0)
        cls.addAttribute(cls.DAMP)

        cls.STIFFNESS = numAttrFn.create("stiffness", "stiffness", OpenMaya.MFnNumericData.kFloat, 0.3)
        numAttrFn.setKeyable(True)
        numAttrFn.setMin(0.0)
        numAttrFn.setMax(1.0)
        cls.addAttribute(cls.STIFFNESS)

        cls.PARENT_INV_MATRIX = matrixAttrFn.create("parentInverseMatrix", "parentInverseMatrix")
        cls.addAttribute(cls.PARENT_INV_MATRIX)

        cls.GOAL_POSITON = numAttrFn.createPoint("goalPosition", "goalPosition")
        cls.addAttribute(cls.GOAL_POSITON)

        cls.OUT_POSITON = numAttrFn.createPoint("outPosition", "outPosition")
        numAttrFn.setWritable(False)
        numAttrFn.setStorable(False)
        cls.addAttribute(cls.OUT_POSITON)

        # Set attributes dependency
        cls.attributeAffects(cls.WEIGHT, cls.OUT_POSITON)
        cls.attributeAffects(cls.TIME, cls.OUT_POSITON)
        cls.attributeAffects(cls.DAMP, cls.OUT_POSITON)
        cls.attributeAffects(cls.STIFFNESS, cls.OUT_POSITON)
        cls.attributeAffects(cls.PARENT_INV_MATRIX, cls.OUT_POSITON)
        cls.attributeAffects(cls.GOAL_POSITON, cls.OUT_POSITON)

    def __init__(self):
        super(TakJigglePoint, self).__init__()

        self.__initialized = False
        self.__preTime = OpenMaya.MTime()
        self.__prePosition = OpenMaya.MPoint()
        self.__curPosition = OpenMaya.MPoint()

    def compute(self, plug, dataBlock):
        if plug == self.OUT_POSITON:
            # Get inputs
            weight = dataBlock.inputValue(self.WEIGHT).asFloat()
            curTime = dataBlock.inputValue(self.TIME).asTime()
            damp = dataBlock.inputValue(self.DAMP).asFloat()
            stiffness = dataBlock.inputValue(self.STIFFNESS).asFloat()
            parentInvMatrix = dataBlock.inputValue(self.PARENT_INV_MATRIX).asMatrix()
            goalPos = OpenMaya.MPoint(dataBlock.inputValue(self.GOAL_POSITON).asFloatVector())
            outPositionHandle = dataBlock.outputValue(self.OUT_POSITON)

            # Prepare starting calculation
            if not self.__initialized:
                self.__prePosition = goalPos
                self.__curPosition = goalPos
                self.__initialized = True

            # Do not calculate when user jumps frame or stay
            deltaTime = curTime.value() - self.__preTime.value()
            if deltaTime != 1.0:
                self.__initialized = False  # For reinitializing
                self.__preTime = curTime
                goalPos *= parentInvMatrix
                outPositionHandle.setMFloatVector(OpenMaya.MFloatVector(goalPos))
                dataBlock.setClean(plug)  # Prevent recaculation
                return

            # Get outPosition
            velocity = (self.__curPosition - self.__prePosition) * (1.0 - damp)
            newPos = self.__curPosition + velocity
            goalForce = (goalPos - newPos) * stiffness
            newPos += goalForce

            # Reset for next caculation
            self.__preTime = curTime
            self.__prePosition = OpenMaya.MPoint(self.__curPosition)
            self.__curPosition = OpenMaya.MPoint(newPos)

            # Set weight of jiggle amount
            newPos = goalPos + ((newPos - goalPos) * weight)

            # Set outPosition to local
            newPos *= parentInvMatrix

            # Set outPosition
            outVector = OpenMaya.MFloatVector(newPos.x, newPos.y, newPos.z)
            outPositionHandle.setMFloatVector(outVector)
            dataBlock.setClean(plug)
        else:
            return OpenMaya.kUnknownParameter



# ---------------------------------------------
# Register node to maya
# ---------------------------------------------
def initializePlugin(obj):
    pluginFn = OpenMayaMPx.MFnPlugin(obj, "TAK", "1.0", "Any")
    try:
        pluginFn.registerNode(
            TakJigglePoint.NAME,
            TakJigglePoint.ID,
            TakJigglePoint.creator,
            TakJigglePoint.initialize
        )
    except:
        OpenMaya.MGlobal.displayError("Failed register node: {0}".format(TakJigglePoint.NAME))

def uninitializePlugin(obj):
    pluginFn = OpenMayaMPx.MFnPlugin(obj)
    try:
        pluginFn.deregisterNode(TakJigglePoint.ID)
    except:
        OpenMaya.MGlobal.displayError("Failed deregister node: {0}".format(TakJigglePoint.NAME))
