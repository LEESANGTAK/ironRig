from math import sqrt
from maya.api import OpenMaya as om
from maya.api import OpenMayaAnim as oma
from maya import cmds, mel


def makeHierarchy(objects):
    for index, jnt in enumerate(objects):
        if index == 0:
            continue
        cmds.parent(jnt, objects[index-1])

def parentKeepHierarchy(childObjects, parentObject):
    if not isinstance(childObjects, list):
        childObjects = [childObjects]
    childObjects = childObjects

    parentInfo = {}
    for childObj in childObjects:
        parentInfo[childObj] = cmds.listRelatives(childObj, p=True)[0]

    if parentObject == 'world':
        cmds.parent(childObjects, w=True)
    else:
        cmds.parent(childObjects, parentObject)

    for childObj, parent in parentInfo.items():
        if parent and parent in childObjects:
            cmds.parent(childObj, parent)


def getWorldPoint(object):
    return om.MPoint(cmds.xform(object, q=True, rp=True, ws=True))


def findClosestObject(searchPoint, objects):
    closestObj = None

    minDist = 100000.0
    for obj in objects:
        objPnt = om.MPoint(cmds.xform(obj, q=True, rp=True, ws=True))
        delta = objPnt - searchPoint
        if delta.length() < minDist:
            closestObj = obj
            minDist = delta.length()

    return closestObj


def findClosestController(searchPoint, controllers):
    closestCtrl = None

    minDist = 100000.0
    for ctrl in controllers:
        ctrlPnt = om.MPoint(cmds.xform(ctrl, q=True, rp=True, ws=True))
        delta = ctrlPnt - searchPoint
        if delta.length() < minDist:
            closestCtrl = ctrl
            minDist = delta.length()

    return closestCtrl


def buildNewJointChain(joints, prefix='', searchStr='', replaceStr=''):
    newJoints = buildNewJoints(joints, prefix, searchStr, replaceStr)

    for index, newJnt in enumerate(newJoints):
        if index == 0:
            continue
        cmds.parent(newJnt, newJoints[index-1])

    cmds.makeIdentity(newJoints[0], apply=True)

    return newJoints


def buildNewJoints(joints, prefix='', searchStr='', replaceStr=''):
    newJoints = []
    for jnt in joints:
        newJnt = cmds.createNode('joint', n=prefix + jnt.replace(searchStr, replaceStr))
        cmds.matchTransform(newJnt, jnt)
        newJoints.append(newJnt)

    cmds.makeIdentity(newJoints, apply=True)

    return newJoints


def duplicateJointChain(joints, prefix='', searchStr='', replaceStr=''):
    dupJnts = duplicateJoints(joints, prefix, searchStr, replaceStr)

    for index, dupJnt in enumerate(dupJnts):
        if index == 0:
            continue
        cmds.parent(dupJnt, dupJnts[index-1])

    cmds.makeIdentity(dupJnts[0], apply=True)

    return dupJnts


def duplicateJoints(joints, prefix='', searchStr='', replaceStr=''):
    dupJnts = []

    for jnt in joints:
        if prefix:
            dupJnt = cmds.duplicate(jnt, n='{}{}'.format(prefix, jnt), po=True)[0]
        else:
            dupJnt = cmds.duplicate(jnt, n=jnt.replace(searchStr, replaceStr), po=True)[0]
        dupJnts.append(dupJnt)

    cmds.makeIdentity(dupJnts, apply=True)

    return dupJnts


def createJointsOnCurve(curve, numJoints, prefix):
    joints = []
    crvFn = om.MFnNurbsCurve(getDagPath(curve))
    crvLength = crvFn.length()
    segments = numJoints - 1
    increment = crvLength / segments

    for i in range(numJoints):
        parm = crvFn.findParamFromLength(increment * i)
        pointOnCrv = crvFn.getPointAtParam(parm, space=om.MSpace.kWorld)
        jnt = cmds.createNode('joint', n='{}{:02d}_crvJnt'.format(prefix, i))
        cmds.xform(jnt, t=pointOnCrv, ws=True)
        joints.append(jnt)
    joints[-1].rename('_'.join(joints[-1].split('_')[:-2]) + '_end_crvJnt')

    cmds.makeIdentity(joints, apply=True)

    return joints


