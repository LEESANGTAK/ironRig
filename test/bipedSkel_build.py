# -------------- Module Build ---------------------
import ironRig as ir; reload(ir)
from ironRig.api import irGlobal
from ironRig.api import irMaster
from ironRig.api import irModule


globalMst = irMaster.GlobalMaster(skeletonRoot='root', cogJoint='Pelvis')
globalMst.build()
globalMst.controllerScale = 50
globalMst.postBuild()
#globalMst.remove()

prefix = 'spine_'
joints = [u'Spine', u'Spine1', u'Spine2', u'Spine3', u'Spine4', u'Spine5']
spineMod = irModule.Spine(prefix, joints)
spineMod.preBuild()
spineMod.build()
spineMod.controllerScale = 8
spineMod.postBuild()
globalMst.addModules(spineMod)
#spineMod.remove()

prefix = 'neck_'
joints = [u'Neck', u'Neck1', u'Head']
neckMod = irModule.Neck(prefix, joints)
neckMod.preBuild()
neckMod.numControllers = 2
neckMod.build()
neckMod.controllerScale = 10
neckMod.postBuild()
neckMod.attachTo(spineMod)
globalMst.addModules(neckMod)
#neckMod.remove()

prefix = 'head_'
joints = [u'Head']
headMod = irModule.Simple(prefix, joints)
headMod.preBuild()
headMod.build()
headMod.attachTo(neckMod)
globalMst.addModules(headMod)
#headMod.remove()

# ---------------------------------------------------------------------------

prefix = 'clavicle_L_'
joints = [u'LClavicle', u'LUpperArm']
claLMod = irModule.Clavicle(prefix, joints)
claLMod.preBuild()
claLMod.build()
claLMod.controllerColor = irGlobal.Controller.COLOR.BLUE
claLMod.controllerScale = 20
claLMod.postBuild()
claLMod.attachTo(spineMod)
globalMst.addModules(claLMod)
#claLMod.remove()

prefix = 'clavicle_R_'
joints = [u'RClavicle', u'RUpperArm']
claRMod = irModule.Clavicle(prefix, joints)
claRMod.preBuild()
claRMod.build()
claRMod.controllerColor = irGlobal.Controller.COLOR.RED
claRMod.controllerScale = 20
claRMod.postBuild()
claRMod.attachTo(spineMod)
globalMst.addModules(claRMod)
#claRMod.remove()

prefix = 'arm_L_'
joints = [u'LUpperArm', u'LForearm', u'LHand']
armLMod = irModule.TwoBoneLimb(prefix, joints)
armLMod.preBuild()
armLMod.build()
armLMod.controllerColor = irGlobal.Controller.COLOR.BLUE
armLMod.controllerScale = 7
armLMod.postBuild()
armLMod.attachTo(claLMod)
globalMst.addModules(armLMod)
#armLMod.remove()

prefix = 'arm_R_'
joints = [u'RUpperArm', u'RForearm', u'RHand']
armRMod = irModule.TwoBoneLimb(prefix, joints)
armRMod.preBuild()
armRMod.build()
armRMod.controllerColor = irGlobal.Controller.COLOR.RED
armRMod.controllerScale = 7
armRMod.postBuild()
armRMod.attachTo(claRMod)
globalMst.addModules(armRMod)
#armRMod.remove()

prefix = 'leg_L_'
joints = [u'LThigh', u'LCalf', u'LFoot']
legLMod = irModule.TwoBoneLimb(prefix, joints)
legLMod.preBuild()
legLMod.build()
legLMod.controllerColor = irGlobal.Controller.COLOR.BLUE
legLMod.controllerScale = 7
legLMod.postBuild()
legLMod.attachTo(spineMod)
globalMst.addModules(legLMod)
#legLMod.remove()

prefix = 'leg_R_'
joints = [u'RThigh', u'RCalf', u'RFoot']
legRMod = irModule.TwoBoneLimb(prefix, joints)
legRMod.preBuild()
legRMod.build()
legRMod.controllerColor = irGlobal.Controller.COLOR.RED
legRMod.controllerScale = 7
legRMod.postBuild()
legRMod.attachTo(spineMod)
globalMst.addModules(legRMod)
#legRMod.remove()

prefix = 'foot_L_'
joints = [u'LeftFoot', u'LeftToeBase', u'LeftToe_End']
footLMod = irModule.Foot(prefix, joints)
footLMod.preBuild()
footLMod.build()
footLMod.controllerColor = irGlobal.Controller.COLOR.BLUE
footLMod.controllerScale = 7
footLMod.postBuild()
footLMod.attachTo(legLMod)
globalMst.addModules(footLMod)
#footLMod.remove()

prefix = 'foot_R_'
joints = [u'RightFoot', u'RightToeBase', u'RightToe_End']
footRMod = irModule.Foot(prefix, joints)
footRMod.preBuild()
footRMod.negateScaleX = True
footRMod.build()
footRMod.controllerColor = irGlobal.Controller.COLOR.RED
footRMod.controllerScale = 7
footRMod.postBuild()
footRMod.attachTo(legRMod)
globalMst.addModules(footRMod)
#footRMod.remove()

