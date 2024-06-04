from imp import reload
import ironRig; reload(ironRig)
import ironRig.api.irGlobal as irg
import ironRig.api.irSystem as irs
import ironRig.api.irModule as irm
import ironRig.api.irMaster as irmst


# -------------- Module Build ---------------------
globalMst = irmst.GlobalMaster('root')
globalMst.build()
#globalMst.delete()

name = 'spine'
joints = ['Root_M1', 'Spine1_M1', 'Spine2_M1', 'Spine3_M1', 'Spine4_M1', 'Spine5_M1', 'Chest_M1']
spineMod = irm.Spine(name, irm.Module.SIDE.CENTER, joints)
spineMod.preBuild()
spineMod.build()
spineMod.controllerSize = 15
globalMst.addModules(spineMod)
#spineMod.delete()

name = 'neck'
joints = ['Neck1_M1', 'Neck2_M1', 'Neck3_M1', 'Neck4_M1', 'Head_M1']
neckMod = irm.Neck(name, joints)
neckMod.numControllers = 3
neckMod.controllerSize = 10
neckMod.preBuild()
neckMod.build()
neckMod.attachTo(spineMod)
globalMst.addModules(neckMod)
#neckMod.delete()

name = 'head'
joints = ['Head_M1', 'HeadEnd_M1']
headMod = irm.Head(name, joints)
headMod.preBuild()
headMod.build()
headMod.attachTo(neckMod)
globalMst.addModules(headMod)
#headMod.delete()

name = 'jaw'
joints = ['Jaw_M1', 'JawEnd_M1']
jawMod = irm.Jaw(name, joints)
jawMod.preBuild()
jawMod.build()
jawMod.attachTo(headMod)
globalMst.addModules(jawMod)
#jawMod.delete()

# ---------------------------------------------------------------------------
# Eye L Build
name = 'eye_L'
joints = ['Eye_L1', 'EyeEnd_L1']
eyeLMod = irm.Eye(name, joints)
eyeLMod.preBuild()
eyeLMod.build()
eyeLMod.controllerColor = irGlobal.Controller.COLOR.BLUE
eyeLMod.controllerSize = 2
eyeLMod.postBuild()
#eyeLMod.delete()

# Eye R Build
name = 'eye_R'
joints = ['Eye_R1', 'EyeEnd_R1']
eyeRMod = irm.Eye(name, joints)
eyeRMod.preBuild()
eyeRMod.build()
eyeRMod.controllerColor = irGlobal.Controller.COLOR.RED
eyeRMod.controllerSize = 2
eyeRMod.postBuild()
#eyeRMod.delete()

name = 'eyes'
eyesMaster = irMaster.EyesMaster(name)
eyesMaster.addModules(eyeLMod, eyeRMod)
eyesMaster.build()
eyesMaster.attachTo(headMod)
globalMst.addMasters(eyesMaster)
#eyesMaster.delete()
# ---------------------------------------------------------------------------

name = 'clavicle_L'
joints = ['Scapula_L1', 'Shoulder_L1']
claLMod = irm.Clavicle(name, joints)
claLMod.preBuild()
claLMod.build()
claLMod.controllerColor = irGlobal.Controller.COLOR.BLUE
claLMod.controllerSize = 20
claLMod.postBuild()
claLMod.attachTo(spineMod)
globalMst.addModules(claLMod)
#claLMod.delete()

name = 'clavicle_R'
joints = ['Scapula_R1', 'Shoulder_R1']
claRMod = irm.Clavicle(name, joints)
claRMod.preBuild()
claRMod.negateScaleX = True
claRMod.build()
claRMod.controllerColor = irGlobal.Controller.COLOR.RED
claRMod.controllerSize = 20
claRMod.postBuild()
claRMod.attachTo(spineMod)
globalMst.addModules(claRMod)
#claRMod.delete()

name = 'arm_L'
joints = ['Shoulder_L1', 'Elbow_L1', 'Wrist_L1']
armLMod = irm.TwoBoneLimb(name, joints)
armLMod.preBuild()
armLMod.build()
armLMod.controllerColor = irGlobal.Controller.COLOR.BLUE
armLMod.controllerSize = 7
armLMod.postBuild()
armLMod.attachTo(claLMod)
globalMst.addModules(armLMod)
#armLMod.delete()