def createJointsOnSurface(surface, numJoints, prefix):
    joints = []
    srfcFn = om.MFnNurbsSurface(getDagPath(surface))
    segments = numJoints - 1
    increment = 1.0 / segments

    for i in range(numJoints):
        pointOnSurface = srfcFn.getPointAtParam(increment * i, 0.5, space=om.MSpace.kWorld)
        jnt = cmds.createNode('joint', n='{}{:02d}_srfcJnt'.format(prefix, i))
        cmds.xform(jnt, t=pointOnSurface, ws=True)
        joints.append(jnt)
    joints[-1].rename('_'.join(joints[-1].split('_')[:-2]) + '_end_srfcJnt')

    cmds.makeIdentity(joints, apply=True)

    return joints


def getAimAxisInfo(startObject, endObject, space='local'):
    startPnt = om.MPoint(cmds.xform(startObject, q=True, rp=True, ws=True))
    endPnt = om.MPoint(cmds.xform(endObject, q=True, rp=True, ws=True))
    aimVector = endPnt - startPnt
    aimVector.normalize()

    if space == 'local':
        startObjectMtx = cmds.getAttr('{}.worldMatrix'.format(startObject))
        mtxXVec = om.MVector(startObjectMtx[0][:3])
        mtxYVec = om.MVector(startObjectMtx[1][:3])
        mtxZVec = om.MVector(startObjectMtx[2][:3])
    elif space == 'world':
        mtxXVec = om.MVector.kXaxisVector
        mtxYVec = om.MVector.kYaxisVector
        mtxZVec = om.MVector.kZaxisVector

    aimDotMtxXVecInfo = [round(aimVector * mtxXVec), 1, 'X']
    aimDotMtxNegXVecInfo = [round(aimVector * -mtxXVec), -1, 'X']
    aimDotMtxYVecInfo = [round(aimVector * mtxYVec), 1, 'Y']
    aimDotMtxNegYVecInfo = [round(aimVector * -mtxYVec), -1, 'Y']
    aimDotMtxZVecInfo = [round(aimVector * mtxZVec), 1, 'Z']
    aimDotMtxNegZVecInfo = [round(aimVector * -mtxZVec), -1, 'Z']

    for info in [aimDotMtxXVecInfo, aimDotMtxNegXVecInfo, aimDotMtxYVecInfo, aimDotMtxNegYVecInfo, aimDotMtxZVecInfo, aimDotMtxNegZVecInfo]:
        if info[0] == 1:
            return (info[1], info[2])


def getInbetweenJoints(startJoint, endJoint):
    inbJoints = []

    inbJointsInfo = {}

    startPnt = om.MPoint(cmds.xform(startJoint, q=True, rp=True, ws=True))
    endPnt = om.MPoint(cmds.xform(endJoint, q=True, rp=True, ws=True))
    startToEndVector = endPnt - startPnt

    for childJnt in cmds.listRelatives(startJoint, ad=True, type='joint'):
        childJntPnt = om.MPoint(cmds.xform(childJnt, q=True, rp=True, ws=True))
        startToChildVec = childJntPnt - startPnt
        if (startToEndVector.normal() * startToChildVec.normal()) >= 0.99 and startToChildVec.length() < startToEndVector.length():
            inbJointsInfo[childJnt] = startToChildVec.length()

    inbJoints = [element[0] for element in sorted(inbJointsInfo.items(), key=lambda item: item[1])]

    return inbJoints


def axisStrToVector(axis):
    axisTable = {'X': om.MVector.kXaxisVector,
                 'Y': om.MVector.kYaxisVector,
                 'Z': om.MVector.kZaxisVector}
    return axisTable[axis]


def axisStrToEnum(axis):
    axisTable = {'X': 0,
                 'Y': 1,
                 'Z': 2}
    return axisTable[axis]


def getMeshesFromJoints(joints):
    meshes = []
    skinClusters = []

    for jnt in joints:
        jntSkinClusters = cmds.listConnections('{}.worldMatrix'.format(jnt), source=False, type='skinCluster')[0]
        if jntSkinClusters:
            skinClusters.extend(jntSkinClusters)
    skinClusters = list(set(skinClusters))
    if not skinClusters:
        return meshes

    for skinCluster in skinClusters:
        meshes.extend(cmds.listConnections('{}.outputGeometry'.format(skinCluster), source=False))
    meshes = list(set(meshes))

    return meshes


