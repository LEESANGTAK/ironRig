"""
Author: Sangtak Lee
Contact: chst27@gmail.com
"""


import pymel.core as pm


def getHairSystems(nucleus):
    hairSystems = []
    hairSystems = nucleus.startFrame.connections(source=False, type='hairSystem', shapes=True)
    return hairSystems


def getNucleusControllerAttributes(nucleus):
    enableCtrlAttr = None
    startFrameCtrlAttr = None
    enableAttrDriver = nucleus.enable.connections(destination=False, plugs=True)
    startFrameAttrDriver = nucleus.startFrame.connections(destination=False, plugs=True)
    enableCtrlAttr = enableAttrDriver[0] if enableAttrDriver else nucleus.enable
    startFrameCtrlAttr = startFrameAttrDriver[0] if startFrameAttrDriver else nucleus.startFrame
    return enableCtrlAttr, startFrameCtrlAttr


def getSplineIkCurve(hairSystem):
    splineIkCurve = None
    follicle = hairSystem.connections(source=False, type='follicle', shapes=True)[0]
    dynCurve = follicle.connections(source=False, type='nurbsCurve', shapes=True)[0]
    blendShape = dynCurve.connections(source=False, type='blendShape')
    if blendShape:
        splineIkCurve = blendShape[0].connections(source=False, type='nurbsCurve', shapes=True)[0]
    else:
        splineIkCurve = dynCurve
    return splineIkCurve


def getDynCurve(hairSystem):
    dynCrv = None
    follicle = hairSystem.outputHair[0].connections(type='follicle', shapes=True)[0]
    dynCrv = follicle.outCurve.connections(type='nurbsCurve', shapes=True)[0]
    return dynCrv


def getBakeLocators(dynCrv):
    bakeLocs = []
    bakeLocs = [pointOnCurveInfo.result.position.connections(type='transform')[0].getChildren(type='transform')[0] for pointOnCurveInfo in dynCrv.worldSpace[0].connections(type='pointOnCurveInfo')]
    return bakeLocs


def getIkHandle(splineIkCurve):
    ikHandle = None
    ikHandle = splineIkCurve.worldSpace[0].connections(type='ikHandle')[0]
    return ikHandle


def getControls(dynCrv):
    controls = []
    pntOnCrvInfos = dynCrv.outputs(type='pointOnCurveInfo')
    for pntOnCrvInfo in pntOnCrvInfos:
        bakeLocParent = pntOnCrvInfo.outputs(type='transform')[0]
        ctrlName = bakeLocParent.getChildren()[0].replace('_bake_loc', '')
        controls.append(pm.PyNode(ctrlName))
    return controls


def getJoints(splineIkCurve):
    joints = []

    ikHandle = splineIkCurve.outputs(type='ikHandle')[0]
    startJoint = ikHandle.inputs(type='joint')[0]
    joints = startJoint.getChildren(ad=True, type='joint') + [startJoint]

    return joints


