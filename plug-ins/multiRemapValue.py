"""
Author: Sangtak Lee
Contact: https://ta-note.com
Description:
This node has multiple input and output values.
It works just like native maya remapValue node.
"""


import maya.OpenMaya as OpenMaya
import maya.OpenMayaMPx as OpenMayaMPx
import sys


kNodeName = 'multiRemapValue'
kNodeId = OpenMaya.MTypeId(0x00002736)


class MultiRemapValue(OpenMayaMPx.MPxNode):
    inputValue = OpenMaya.MObject()
    outValue = OpenMaya.MObject()
    value = OpenMaya.MObject()
    inputMin = OpenMaya.MObject()
    inputMax = OpenMaya.MObject()
    outputMin = OpenMaya.MObject()
    outputMax = OpenMaya.MObject()

    def __init__(self):
        super(MultiRemapValue, self).__init__()

    # def shouldSave(self, plug, result):
    #     if plug == self.inputValue:
    #         return True
    #     return OpenMayaMPx.MPxNode.shouldSave(self, plug, result)

    def postConstructor(self):
        thisNode = self.thisMObject()
        initializeCurveRamp(thisNode, MultiRemapValue.value, 0, 0.0, 0.0, 1)
        initializeCurveRamp(thisNode, MultiRemapValue.value, 1, 1.0, 1.0, 1)

    def compute(self, plug, dataBlock):
        if plug == MultiRemapValue.outValue:
            # Get input values
            inputArrayHandle = dataBlock.inputArrayValue(MultiRemapValue.inputValue)
            numInputs = inputArrayHandle.elementCount()

            thisNode = self.thisMObject()
            curveRamp = OpenMaya.MRampAttribute(thisNode, MultiRemapValue.value)

            inputMinValue = dataBlock.inputValue(MultiRemapValue.inputMin).asFloat()
            inputMaxValue = dataBlock.inputValue(MultiRemapValue.inputMax).asFloat()
            outputMinValue = dataBlock.inputValue(MultiRemapValue.outputMin).asFloat()
            outputMaxValue = dataBlock.inputValue(MultiRemapValue.outputMax).asFloat()

            for i in range(numInputs):
                inputArrayHandle.jumpToArrayElement(i)
                inputVal = inputArrayHandle.inputValue().asFloat()

                inputVal = max(min(inputVal, inputMaxValue), inputMinValue) # Clamp input value to input value range
                normalizedVal = remapValue(inputVal, inputMinValue, inputMaxValue, 0, 1)
                valAtCurve = getCurveValAtPos(curveRamp, normalizedVal)
                outValue = remapValue(valAtCurve, 0, 1, outputMinValue, outputMaxValue)

                try:
                    # Set output value
                    outputArrayHandle = dataBlock.outputArrayValue(MultiRemapValue.outValue)
                    outputArrayHandle.jumpToArrayElement(i)
                    outputHandle = outputArrayHandle.outputValue()
                    outputHandle.setFloat(outValue)
                except:
                    pass
        else:
            return OpenMaya.kUnknownParameter

        dataBlock.setClean(plug)


def nodeCreator():
    return OpenMayaMPx.asMPxPtr(MultiRemapValue())