def getAffectedVertices(joints, minWeight=0.1):
    preSels = cmds.ls()
    cmds.select(cl=True)
    for jnt in joints:
        skinClusters = cmds.listConnections('{}.worldMatrix'.format(jnt), source=False, type='skinCluster')[0]
        if skinClusters:
            selLs = om.MSelectionList()
            jntDagPath = om.MDagPath()

            for skinCluster in skinClusters:
                # Get skin cluster function
                skinNode = om.MObject()
                selLs.add(skinCluster)
                selLs.getDependNode(0, skinNode)
                if not skinNode.hasFn(om.MFn.kSkinClusterFilter):
                    continue
                skinFn = oma.MFnSkinCluster(skinNode)

                # Get affected points
                selLs.add(jnt)
                selLs.getDagPath(1, jntDagPath)
                componentsSelLs = om.MSelectionList()
                weights = om.MDoubleArray()
                skinFn.getPointsAffectedByInfluence(jntDagPath, componentsSelLs, weights)

                # Select vertices
                geoDagPath = om.MDagPath()
                vertices = om.MObject()
                if componentsSelLs.length() >= 1:
                    componentsSelLs.getDagPath(0, geoDagPath, vertices)
                    fnAllWeightedVtxs = om.MFnSingleIndexedComponent(vertices)
                    allWeightedVtxs = om.MIntArray()
                    fnAllWeightedVtxs.getElements(allWeightedVtxs)
                    fnFilteredWeightedVtxs = om.MFnSingleIndexedComponent()
                    filteredVtxs = fnFilteredWeightedVtxs.create(om.MFn.kMeshVertComponent)
                    for vtxId, weight in zip(allWeightedVtxs, weights):
                        if weight > minWeight:
                            fnFilteredWeightedVtxs.addElement(vtxId)
                    om.MGlobal.select(geoDagPath, filteredVtxs, om.MGlobal.kAddToList)

                selLs.clear()
    affectedVtxs = cmds.ls(fl=True)
    cmds.select(preSels, r=True)
    return affectedVtxs


def filterGroundLevelVertices(vertices, threshold=1.0):
    groundLevelVertices = []
    for vtx in vertices:
        if abs(cmds.pointPosition(vtx, world=True)[1]) < threshold:
            groundLevelVertices.append(vtx)
    return groundLevelVertices


def getFacingFaces(faces, direction, tol=0.5):
    preSel = cmds.ls()
    facingFaces = []

    cmds.select(faces, r=True)
    sels = om.MSelectionList()
    om.MGlobal.getActiveSelectionList(sels)
    itSels = om.MItSelectionList(sels)
    cmds.select(cl=True)
    while not itSels.isDone():
        meshDag = om.MDagPath()
        facesObj = om.MObject()
        itSels.getDagPath(meshDag, facesObj)

        fnFacingFaces = om.MFnSingleIndexedComponent()
        facingFaces = fnFacingFaces.create(om.MFn.kMeshPolygonComponent)
        itFaces = om.MItMeshPolygon(meshDag, facesObj)
        while not itFaces.isDone():
            faceNormal = om.MVector()
            itFaces.getNormal(faceNormal, om.MSpace.kWorld)
            if (faceNormal * direction) > tol:
                fnFacingFaces.addElement(itFaces.index())
            itFaces.next()
        om.MGlobal.select(meshDag, facingFaces, om.MGlobal.kAddToList)
        itSels.next()
    facingFaces = cmds.ls(fl=True)
    cmds.select(preSel, r=True)

    return facingFaces