def bakeDynToControllers(bakeLocators):
    minFrame = pm.playbackOptions(q=True, min=True)
    maxFrame = pm.playbackOptions(q=True, max=True)

    ctrls = []
    ctrlSpaceLocs = []
    for bakeLoc in bakeLocators:
        ctrl = pm.PyNode(bakeLoc.split('_bake_loc')[0])
        ctrls.append(ctrl)
        pm.matchTransform(bakeLoc, ctrl)
        pm.cutKey(ctrl, attribute=['tx', 'ty', 'tz', 'rx', 'ry', 'rz'], clear=True)

        ctrlSpaceLoc = pm.spaceLocator(n='{}_space_loc'.format(ctrl))
        ctrlSpaceLocs.append(ctrlSpaceLoc)
        # pm.parent(ctrlSpaceLoc, ctrl.getParent())
        pm.parentConstraint(bakeLoc, ctrlSpaceLoc, mo=False)

    pm.bakeResults(
        ctrlSpaceLocs,
        simulation=True,
        time=(minFrame, maxFrame),
        sampleBy=1,
        attribute=['tx', 'ty', 'tz', 'rx', 'ry', 'rz'],
        disableImplicitControl=True,
        preserveOutsideKeys=True,
        sparseAnimCurveBake=False,
        removeBakedAttributeFromLayer=False,
        bakeOnOverrideLayer=False,
        controlPoints=False,
        shape=False
    )

    # for ctrlSpaceLoc, ctrl in zip(ctrlSpaceLocs, ctrls):
    #     pm.cutKey(ctrlSpaceLoc, time=':', attribute=['tx', 'ty', 'tz', 'rx', 'ry', 'rz'], hierarchy='none')
    #     pm.pasteKey(ctrl, option='insert', copies=1, connect=True, timeOffset=0, floatOffset=0, valueOffset=0)

    # pm.delete(ctrlSpaceLocs)

    print(ctrlSpaceLocs)
    print(ctrls)
    for ctrlSpaceLoc, ctrl in zip(ctrlSpaceLocs, ctrls):
        pm.parentConstraint(ctrlSpaceLoc, ctrl, mo=False)
    pm.bakeResults(
        ctrls,
        simulation=True,
        time=(minFrame, maxFrame),
        sampleBy=1,
        attribute=['tx', 'ty', 'tz', 'rx', 'ry', 'rz'],
        disableImplicitControl=True,
        preserveOutsideKeys=True,
        sparseAnimCurveBake=False,
        removeBakedAttributeFromLayer=False,
        bakeOnOverrideLayer=False,
        controlPoints=False,
        shape=False
    )
    pm.delete(ctrlSpaceLocs)

def bakeDynToJoints(joints, endCtrs=[]):
    minFrame = pm.playbackOptions(q=True, min=True)
    maxFrame = pm.playbackOptions(q=True, max=True)

    pm.bakeResults(
        joints,
        simulation=True,
        time=(minFrame, maxFrame),
        sampleBy=1,
        attribute=['tx', 'ty', 'tz', 'rx', 'ry', 'rz'],
        disableImplicitControl=True,
        preserveOutsideKeys=True,
        sparseAnimCurveBake=False,
        removeBakedAttributeFromLayer=False,
        bakeOnOverrideLayer=False,
        controlPoints=False,
        shape=False
    )

    if endCtrs:
        for endCtr in endCtrs:
            endCtr.bakeType.set(0)
            endCtr.IkBlend.set(0)


def deleteKeys(objects):
    if not objects:
        pm.error('There is no transform to delete keys')
    pm.select(objects, r=True)
    pm.mel.eval('DeleteKeys;')
    pm.select(cl=True)


def getIhHairchainData(endCtrs):
    ihHairchainData = {'ctrList': [], 'bakeCtrList': [], 'bakeOutList': [], 'jointList': []}
    for ctr in endCtrs:
        prefix = ctr.replace('_ctrEnd_crv', '')
        ihHairchainData['ctrList'].extend(pm.ls(prefix + '_ctr*_crv'))
        ihHairchainData['bakeCtrList'].extend(pm.ls(prefix + '_bake*_crv'))
        ihHairchainData['bakeOutList'].extend(pm.ls(prefix + '_bakeOut*_jnt', type='joint'))
        ihHairchainData['jointList'].extend(pm.ls(prefix + '_*_jnt', type='joint'))
    return ihHairchainData