# ---------------------------------------------------------------------------

# Fingers L Build
prefix = 'thumbFinger_L_'
joints = [u'ThumbFinger1_L1',
 u'ThumbFinger2_L1',
 u'ThumbFinger3_L1',
 u'ThumbFinger4_L1']
thumbLMod = irModule.Finger(prefix, joints)
thumbLMod.preBuild()
thumbLMod.build()
thumbLMod.controllerColor = irGlobal.Controller.COLOR.BLUE
thumbLMod.controllerScale = 2
thumbLMod.postBuild()
#thumbLMod.remove()

prefix = 'indexFinger_L_'
joints = [u'IndexFinger1_L1',
 u'IndexFinger2_L1',
 u'IndexFinger3_L1',
 u'IndexFinger4_L1']
indexLMod = irModule.Finger(prefix, joints)
indexLMod.preBuild()
indexLMod.build()
indexLMod.controllerColor = irGlobal.Controller.COLOR.BLUE
indexLMod.controllerScale = 2
indexLMod.postBuild()
#indexLMod.remove()

prefix = 'middleFinger_L_'
joints = [u'MiddleFinger1_L1',
 u'MiddleFinger2_L1',
 u'MiddleFinger3_L1',
 u'MiddleFinger4_L1']
middleLMod = irModule.Finger(prefix, joints)
middleLMod.preBuild()
middleLMod.build()
middleLMod.controllerColor = irGlobal.Controller.COLOR.BLUE
middleLMod.controllerScale = 2
middleLMod.postBuild()
#middleLMod.remove()

prefix = 'ringFinger_L_'
joints = [u'RingFinger1_L1',
 u'RingFinger2_L1',
 u'RingFinger3_L1',
 u'RingFinger4_L1']
ringLMod = irModule.Finger(prefix, joints)
ringLMod.preBuild()
ringLMod.build()
ringLMod.controllerColor = irGlobal.Controller.COLOR.BLUE
ringLMod.controllerScale = 2
ringLMod.postBuild()
#ringLMod.remove()

prefix = 'pinkyFinger_L_'
joints = [u'PinkyFinger1_L1',
 u'PinkyFinger2_L1',
 u'PinkyFinger3_L1',
 u'PinkyFinger4_L1']
pinkyLMod = irModule.Finger(prefix, joints)
pinkyLMod.preBuild()
pinkyLMod.build()
pinkyLMod.controllerColor = irGlobal.Controller.COLOR.BLUE
pinkyLMod.controllerScale = 2
pinkyLMod.postBuild()
#pinkyLMod.remove()

prefix = 'fingers_L_'
fingersLMaster = irMaster.FingersMaster(prefix)
fingersLMaster.addModules(thumbLMod, indexLMod, middleLMod, ringLMod, pinkyLMod)
fingersLMaster.build()
fingersLMaster.attachTo(armLMod)
globalMst.addMasters(fingersLMaster)
#fingersLMaster.remove()

# ---------------------------------------------------------------------------
# Fingers R Build
prefix = 'thumbFinger_R_'
joints = [u'ThumbFinger1_R1',
 u'ThumbFinger2_R1',
 u'ThumbFinger3_R1',
 u'ThumbFinger4_R1']
thumbRMod = irModule.Finger(prefix, joints)
thumbRMod.preBuild()
thumbRMod.negateScaleX = True
thumbRMod.build()
thumbRMod.controllerColor = irGlobal.Controller.COLOR.RED
thumbRMod.controllerScale = 2
thumbRMod.postBuild()
#thumbRMod.remove()

prefix = 'indexFinger_R_'
joints = [u'IndexFinger1_R1',
 u'IndexFinger2_R1',
 u'IndexFinger3_R1',
 u'IndexFinger4_R1']
indexRMod = irModule.Finger(prefix, joints)
indexRMod.preBuild()
indexRMod.negateScaleX = True
indexRMod.build()
indexRMod.controllerColor = irGlobal.Controller.COLOR.RED
indexRMod.controllerScale = 2
indexRMod.postBuild()
#indexRMod.remove()

prefix = 'middleFinger_R_'
joints = [u'MiddleFinger1_R1',
 u'MiddleFinger2_R1',
 u'MiddleFinger3_R1',
 u'MiddleFinger4_R1']
middleRMod = irModule.Finger(prefix, joints)
middleRMod.preBuild()
middleRMod.negateScaleX = True
middleRMod.build()
middleRMod.controllerColor = irGlobal.Controller.COLOR.RED
middleRMod.controllerScale = 2
middleRMod.postBuild()
#middleRMod.remove()

prefix = 'ringFinger_R_'
joints = [u'RingFinger1_R1',
 u'RingFinger2_R1',
 u'RingFinger3_R1',
 u'RingFinger4_R1']
ringRMod = irModule.Finger(prefix, joints)
ringRMod.preBuild()
ringRMod.negateScaleX = True
ringRMod.build()
ringRMod.controllerColor = irGlobal.Controller.COLOR.RED
ringRMod.controllerScale = 2
ringRMod.postBuild()
#ringRMod.remove()