name = 'arm_R'
joints = ['Shoulder_R1', 'Elbow_R1', 'Wrist_R1']
armRMod = irm.TwoBoneLimb(name, joints)
armRMod.preBuild()
armRMod.negateScaleX = True
armRMod.build()
armRMod.controllerColor = irGlobal.Controller.COLOR.RED
armRMod.controllerSize = 7
armRMod.postBuild()
armRMod.attachTo(claRMod)
globalMst.addModules(armRMod)
#armRMod.delete()

name = 'leg_L'
joints = ['Hip_L1', 'Knee_L1', 'Ankle_L1']
legLMod = irm.TwoBoneLimb(name, joints)
legLMod.preBuild()
legLMod.build()
legLMod.controllerColor = irGlobal.Controller.COLOR.BLUE
legLMod.controllerSize = 7
legLMod.postBuild()
legLMod.attachTo(spineMod)
globalMst.addModules(legLMod)
#legLMod.delete()

name = 'leg_R'
joints = ['Hip_R1', 'Knee_R1', 'Ankle_R1']
legRMod = irm.TwoBoneLimb(name, joints)
legRMod.preBuild()
legRMod.negateScaleX = True
legRMod.build()
legRMod.controllerColor = irGlobal.Controller.COLOR.RED
legRMod.controllerSize = 7
legRMod.postBuild()
legRMod.attachTo(spineMod)
globalMst.addModules(legRMod)
#legRMod.delete()

name = 'foot_L'
joints = ['Ankle_L1', 'Toes_L1', 'ToesEnd_L1']
footLMod = irm.Foot(name, joints)
footLMod.preBuild()
footLMod.build()
footLMod.controllerColor = irGlobal.Controller.COLOR.BLUE
footLMod.controllerSize = 7
footLMod.postBuild()
footLMod.attachTo(legLMod)
globalMst.addModules(footLMod)
#footLMod.delete()

name = 'foot_R'
joints = ['Ankle_R1', 'Toes_R1', 'ToesEnd_R1']
footRMod = irm.Foot(name, joints)
footRMod.preBuild()
footRMod.negateScaleX = True
footRMod.build()
footRMod.controllerColor = irGlobal.Controller.COLOR.RED
footRMod.controllerSize = 7
footRMod.postBuild()
footRMod.attachTo(legRMod)
globalMst.addModules(footRMod)
#footRMod.delete()

# ---------------------------------------------------------------------------

# Fingers L Build
name = 'thumbFinger_L'
joints = ['ThumbFinger1_L1',
 'ThumbFinger2_L1',
 'ThumbFinger3_L1',
 'ThumbFinger4_L1']
thumbLMod = irm.Finger(name, joints)
thumbLMod.preBuild()
thumbLMod.build()
thumbLMod.controllerColor = irGlobal.Controller.COLOR.BLUE
thumbLMod.controllerSize = 2
thumbLMod.postBuild()
#thumbLMod.delete()

name = 'indexFinger_L'
joints = ['IndexFinger1_L1',
 'IndexFinger2_L1',
 'IndexFinger3_L1',
 'IndexFinger4_L1']
indexLMod = irm.Finger(name, joints)
indexLMod.preBuild()
indexLMod.build()
indexLMod.controllerColor = irGlobal.Controller.COLOR.BLUE
indexLMod.controllerSize = 2
indexLMod.postBuild()
#indexLMod.delete()

name = 'middleFinger_L'
joints = ['MiddleFinger1_L1',
 'MiddleFinger2_L1',
 'MiddleFinger3_L1',
 'MiddleFinger4_L1']
middleLMod = irm.Finger(name, joints)
middleLMod.preBuild()
middleLMod.build()
middleLMod.controllerColor = irGlobal.Controller.COLOR.BLUE
middleLMod.controllerSize = 2
middleLMod.postBuild()
#middleLMod.delete()

name = 'ringFinger_L'
joints = ['RingFinger1_L1',
 'RingFinger2_L1',
 'RingFinger3_L1',
 'RingFinger4_L1']
