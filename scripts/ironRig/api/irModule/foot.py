from maya.api import OpenMaya as om
from maya import cmds
from ... import utils
from ... import common
from ..irGlobal.controller import Controller
from ..irSystem.fk import FK
from ..irSystem.footIK import FootIK
from .module import Module


class Foot(Module):
    def __init__(self, name='new', side=Module.SIDE.CENTER, skeletonJoints=[], vertices=[]):
        self._vertices = vertices
        self._pivotLocators = []

        self._ikSystem = None
        self._fkSystem = None

        self._blendJoints = []
        self._blendConstraints = []

        super().__init__(name, side, skeletonJoints)

    def _addSystems(self):
        self._pivotLocators = ['{}_in_loc'.format(self.shortName), '{}_out_loc'.format(self.shortName), '{}_heel_loc'.format(self.shortName), '{}_tip_loc'.format(self.shortName)]
        self._ikSystem = FootIK(self._name, self._side, pivotLocators=self._pivotLocators)
        self._systems.append(self._ikSystem)

        self._fkSystem = FK(self._name, self._side)
        self._systems.append(self._fkSystem)

        super()._addSystems()

    def _createMidLocator(self):
        midLoc = None

        midInitSkelLoc = self._initSkelLocators[int(len(self._initSkelLocators)*0.5)]
        midLocPos = utils.getWorldPoint(midInitSkelLoc) + (om.MVector.kYaxisVector * utils.getDistance(self._initSkelLocators[0], self._initSkelLocators[-1]))

        midLoc = cmds.spaceLocator(n='{}_mid_oriPlane_loc'.format(self.shortName))[0]
        cmds.setAttr('{}.overrideEnabled'.format(midLoc), True)
        cmds.setAttr('{}.overrideColor'.format(midLoc), 14)
        cmds.xform(midLoc, t=list(midLocPos)[:3], ws=True)

        negAxisAttrNames = ['negateXAxis', 'negateZAxis', 'swapYZAxis']
        for attrName in negAxisAttrNames:
            cmds.addAttr(midLoc, ln=attrName, at='bool', dv=False, keyable=True)
            cmds.connectAttr('{}.{}'.format(midLoc, attrName), '{}.{}'.format(self._orientPlane, attrName))

        return midLoc

    def preBuild(self):
        super().preBuild()
        for pivotLoc in self._pivotLocators:
            cmds.spaceLocator(n=pivotLoc)[0]
        cmds.parent(self._pivotLocators, self._initGrp)

    def build(self):
        super().build()
        self._buildControls()

    def _buildGroups(self):
        super()._buildGroups()
        self._controllerGrp = cmds.group(n='{}_ctrl_grp'.format(self.longName), empty=True)
        cmds.parent(self._controllerGrp, self._topGrp)

    def _buildSystems(self):
        ikJoints = utils.buildNewJointChain(self._initJoints, searchStr='init', replaceStr='ik')
        self._ikSystem.joints = ikJoints
        self._ikSystem.build()

        fkJoints = utils.buildNewJointChain(self._initJoints, searchStr='init', replaceStr='fk')
        self._fkSystem.joints = fkJoints
        self._fkSystem.build()

    def _connectSystems(self):
        self._blendJoints = utils.buildNewJointChain(self._initJoints, searchStr='init', replaceStr='blend')
        utils.parentKeepHierarchy(self._blendJoints, self._systemGrp)
        for ikJnt, fkJnt, blendJnt in zip(self._ikSystem.joints, self._fkSystem.joints, self._blendJoints):
            blendCnst = cmds.parentConstraint(ikJnt, fkJnt, blendJnt, mo=True)[0]
            cmds.setAttr('{}.interpType'.format(blendCnst), 2)
            self._blendConstraints.append(blendCnst)
        cmds.hide(self._blendJoints[0])

        self._sysJoints = self._blendJoints

    def _buildControls(self):
        moduleCtrl = Controller('{}_module'.format(self.shortName), Controller.SHAPE.SPHERE)
        moduleCtrl.lockHideChannels(['translate', 'rotate', 'scale', 'visibility'])
        cmds.addAttr(moduleCtrl, ln='ik', at='double', min=0.0, max=1.0, dv=1.0, keyable=True)
        cmds.parentConstraint(self._blendJoints[1], moduleCtrl.zeroGrp, mo=False)
        moduleCtrl.shapeOffset = [0, self._aimSign*10, 0]

        fkIkRev = cmds.createNode('reverse', n='{}_fkIk_rev'.format(self.shortName))
        cmds.connectAttr('{}.ik'.format(moduleCtrl), '{}.visibility'.format(self._ikSystem.topGrp))
        cmds.connectAttr('{}.ik'.format(moduleCtrl), '{}.inputX'.format(fkIkRev))
        cmds.connectAttr('{}.outputX'.format(fkIkRev), '{}.visibility'.format(self._fkSystem.topGrp))
        for cnst in self._blendConstraints:
            ikWeightAttr = cmds.listConnections('{}.target[0].targetParentMatrix'.format(cnst))[0] + 'W0'
            cmds.connectAttr('{}.ik'.format(moduleCtrl), '{}.{}'.format(cnst, ikWeightAttr))
            fkWeightAttr = cmds.listConnections('{}.target[1].targetParentMatrix'.format(cnst))[0] + 'W1'
            cmds.connectAttr('{}.outputX'.format(fkIkRev), '{}.{}'.format(cnst, fkWeightAttr))

        cmds.parent(moduleCtrl.zeroGrp, self._controllerGrp)
        self._controllers.append(moduleCtrl)

        self._ikSystem.controllers[0].size = self._controllerSize * 2
        self._controllers[0].size = self._controllerSize * 0.2

    def attachTo(self, module, outJointIndex=-1000000):
        if module.__class__.__name__ in ['TwoBoneLimb', 'ThreeBoneLimb']:
            # Connect ik joints
            utils.removeConnections(self._ikSystem.joints[0])
            cmds.parentConstraint(module.ikSystem.joints[-1], self._ikSystem.joints[0], mo=True)
            # Connect skel joints
            utils.removeConnections(module.skelJoints[-1])
            cmds.parentConstraint(self._outJoints[0], module.skelJoints[-1], mo=True)
            # Connect ik handle
            moduleIkHandleLoc = module.ikSystem.ikHandleLocator
            utils.removeConnections(moduleIkHandleLoc)
            cmds.pointConstraint(self._ikSystem.revFootJoints()[-1], moduleIkHandleLoc, mo=True)
            # Connect ik controllers
            cmds.parentConstraint(module.ikSystem.controllers[0], self._ikSystem.controllers[0], mo=True)
            utils.cloneUserDefinedAttrs(self._ikSystem.controllers[0], module.ikSystem.controllers[0])
            self._ikSystem.controllers[0].hide()
            # Connect fk controllers
            cmds.parentConstraint(module.fkSystem.controllers[-1], self._fkSystem.controllers[0], mo=True)
            self._fkSystem.controllers[0].hide()
            # Connect module controllers
            cmds.connectAttr('{}.ik'.format(module.controllers[0]), '{}.ik'.format(self._controllers[0]))
            self._controllers[0].hide()

            self._parent = module
            self._parentOutJointID = outJointIndex
        else:
            super().attachTo(module, outJointIndex)

    def mirror(self, skeletonSearchStr='_l', skeletonReplaceStr='_r', mirrorTranslate=False):
        oppSideChar, oppSkelJoints = super().mirror(skeletonSearchStr, skeletonReplaceStr)
        oppMod = Foot(self._name, oppSideChar, oppSkelJoints)
        oppMod.mirrorTranslate = mirrorTranslate
        oppMod.preBuild()
        oppMod.symmetrizeGuide()
        oppMod.build()
        oppMod.symmetrizeControllerShapes()
        oppMod.controllerColor = common.SYMMETRY_COLOR_TABLE.get(self._controllerColor)
        return oppMod

    def symmetrizeGuide(self, jointAxis=True):
        super().symmetrizeGuide(jointAxis)
        oppSideChar = common.SYMMETRY_CHAR_TABLE.get(self._side)
        for pivotLoc in self._pivotLocators:
            oppPivotLoc = pivotLoc.replace('_{}_'.format(self._side), '_{}_'.format(oppSideChar))
            oppPivotLocPos = cmds.xform(oppPivotLoc, q=True, t=True, ws=True)
            cmds.xform(pivotLoc, t=[-oppPivotLocPos[0], oppPivotLocPos[1], oppPivotLocPos[2]], ws=True)

    def serialize(self):
        moduleData = super().serialize()
        moduleData['pivotLocatorsPosition'] = [cmds.xform(loc, q=True, t=True, ws=True) for loc in self._pivotLocators]
        return moduleData

    def deserialize(self, data, hashmap={}):
        hashmap[data.get('id')] = self
        self._id = data.get('id')

        # Set porperties before build
        self.mirrorTranslate = data.get('mirrorTranslate')

        self.preBuild()

        # Set mid locator position and attributes for the joint axis
        midLocator = self._oriPlaneLocators[1]
        cmds.xform(midLocator, t=data.get('midLocatorPosition'), ws=True)
        for attr, val in zip(['negateXAxis', 'negateZAxis', 'swapYZAxis'], data.get('midLocatorAxisAttributes')):
            cmds.setAttr('{}.{}'.format(midLocator, attr), val)

        # Set pivot locators position
        for pivotLoc, pivotLocPos in zip(self._pivotLocators, data.get('pivotLocatorsPosition')):
            cmds.xform(pivotLoc, t=pivotLocPos, ws=True)

        self.build()

        # Set controllers shapes
        self.controllerSize = data.get('controllerSize')
        self.controllerColor = data.get('controllerColor')
        for ctrl, ctrlData in zip(self._allControllers(), data.get('allControllers')):
            ctrl.deserialize(ctrlData, hashmap)

        # Attach to parent module
        parentID = data.get('parentID')
        if parentID:
            parent = hashmap.get(parentID)
            self.attachTo(parent, data.get('parentOutJointIndex'))
