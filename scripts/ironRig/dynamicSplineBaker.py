"""
Author: Sangtak Lee
Contact: chst27@gmail.com
"""

from maya import cmds, mel


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
        controls.append(ctrlName)
    return controls


def getJoints(splineIkCurve):
    joints = []

    ikHandle = splineIkCurve.outputs(type='ikHandle')[0]
    startJoint = ikHandle.inputs(type='joint')[0]
    joints = startJoint.getChildren(ad=True, type='joint') + [startJoint]

    return joints


def bakeDynToControllers(bakeLocators):
    minFrame = cmds.playbackOptions(q=True, min=True)
    maxFrame = cmds.playbackOptions(q=True, max=True)

    ctrls = []
    ctrlSpaceLocs = []
    for bakeLoc in bakeLocators:
        ctrl = bakeLoc.split('_bake_loc')[0]
        ctrls.append(ctrl)
        cmds.matchTransform(bakeLoc, ctrl)
        cmds.cutKey(ctrl, attribute=['tx', 'ty', 'tz', 'rx', 'ry', 'rz'], clear=True)

        ctrlSpaceLoc = cmds.spaceLocator(n='{}_space_loc'.format(ctrl))[0]
        ctrlSpaceLocs.append(ctrlSpaceLoc)
        # cmds.parent(ctrlSpaceLoc, ctrl.getParent())
        cmds.parentConstraint(bakeLoc, ctrlSpaceLoc, mo=False)

    cmds.bakeResults(
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
    #     cmds.cutKey(ctrlSpaceLoc, time=':', attribute=['tx', 'ty', 'tz', 'rx', 'ry', 'rz'], hierarchy='none')
    #     cmds.pasteKey(ctrl, option='insert', copies=1, connect=True, timeOffset=0, floatOffset=0, valueOffset=0)

    # cmds.delete(ctrlSpaceLocs)

    for ctrlSpaceLoc, ctrl in zip(ctrlSpaceLocs, ctrls):
        cmds.parentConstraint(ctrlSpaceLoc, ctrl, mo=False)
    cmds.bakeResults(
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
    cmds.delete(ctrlSpaceLocs)

def bakeDynToJoints(joints, endCtrs=[]):
    minFrame = cmds.playbackOptions(q=True, min=True)
    maxFrame = cmds.playbackOptions(q=True, max=True)

    cmds.bakeResults(
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
        cmds.error('There is no transform to delete keys')
    cmds.select(objects, r=True)
    mel.eval('DeleteKeys;')
    cmds.select(cl=True)


def getIhHairchainData(endCtrs):
    ihHairchainData = {'ctrList': [], 'bakeCtrList': [], 'bakeOutList': [], 'jointList': []}
    for ctr in endCtrs:
        prefix = ctr.replace('_ctrEnd_crv', '')
        ihHairchainData['ctrList'].extend(cmds.ls(prefix + '_ctr*_crv'))
        ihHairchainData['bakeCtrList'].extend(cmds.ls(prefix + '_bake*_crv'))
        ihHairchainData['bakeOutList'].extend(cmds.ls(prefix + '_bakeOut*_jnt', type='joint'))
        ihHairchainData['jointList'].extend(cmds.ls(prefix + '_*_jnt', type='joint'))
    return ihHairchainData


def bakeIhHairchainControl(ihHairchainData):
    cmds.cutKey(ihHairchainData['ctrList'], attribute=['tx', 'ty', 'tz'], clear=True)

    for bakeCtr in ihHairchainData['bakeCtrList']:
        bakeCtrZero = bakeCtr.replace('_crv', '_zero')
        ctrZero = bakeCtrZero.replace('_bake', '_ctr')
        cmds.delete(cmds.parentConstraint(ctrZero, bakeCtrZero, mo=False))
        cmds.delete(cmds.pointConstraint(bakeCtr.replace('_bake', '_ctr'), bakeCtr, mo=False))

    pntConstraints = []
    for bakeOut in ihHairchainData['bakeOutList']:
        bakeCtr = bakeOut.replace('_bakeOut', '_bake').replace('_jnt', '_crv')
        pntConstraints.append(cmds.pointConstraint(bakeOut, bakeCtr, mo=True))

    minFrame = cmds.playbackOptions(q=True, min=True)
    maxFrame = cmds.playbackOptions(q=True, max=True)
    cmds.bakeResults(
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
    cmds.delete(pntConstraints)

    for bakeCtr in ihHairchainData['bakeCtrList']:
        ctr = bakeCtr.replace('_bake', '_ctr')
        cmds.cutKey(bakeCtr, time=':', attribute=['tx', 'ty', 'tz'], hierarchy='none')
        cmds.pasteKey(ctr, option='insert', copies=1, connect=True, timeOffset=0, floatOffset=0, valueOffset=0)


def bakeIhHairchainJoint(joints, endCtrs):
    cmds.bakeResults()


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
        super().__init__()

        if cmds.window(DynamicSplineBaker.name, q=True, exists=True):
            cmds.deleteUI(DynamicSplineBaker.name)

        win = cmds.window(DynamicSplineBaker.name, title='Dynamic Spline Baker', mnb=False, mxb=False)

        cmds.tabLayout(tabsVisible=False)
        cmds.columnLayout(adj=True, rowSpacing=5)
        self.namespaceMenu = cmds.optionMenu(label='Namespace: ', cc=lambda item: self.populateDynPartsTxtScrlList(item))

        cmds.separator(style='in', h=3)

        cmds.rowColumnLayout(numberOfColumns=3, columnSpacing=[(2, 5), (3, 5)], columnWidth=[(1,150), (2,150)])

        cmds.columnLayout(adj=True, rowSpacing=5, columnAlign='left')
        cmds.text(label='Solvers')
        self.solverTxtScrlList = cmds.textScrollList(sc=self.populateDynCtrlsTxtScrlList)

        cmds.setParent('..')
        cmds.columnLayout(adj=True, rowSpacing=5, columnAlign='left')
        cmds.text(label='Dynamic Controllers')
        self.dynCtrlsTxtScrlList = cmds.textScrollList(allowMultiSelection=True, sc=self.selectDynCtrls)
        cmds.popupMenu()
        cmds.menuItem(label='Select All Controllers', c=self.selectAllDynCtrls)

        cmds.setParent('..')
        cmds.columnLayout(adj=True, rowSpacing=5)
        cmds.separator(h=10, style='none')
        self.dynOnOffBtn = cmds.button(label='Dynamic On/Off', c=self.dynOnOff)
        cmds.rowColumnLayout(numberOfColumns=2)

        cmds.setParent('..')
        self.bakeTypeMenu = cmds.optionMenu(label='Bake Type: ')
        cmds.menuItem(label='Controller')
        cmds.menuItem(label='Joint')
        cmds.separator(h=10, style='in')
        cmds.button(label='Bake Dynamic', h=70, c=lambda x: self.bakeDynamic(cmds.optionMenu(self.bakeTypeMenu, q=True, value=True)))
        cmds.button(label='Delete Keys', c=self.delKeys)
        cmds.button(label='Reset Controls', c=self.resetControls)

        cmds.window(DynamicSplineBaker.name, e=True, w=100, h=100)
        cmds.showWindow(win)

        self.buildObjects()
        self.populateNamespaceMenu()
        self.populateDynPartsTxtScrlList(cmds.optionMenu(self.namespaceMenu, q=True, value=True))

    def buildObjects(self):
        namespaces = []
        defaultNamespaces = set(['UI', 'shared'])
        namespaces = list(set(cmds.namespaceInfo(listOnlyNamespaces=True, r=True)) - defaultNamespaces)
        if not namespaces:
            hairChainNucleuses = [nucleus for nucleus in cmds.ls(type='nucleus') if nucleus.startFrame.connections(source=False, type='hairSystem', shapes=True)]
            self.objects.append({'namespace': ':', 'nucleuses': hairChainNucleuses})
        for namespace in namespaces:
            nucleuses = [item for item in cmds.namespaceInfo(namespace, listOnlyDependencyNodes=True) if cmds.nodeType(item) == 'nucleus']
            hairChainNucleuses = [nucleus for nucleus in nucleuses if nucleus.startFrame.connections(source=False, type='hairSystem', shapes=True)]
            if hairChainNucleuses:
                self.objects.append({'namespace': namespace, 'nucleuses': hairChainNucleuses})

    def populateNamespaceMenu(self):
        for obj in self.objects:

            cmds.menuItem(label=obj['namespace'], parent=self.namespaceMenu)

    def populateDynPartsTxtScrlList(self, namespace):
        cmds.textScrollList(self.solverTxtScrlList, e=True, removeAll=True)
        for obj in self.objects:
            if namespace == obj['namespace']:
                for nucleus in obj['nucleuses']:
                    cmds.textScrollList(self.solverTxtScrlList, e=True, append=nucleus.replace(namespace+':', ''))

    def populateDynCtrlsTxtScrlList(self, *args):
        namespace = cmds.optionMenu(self.namespaceMenu, q=True, value=True)
        cmds.textScrollList(self.dynCtrlsTxtScrlList, e=True, removeAll=True)
        nucleus = [namespace+':'+item for item in cmds.textScrollList(self.solverTxtScrlList, q=True, selectItem=True)][0]

        dyn_ctrl = list(set(nucleus.inputs(type='transform')))
        cmds.select(dyn_ctrl, r=True)
        # cmds.select(nucleus, r=True)

        enableAttr, startFrameAttr = getNucleusControllerAttributes(nucleus)
        cmds.cutKey(enableAttr, startFrameAttr, clear=True)

        self.updateDynOfOffBtn()

        dynCtrls = []
        hairSystems = getHairSystems(nucleus)
        for hairSystem in hairSystems:
            try:  # In case JH Hairchain Rig or TAK's spline rig
                splineIkCurve = getSplineIkCurve(hairSystem)
                joints = sorted(getJoints(splineIkCurve))
                dynCtrls.append(joints[0].visibility.connections(type='transform')[0])
            except:  # In case IH Hairchain Rig
                dynCtrls.append(hairSystem.startCurveAttract.connections(destination=False, type='transform')[0])

        for dynCtrl in dynCtrls:
            cmds.textScrollList(self.dynCtrlsTxtScrlList, e=True, append=dynCtrl.replace(namespace+':', ''))

    def dynOnOff(self, *args):
        namespace = cmds.optionMenu(self.namespaceMenu, q=True, value=True)
        nucleus = [namespace+':'+item for item in cmds.textScrollList(self.solverTxtScrlList, q=True, selectItem=True)][0]
        enableAttr, startFrameAttr = getNucleusControllerAttributes(nucleus)
        enabled = enableAttr.get()
        hairSystem = getHairSystems(nucleus)[0]
        endCtrs = [namespace+':'+ctr for ctr in cmds.textScrollList(self.dynCtrlsTxtScrlList, q=True, allItems=True)]
        if enabled and hairSystem.simulationMethod.get() == 3:
            enableAttr.set(False)
            startFrameAttr.set(100000)
            cmds.button(self.dynOnOffBtn, e=True, bgc=(0.75, 0.25, 0.0), label='Dynamic Off')
            if endCtrs[0].hasAttr('dynamicType'):
                endCtrs[0].dynamicType.connections(destination=False, plugs=True)[0].set(0)
            for endCtr in endCtrs:
                if endCtr.hasAttr('Constraint'):
                    cmds.cutKey(endCtr.Constraint, clear=True)
                    endCtr.Constraint.set(1)
        else:
            enableAttr.set(True)
            startFrameAttr.set(cmds.playbackOptions(q=True, min=True))
            cmds.button(self.dynOnOffBtn, e=True, bgc=(0.0, 0.75, 0.25), label='Dynamic On')
            if endCtrs[0].hasAttr('dynamicType'):
                endCtrs[0].dynamicType.connections(destination=False, plugs=True)[0].set(2)
            for endCtr in endCtrs:
                if endCtr.hasAttr('Constraint'):
                    cmds.cutKey(endCtr.Constraint, clear=True)
                    endCtr.Constraint.set(0)

    def updateDynOfOffBtn(self):
        namespace = cmds.optionMenu(self.namespaceMenu, q=True, value=True)
        nucleus = [namespace+':'+item for item in cmds.textScrollList(self.solverTxtScrlList, q=True, selectItem=True)][0]
        enableAttr, startFrameAttr = getNucleusControllerAttributes(nucleus)
        enabled = enableAttr.get()
        hairSystem = getHairSystems(nucleus)[0]
        if enabled and hairSystem.simulationMethod.get() == 3:
            cmds.button(self.dynOnOffBtn, e=True, bgc=(0.0, 0.75, 0.25), label='Dynamic On')
        else:
            cmds.button(self.dynOnOffBtn, e=True, bgc=(0.75, 0.25, 0.0), label='Dynamic Off')

    def selectDynCtrls(self):
        namespace = cmds.optionMenu(self.namespaceMenu, q=True, value=True)
        dynCtrls = [namespace+':'+ctrl for ctrl in cmds.textScrollList(self.dynCtrlsTxtScrlList, q=True, selectItem=True)]
        cmds.select(dynCtrls, r=True)

    def selectAllDynCtrls(self, *args):
        namespace = cmds.optionMenu(self.namespaceMenu, q=True, value=True)
        allDynCtrls = [namespace+':'+ctrl for ctrl in cmds.textScrollList(self.dynCtrlsTxtScrlList, q=True, allItems=True)]
        cmds.textScrollList(self.dynCtrlsTxtScrlList, e=True, selectItem=cmds.textScrollList(self.dynCtrlsTxtScrlList, q=True, allItems=True))
        cmds.select(allDynCtrls, r=True)

    def bakeDynamic(self, bakeType):
        namespace = cmds.optionMenu(self.namespaceMenu, q=True, value=True)
        nucleus = [namespace+':'+item for item in cmds.textScrollList(self.solverTxtScrlList, q=True, selectItem=True)][0]

        enableAttr, startFrameAttr = getNucleusControllerAttributes(nucleus)
        enableAttr.set(True)
        cmds.button(self.dynOnOffBtn, e=True, bgc=(0.0, 0.75, 0.25), label='Dynamic On')
        startFrameAttr.set(cmds.playbackOptions(q=True, min=True))
        endCtrs = [namespace+':'+ctr for ctr in cmds.textScrollList(self.dynCtrlsTxtScrlList, q=True, allItems=True)]
        if endCtrs[0].hasAttr('dynamicType'):
            endCtrs[0].dynamicType.connections(destination=False, plugs=True)[0].set(2)
        for endCtr in endCtrs:
            if endCtr.hasAttr('Constraint'):
                cmds.cutKey(endCtr.Constraint, clear=True)
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
            cmds.refresh(su=True)
            bakeDynToControllers(allBakeLocs) if bakeType == 'Controller' else bakeDynToJoints(allJoints)
            cmds.refresh(su=False)
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
        namespace = cmds.optionMenu(self.namespaceMenu, q=True, value=True)
        nucleus = [namespace+':'+item for item in cmds.textScrollList(self.solverTxtScrlList, q=True, selectItem=True)][0]
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
            endCtrs = [namespace+':'+ctr for ctr in cmds.textScrollList(self.dynCtrlsTxtScrlList, q=True, allItems=True)]
            ihHairchainData = getIhHairchainData(endCtrs)
            deleteKeys(ihHairchainData['ctrList'])
            deleteKeys(ihHairchainData['jointList'])
            for endCtr in endCtrs:
                endCtr.bakeType.set(0)
                endCtr.IkBlend.set(1)

    def resetControls(self, *args):
        namespace = cmds.optionMenu(self.namespaceMenu, q=True, value=True)
        nucleus = [namespace+':'+item for item in cmds.textScrollList(self.solverTxtScrlList, q=True, selectItem=True)][0]
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
            endCtrs = [namespace+':'+ctr for ctr in cmds.textScrollList(self.dynCtrlsTxtScrlList, q=True, allItems=True)]
            ihHairchainData = getIhHairchainData(endCtrs)
            for ctr in ihHairchainData['ctrList']:
                for attr in attrs:
                    ctr.attr(attr).set(0)
