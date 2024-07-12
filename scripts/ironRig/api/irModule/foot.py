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
            Foot.addAnnotation(pivotLoc, pivotLoc.split('_')[-2], [0.0, 1.0, 0.0])
        cmds.parent(self._pivotLocators, self._initGrp)

    @staticmethod
    def addAnnotation(transform, text, rgb):
        annShp = cmds.createNode('annotationShape')
        annTrsf = cmds.listRelatives(annShp, p=True)[0]
        cmds.setAttr('{}.text'.format(annShp), text, type='string')
        cmds.setAttr('{}.overrideEnabled'.format(annShp), True)
        cmds.setAttr('{}.overrideRGBColors'.format(annShp), True)
        cmds.setAttr('{}.overrideColorRGB'.format(annShp), *rgb)
        cmds.parent(annShp, transform, s=True, r=True)
        cmds.delete(annTrsf)

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

        super()._buildSystems()

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

    def attachTo(self, parentModule, parentModuleOutJointIndex=-1000000):
        if parentModule.__class__.__name__ in ['TwoBoneLimb', 'ThreeBoneLimb']:
            cnsts = []
            # Connect ik joints
            utils.removeConnections(self._ikSystem.joints[0])
            cnsts.append(cmds.parentConstraint(parentModule.ikSystem.joints[-1], self._ikSystem.joints[0], mo=True)[0])
            # Connect skel joints
            utils.removeConnections(parentModule.skelJoints[-1])
            cnsts.append(cmds.parentConstraint(self._outJoints[0], parentModule.skelJoints[-1], mo=True)[0])
            # Connect ik handle
            moduleIkHandleLoc = parentModule.ikSystem.ikHandleLocator
            utils.removeConnections(moduleIkHandleLoc)
            cnsts.append(cmds.pointConstraint(self._ikSystem.revFootJoints[-1], moduleIkHandleLoc, mo=True)[0])
            # Connect ik controllers
            cnsts.append(cmds.parentConstraint(parentModule.ikSystem.controllers[0], self._ikSystem.controllers[0], mo=True)[0])
            clonedAttrs = utils.cloneUserDefinedAttrs(self._ikSystem.controllers[0], parentModule.ikSystem.controllers[0])
            self._ikSystem.controllers[0].hide()
            # Connect fk controllers
            cnsts.append(cmds.parentConstraint(parentModule.fkSystem.controllers[-1], self._fkSystem.controllers[0], mo=True)[0])
            self._fkSystem.controllers[0].hide()
            # Connect module controllers
            cmds.connectAttr('{}.ik'.format(parentModule.controllers[0]), '{}.ik'.format(self._controllers[0]))
            self._controllers[0].hide()

            self._attachInfo['nodes'] = cnsts
            self._attachInfo['attributes'] = clonedAttrs
            self._attachInfo['connections'] = [('{}.ik'.format(parentModule.controllers[0]), '{}.ik'.format(self._controllers[0]))]

            self._parentModule = parentModule
            self._parentModuleOutJointIndex = parentModuleOutJointIndex
            self._parentModule.addChildren(self)
        else:
            super().attachTo(parentModule, parentModuleOutJointIndex)

    def detach(self):
        """Detach from the parent sapce. And remove created nodes, attributes when attached.
        """
        if not self._parentModule:
            return

        for node in self._attachInfo.get('nodes'):
            if cmds.objExists(node):
                cmds.delete(node)
        for driver, driven in self._attachInfo.get('connections'):
            cmds.disconnectAttr(driver, driven)
        for attr in self._attachInfo.get('attributes'):
            cmds.deleteAttr(attr)

        if self._parentModule.__class__.__name__ in ['TwoBoneLimb', 'ThreeBoneLimb']:
            # Constraints
            cmds.pointConstraint(self._parentModule.ikSystem.ikHandleController, self._parentModule.ikSystem.ikHandleLocator, mo=True)
            cmds.parentConstraint(self._parentModule.outJoints[-1], self._parentModule.skelJoints[-1], mo=True)
            cmds.parentConstraint(self._ikSystem.revFootJoints[-1], self._ikSystem.joints[0], mo=True)

            # Unhide controllers
            self._ikSystem.controllers[0].hide(False)
            self._fkSystem.controllers[0].hide(False)
            self._controllers[0].hide(False)

        self._parentModule.removeChildren(self)

        # Initialize parent module data
        self._parentModule = None
        self._parentModuleOutJointIndex = -1000000
        self._attachInfo = {
            'nodes': [],
            'attributes': [],
            'connections': [],
        }

    def clear(self):
        spaceSwitchBuilders = super().clear()

        # Initialize attributes
        self._blendJoints = []
        self._blendConstraints = []

        return spaceSwitchBuilders

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

    def _setAttributesFromData(self, data):
        super()._setAttributesFromData(data)

        # Set pivot locators position
        for pivotLoc, pivotLocPos in zip(self._pivotLocators, data.get('pivotLocatorsPosition')):
            cmds.xform(pivotLoc, t=pivotLocPos, ws=True)
