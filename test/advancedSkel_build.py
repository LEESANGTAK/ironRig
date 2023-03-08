# -------------- Module Build ---------------------
import ironRig as ir; reload(ir)
from ironRig.api import irGlobal
from ironRig.api import irMaster
from ironRig.api import irModule


globalMst = irMaster.GlobalMaster('root')
globalMst.build()
globalMst.controllerSize = 50
globalMst.postBuild()
#globalMst.remove()

prefix = 'spine_'
joints = [u'Root_M1',
 u'Spine1_M1',
 u'Spine2_M1',
 u'Spine3_M1',
 u'Spine4_M1',
 u'Spine5_M1',
 u'Chest_M1']
spineMod = irModule.Spine(prefix, joints)
spineMod.preBuild()
spineMod.build()
spineMod.controllerSize = 15
spineMod.postBuild()
globalMst.addModules(spineMod)
#spineMod.remove()

prefix = 'neck_'
joints = [u'Neck1_M1', u'Neck2_M1', u'Neck3_M1', u'Neck4_M1', u'Head_M1']
neckMod = irModule.Neck(prefix, joints)
neckMod.preBuild()
neckMod.numControllers = 3
neckMod.build()
neckMod.controllerSize = 10
neckMod.postBuild()
neckMod.attachTo(spineMod)
globalMst.addModules(neckMod)
#neckMod.remove()

prefix = 'head_'
joints = [u'Head_M1', u'HeadEnd_M1']
headMod = irModule.Head(prefix, joints)
headMod.preBuild()
headMod.build()
headMod.attachTo(neckMod)
globalMst.addModules(headMod)
#headMod.remove()

prefix = 'jaw_'
joints = [u'Jaw_M1', u'JawEnd_M1']
jawMod = irModule.Jaw(prefix, joints)
jawMod.preBuild()
jawMod.build()
jawMod.attachTo(headMod)
globalMst.addModules(jawMod)
#jawMod.remove()

# ---------------------------------------------------------------------------
# Eye L Build
prefix = 'eye_L_'
joints = [u'Eye_L1', u'EyeEnd_L1']
eyeLMod = irModule.Eye(prefix, joints)
eyeLMod.preBuild()
eyeLMod.build()
eyeLMod.controllerColor = irGlobal.Controller.COLOR.BLUE
eyeLMod.controllerSize = 2
eyeLMod.postBuild()
#eyeLMod.remove()

# Eye R Build
prefix = 'eye_R_'
joints = [u'Eye_R1', u'EyeEnd_R1']
eyeRMod = irModule.Eye(prefix, joints)
eyeRMod.preBuild()
eyeRMod.build()
eyeRMod.controllerColor = irGlobal.Controller.COLOR.RED
eyeRMod.controllerSize = 2
eyeRMod.postBuild()
#eyeRMod.remove()

prefix = 'eyes_'
eyesMaster = irMaster.EyesMaster(prefix)
eyesMaster.addModules(eyeLMod, eyeRMod)
eyesMaster.build()
eyesMaster.attachTo(headMod)
globalMst.addMasters(eyesMaster)
#eyesMaster.remove()
# ---------------------------------------------------------------------------

prefix = 'clavicle_L_'
joints = [u'Scapula_L1', u'Shoulder_L1']
claLMod = irModule.Clavicle(prefix, joints)
claLMod.preBuild()
claLMod.build()
claLMod.controllerColor = irGlobal.Controller.COLOR.BLUE
claLMod.controllerSize = 20
claLMod.postBuild()
claLMod.attachTo(spineMod)
globalMst.addModules(claLMod)
#claLMod.remove()

prefix = 'clavicle_R_'
joints = [u'Scapula_R1', u'Shoulder_R1']
claRMod = irModule.Clavicle(prefix, joints)
claRMod.preBuild()
claRMod.negateScaleX = True
claRMod.build()
claRMod.controllerColor = irGlobal.Controller.COLOR.RED
claRMod.controllerSize = 20
claRMod.postBuild()
claRMod.attachTo(spineMod)
globalMst.addModules(claRMod)
#claRMod.remove()

prefix = 'arm_L_'
joints = [u'Shoulder_L1', u'Elbow_L1', u'Wrist_L1']
armLMod = irModule.TwoBoneLimb(prefix, joints)
armLMod.preBuild()
armLMod.build()
armLMod.controllerColor = irGlobal.Controller.COLOR.BLUE
armLMod.controllerSize = 7
armLMod.postBuild()
armLMod.attachTo(claLMod)
globalMst.addModules(armLMod)
#armLMod.remove()

prefix = 'arm_R_'
joints = [u'Shoulder_R1', u'Elbow_R1', u'Wrist_R1']
armRMod = irModule.TwoBoneLimb(prefix, joints)
armRMod.preBuild()
armRMod.negateScaleX = True
armRMod.build()
armRMod.controllerColor = irGlobal.Controller.COLOR.RED
armRMod.controllerSize = 7
armRMod.postBuild()
armRMod.attachTo(claRMod)
globalMst.addModules(armRMod)
#armRMod.remove()

prefix = 'leg_L_'
joints = [u'Hip_L1', u'Knee_L1', u'Ankle_L1']
legLMod = irModule.TwoBoneLimb(prefix, joints)
legLMod.preBuild()
legLMod.build()
legLMod.controllerColor = irGlobal.Controller.COLOR.BLUE
legLMod.controllerSize = 7
legLMod.postBuild()
legLMod.attachTo(spineMod)
globalMst.addModules(legLMod)
#legLMod.remove()

prefix = 'leg_R_'
joints = [u'Hip_R1', u'Knee_R1', u'Ankle_R1']
legRMod = irModule.TwoBoneLimb(prefix, joints)
legRMod.preBuild()
legRMod.negateScaleX = True
legRMod.build()
legRMod.controllerColor = irGlobal.Controller.COLOR.RED
legRMod.controllerSize = 7
legRMod.postBuild()
legRMod.attachTo(spineMod)
globalMst.addModules(legRMod)
#legRMod.remove()

prefix = 'foot_L_'
joints = [u'Ankle_L1', u'Toes_L1', u'ToesEnd_L1']
footLMod = irModule.Foot(prefix, joints)
footLMod.preBuild()
footLMod.build()
footLMod.controllerColor = irGlobal.Controller.COLOR.BLUE
footLMod.controllerSize = 7
footLMod.postBuild()
footLMod.attachTo(legLMod)
globalMst.addModules(footLMod)
#footLMod.remove()

prefix = 'foot_R_'
joints = [u'Ankle_R1', u'Toes_R1', u'ToesEnd_R1']
footRMod = irModule.Foot(prefix, joints)
footRMod.preBuild()
footRMod.negateScaleX = True
footRMod.build()
footRMod.controllerColor = irGlobal.Controller.COLOR.RED
footRMod.controllerSize = 7
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
thumbLMod.controllerSize = 2
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
indexLMod.controllerSize = 2
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
middleLMod.controllerSize = 2
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
ringLMod.controllerSize = 2
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
pinkyLMod.controllerSize = 2
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
thumbRMod.controllerSize = 2
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
indexRMod.controllerSize = 2
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
middleRMod.controllerSize = 2
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
ringRMod.controllerSize = 2
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
pinkyRMod.controllerSize = 2
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