def eigh(a, tol=1.0e-9):
    """
    Calculates the eigenValues and vectors using jacobi method.

    Returns:
        (list of 3 floats) EigenValues
        (3x3 list of floats) EigenVectors

    Raises:
        None
    """
    # Find largest off-diag. element a[k][l]
    def maxElem(a):
        n = len(a)
        aMax = 0.0
        for i in range(n-1):
            for j in range(i+1, n):
                if abs(a[i][j]) >= aMax:
                    aMax = abs(a[i][j])
                    k = i
                    l = j
        return aMax, k, l

    # Rotate to make a[k][l] = 0
    def rotate(a, p, k, l):
        n = len(a)
        aDiff = a[l][l] - a[k][k]
        if abs(a[k][l]) < abs(aDiff) * 1.0e-36:
            t = a[k][l] / aDiff
        else:
            phi = aDiff/(2.0 * a[k][l])
            t = 1.0/(abs(phi) + sqrt(phi**2 + 1.0))
            if phi < 0.0:
                t = -t
        c = 1.0/sqrt(t**2 + 1.0)
        s = t*c
        tau = s/(1.0 + c)
        temp = a[k][l]
        a[k][l] = 0.0
        a[k][k] = a[k][k] - t * temp
        a[l][l] = a[l][l] + t * temp
        for i in range(k):      # Case of i < k
            temp = a[i][k]
            a[i][k] = temp - s*(a[i][l] + tau*temp)
            a[i][l] = a[i][l] + s*(temp - tau*a[i][l])
        for i in range(k+1, l):  # Case of k < i < l
            temp = a[k][i]
            a[k][i] = temp - s*(a[i][l] + tau*a[k][i])
            a[i][l] = a[i][l] + s*(temp - tau*a[i][l])
        for i in range(l+1, n):  # Case of i > l
            temp = a[k][i]
            a[k][i] = temp - s*(a[l][i] + tau*temp)
            a[l][i] = a[l][i] + s*(temp - tau*a[l][i])
        for i in range(n):      # Update transformation matrix
            temp = p[i][k]
            p[i][k] = temp - s*(p[i][l] + tau*p[i][k])
            p[i][l] = p[i][l] + s*(temp - tau*p[i][l])

    # Set limit on number of rotations
    n = len(a)
    maxRot = 5*(n**2)

    p = [[1.0,  0.0,  0.0],
         [0.0,  1.0,  0.0],
         [0.0,  0.0,  1.0]]

    # Jacobi rotation loop
    for i in range(maxRot):

        aMax, k, l = maxElem(a)

        if aMax < tol:
            return [a[i][i] for i in range(len(a))], p

        rotate(a, p, k, l)


def duplicateFace(faces):
    # Get meshes
    meshes = []
    for face in faces:
        meshes.append(cmds.ls(face, objectsOnly=True))
    meshes = list(set(meshes))

    # Get faces matching mesh
    meshFaceInfo = {}
    for mesh in meshes:
        meshFaces = []
        for face in faces:
            if mesh in face:
                meshFaces.append(face)
        meshFaceInfo[mesh] = meshFaces

    # Duplicate meshes and delete unselected faces of duplicated mesh
    dupMeshes = []
    for mesh, faces in meshFaceInfo.items():
        dupMesh = cmds.duplicate(mesh)[0]
        dupMeshFaces = [face.replace(mesh, dupMesh) for face in faces]
        cmds.select(dupMesh, r=True)
        cmds.selectMode(component=True)
        cmds.select(dupMeshFaces, r=True)
        mel.eval('InvertSelection();')
        cmds.delete()
        cmds.selectMode(object=True)
        dupMeshes.append(dupMesh)

    # Combine meshes
    if len(dupMeshes) >= 2:
        resultMesh = cmds.polyUnite(dupMeshes, ch=False)[0]
        cmds.delete(dupMeshes)
    else:
        resultMesh = dupMeshes[0]

    return resultMesh

def getMostAlignedVector(axis, vectors):
    mostAlignedVector = None
    mostAligendValue = -1.0
    for vec in vectors:
        alignedVal = axis * vec.normal()
        if alignedVal > mostAligendValue:
            mostAligendValue = alignedVal
            mostAlignedVector = vec
    return mostAlignedVector


