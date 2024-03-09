from imp import reload

# -------------- Module Build ---------------------
import ironRig as ir; reload(ir)
from ironRig.api import irGlobal
from ironRig.api import irMaster
from ironRig.api import irModule


globalMst = irMaster.GlobalMaster(skeletonRoot='skeleton', cogJoint='Hip_joint')
globalMst.build()
globalMst.controllerScale = 50
globalMst.postBuild()
#globalMst.remove()

prefix = 'spine_'
joints = [u'Hip_joint', u'Spine_1', u'Spine_2', u'Spine_3', u'Spine_4', u'Spine_5', u'joint80']
spineMod = irModule.Spine(prefix, joints)
spineMod.preBuild()
spineMod.build()
spineMod.controllerScale = 15
spineMod.postBuild()
globalMst.addModules(spineMod)
#spineMod.remove()

prefix = 'tail_'
joints = [u'joint39',
 u'joint40',
 u'joint41',
 u'joint42',
 u'joint43',
 u'joint44',
 u'joint45',
 u'joint46',
 u'joint47',
 u'joint48',
 u'joint49',
 u'joint50',
 u'joint51',
 u'joint52']
tailMod = irModule.String(prefix, joints)
tailMod.preBuild()
tailMod.numberOfControllers = 4
tailMod.fk = True
tailMod.hybridIK = True
tailMod.wave = True
tailMod.dynamic = True
tailMod.build()
tailMod.controllerScale = 7
tailMod.postBuild()
tailMod.attachTo(spineMod)
globalMst.addModules(tailMod)
#tailMod.remove()

prefix = 'neck_'
joints = [u'Neck1', u'Neck2', u'Neck3', u'Neck4', u'Head']
neckMod = irModule.Neck(prefix, joints)
neckMod.preBuild()
neckMod.numControllers = 3
neckMod.build()
neckMod.controllerScale = 20
neckMod.postBuild()
neckMod.attachTo(spineMod)
globalMst.addModules(neckMod)
#neckMod.remove()

# ------------------------- Leg ------------------------------
prefix = 'backLeg_L_'
joints = [u'L_Back_Hip', u'L_Back_Knee', u'L_Back_Fetlock', u'L_Back_Ankle']
backLegLMod = irModule.ThreeBoneLimb(prefix, joints)
backLegLMod.preBuild()
backLegLMod.build()
backLegLMod.controllerScale = 5
backLegLMod.postBuild()
globalMst.addModules(backLegLMod)
#backLegLMod.remove()

prefix = 'backFoot_L_'
joints = [u'L_Back_Ankle', u'L_Back_Ball', u'L_Back_Toe']
backFootLMod = irModule.Foot(prefix, joints)
backFootLMod.preBuild()
backFootLMod.build()
backFootLMod.controllerColor = irGlobal.Controller.COLOR.BLUE
backFootLMod.controllerScale = 6
backFootLMod.postBuild()
backFootLMod.attachTo(backLegLMod)
globalMst.addModules(backFootLMod)
#backFootLMod.remove()

prefix = 'backLeg_R_'
joints = [u'R_Back_Hip', u'R_Back_Knee', u'R_Back_Fetlock', u'R_Back_Ankle']
backLegRMod = irModule.ThreeBoneLimb(prefix, joints)
backLegRMod.preBuild()
backLegRMod.negateScaleX = True
backLegRMod.build()
backLegRMod.controllerScale = 5
backLegRMod.postBuild()
globalMst.addModules(backLegRMod)
#backLegRMod.remove()

prefix = 'backFoot_R_'
joints = [u'R_Back_Ankle', u'R_Back_Ball', u'R_Back_Toe']
backFootRMod = irModule.Foot(prefix, joints)
backFootRMod.preBuild()
backFootRMod.build()
backFootRMod.controllerColor = irGlobal.Controller.COLOR.RED
backFootRMod.controllerScale = 6
backFootRMod.postBuild()
backFootRMod.attachTo(backLegRMod)
globalMst.addModules(backFootLMod)
#backFootRMod.remove()

prefix = 'clavicle_L_'
joints = [u'L_Front_Scapula', u'L_Front_Shoulder']
LclaMod = irModule.Clavicle(prefix, joints)
LclaMod.preBuild()
LclaMod.build()
LclaMod.controllerColor = irGlobal.Controller.COLOR.BLUE
LclaMod.controllerScale = 7
LclaMod.postBuild()
LclaMod.attachTo(spineMod)
globalMst.addModules(LclaMod)
#LclaMod.remove()

prefix = 'frontLeg_L_'
joints = [u'L_Front_Shoulder', u'L_Front_Knee', u'L_Front_Fetlock', u'L_Front_Ankle']
frontLegLMod = irModule.ThreeBoneLimb(prefix, joints)
frontLegLMod.preBuild()
frontLegLMod.ikStartController = True
frontLegLMod.build()
frontLegLMod.controllerColor = irGlobal.Controller.COLOR.BLUE
frontLegLMod.controllerScale = 5
frontLegLMod.postBuild()
frontLegLMod.attachTo(LclaMod)
globalMst.addModules(frontLegLMod)
#frontLegLMod.remove()

prefix = 'frontFoot_L_'
joints = [u'L_Front_Ankle', u'L_Front_Ball', u'L_Front_Toe']
frontFootLMod = irModule.Foot(prefix, joints)
frontFootLMod.preBuild()
frontFootLMod.build()
frontFootLMod.controllerColor = irGlobal.Controller.COLOR.BLUE
frontFootLMod.controllerScale = 6
frontFootLMod.postBuild()
frontFootLMod.attachTo(frontLegLMod)
globalMst.addModules(backFootLMod)
#frontFootLMod.remove()