def bakeIhHairchainControl(ihHairchainData):
    pm.cutKey(ihHairchainData['ctrList'], attribute=['tx', 'ty', 'tz'], clear=True)

    for bakeCtr in ihHairchainData['bakeCtrList']:
        bakeCtrZero = bakeCtr.replace('_crv', '_zero')
        ctrZero = bakeCtrZero.replace('_bake', '_ctr')
        pm.delete(pm.parentConstraint(ctrZero, bakeCtrZero, mo=False))
        pm.delete(pm.pointConstraint(bakeCtr.replace('_bake', '_ctr'), bakeCtr, mo=False))

    pntConstraints = []
    for bakeOut in ihHairchainData['bakeOutList']:
        bakeCtr = bakeOut.replace('_bakeOut', '_bake').replace('_jnt', '_crv')
        pntConstraints.append(pm.pointConstraint(bakeOut, bakeCtr, mo=True))

    minFrame = pm.playbackOptions(q=True, min=True)
    maxFrame = pm.playbackOptions(q=True, max=True)
    pm.bakeResults(
        ihHairchainData['bakeCtrList'],
        simulation=True,
        time=(minFrame, maxFrame),
        sampleBy=1,
        attribute=['tx', 'ty', 'tz'],
        disableImplicitControl=True,
        preserveOutsideKeys=True,
        sparseAnimCurveBake=False,
        removeBakedAttributeFromLayer=False,
        bakeOnOverrideLayer=False,
        controlPoints=False,
        shape=False
        )
    pm.delete(pntConstraints)

    for bakeCtr in ihHairchainData['bakeCtrList']:
        ctr = bakeCtr.replace('_bake', '_ctr')
        pm.cutKey(bakeCtr, time=':', attribute=['tx', 'ty', 'tz'], hierarchy='none')
        pm.pasteKey(ctr, option='insert', copies=1, connect=True, timeOffset=0, floatOffset=0, valueOffset=0)


def bakeIhHairchainJoint(joints, endCtrs):
    pm.bakeResults()