def getOrientMatrix(point1, point2, point3):
    pnt1Pnt2Vec = point2 - point1
    pnt1pnt3Vec = point3 - point1

    xAxisVec = pnt1Pnt2Vec ^ pnt1pnt3Vec
    zAxisVec = pnt1pnt3Vec ^ xAxisVec
    yAxisVec = zAxisVec ^ xAxisVec

    xAxisVec.normalize()
    yAxisVec.normalize()
    zAxisVec.normalize()

    mtx = [xAxisVec.x, xAxisVec.y, xAxisVec.z, 0,
           yAxisVec.x, yAxisVec.y, yAxisVec.z, 0,
           zAxisVec.x, zAxisVec.y, zAxisVec.z, 0,
           0, 0, 0, 1]
    return om.MMatrix(mtx)


def getProjectedVector(vector1, vector2):
    vector2.normalize()
    return vector2 * (vector1 * vector2)


def isParallel(vector1, vector2):
    return round((vector1 ^ vector2).length()) == 0.0


def getDistance(transform1, transform2):
    return (getWorldPoint(transform2) - getWorldPoint(transform1)).length()


def getCenterVector(transforms):
    trsfVectors = [om.MVector(getWorldPoint(trsf)) for trsf in transforms]
    sumVectors = om.MVector()
    for trsfVector in trsfVectors:
        sumVectors += trsfVector
    return sumVectors / len(trsfVectors)


def removeConnections(node):
    cnsts = cmds.listConnections(node, destination=False, type='constraint')
    if cnsts:
        cmds.delete(cnsts)

    for attr in cmds.listAttr(node, keyable=True):
        disconnectAttr(attr)

    for dynAttr in cmds.listAttr(node, userDefined=True):
        disconnectAttr(dynAttr)


def makeGroup(object, groupName):
    grp = None
    objParent = cmds.listRelatives(object, p=True)
    grp = cmds.createNode('transform', n=groupName)
    cmds.matchTransform(grp, object)
    cmds.parent(object, grp)
    if objParent:
        cmds.parent(grp, objParent)
    return grp


def getCleanName(name):
    cleanName = name

    if '.' in name:
        cleanName = cleanName.replace('.', '_')
    if '[' in name:
        cleanName = cleanName.replace('[', '_')
    if ']' in name:
        cleanName = cleanName.replace(']', '_')
    if '|' in name:
        cleanName = cleanName.replace('|', '_')

    return cleanName


def cloneUserDefinedAttrs(sourceNode, targetNode, keyable=True):
    for attr in cmds.listAttr(sourceNode, ud=True, keyable=keyable):
        attrType = attr.type()
        minVal = attr.getMin()
        maxVal = attr.getMax()
        dftVal = attr.get(default=True)
        cmds.addAttr(targetNode, ln=attr, at=attrType, min=minVal, max=maxVal, dv=dftVal, keyable=keyable)
        targetNode.attr(attr) >> sourceNode.attr(attr)


def getWorldMatrixMirrorX(inMatrix):
    mirrorXMtxLs = [-1, 0, 0, 0,
                    0, 1, 0, 0,
                    0, 0, 1, 0,
                    0, 0, 0, 1]
    mirrorXMtx = om.MMatrix(mirrorXMtxLs)
    return inMatrix * mirrorXMtx


def isOddNumber(number):
    return number%2 == 1


def getSkinCluster(geo):
    return mel.findRelatedSkinCluster(geo)


def cleanupRig():
    cleanupControllers()

    # Connect controlRig set to controlRig group
    rigGrp = 'controlRig'
    masterSet = 'controlRig_set'
    if not cmds.objExists('controlRig.rigSet'):
        cmds.addAttr(rigGrp, ln='rigSet', at='message', keyable=False)
    masterSet.message >> rigGrp.rigSet

    # Hide private groups
    privateGrps = cmds.ls(['*_init_grp', '*_blbx_grp', '*_out_grp'])
    for privateGrp in privateGrps:
        privateGrp.hide()

    # Hide secondary and tertiary controllers
    try:
        cmds.ls('*.extraCtrlVis')[0].set(False)
        cmds.ls('*.facialCtrlVis')[0].set(False)
    except:
        pass

    # Convert multiRemap nodes to maya node networks
    if cmds.pluginInfo('multiRemapValue', q=True, loaded=True):
        multiRemapNodes = cmds.ls(type='multiRemapValue')
        if multiRemapNodes:
            for multiRemapNode in multiRemapNodes:
                convertMultiRemapToMayaRemap(multiRemapNode)