ringLMod = irm.Finger(name, joints)
ringLMod.preBuild()
ringLMod.build()
ringLMod.controllerColor = irGlobal.Controller.COLOR.BLUE
ringLMod.controllerSize = 2
ringLMod.postBuild()
#ringLMod.delete()

name = 'pinkyFinger_L'
joints = ['PinkyFinger1_L1',
 'PinkyFinger2_L1',
 'PinkyFinger3_L1',
 'PinkyFinger4_L1']
pinkyLMod = irm.Finger(name, joints)
pinkyLMod.preBuild()
pinkyLMod.build()
pinkyLMod.controllerColor = irGlobal.Controller.COLOR.BLUE
pinkyLMod.controllerSize = 2
pinkyLMod.postBuild()
#pinkyLMod.delete()

name = 'fingers_L'
fingersLMaster = irMaster.FingersMaster(name)
fingersLMaster.addModules(thumbLMod, indexLMod, middleLMod, ringLMod, pinkyLMod)
fingersLMaster.build()
fingersLMaster.attachTo(armLMod)
globalMst.addMasters(fingersLMaster)
#fingersLMaster.delete()

# ---------------------------------------------------------------------------
# Fingers R Build
name = 'thumbFinger_R'
joints = ['ThumbFinger1_R1',
 'ThumbFinger2_R1',
 'ThumbFinger3_R1',
 'ThumbFinger4_R1']
thumbRMod = irm.Finger(name, joints)
thumbRMod.preBuild()
thumbRMod.negateScaleX = True
thumbRMod.build()
thumbRMod.controllerColor = irGlobal.Controller.COLOR.RED
thumbRMod.controllerSize = 2
thumbRMod.postBuild()
#thumbRMod.delete()

name = 'indexFinger_R'
joints = ['IndexFinger1_R1',
 'IndexFinger2_R1',
 'IndexFinger3_R1',
 'IndexFinger4_R1']
indexRMod = irm.Finger(name, joints)
indexRMod.preBuild()
indexRMod.negateScaleX = True
indexRMod.build()
indexRMod.controllerColor = irGlobal.Controller.COLOR.RED
indexRMod.controllerSize = 2
indexRMod.postBuild()
#indexRMod.delete()

name = 'middleFinger_R'
joints = ['MiddleFinger1_R1',
 'MiddleFinger2_R1',
 'MiddleFinger3_R1',
 'MiddleFinger4_R1']
middleRMod = irm.Finger(name, joints)
middleRMod.preBuild()
middleRMod.negateScaleX = True
middleRMod.build()
middleRMod.controllerColor = irGlobal.Controller.COLOR.RED
middleRMod.controllerSize = 2
middleRMod.postBuild()
#middleRMod.delete()

name = 'ringFinger_R'
joints = ['RingFinger1_R1',
 'RingFinger2_R1',
 'RingFinger3_R1',
 'RingFinger4_R1']
ringRMod = irm.Finger(name, joints)
ringRMod.preBuild()
ringRMod.negateScaleX = True
ringRMod.build()
ringRMod.controllerColor = irGlobal.Controller.COLOR.RED
ringRMod.controllerSize = 2
ringRMod.postBuild()
#ringRMod.delete()

name = 'pinkyFinger_R'
joints = ['PinkyFinger1_R1',
 'PinkyFinger2_R1',
 'PinkyFinger3_R1',
 'PinkyFinger4_R1']
pinkyRMod = irm.Finger(name, joints)
pinkyRMod.preBuild()
pinkyRMod.negateScaleX = True
pinkyRMod.build()
pinkyRMod.controllerColor = irGlobal.Controller.COLOR.RED
pinkyRMod.controllerSize = 2
pinkyRMod.postBuild()
#pinkyRMod.delete()

name = 'fingers_R'
fingersRMaster = irMaster.FingersMaster(name)
fingersRMaster.addModules(thumbRMod, indexRMod, middleRMod, ringRMod, pinkyRMod)
fingersRMaster.build()
fingersRMaster.attachTo(armRMod)
globalMst.addMasters(fingersRMaster)
#fingersRMaster.delete()

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
