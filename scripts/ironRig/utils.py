from math import sqrt
import maya.OpenMaya as om
import maya.OpenMayaAnim as oma
import pymel.core as pm


def makeHierarchy(objects):
    for index, jnt in enumerate(objects):
        if index == 0:
            continue
        objects[index-1] | jnt

def parentKeepHierarchy(childObjects, parentObject):
    if not isinstance(childObjects, list):
        childObjects = [childObjects]
    childObjects = [pm.PyNode(item) for item in childObjects]

    parentInfo = {}
    for childObj in childObjects:
        parentInfo[childObj] = childObj.getParent()

    if parentObject == 'world':
        pm.parent(childObjects, w=True)
    else:
        pm.parent(childObjects, parentObject)

    for childObj, parent in parentInfo.items():
        if parent and parent in childObjects:
            pm.parent(childObj, parent)


def getWorldPoint(object):
    return pm.dt.Point(pm.xform(object, q=True, rp=True, ws=True))


def findClosestObject(searchPoint, objects):
    closestObj = None

    minDist = 100000.0
    for obj in objects:
        objPnt = pm.dt.Point(pm.xform(obj, q=True, rp=True, ws=True))
        delta = objPnt - searchPoint
        if delta.length() < minDist:
            closestObj = obj
            minDist = delta.length()

    return closestObj


def findClosestController(searchPoint, controllers):
    closestCtrl = None

    minDist = 100000.0
    for ctrl in controllers:
        ctrlPnt = pm.dt.Point(pm.xform(ctrl.transform(), q=True, rp=True, ws=True))
        delta = ctrlPnt - searchPoint
        if delta.length() < minDist:
            closestCtrl = ctrl
            minDist = delta.length()

    return closestCtrl


def connectTransform(driver, driven, channels, axes):
    driver = pm.PyNode(driver)
    driven = pm.PyNode(driven)
    attrNames = [ch + axis for ch in channels for axis in axes]
    for attrName in attrNames:
        driver.attr(attrName) >> driven.attr(attrName)


def buildNewJointChain(joints, prefix='', searchStr='', replaceStr=''):
    newJoints = buildNewJoints(joints, prefix, searchStr, replaceStr)

    for index, newJnt in enumerate(newJoints):
        if index == 0:
            continue
        newJoints[index-1] | newJnt

    pm.makeIdentity(newJoints[0], apply=True)

    return newJoints


def buildNewJoints(joints, prefix='', searchStr='', replaceStr=''):
    newJoints = []
    for jnt in joints:
        newJnt = pm.createNode('joint', n=prefix + jnt.replace(searchStr, replaceStr))
        pm.matchTransform(newJnt, jnt)
        newJoints.append(newJnt)

    pm.makeIdentity(newJoints, apply=True)

    return newJoints


def duplicateJointChain(joints, prefix='', searchStr='', replaceStr=''):
    dupJnts = duplicateJoints(joints, prefix, searchStr, replaceStr)

    for index, dupJnt in enumerate(dupJnts):
        if index == 0:
            continue
        dupJnts[index-1] | dupJnt

    pm.makeIdentity(dupJnts[0], apply=True)

    return dupJnts


def duplicateJoints(joints, prefix='', searchStr='', replaceStr=''):
    dupJnts = []

    for jnt in joints:
        if prefix:
            dupJnt = pm.duplicate(jnt, n='{}{}'.format(prefix, jnt), po=True)[0]
        else:
            dupJnt = pm.duplicate(jnt, n=jnt.replace(searchStr, replaceStr), po=True)[0]
        dupJnts.append(dupJnt)

    pm.makeIdentity(dupJnts, apply=True)

    return dupJnts


def createJointsOnCurve(curve, numJoints, prefix):
    joints = []

    curve = pm.PyNode(curve)

    crvLength = curve.length()
    segments = numJoints - 1
    increment = crvLength / segments

    for i in range(numJoints):
        parm = curve.findParamFromLength(increment * i)
        pointOnCrv = curve.getPointAtParam(parm, space='world')
        jnt = pm.createNode('joint', n='{}{:02d}_crvJnt'.format(prefix, i))
        pm.xform(jnt, t=pointOnCrv, ws=True)
        joints.append(jnt)

    pm.makeIdentity(joints, apply=True)

    return joints