prefix = 'clavicle_R_'
joints = [u'R_Front_Scapula', u'R_Front_Shoulder']
RclaMod = irModule.Clavicle(prefix, joints)
RclaMod.preBuild()
RclaMod.negateScaleX = True
RclaMod.build()
RclaMod.controllerColor = irGlobal.Controller.COLOR.RED
RclaMod.controllerScale = 7
RclaMod.postBuild()
RclaMod.attachTo(spineMod)
globalMst.addModules(RclaMod)
#RclaMod.remove()

prefix = 'frontLeg_R_'
joints = [u'R_Front_Shoulder', u'R_Front_Knee', u'R_Front_Fetlock', u'R_Front_Ankle']
frontLegRMod = irModule.ThreeBoneLimb(prefix, joints)
frontLegRMod.preBuild()
frontLegRMod.negateScaleX = True
frontLegRMod.build()
frontLegRMod.controllerColor = irGlobal.Controller.COLOR.RED
frontLegRMod.controllerScale = 5
frontLegRMod.postBuild()
frontLegRMod.attachTo(RclaMod)
globalMst.addModules(backFootLMod)
#frontLegRMod.remove()

prefix = 'frontFoot_R_'
joints = [u'R_Front_Ankle', u'R_Front_Ball', u'R_Front_Toe']
frontFootRMod = irModule.Foot(prefix, joints)
frontFootRMod.preBuild()
frontFootRMod.negateScaleX = True
frontFootRMod.build()
frontFootRMod.controllerColor = irGlobal.Controller.COLOR.RED
frontFootRMod.controllerScale = 6
frontFootRMod.postBuild()
frontFootRMod.attachTo(frontLegRMod)
globalMst.addModules(backFootLMod)
#frontFootRMod.remove()

# ------------------------------------------------------------------------------



# ---------------- Space Switch Setup ---------------------
mainCtrl = globalMst.mainController()
pelvisCtrl = spineMod.controllers()[0]
chestCtrl = spineMod.ikSystem().controllers()[-1]
neckCtrl = neckMod.ikSystem().controllers()[0]
headCtrl = neckMod.ikSystem().controllers()[-1]

claLCtrl = LclaMod.fkSystem().controllers()[0]
claRCtrl = RclaMod.fkSystem().controllers()[0]

footLCtrl = LlegMod.ikSystem().ikHandleController()
footRCtrl = RlegMod.ikSystem().ikHandleController()


handLIkhCtrlSSBuilder = irGlobal.SpaceSwitchBuilder(handLCtrl,
                                                     [mainCtrl, pelvisCtrl, chestCtrl, headCtrl],
                                                     mainCtrl)
handLIkhCtrlSSBuilder.build(parent=True)
armLPvCtrlSSBuilder = irGlobal.SpaceSwitchBuilder(LarmMod.ikSystem().poleVectorController(),
                                                   [mainCtrl, chestCtrl, handLCtrl],
                                                   mainCtrl)
armLPvCtrlSSBuilder.build(parent=True)
shoulderLCtrlSSBuilder = irGlobal.SpaceSwitchBuilder(shoulderLCtrl,
                                                         [mainCtrl, claLCtrl],
                                                         claLCtrl)
shoulderLCtrlSSBuilder.build(orient=True)


handRIkhCtrlSSBuilder = irGlobal.SpaceSwitchBuilder(handRCtrl,
                                                     [mainCtrl, pelvisCtrl, chestCtrl, headCtrl],
                                                     mainCtrl)
handRIkhCtrlSSBuilder.build(parent=True)
armRPvCtrlSSBuilder = irGlobal.SpaceSwitchBuilder(RarmMod.ikSystem().poleVectorController(),
                                                   [mainCtrl, chestCtrl, handRCtrl],
                                                   mainCtrl)
armRPvCtrlSSBuilder.build(parent=True)
shoulderRCtrlSSBuilder = irGlobal.SpaceSwitchBuilder(shoulderRCtrl,
                                                         [mainCtrl, claRCtrl],
                                                         claRCtrl)
shoulderRCtrlSSBuilder.build(orient=True)


footRIkhCtrlSSBuilder = irGlobal.SpaceSwitchBuilder(footLCtrl,
                                                     [mainCtrl, pelvisCtrl],
                                                     mainCtrl)
footRIkhCtrlSSBuilder.build(parent=True)
legRPvCtrlSSBuilder = irGlobal.SpaceSwitchBuilder(LlegMod.ikSystem().poleVectorController(),
                                                   [mainCtrl, footLCtrl],
                                                   mainCtrl)
legRPvCtrlSSBuilder.build(parent=True)


footRIkhCtrlSSBuilder = irGlobal.SpaceSwitchBuilder(footRCtrl,
                                                     [mainCtrl, pelvisCtrl],
                                                     mainCtrl)
footRIkhCtrlSSBuilder.build(parent=True)
legRPvCtrlSSBuilder = irGlobal.SpaceSwitchBuilder(RlegMod.ikSystem().poleVectorController(),
                                                   [mainCtrl, footRCtrl],
                                                   mainCtrl)
legRPvCtrlSSBuilder.build(parent=True)


headCtrlSSBuilder = irGlobal.SpaceSwitchBuilder(headCtrl, [neckCtrl, mainCtrl], neckCtrl)
headCtrlSSBuilder.build(orient=True)


eyesCtrlSSBuilder = irGlobal.SpaceSwitchBuilder(eyesMaster.controller(), [upHeadCtrl, mainCtrl], upHeadCtrl)
eyesCtrlSSBuilder.build(parent=True)