def cleanupControllers():
    rigSet = 'controlRig_set'
    ctrlTrsfs = [ctrlNode.inputs()[0] for ctrlNode in cmds.ls(rigSet.members(flatten=True), type='controller')]

    # Remove keyframe
    for ctrlTrsf in ctrlTrsfs:
        cmds.cutKey(ctrlTrsf)

    # Set default value
    for ctrlTrsf in ctrlTrsfs:
        for attr in ctrlTrsf.listAttr(keyable=True) + ctrlTrsf.listAttr(ud=True):
            try:
                attr.set(attr.getDefault())
            except:
                pass

    # Set geometry display type to reference
    displayCtrl = [ctrlTrsf for ctrlTrsf in ctrlTrsfs if ctrlTrsf.hasAttr('geometryVis')]
    if displayCtrl:
        displayCtrl[0].geometryVis.set(2)


def convertMultiRemapToMayaRemap(multiRemapNode):
    # Get informations
    valueInfo = {}
    minMaxInfo = {}
    inputValues = []
    inConnectInfo = []
    outConnectInfo = []
    set = None

    valueArray = cmds.listAttr(multiRemapNode.value, multi=True, string='value')
    for element in valueArray:
        attr = multiRemapNode.attr(element)
        elementInfo = {}
        elementInfo['Position'] = attr.value_Position.get()
        elementInfo['FloatValue'] = attr.value_FloatValue.get()
        elementInfo['Interp'] = attr.value_Interp.get()
        valueInfo[element] = elementInfo

    for attrName in ['inputMin', 'inputMax', 'outputMin', 'outputMax']:
        minMaxInfo[attrName] = multiRemapNode.attr(attrName).get()

    inputValues = multiRemapNode.inputValue.get()

    driverPlugs = multiRemapNode.inputs(plugs=True)
    for driverPlug in driverPlugs:
        drivenPlug = driverPlug.outputs(plugs=True, type='multiRemapValue')[0]
        inConnectInfo.append((driverPlug, drivenPlug))

    drivenPlugs = multiRemapNode.outputs(plugs=True, type='addDoubleLinear')
    for drivenPlug in drivenPlugs:
        driverPlug = drivenPlug.inputs(plugs=True, type='multiRemapValue')[0]
        outConnectInfo.append((driverPlug, drivenPlug))

    set = multiRemapNode.message.outputs(type='objectSet')[0]

    # Setup parent remap value
    nodeName = multiRemapNode.rsplit('_', 1)[0]
    parentRemap = cmds.createNode('remapValue', n='{}_parent_remap'.format(nodeName))
    for valName, valInfo in valueInfo.items():
        for name, val in valInfo.items():
            parentRemap.attr(valName).attr('value_{}'.format(name)).set(val)
    for name, val in minMaxInfo.items():
        parentRemap.attr(name).set(val)
    for inConnect in inConnectInfo:
        driverPlug = inConnect[0]
        drivenPlug = '{}.{}'.format(parentRemap, inConnect[1].split('.', 1)[-1])
        driverPlug >> drivenPlug

    set.forceElement(parentRemap)

    # Setup child remap values
    childRemaps = []
    for i, inputVal in enumerate(inputValues):
        childRemap = cmds.duplicate(parentRemap, n='{}_child_{:02d}_remap'.format(nodeName, i))[0]
        childRemap.inputValue.set(inputVal)
        for attrName in cmds.listAttr(parentRemap.value, multi=True, string='value'):
            parentValAttr = '{}.{}'.format(parentRemap, attrName)
            childValAttr = '{}.{}'.format(childRemap, attrName)
            parentValAttr >> childValAttr

        for attrName in minMaxInfo.keys():
            parentRemap.attr(attrName) >> childRemap.attr(attrName)

        driverAttr = childRemap.outValue
        drivenAttr = outConnectInfo[i][1]
        driverAttr >> drivenAttr

        childRemaps.append(childRemap)

    cmds.delete(multiRemapNode)
    set.forceElement(childRemaps)