def nodeInitializer():
    # Create and set attributes
    numericAttrFn = OpenMaya.MFnNumericAttribute()
    rampAttrFn = OpenMaya.MRampAttribute()

    # The inputValue attribute is an array.
    # So, if it has default value(0.0) attribute is not stored.
    # Since shouldSave() method is not working correctly I just set the default value to unreached value in normal situation.
    MultiRemapValue.inputValue = numericAttrFn.create('inputValue', 'inputValue', OpenMaya.MFnNumericData.kFloat, -1.000000)
    numericAttrFn.setArray(True)

    MultiRemapValue.value = rampAttrFn.createCurveRamp('value', 'value')

    MultiRemapValue.inputMin = numericAttrFn.create('inputMin', 'inputMin', OpenMaya.MFnNumericData.kFloat)
    numericAttrFn.setKeyable(True)
    MultiRemapValue.inputMax = numericAttrFn.create('inputMax', 'inputMax', OpenMaya.MFnNumericData.kFloat, 1.0)
    numericAttrFn.setKeyable(True)
    MultiRemapValue.outputMin = numericAttrFn.create('outputMin', 'outputMin', OpenMaya.MFnNumericData.kFloat)
    numericAttrFn.setKeyable(True)
    MultiRemapValue.outputMax = numericAttrFn.create('outputMax', 'outputMax', OpenMaya.MFnNumericData.kFloat, 1.0)
    numericAttrFn.setKeyable(True)

    MultiRemapValue.outValue = numericAttrFn.create('outValue', 'outValue', OpenMaya.MFnNumericData.kFloat)
    numericAttrFn.setArray(True)
    numericAttrFn.setStorable(False)
    numericAttrFn.setWritable(False)

    # Add attributes
    MultiRemapValue.addAttribute(MultiRemapValue.inputValue)
    MultiRemapValue.addAttribute(MultiRemapValue.value)
    MultiRemapValue.addAttribute(MultiRemapValue.inputMin)
    MultiRemapValue.addAttribute(MultiRemapValue.inputMax)
    MultiRemapValue.addAttribute(MultiRemapValue.outputMin)
    MultiRemapValue.addAttribute(MultiRemapValue.outputMax)
    MultiRemapValue.addAttribute(MultiRemapValue.outValue)

    # Set attributes depedency
    MultiRemapValue.attributeAffects(MultiRemapValue.inputValue, MultiRemapValue.outValue)
    MultiRemapValue.attributeAffects(MultiRemapValue.value, MultiRemapValue.outValue)
    MultiRemapValue.attributeAffects(MultiRemapValue.inputMin, MultiRemapValue.outValue)
    MultiRemapValue.attributeAffects(MultiRemapValue.inputMax, MultiRemapValue.outValue)
    MultiRemapValue.attributeAffects(MultiRemapValue.outputMin, MultiRemapValue.outValue)
    MultiRemapValue.attributeAffects(MultiRemapValue.outputMax, MultiRemapValue.outValue)

    AETemplate()


def AETemplate():
    cmd = '''
    global proc AEmultiRemapValueTemplate(string $nodeName)
    {
        editorTemplate -beginScrollLayout;

            editorTemplate -addControl "inputValue";

            AEaddRampControl($nodeName + ".value");

            editorTemplate -beginLayout "Input and Output Ranges" -collapse 1;
                editorTemplate -addControl "inputMin";
                editorTemplate -addControl "inputMax";
                editorTemplate -addControl "outputMin";
                editorTemplate -addControl "outputMax";
            editorTemplate -endLayout;

            AEdependNodeTemplate $nodeName;
            editorTemplate -addExtraControls;
        editorTemplate -endScrollLayout;
    }
    '''
    OpenMaya.MGlobal.executeCommand(cmd)


def initializeCurveRamp(node, rampAttr, index, position, value, interpolation):
    rampPlug = OpenMaya.MPlug(node, rampAttr)
    elementPlug = rampPlug.elementByLogicalIndex(index)

    positionPlug = elementPlug.child(0)
    positionPlug.setFloat(position)

    valuePlug = elementPlug.child(1)
    valuePlug.setFloat(value)

    interpPlug = elementPlug.child(2)
    interpPlug.setInt(interpolation)


def getCurveValAtPos(rampAttr, position):
    valAtUtil = OpenMaya.MScriptUtil()
    valAtUtil.createFromDouble(1.0)
    valAtPtr = valAtUtil.asFloatPtr()
    rampAttr.getValueAtPosition(position, valAtPtr)
    return valAtUtil.getFloat(valAtPtr)


def remapValue(inValue, oldMin, oldMax, newMin, newMax):
    inDiffInOld = inValue-oldMin
    oldDiff = 0.00001 if oldMax == oldMin else oldMax-oldMin  # Prevent zero division error
    newDiff = newMax-newMin
    newFactorToOld = newDiff / oldDiff
    outValue = newMin + (inDiffInOld * newFactorToOld)
    return outValue



def initializePlugin(mobj):
    pluginFn = OpenMayaMPx.MFnPlugin(mobj, 'Tak', '1.0', 'Any')
    try:
        pluginFn.registerNode(kNodeName, kNodeId, nodeCreator, nodeInitializer, OpenMayaMPx.MPxNode.kDependNode)
    except:
        sys.stderr.write('Failed to register node: %s' % kNodeName)
        raise


def uninitializePlugin(mobj):
    pluginFn = OpenMayaMPx.MFnPlugin(mobj)
    try:
        pluginFn.deregisterNode(kNodeId)
    except:
        sys.stderr.write('Failed to deregister node: %s' % kNodeName)
        raise
