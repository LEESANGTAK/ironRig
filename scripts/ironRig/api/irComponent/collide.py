from maya import cmds


def setupCollideComponent(driven, driver, type='plane'):
    typeMap = {
        'plane': cmds.nurbsPlane,
        'sphere': cmds.sphere
    }

    # Create dag nodes
    colGeo = typeMap.get(type)(n='{}_col_geo'.format(driven), d=1, ch=False)[0]
    inLoc = cmds.spaceLocator(n='{}_col_in_loc'.format(driven))[0]
    cmds.matchTransform(inLoc, driven)
    outLoc = cmds.spaceLocator(n='{}_col_out_loc'.format(driven))[0]
    cmds.setAttr('{}.inheritsTransform'.format(outLoc), False)

    # Create dg nodes
    closestPntOnSrfc = cmds.createNode('closestPointOnSurface', n='{}_col_closestPntOnSrfc'.format(driven))
    pntOnSrfcInfo = cmds.createNode('pointOnSurfaceInfo', n='{}_col_pntOnSrfcInfo'.format(driven))
    plusMinusAvg = cmds.createNode('plusMinusAverage', n='{}_col_plusMinusAvg'.format(driven))
    vectorProd = cmds.createNode('vectorProduct', n='{}_col_vectorProd'.format(driven))
    cond = cmds.createNode('condition', n='{}_col_cond'.format(driven))

    # Set attributes for nodes
    cmds.setAttr('{}.operation'.format(plusMinusAvg), 2)
    cmds.setAttr('{}.operation'.format(cond), 5)

    # Connect nodes
    cmds.connectAttr('{}.worldSpace[0]'.format(colGeo), '{}.inputSurface'.format(closestPntOnSrfc))
    cmds.connectAttr('{}.worldPosition[0]'.format(inLoc), '{}.inPosition'.format(closestPntOnSrfc))

    cmds.connectAttr('{}.worldSpace[0]'.format(colGeo), '{}.inputSurface'.format(pntOnSrfcInfo))
    cmds.connectAttr('{}.parameterU'.format(closestPntOnSrfc), '{}.parameterU'.format(pntOnSrfcInfo))
    cmds.connectAttr('{}.parameterV'.format(closestPntOnSrfc), '{}.parameterV'.format(pntOnSrfcInfo))

    cmds.connectAttr('{}.worldPosition[0]'.format(inLoc), '{}.input3D[0]'.format(plusMinusAvg))
    cmds.connectAttr('{}.position'.format(pntOnSrfcInfo), '{}.input3D[1]'.format(plusMinusAvg))

    cmds.connectAttr('{}.output3D'.format(plusMinusAvg), '{}.input1'.format(vectorProd))
    cmds.connectAttr('{}.normal'.format(pntOnSrfcInfo), '{}.input2'.format(vectorProd))

    cmds.connectAttr('{}.outputX'.format(vectorProd), '{}.firstTerm'.format(cond))
    cmds.connectAttr('{}.position'.format(pntOnSrfcInfo), '{}.colorIfTrue'.format(cond))
    cmds.connectAttr('{}.worldPosition[0]'.format(inLoc), '{}.colorIfFalse'.format(cond))

    cmds.connectAttr('{}.outColor'.format(cond), '{}.translate'.format(outLoc))

    # Clean up outliner
    cpntGrp = cmds.createNode('transform', n='{}_col_cpnt'.format(driven))
    driverParent = cmds.listRelatives(driver, p=True)
    if driverParent:
        cmds.matchTransform(cpntGrp, driverParent)
        cmds.parentConstraint(driverParent[0], cpntGrp, mo=True)
        cmds.connectAttr('{}.scale'.format(driver), '{}.scale'.format(cpntGrp))
    cmds.parent([colGeo, inLoc, outLoc], cpntGrp)
    cmds.setAttr('{}.translate'.format(colGeo), 0, 0, 0)
    cmds.setAttr('{}.rotate'.format(colGeo), 0, 0, 0)

    # Constrain
    cmds.parentConstraint(driver, colGeo, mo=True)
    # Point constraint need after edit collision geometry shape
    #cmds.pointConstraint(outLoc, driven, mo=True)

    cmds.select(colGeo, r=True)