def setupGlobalDynamicController(moduleGroups, name):
    cmds.undoInfo(openChunk=True)

    hairSystems = [moduleGrp.getChildren(ad=True, type='hairSystem')[0] for moduleGrp in moduleGroups]

    solver = cmds.createNode('nucleus', n='{}_nucleus'.format(name))
    solver.inheritsTransform.set(False)
    solver.spaceScale.set(0.05)

    # Create controller
    dynCtrlName = 'dyn_ctrl'
    if not cmds.objExists(dynCtrlName):
        dynCtrlName = cmds.curve(d=1, p=[[-1, 6, 0], [0, 5, 0], [1, 6, 0], [2, 6, 0], [4, 4, 0], [3, 3, 0], [2, 4, 0], [2, 1, 0], [-2, 1, 0], [-2, 4, 0], [-3, 3, 0], [-4, 4, 0], [-2, 6, 0], [-1, 6, 0]], n=dynCtrlName)
        cmds.group(dynCtrlName, n='{}_zero'.format(dynCtrlName))
        for attr in dynCtrlName.listAttr(keyable=True):
            attr.lock(True)
            attr.setKeyable(False)

    cmds.addAttr(dynCtrlName, ln=name, at='enum', en='---------------:')
    cmds.setAttr('{}.{}'.format(dynCtrlName, name), channelBox=True)
    cmds.addAttr(dynCtrlName, ln='{}_enable'.format(name), at='bool', keyable=True, dv=False)
    cmds.addAttr(dynCtrlName, ln='{}_startFrame'.format(name), at='long', keyable=True, dv=100000)
    cmds.addAttr(dynCtrlName, ln='{}_subSteps'.format(name), at='long', keyable=True, dv=3)
    cmds.addAttr(dynCtrlName, ln='{}_bendResistance'.format(name), at='double', keyable=True, dv=0.1)
    cmds.addAttr(dynCtrlName, ln='{}_stiffness'.format(name), at='double', keyable=True, dv=0.1)
    cmds.addAttr(dynCtrlName, ln='{}_damp'.format(name), at='double', keyable=True, dv=0.1)
    cmds.addAttr(dynCtrlName, ln='{}_drag'.format(name), at='double', keyable=True, dv=0.05)
    cmds.addAttr(dynCtrlName, ln='{}_startCurveAttract'.format(name), at='double', keyable=True, dv=1)
    cmds.addAttr(dynCtrlName, ln='{}_attractionDamp'.format(name), at='double', keyable=True, dv=0)

    dynCtrlName.attr('{}_enable'.format(name)) >> solver.enable
    dynCtrlName.attr('{}_startFrame'.format(name)) >> solver.startFrame
    dynCtrlName.attr('{}_subSteps'.format(name)) >> solver.subSteps

    for hairSystem in hairSystems:
        changeSolver(hairSystem, solver)
        localDynCtrl = list(set(hairSystem.inputs(type='transform', exactType=True)))[0]
        dynCtrlName.attr('{}_enable'.format(name)) >> localDynCtrl.enable
        dynCtrlName.attr('{}_startFrame'.format(name)) >> localDynCtrl.startFrame
        dynCtrlName.attr('{}_subSteps'.format(name)) >> localDynCtrl.subSteps
        dynCtrlName.attr('{}_bendResistance'.format(name)) >> localDynCtrl.bendResistance
        dynCtrlName.attr('{}_stiffness'.format(name)) >> localDynCtrl.stiffness
        dynCtrlName.attr('{}_damp'.format(name)) >> localDynCtrl.damp
        dynCtrlName.attr('{}_drag'.format(name)) >> localDynCtrl.drag
        dynCtrlName.attr('{}_startCurveAttract'.format(name)) >> localDynCtrl.startCurveAttract
        dynCtrlName.attr('{}_attractionDamp'.format(name)) >> localDynCtrl.attractionDamp

    cmds.undoInfo(closeChunk=True)

