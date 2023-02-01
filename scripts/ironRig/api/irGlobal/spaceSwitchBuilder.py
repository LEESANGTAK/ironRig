import pymel.core as pm
from ... import utils


class SpaceSwitchBuilder(object):
    SPACE_SWITCH_GRP = 'spaceSwitches_grp'

    def __init__(self, drivenController=None, driverControllers=None, defaultDriverController=None):
        self.__drivenController = drivenController
        self.__driverControllers = driverControllers
        self.__defaultDriverController = defaultDriverController

    @property
    def drivenController(self):
        return self.__drivenController

    @drivenController.setter
    def drivenController(self, controller):
        self.__drivenController = controller

    @property
    def driverControllers(self):
        return self.__driverControllers

    @driverControllers.setter
    def driverControllers(self, controllers):
        assert isinstance(controllers, list), 'property driverControllers needs a list of controllers'
        self.__driverControllers = controllers

    def build(self, parent=False, orient=False):
        topGrp = pm.createNode('transform', n='{}_spaceSwitch_grp'.format(self.__drivenController))

        allDriverCtrls = list((set(self.__driverControllers) - set([self.__defaultDriverController])))
        allDriverCtrls.insert(0, self.__defaultDriverController)

        # Create driver locators
        spaceLocs = []
        for driverCtrl in allDriverCtrls:
            spaceLoc = pm.spaceLocator(n='{}_{}_space_loc'.format(self.__drivenController, driverCtrl))
            spaceLocs.append(spaceLoc)
            pm.matchTransform(spaceLoc, self.__drivenController)
            spaceLocZeroGrp = utils.makeGroup(spaceLoc, '{}_zero'.format(spaceLoc))
            topGrp | spaceLocZeroGrp
            if parent:
                pm.parentConstraint(driverCtrl, spaceLocZeroGrp, mo=True)
            elif orient:
                pm.orientConstraint(driverCtrl, spaceLocZeroGrp, mo=True)
        pm.parent(topGrp, SpaceSwitchBuilder.SPACE_SWITCH_GRP)

        # Constraint driven controller sapce group
        spaceGrp = utils.makeGroup(self.__drivenController.extraGrp(), '{}_space'.format(self.__drivenController))
        if parent:
            cnst = pm.parentConstraint(spaceLocs, spaceGrp, mo=True)
        elif orient:
            cnst = pm.orientConstraint(spaceLocs, spaceGrp, mo=True)

        # Add attributes and connect to constraint weights
        defaultSpaceAttr = None
        otherSpaceAttrs = []
        for index, driverCtrl in enumerate(allDriverCtrls):
            attrName = driverCtrl.split('_')[0] + '_space'
            pm.addAttr(self.__drivenController, ln=attrName, at='float', min=0.0, max=1.0, dv=0.0, keyable=True)
            ctrlAttr = self.__drivenController.attr(attrName)
            ctrlAttr >> cnst.target[index].targetWeight
            if driverCtrl == self.__defaultDriverController:
                defaultSpaceAttr = ctrlAttr
            else:
                otherSpaceAttrs.append(ctrlAttr)

        # Extra connection setup
        SpaceAttrsSum = pm.createNode('plusMinusAverage', n='{}_spaces_sum'.format(self.__drivenController))
        spaceAttrsClamp = pm.createNode('clamp', n='{}_spaces_clamp'.format(self.__drivenController))
        spaceAttrsClamp.maxR.set(1)
        spaceAttrsRev = pm.createNode('reverse', n='{}_spaces_rev'.format(self.__drivenController))
        for index, spaceAttr in enumerate(otherSpaceAttrs):
            spaceAttr >> SpaceAttrsSum.input1D[index]
        SpaceAttrsSum.output1D >> spaceAttrsClamp.inputR
        spaceAttrsClamp.outputR >> spaceAttrsRev.inputX
        spaceAttrsRev.outputX >> defaultSpaceAttr.outputs(plugs=True)[0]
        defaultSpaceAttr.delete()