def createJointsOnSurface(surface, numJoints, prefix):
    joints = []

    surface = pm.PyNode(surface)

    segments = numJoints - 1
    increment = 1.0 / segments

    for i in range(numJoints):
        pointOnSurface = surface.getPointAtParam(increment * i, 0.5, space='world')
        jnt = pm.createNode('joint', n='{}{:02d}_srfcJnt'.format(prefix, i))
        pm.xform(jnt, t=pointOnSurface, ws=True)
        joints.append(jnt)

    pm.makeIdentity(joints, apply=True)

    return joints


def getAimAxisInfo(startJoint, endJoint):
    startJoint = pm.PyNode(startJoint)
    endJoint = pm.PyNode(endJoint)

    startPnt = pm.dt.Point(pm.xform(startJoint, q=True, rp=True, ws=True))
    endPnt = pm.dt.Point(pm.xform(endJoint, q=True, rp=True, ws=True))
    aimVector = endPnt - startPnt
    aimVector.normalize()

    startJntMtx = startJoint.worldMatrix.get()
    mtxXVec = pm.dt.Vector(startJntMtx[0][:3])
    mtxYVec = pm.dt.Vector(startJntMtx[1][:3])
    mtxZVec = pm.dt.Vector(startJntMtx[2][:3])

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
    startJoint = pm.PyNode(startJoint)
    endJoint = pm.PyNode(endJoint)

    startPnt = pm.dt.Point(pm.xform(startJoint, q=True, rp=True, ws=True))
    endPnt = pm.dt.Point(pm.xform(endJoint, q=True, rp=True, ws=True))
    startToEndVector = endPnt - startPnt

    for childJnt in startJoint.getChildren(ad=True, type='joint'):
        childJntPnt = pm.dt.Point(pm.xform(childJnt, q=True, rp=True, ws=True))
        startToChildVec = childJntPnt - startPnt
        if startToEndVector * startToChildVec > 0 and startToChildVec.length() < startToEndVector.length():
            inbJointsInfo[childJnt] = startToChildVec.length()

    inbJoints = [element[0] for element in sorted(inbJointsInfo.items(), key=lambda item: item[1])]

    return inbJoints


def axisToVector(axis):
    axisTable = {'X': pm.dt.Vector(1, 0, 0),
                 'Y': pm.dt.Vector(0, 1, 0),
                 'Z': pm.dt.Vector(0, 0, 1)}
    return axisTable[axis]


def getAffectedVertices(joints, minWeight=0.1):
    preSels = pm.selected()
    pm.select(cl=True)
    for jnt in joints:
        jnt = pm.PyNode(jnt)
        skinClusters = jnt.worldMatrix.outputs(type='skinCluster')

        selLs = om.MSelectionList()
        jntDagPath = om.MDagPath()

        for skinCluster in skinClusters:
            # Get skin cluster function
            skinNode = om.MObject()
            selLs.add(skinCluster.name())
            selLs.getDependNode(0, skinNode)
            if not skinNode.hasFn(om.MFn.kSkinClusterFilter):
                continue
            skinFn = oma.MFnSkinCluster(skinNode)

            # Get affected points
            selLs.add(jnt.name())
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
    affectedVtxs = pm.selected(fl=True)
    pm.select(preSels, r=True)
    return affectedVtxs


def getFacingFaces(faces, direction, tol=0.5):
    preSel = pm.selected()
    facingFaces = []

    pm.select(faces, r=True)
    sels = om.MSelectionList()
    om.MGlobal.getActiveSelectionList(sels)
    itSels = om.MItSelectionList(sels)
    pm.select(cl=True)
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
    facingFaces = pm.selected(fl=True)
    pm.select(preSel, r=True)

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
        meshes.append(face.node().getTransform())
    meshes = list(set(meshes))

    # Get faces matching mesh
    meshFaceInfo = {}
    for mesh in meshes:
        meshFaces = []
        for face in faces:
            if mesh.name() in face.name():
                meshFaces.append(face)
        meshFaceInfo[mesh] = meshFaces

    # Duplicate meshes and delete unselected faces of duplicated mesh
    dupMeshes = []
    for mesh, faces in meshFaceInfo.items():
        dupMesh = pm.duplicate(mesh)[0]
        dupMeshFaces = [face.replace(mesh.name(), dupMesh.name()) for face in faces]
        pm.select(dupMesh, r=True)
        pm.selectMode(component=True)
        pm.select(dupMeshFaces, r=True)
        pm.mel.eval('InvertSelection();')
        pm.delete()
        pm.selectMode(object=True)
        dupMeshes.append(dupMesh)

    # Combine meshes
    if len(dupMeshes) >= 2:
        resultMesh = pm.polyUnite(dupMeshes, ch=False)[0]
        pm.delete(dupMeshes)
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
    return pm.dt.Matrix(mtx)