prefix = 'pinkyFinger_R_'
joints = [u'PinkyFinger1_R1',
 u'PinkyFinger2_R1',
 u'PinkyFinger3_R1',
 u'PinkyFinger4_R1']
pinkyRMod = irModule.Finger(prefix, joints)
pinkyRMod.preBuild()
pinkyRMod.negateScaleX = True
pinkyRMod.build()
pinkyRMod.controllerColor = irGlobal.Controller.COLOR.RED
pinkyRMod.controllerScale = 2
pinkyRMod.postBuild()
#pinkyRMod.remove()

prefix = 'fingers_R_'
fingersRMaster = irMaster.FingersMaster(prefix)
fingersRMaster.addModules(thumbRMod, indexRMod, middleRMod, ringRMod, pinkyRMod)
fingersRMaster.build()
fingersRMaster.attachTo(armRMod)
globalMst.addMasters(fingersRMaster)
#fingersRMaster.remove()

# ---------------- Space Switch Setup ---------------------
mainCtrl = globalMst.mainController()
pelvisCtrl = spineMod.controllers()[0]
chestCtrl = spineMod.ikSystem().controllers()[-1]
neckCtrl = neckMod.ikSystem().controllers()[-1]
headCtrl = headMod.fkSystem().controllers()[0]

claLCtrl = claLMod.fkSystem().controllers()[0]
claRCtrl = claRMod.fkSystem().controllers()[0]

handLCtrl = armLMod.ikSystem().ikHandleController()
shoulderLCtrl = armLMod.fkSystem().controllers()[0]
handRCtrl = armRMod.ikSystem().ikHandleController()
shoulderRCtrl = armRMod.fkSystem().controllers()[0]

footLCtrl = legLMod.ikSystem().ikHandleController()
footRCtrl = legRMod.ikSystem().ikHandleController()


handLIkhCtrlSSBuilder = irGlobal.SpaceSwitchBuilder(handLCtrl,
                                                     [mainCtrl, pelvisCtrl, chestCtrl, headCtrl],
                                                     mainCtrl)
handLIkhCtrlSSBuilder.build(parent=True)
shoulderLIkhCtrlSSBuilder = irGlobal.SpaceSwitchBuilder(shoulderLCtrl,
                                                         [mainCtrl, claLCtrl],
                                                         claLCtrl)
shoulderLIkhCtrlSSBuilder.build(orient=True)
armLPvCtrlSSBuilder = irGlobal.SpaceSwitchBuilder(armLMod.ikSystem().poleVectorController(),
                                                   [mainCtrl, chestCtrl, handLCtrl],
                                                   mainCtrl)
armLPvCtrlSSBuilder.build(parent=True)


handRIkhCtrlSSBuilder = irGlobal.SpaceSwitchBuilder(handRCtrl,
                                                     [mainCtrl, pelvisCtrl, chestCtrl, headCtrl],
                                                     mainCtrl)
handRIkhCtrlSSBuilder.build(parent=True)
shoulderRIkhCtrlSSBuilder = irGlobal.SpaceSwitchBuilder(shoulderRCtrl,
                                                         [mainCtrl, claRCtrl],
                                                         claRCtrl)
shoulderRIkhCtrlSSBuilder.build(orient=True)
armRPvCtrlSSBuilder = irGlobal.SpaceSwitchBuilder(armRMod.ikSystem().poleVectorController(),
                                                   [mainCtrl, chestCtrl, handRCtrl],
                                                   mainCtrl)
armRPvCtrlSSBuilder.build(parent=True)


footRIkhCtrlSSBuilder = irGlobal.SpaceSwitchBuilder(footLCtrl,
                                                     [mainCtrl, pelvisCtrl],
                                                     mainCtrl)
footRIkhCtrlSSBuilder.build(parent=True)
legRPvCtrlSSBuilder = irGlobal.SpaceSwitchBuilder(legLMod.ikSystem().poleVectorController(),
                                                   [mainCtrl, footLCtrl],
                                                   mainCtrl)
legRPvCtrlSSBuilder.build(parent=True)


footRIkhCtrlSSBuilder = irGlobal.SpaceSwitchBuilder(footRCtrl,
                                                     [mainCtrl, pelvisCtrl],
                                                     mainCtrl)
footRIkhCtrlSSBuilder.build(parent=True)
legRPvCtrlSSBuilder = irGlobal.SpaceSwitchBuilder(legRMod.ikSystem().poleVectorController(),
                                                   [mainCtrl, footRCtrl],
                                                   mainCtrl)
legRPvCtrlSSBuilder.build(parent=True)


headCtrlSSBuilder = irGlobal.SpaceSwitchBuilder(headCtrl, [neckCtrl, mainCtrl], neckCtrl)
headCtrlSSBuilder.build(orient=True)


eyesCtrlSSBuilder = irGlobal.SpaceSwitchBuilder(eyesMaster.controller(), [headCtrl, mainCtrl], headCtrl)
eyesCtrlSSBuilder.build(parent=True)