class DynamicSplineBaker(object):
    name = 'dynSplineBaker'

    # Attributes
    bakeType = ['Controller', 'Joint']
    namespaceMenu = None
    solverTxtScrlList = None
    dynCtrlsTxtScrlList = None
    bakeTypeMenu = None
    dynOnOffBtn = None
    objects = []

    def __init__(self):
        super(DynamicSplineBaker, self).__init__()

        if pm.window(DynamicSplineBaker.name, q=True, exists=True):
            pm.deleteUI(DynamicSplineBaker.name)

        win = pm.window(DynamicSplineBaker.name, title='Dynamic Spline Baker', mnb=False, mxb=False)

        pm.tabLayout(tabsVisible=False)
        pm.columnLayout(adj=True, rowSpacing=5)
        self.namespaceMenu = pm.optionMenu(label='Namespace: ', cc=lambda item: self.populateDynPartsTxtScrlList(item))

        pm.separator(style='in', h=3)

        pm.rowColumnLayout(numberOfColumns=3, columnSpacing=[(2, 5), (3, 5)], columnWidth=[(1,150), (2,150)])

        pm.columnLayout(adj=True, rowSpacing=5, columnAlign='left')
        pm.text(label='Solvers')
        self.solverTxtScrlList = pm.textScrollList(sc=self.populateDynCtrlsTxtScrlList)

        pm.setParent('..')
        pm.columnLayout(adj=True, rowSpacing=5, columnAlign='left')
        pm.text(label='Dynamic Controllers')
        self.dynCtrlsTxtScrlList = pm.textScrollList(allowMultiSelection=True, sc=self.selectDynCtrls)
        pm.popupMenu()
        pm.menuItem(label='Select All Controllers', c=self.selectAllDynCtrls)

        pm.setParent('..')
        pm.columnLayout(adj=True, rowSpacing=5)
        pm.separator(h=10, style='none')
        self.dynOnOffBtn = pm.button(label='Dynamic On/Off', c=self.dynOnOff)
        pm.rowColumnLayout(numberOfColumns=2)

        pm.setParent('..')
        self.bakeTypeMenu = pm.optionMenu(label='Bake Type: ')
        pm.menuItem(label='Controller')
        pm.menuItem(label='Joint')
        pm.separator(h=10, style='in')
        pm.button(label='Bake Dynamic', h=70, c=lambda x: self.bakeDynamic(pm.optionMenu(self.bakeTypeMenu, q=True, value=True)))
        pm.button(label='Delete Keys', c=self.delKeys)
        pm.button(label='Reset Controls', c=self.resetControls)

        pm.window(DynamicSplineBaker.name, e=True, w=100, h=100)
        pm.showWindow(win)

        self.buildObjects()
        self.populateNamespaceMenu()
        self.populateDynPartsTxtScrlList(pm.optionMenu(self.namespaceMenu, q=True, value=True))

    def buildObjects(self):
        namespaces = []
        defaultNamespaces = set(['UI', 'shared'])
        namespaces = list(set(pm.namespaceInfo(listOnlyNamespaces=True, r=True)) - defaultNamespaces)
        if not namespaces:
            hairChainNucleuses = [nucleus for nucleus in pm.ls(type='nucleus') if nucleus.startFrame.connections(source=False, type='hairSystem', shapes=True)]
            self.objects.append({'namespace': ':', 'nucleuses': hairChainNucleuses})
        for namespace in namespaces:
            nucleuses = [pm.PyNode(item) for item in pm.namespaceInfo(namespace, listOnlyDependencyNodes=True) if isinstance(pm.PyNode(item), pm.nodetypes.Nucleus)]
            hairChainNucleuses = [nucleus for nucleus in nucleuses if nucleus.startFrame.connections(source=False, type='hairSystem', shapes=True)]
            if hairChainNucleuses:
                self.objects.append({'namespace': namespace, 'nucleuses': hairChainNucleuses})

    def populateNamespaceMenu(self):
        for obj in self.objects:

            pm.menuItem(label=obj['namespace'], parent=self.namespaceMenu)

    def populateDynPartsTxtScrlList(self, namespace):
        pm.textScrollList(self.solverTxtScrlList, e=True, removeAll=True)
        for obj in self.objects:
            if namespace == obj['namespace']:
                for nucleus in obj['nucleuses']:
                    pm.textScrollList(self.solverTxtScrlList, e=True, append=nucleus.replace(namespace+':', ''))

    def populateDynCtrlsTxtScrlList(self, *args):
        namespace = pm.optionMenu(self.namespaceMenu, q=True, value=True)
        pm.textScrollList(self.dynCtrlsTxtScrlList, e=True, removeAll=True)
        nucleus = [pm.PyNode(namespace+':'+item) for item in pm.textScrollList(self.solverTxtScrlList, q=True, selectItem=True)][0]

        dyn_ctrl = list(set(nucleus.inputs(type='transform')))
        pm.select(dyn_ctrl, r=True)
        # pm.select(nucleus, r=True)

        enableAttr, startFrameAttr = getNucleusControllerAttributes(nucleus)
        pm.cutKey(enableAttr, startFrameAttr, clear=True)

        self.updateDynOfOffBtn()

        dynCtrls = []
        hairSystems = getHairSystems(pm.PyNode(nucleus))
        for hairSystem in hairSystems:
            try:  # In case JH Hairchain Rig or TAK's spline rig
                splineIkCurve = getSplineIkCurve(hairSystem)
                joints = sorted(getJoints(splineIkCurve))
                dynCtrls.append(joints[0].visibility.connections(type='transform')[0])
            except:  # In case IH Hairchain Rig
                dynCtrls.append(hairSystem.startCurveAttract.connections(destination=False, type='transform')[0])

        for dynCtrl in dynCtrls:
            pm.textScrollList(self.dynCtrlsTxtScrlList, e=True, append=dynCtrl.replace(namespace+':', ''))

    def dynOnOff(self, *args):
        namespace = pm.optionMenu(self.namespaceMenu, q=True, value=True)
        nucleus = [pm.PyNode(namespace+':'+item) for item in pm.textScrollList(self.solverTxtScrlList, q=True, selectItem=True)][0]
        enableAttr, startFrameAttr = getNucleusControllerAttributes(nucleus)
        enabled = enableAttr.get()
        hairSystem = getHairSystems(nucleus)[0]
        endCtrs = [pm.PyNode(namespace+':'+ctr) for ctr in pm.textScrollList(self.dynCtrlsTxtScrlList, q=True, allItems=True)]
        if enabled and hairSystem.simulationMethod.get() == 3:
            enableAttr.set(False)
            startFrameAttr.set(100000)
            pm.button(self.dynOnOffBtn, e=True, bgc=(0.75, 0.25, 0.0), label='Dynamic Off')
            if endCtrs[0].hasAttr('dynamicType'):
                endCtrs[0].dynamicType.connections(destination=False, plugs=True)[0].set(0)
            for endCtr in endCtrs:
                if endCtr.hasAttr('Constraint'):
                    pm.cutKey(endCtr.Constraint, clear=True)
                    endCtr.Constraint.set(1)
        else:
            enableAttr.set(True)
            startFrameAttr.set(pm.playbackOptions(q=True, min=True))
            pm.button(self.dynOnOffBtn, e=True, bgc=(0.0, 0.75, 0.25), label='Dynamic On')
            if endCtrs[0].hasAttr('dynamicType'):
                endCtrs[0].dynamicType.connections(destination=False, plugs=True)[0].set(2)
            for endCtr in endCtrs:
                if endCtr.hasAttr('Constraint'):
                    pm.cutKey(endCtr.Constraint, clear=True)
                    endCtr.Constraint.set(0)

    def updateDynOfOffBtn(self):
        namespace = pm.optionMenu(self.namespaceMenu, q=True, value=True)
        nucleus = [pm.PyNode(namespace+':'+item) for item in pm.textScrollList(self.solverTxtScrlList, q=True, selectItem=True)][0]
        enableAttr, startFrameAttr = getNucleusControllerAttributes(nucleus)
        enabled = enableAttr.get()
        hairSystem = getHairSystems(nucleus)[0]
        if enabled and hairSystem.simulationMethod.get() == 3:
            pm.button(self.dynOnOffBtn, e=True, bgc=(0.0, 0.75, 0.25), label='Dynamic On')
        else:
            pm.button(self.dynOnOffBtn, e=True, bgc=(0.75, 0.25, 0.0), label='Dynamic Off')

    def selectDynCtrls(self):
        namespace = pm.optionMenu(self.namespaceMenu, q=True, value=True)
        dynCtrls = [namespace+':'+ctrl for ctrl in pm.textScrollList(self.dynCtrlsTxtScrlList, q=True, selectItem=True)]
        pm.select(dynCtrls, r=True)

    def selectAllDynCtrls(self, *args):
        namespace = pm.optionMenu(self.namespaceMenu, q=True, value=True)
        allDynCtrls = [namespace+':'+ctrl for ctrl in pm.textScrollList(self.dynCtrlsTxtScrlList, q=True, allItems=True)]
        pm.textScrollList(self.dynCtrlsTxtScrlList, e=True, selectItem=pm.textScrollList(self.dynCtrlsTxtScrlList, q=True, allItems=True))
        pm.select(allDynCtrls, r=True)

    def bakeDynamic(self, bakeType):
        namespace = pm.optionMenu(self.namespaceMenu, q=True, value=True)
        nucleus = [pm.PyNode(namespace+':'+item) for item in pm.textScrollList(self.solverTxtScrlList, q=True, selectItem=True)][0]

        enableAttr, startFrameAttr = getNucleusControllerAttributes(nucleus)
        enableAttr.set(True)
        pm.button(self.dynOnOffBtn, e=True, bgc=(0.0, 0.75, 0.25), label='Dynamic On')
        startFrameAttr.set(pm.playbackOptions(q=True, min=True))
        endCtrs = [pm.PyNode(namespace+':'+ctr) for ctr in pm.textScrollList(self.dynCtrlsTxtScrlList, q=True, allItems=True)]
        if endCtrs[0].hasAttr('dynamicType'):
            endCtrs[0].dynamicType.connections(destination=False, plugs=True)[0].set(2)
        for endCtr in endCtrs:
            if endCtr.hasAttr('Constraint'):
                pm.cutKey(endCtr.Constraint, clear=True)
                endCtr.Constraint.set(0)

        hairSystems = getHairSystems(nucleus)
        allJoints = []
        allBakeLocs = []
        for hairSystem in hairSystems:
            try:  # In case JH Hairchain Rig or TAK's spline rig
                splineIkCurve = getSplineIkCurve(hairSystem)
                dynCrv = getDynCurve(hairSystem)
                allJoints.extend(getJoints(splineIkCurve))
                if bakeType == 'Controller':
                    allBakeLocs.extend(getBakeLocators(dynCrv))
            except:  # In case IH Hairchain Rig
                break

        try:  # In case JH Hairchain Rig or TAK's spline rig
            pm.refresh(su=True)
            bakeDynToControllers(allBakeLocs) if bakeType == 'Controller' else bakeDynToJoints(allJoints)
            pm.refresh(su=False)
        except:  # In case IH Hairchain Rig
            for endCtr in endCtrs:
                if endCtr.hasAttr('Constraint'):
                    endCtr.Constraint.set(0)
            ihHairchainData = getIhHairchainData(endCtrs)
            bakeIhHairchainControl(ihHairchainData) if bakeType == 'Controller' else bakeDynToJoints(ihHairchainData['jointList'], endCtrs)
            endCtrs[0].dynamicType.connections(destination=False, plugs=True)[0].set(0)

        enableAttr, startFrameAttr = getNucleusControllerAttributes(nucleus)
        enableAttr.set(False)
        startFrameAttr.set(100000)
        self.updateDynOfOffBtn()

    def delKeys(self, *args):
        namespace = pm.optionMenu(self.namespaceMenu, q=True, value=True)
        nucleus = [pm.PyNode(namespace+':'+item) for item in pm.textScrollList(self.solverTxtScrlList, q=True, selectItem=True)][0]
        allJoints = []
        allControls = []
        allIkHandles = []
        hairSystems = getHairSystems(nucleus)
        for hairSystem in hairSystems:
            try:  # In case JH Hairchain Rig or TAK's spline rig
                splineIkCurve = getSplineIkCurve(hairSystem)
                allJoints.extend(getJoints(splineIkCurve))
                allIkHandles.append(getIkHandle(splineIkCurve))
                allControls.extend(getControls(getDynCurve(hairSystem)))
            except:  # In case IH Hairchain Rig
                break

        try:  # In case JH Hairchain Rig or TAK's spline rig
            deleteKeys(allControls)
            deleteKeys(allJoints)
            for ikHandle in allIkHandles:
                ikHandle.ikBlend.set(1)
        except:  # In case IH Hairchain Rig
            endCtrs = [pm.PyNode(namespace+':'+ctr) for ctr in pm.textScrollList(self.dynCtrlsTxtScrlList, q=True, allItems=True)]
            ihHairchainData = getIhHairchainData(endCtrs)
            deleteKeys(ihHairchainData['ctrList'])
            deleteKeys(ihHairchainData['jointList'])
            for endCtr in endCtrs:
                endCtr.bakeType.set(0)
                endCtr.IkBlend.set(1)

    def resetControls(self, *args):
        namespace = pm.optionMenu(self.namespaceMenu, q=True, value=True)
        nucleus = [pm.PyNode(namespace+':'+item) for item in pm.textScrollList(self.solverTxtScrlList, q=True, selectItem=True)][0]
        allControls = []
        hairSystems = getHairSystems(nucleus)
        for hairSystem in hairSystems:
            try:  # In case JH Hairchain Rig or TAK's spline rig
                allControls.extend(getControls(getDynCurve(hairSystem)))
            except:  # In case IH Hairchain Rig
                break

        attrs = ['tx', 'ty', 'tz', 'rx', 'ry', 'rz']
        try:  # In case JH Hairchain Rig or TAK's spline rig
            for ctrl in allControls:
                for attr in attrs:
                    ctrl.attr(attr).set(0)
        except:  # In case IH Hairchain Rig
            endCtrs = [pm.PyNode(namespace+':'+ctr) for ctr in pm.textScrollList(self.dynCtrlsTxtScrlList, q=True, allItems=True)]
            ihHairchainData = getIhHairchainData(endCtrs)
            for ctr in ihHairchainData['ctrList']:
                for attr in attrs:
                    ctr.attr(attr).set(0)
