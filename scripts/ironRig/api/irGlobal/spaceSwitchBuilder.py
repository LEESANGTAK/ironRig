from maya import cmds
from ... import utils
from .serializable import Serializable


class SpaceSwitchBuilder(Serializable):
    SPACE_SWITCH_GRP = 'spaceSwitches_grp'

    def __init__(self, drivenController=None, driverControllers=None, defaultDriverController=None):
        super().__init__()

        self._drivenController = drivenController
        self._driverControllers = driverControllers
        self._defaultDriverController = defaultDriverController
        self._isParentType = False
        self._isOrientType = False

        self._topGroup = None
        self._spaceGroup = None
        self._spaceAttributes = []

    @property
    def drivenController(self):
        return self._drivenController

    @drivenController.setter
    def drivenController(self, controller):
        self._drivenController = controller

    @property
    def driverControllers(self):
        return self._driverControllers

    @driverControllers.setter
    def driverControllers(self, controllers):
        assert isinstance(controllers, list), 'property driverControllers needs a list of controllers'
        self._driverControllers = controllers

    @property
    def isParentType(self):
        return self._isParentType

    @isParentType.setter
    def isParentType(self, val):
        self._isParentType = val

    @property
    def isOrientType(self):
        return self._isOrientType

    @isOrientType.setter
    def isOrientType(self, val):
        self._isOrientType = val

    def build(self):
        self._topGroup = '{}_spaceSwitch_grp'.format(self._drivenController)
        if cmds.objExists(self._topGroup):
            cmds.delete(self._topGroup)

        topGrp = cmds.createNode('transform', n=self._topGroup)

        allDriverCtrls = list((set(self._driverControllers) - set([self._defaultDriverController])))
        allDriverCtrls.insert(0, self._defaultDriverController)

        # Create driver locators
        spaceLocs = []
        for driverCtrl in allDriverCtrls:
            spaceLoc = cmds.spaceLocator(n='{}_{}_space_loc'.format(self._drivenController, driverCtrl))[0]
            spaceLocs.append(spaceLoc)
            cmds.matchTransform(spaceLoc, self._drivenController)
            spaceLocZeroGrp = utils.makeGroup(spaceLoc, '{}_zero'.format(spaceLoc))
            cmds.parent(spaceLocZeroGrp, topGrp)
            if self._isParentType:
                cmds.parentConstraint(driverCtrl, spaceLocZeroGrp, mo=True)
            elif self._isOrientType:
                cmds.orientConstraint(driverCtrl, spaceLocZeroGrp, mo=True)
        cmds.parent(topGrp, SpaceSwitchBuilder.SPACE_SWITCH_GRP)

        # Constraint driven controller sapce group
        self._spaceGroup = utils.makeGroup(self._drivenController.extraGrp, '{}_space'.format(self._drivenController))
        if self._isParentType:
            cnst = cmds.parentConstraint(spaceLocs, self._spaceGroup, mo=True)[0]
        elif self._isOrientType:
            cnst = cmds.orientConstraint(spaceLocs, self._spaceGroup, mo=True)[0]

        # Add attributes and connect to constraint weights
        defaultSpaceAttr = None
        for index, driverCtrl in enumerate(allDriverCtrls):
            attrName = driverCtrl.split('_')[0] + '_space'
            cmds.addAttr(self._drivenController, ln=attrName, at='float', min=0.0, max=1.0, dv=0.0, keyable=True)
            ctrlAttr = '{}.{}'.format(self._drivenController, attrName)
            cmds.connectAttr(ctrlAttr, '{}.target[{}].targetWeight'.format(cnst, index), f=True)
            if driverCtrl == self._defaultDriverController:
                defaultSpaceAttr = ctrlAttr
            else:
                self._spaceAttributes.append(ctrlAttr)

        # Set up for default space attribute
        SpaceAttrsSum = cmds.createNode('plusMinusAverage', n='{}_spaces_sum'.format(self._drivenController))
        spaceAttrsClamp = cmds.createNode('clamp', n='{}_spaces_clamp'.format(self._drivenController))
        cmds.setAttr('{}.maxR'.format(spaceAttrsClamp), 1)
        spaceAttrsRev = cmds.createNode('reverse', n='{}_spaces_rev'.format(self._drivenController))
        for index, spaceAttr in enumerate(self._spaceAttributes):
            cmds.connectAttr(spaceAttr, '{}.input1D[{}]'.format(SpaceAttrsSum, index))
        cmds.connectAttr('{}.output1D'.format(SpaceAttrsSum), '{}.inputR'.format(spaceAttrsClamp))
        cmds.connectAttr('{}.outputR'.format(spaceAttrsClamp), '{}.inputX'.format(spaceAttrsRev))
        cmds.connectAttr('{}.outputX'.format(spaceAttrsRev), cmds.listConnections(defaultSpaceAttr, source=False, plugs=True)[0], f=True)
        cmds.deleteAttr(defaultSpaceAttr)

        self._drivenController.spaceSwitchBuilder = self

    def clear(self):
        cmds.parent(self._drivenController.extraGrp, self._drivenController.zeroGrp)
        cmds.delete(self._spaceGroup, self._topGroup)
        for attr in self._spaceAttributes:
            cmds.deleteAttr(attr)

    def serialize(self):
        return {
            'id': self._id,
            'drivenControllerID': self._drivenController.id,
            'driverControllersID': [ctrl.id for ctrl in self._driverControllers],
            'defaultDriverControllerID': self._defaultDriverController.id,
            'isParentType': self._isParentType,
            'isOrientType': self._isOrientType
        }

    def deserialize(self, data, hashmap={}):
        super().deserialize(data, hashmap)
        self._drivenController = hashmap.get(data.get('drivenControllerID'))
        self._driverControllers = [hashmap.get(ctrlID) for ctrlID in data.get('driverControllersID')]
        self._defaultDriverController = hashmap.get(data.get('defaultDriverControllerID'))
        self._isParentType = data.get('isParentType')
        self._isOrientType = data.get('isOrientType')
        self.build()