def changeSolver(dynamicNode, solver=None):
    if not solver:
        solver = cmds.createNode('nucleus')

    if dynamicNode.nodeType() == 'transform':
        dynamicNode = dynamicNode.getShape()

    oldSolver = list(set(dynamicNode.inputs(type='nucleus')))

    time1 = 'time1'
    time1.outTime.connect(solver.currentTime, f=True)

    solver.startFrame.connect(dynamicNode.startFrame, f=True)

    index = findMultiAttributeEmptyIndex(node=solver, attribute='outputObjects')
    solver.outputObjects[index].connect(dynamicNode.nextState, f=True)

    index = findMultiAttributeEmptyIndex(node=solver, attribute='inputActive')
    dynamicNode.currentState.disconnect()
    dynamicNode.currentState.connect(solver.inputActive[index])

    index = findMultiAttributeEmptyIndex(node=solver, attribute='inputActiveStart')
    dynamicNode.startState.disconnect()
    dynamicNode.startState.connect(solver.inputActiveStart[index])

    cmds.delete(oldSolver)

def findMultiAttributeEmptyIndex(node, attribute):
    id = 0
    while node.attr(attribute)[id].isConnected():
        id += 1
    return id

def symmeterizeModule(sourceModuleGroup, targetModuleGroup):
    srcTrans = sourceModuleGroup.translate.get()
    srcRotate = sourceModuleGroup.rotate.get()
    srcScale = sourceModuleGroup.scale.get()
    targetModuleGroup.translate.set(-srcTrans.x, srcTrans.y, srcTrans.z)
    targetModuleGroup.rotate.set(srcRotate)
    targetModuleGroup.scale.set(srcScale)

    srcPrefix = sourceModuleGroup.split('_module')[0]
    trgPrefix = targetModuleGroup.split('_module')[0]
    srcCtrlNodes = [item for item in cmds.sets('{}_set'.format(srcPrefix), q=True) if item.nodeType() == 'controller']
    srcCtrls = [ctrlNode.inputs()[0] for ctrlNode in srcCtrlNodes]
    trgCtrlNodes = [item for item in cmds.sets('{}_set'.format(trgPrefix), q=True) if item.nodeType() == 'controller']
    trgCtrls = [ctrlNode.inputs()[0] for ctrlNode in trgCtrlNodes]

    for srcCtrl, trgCtrl in zip(sorted(srcCtrls), sorted(trgCtrls)):
        srcCtrlZeroGrp = srcCtrl.getParent(generations=2)
        trgCtrlZeroGrp = trgCtrl.getParent(generations=2)
        srcMtx = srcCtrlZeroGrp.worldMatrix.get()
        trgMtx = symmetryMatrix(srcMtx)
        cmds.xform(trgCtrlZeroGrp, m=trgMtx, ws=True)
        cmds.xform(trgCtrlZeroGrp, t=(-srcMtx[3][0], srcMtx[3][1], srcMtx[3][2]), ws=True)

        srcCtrlExtraGrp = srcCtrl.getParent()
        trgCtrlExtraGrp = trgCtrl.getParent()
        srcMtx = srcCtrlExtraGrp.worldMatrix.get()
        trgMtx = symmetryMatrix(srcMtx)
        cmds.xform(trgCtrlExtraGrp, m=trgMtx, ws=True)
        cmds.xform(trgCtrlExtraGrp, t=(-srcMtx[3][0], srcMtx[3][1], srcMtx[3][2]), ws=True)

def symmetryMatrix(matrix):
    resultMtx = om.MMatrix()
    symMtx = om.MMatrix(
        1.0, 0.0, 0.0, 0.0,
        0.0, -1.0, 0.0, 0.0,
        0.0, 0.0, -1.0, 0.0,
        0.0, 0.0, 0.0, 1.0
    )
    resultMtx = matrix * symMtx
    return resultMtx


def connectScaleWithConstraint(moduleGroup):
    outJnts = [jnt for jnt in moduleGroup.getChildren(ad=True, type='joint') if 'out' in jnt.name()]
    for outJnt in outJnts:
        skelJnt = outJnt.scaleX.outputs(type='joint')[0]
        outJnt.scaleX // skelJnt.scaleX
        outJnt.scaleY // skelJnt.scaleY
        outJnt.scaleZ // skelJnt.scaleZ
        cmds.scaleConstraint(outJnt, skelJnt, mo=True)


def getDagPath(name):
    sels = om.MSelectionList()
    sels.add(name)
    return sels.getDagPath(0)


def disconnectAttr(attribute):
    inputPlug = cmds.listConnections(attribute, destination=False, plugs=True)
    if inputPlug:
        cmds.disconnectAttr(inputPlug[0], attribute)