def getProjectedVector(vector1, vector2):
    vector2.normalize()
    return vector2 * (vector1 * vector2)


def isParallel(vector1, vector2):
    return round((vector1 ^ vector2).length()) == 0.0


def getDistance(transform1, transform2):
    return (getWorldPoint(transform2) - getWorldPoint(transform1)).length()


def getCenterVector(transforms):
    trsfVectors = [pm.dt.Vector(getWorldPoint(trsf)) for trsf in transforms]
    sumVectors = pm.dt.Vector()
    for trsfVector in trsfVectors:
        sumVectors += trsfVector
    return sumVectors / len(trsfVectors)


def removeConnections(node):
    node = pm.PyNode(node)
    cnsts = node.inputs(type='constraint')
    if cnsts:
        pm.delete(cnsts)

    for attr in node.listAttr(keyable=True):
        attr.disconnect()

    for dynAttr in node.listAttr(userDefined=True):
        dynAttr.disconnect()


def makeGroup(object, groupName):
    grp = None
    object = pm.PyNode(object)
    objParent = object.getParent()
    grp = pm.createNode('transform', n=groupName)
    pm.matchTransform(grp, object)
    grp | object
    if objParent:
        objParent | grp
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


def cloneUserDefinedAttrs(sourceNode, targetNode):
    for attr in sourceNode.listAttr(ud=True):
        attrName = attr.attrName()
        attrType = attr.type()
        minVal = attr.getMin()
        maxVal = attr.getMax()
        dftVal = attr.get(default=True)
        pm.addAttr(targetNode, ln=attrName, at=attrType, min=minVal, max=maxVal, dv=dftVal, keyable=True)
        targetNode.attr(attrName) >> sourceNode.attr(attrName)


def getWorldMatrixMirrorX(inMatrix):
    mirrorXMtxLs = [-1, 0, 0, 0,
                    0, 1, 0, 0,
                    0, 0, 1, 0,
                    0, 0, 0, 1]
    mirrorXMtx = pm.dt.Matrix(mirrorXMtxLs)
    return inMatrix * mirrorXMtx


def cleanupRig():
    cleanupControllers()
    # Hide private groups
    privateGrps = pm.ls(['*_init_grp', '*_blbx_grp', '*_out_grp'])
    for privateGrp in privateGrps:
        privateGrp.hide()
    hideJoints()


def cleanupControllers():
    rigSet = pm.PyNode('rig_set')
    ctrlTrsfs = [ctrlNode.inputs()[0] for ctrlNode in pm.ls(rigSet.members(flatten=True), type='controller')]

    # Remove keyframe
    for ctrlTrsf in ctrlTrsfs:
        pm.cutKey(ctrlTrsf)

    # Set default value
    for ctrlTrsf in ctrlTrsfs:
        for attr in ctrlTrsf.listAttr(keyable=True):
            try:
                attr.set(attr.getDefault())
            except:
                pass

    # Set geometry display type to reference
    displayCtrl = [ctrlTrsf for ctrlTrsf in ctrlTrsfs if ctrlTrsf.hasAttr('geometryVis')]
    if displayCtrl:
        displayCtrl[0].geometryVis.set(2)


def hideJoints():
    for jnt in pm.ls(type='joint'):
        jnt.drawStyle.set(2)


def isOddNumber(number):
    return number%2 == 1


def getSkinCluster(geo):
    return pm.mel.findRelatedSkinCluster(geo.node())