from imp import reload
import ironRig; reload(ironRig)
import ironRig.api.irGlobal as irg
import ironRig.api.irSystem as irs
import ironRig.api.irModule as irm
import ironRig.api.irMaster as irmst


# -------------- Module Build ---------------------
globalMst = irmst.GlobalMaster('root', True)
globalMst.build()
#globalMst.delete()

name = 'spine'
joints = ['Root_M1', 'Spine1_M1', 'Spine2_M1', 'Spine3_M1', 'Spine4_M1', 'Spine5_M1', 'Chest_M1']
spineMod = irm.Spine(name, irm.Module.SIDE.CENTER, skeletonJoints=joints)
spineMod.preBuild()
spineMod.build()
spineMod.controllerSize = 15
globalMst.addModules(spineMod)
#spineMod.delete()

name = 'neck'
joints = ['Neck1_M1', 'Neck2_M1', 'Neck3_M1', 'Neck4_M1', 'Head_M1']
neckMod = irm.Neck(name, skeletonJoints=joints)
neckMod.numberOfControllers = 3
neckMod.preBuild()
neckMod.build()
neckMod.controllerSize = 10
neckMod.attachTo(spineMod)
globalMst.addModules(neckMod)
#neckMod.delete()
headCtrlSSBuilder = irg.SpaceSwitchBuilder(neckMod.headController, [neckMod.neckController, globalMst.mainController], neckMod.neckController)
headCtrlSSBuilder.build(orient=True)


name = 'jaw'
joints = ['Jaw_M1', 'JawEnd_M1']
jawMod = irm.Jaw(name, skeletonJoints=joints)
jawMod.preBuild()
jawMod.build()
jawMod.attachTo(neckMod, -1)
globalMst.addModules(jawMod)
#jawMod.delete()

# ---------------------------------------------------------------------------
# Eye L Build
name = 'eye'
joints = ['Eye_L1', 'EyeEnd_L1']
eyeLMod = irm.Eye(name, irm.Module.SIDE.LEFT, skeletonJoints=joints)
eyeLMod.preBuild()
eyeLMod.build()
eyeLMod.controllerColor = irg.Controller.COLOR.BLUE
eyeLMod.controllerSize = 2
#eyeLMod.delete()

# Eye R Build
name = 'eye'
joints = ['Eye_R1', 'EyeEnd_R1']
eyeRMod = irm.Eye(name, irm.Module.SIDE.RIGHT, skeletonJoints=joints)
eyeRMod.preBuild()
eyeRMod.build()
eyeRMod.controllerColor = irg.Controller.COLOR.RED
eyeRMod.controllerSize = 2
#eyeRMod.delete()

name = 'eyes'
eyesMaster = irmst.EyesMaster(name)
eyesMaster.addModules(eyeLMod, eyeRMod)
eyesMaster.build()
eyesMaster.attachTo(neckMod, -1)
globalMst.addMasters(eyesMaster)
#eyesMaster.delete()
eyesCtrlSSBuilder = irg.SpaceSwitchBuilder(eyesMaster.controller, [neckMod.headController, globalMst.mainController], neckMod.headController)
eyesCtrlSSBuilder.build(parent=True)
# ---------------------------------------------------------------------------

name = 'clavicle'
joints = ['Scapula_L1', 'Shoulder_L1']
claLMod = irm.LimbBase(name, irm.Module.SIDE.LEFT, skeletonJoints=joints)
claLMod.preBuild()
claLMod.build()
claLMod.controllerColor = irg.Controller.COLOR.BLUE
claLMod.controllerSize = 20
claLMod.attachTo(spineMod)
globalMst.addModules(claLMod)
#claLMod.delete()

name = 'clavicle'
joints = ['Scapula_R1', 'Shoulder_R1']
claRMod = irm.LimbBase(name, irm.Module.SIDE.RIGHT, skeletonJoints=joints)
claRMod.preBuild()
claRMod.negateScaleX = True
claRMod.build()
claRMod.controllerColor = irg.Controller.COLOR.RED
claRMod.controllerSize = 20
claRMod.attachTo(spineMod)
globalMst.addModules(claRMod)
#claRMod.delete()

name = 'arm'
joints = ['Shoulder_L1', 'Elbow_L1', 'Wrist_L1']
armLMod = irm.TwoBoneLimb(name, irm.Module.SIDE.LEFT, skeletonJoints=joints)
armLMod.preBuild()
armLMod.build()
armLMod.controllerColor = irg.Controller.COLOR.BLUE
armLMod.controllerSize = 7
armLMod.attachTo(claLMod)
globalMst.addModules(armLMod)
#armLMod.delete()
handLIkhCtrlSSBuilder = irg.SpaceSwitchBuilder(armLMod.ikController, [globalMst.mainController, spineMod.pelvisController, spineMod.chestController, neckMod.headController], globalMst.mainController)
handLIkhCtrlSSBuilder.build(parent=True)
shoulderLIkhCtrlSSBuilder = irg.SpaceSwitchBuilder(armLMod.fkRootController, [globalMst.mainController, claLMod.fkRootController], claLMod.fkRootController)
shoulderLIkhCtrlSSBuilder.build(orient=True)
armLPvCtrlSSBuilder = irg.SpaceSwitchBuilder(armLMod.poleVectorController, [globalMst.mainController, spineMod.chestController, armLMod.ikController], globalMst.mainController)
armLPvCtrlSSBuilder.build(parent=True)

name = 'arm'
joints = ['Shoulder_R1', 'Elbow_R1', 'Wrist_R1']
armRMod = irm.TwoBoneLimb(name, irm.Module.SIDE.RIGHT, skeletonJoints=joints)
armRMod.preBuild()
armRMod.negateScaleX = True
armRMod.build()
armRMod.controllerColor = irg.Controller.COLOR.RED
armRMod.controllerSize = 7
armRMod.attachTo(claRMod)
globalMst.addModules(armRMod)
#armRMod.delete()
handRIkhCtrlSSBuilder = irg.SpaceSwitchBuilder(armRMod.ikController, [globalMst.mainController, spineMod.pelvisController, spineMod.chestController, neckMod.headController], globalMst.mainController)
handRIkhCtrlSSBuilder.build(parent=True)
shoulderRIkhCtrlSSBuilder = irg.SpaceSwitchBuilder(armRMod.fkRootController, [globalMst.mainController, claRMod.fkRootController], claRMod.fkRootController)
shoulderRIkhCtrlSSBuilder.build(orient=True)
armRPvCtrlSSBuilder = irg.SpaceSwitchBuilder(armRMod.poleVectorController, [globalMst.mainController, spineMod.chestController, armRMod.ikController], globalMst.mainController)
armRPvCtrlSSBuilder.build(parent=True)

name = 'leg'
joints = ['Hip_L1', 'Knee_L1', 'Ankle_L1']
legLMod = irm.TwoBoneLimb(name, irm.Module.SIDE.LEFT, skeletonJoints=joints)
legLMod.preBuild()
legLMod.build()
legLMod.controllerColor = irg.Controller.COLOR.BLUE
legLMod.controllerSize = 7
legLMod.attachTo(spineMod)
globalMst.addModules(legLMod)
#legLMod.delete()
footLIkhCtrlSSBuilder = irg.SpaceSwitchBuilder(legLMod.ikController, [globalMst.mainController, spineMod.pelvisController], globalMst.mainController)
footLIkhCtrlSSBuilder.build(parent=True)
legLPvCtrlSSBuilder = irg.SpaceSwitchBuilder(legLMod.poleVectorController, [globalMst.mainController, legLMod.ikController], globalMst.mainController)
legLPvCtrlSSBuilder.build(parent=True)

name = 'foot'
joints = ['Ankle_L1', 'Toes_L1', 'ToesEnd_L1']
footLMod = irm.Foot(name, irm.Module.SIDE.LEFT, skeletonJoints=joints)
footLMod.preBuild()
footLMod.build()
footLMod.controllerColor = irg.Controller.COLOR.BLUE
footLMod.controllerSize = 10
footLMod.attachTo(legLMod)
globalMst.addModules(footLMod)
#footLMod.delete()

name = 'leg'
joints = ['Hip_R1', 'Knee_R1', 'Ankle_R1']
legRMod = irm.TwoBoneLimb(name, irm.Module.SIDE.RIGHT, skeletonJoints=joints)
legRMod.preBuild()
legRMod.negateScaleX = True
legRMod.build()
legRMod.controllerColor = irg.Controller.COLOR.RED
legRMod.controllerSize = 7
legRMod.attachTo(spineMod)
globalMst.addModules(legRMod)
#legRMod.delete()
footRIkhCtrlSSBuilder = irg.SpaceSwitchBuilder(legRMod.ikController, [globalMst.mainController, spineMod.pelvisController], globalMst.mainController)
footRIkhCtrlSSBuilder.build(parent=True)
legRPvCtrlSSBuilder = irg.SpaceSwitchBuilder(legRMod.poleVectorController, [globalMst.mainController, legRMod.ikController], globalMst.mainController)
legRPvCtrlSSBuilder.build(parent=True)

name = 'foot'
joints = ['Ankle_R1', 'Toes_R1', 'ToesEnd_R1']
footRMod = irm.Foot(name, irm.Module.SIDE.RIGHT, skeletonJoints=joints)
footRMod.preBuild()
footRMod.negateScaleX = True
footRMod.build()
footRMod.controllerColor = irg.Controller.COLOR.RED
footRMod.controllerSize = 10
footRMod.attachTo(legRMod)
globalMst.addModules(footRMod)
#footRMod.delete()


# ---------------------------------------------------------------------------

# Fingers L Build
name = 'thumbFinger'
joints = ['ThumbFinger1_L1',
 'ThumbFinger2_L1',
 'ThumbFinger3_L1',
 'ThumbFinger4_L1']
thumbLMod = irm.Finger(name, irm.Module.SIDE.LEFT, skeletonJoints=joints)
thumbLMod.preBuild()
thumbLMod.build()
thumbLMod.controllerColor = irg.Controller.COLOR.BLUE
thumbLMod.controllerSize = 2
#thumbLMod.delete()

name = 'indexFinger'
joints = ['IndexFinger1_L1',
 'IndexFinger2_L1',
 'IndexFinger3_L1',
 'IndexFinger4_L1']
indexLMod = irm.Finger(name, irm.Module.SIDE.LEFT, skeletonJoints=joints)
indexLMod.preBuild()
indexLMod.build()
indexLMod.controllerColor = irg.Controller.COLOR.BLUE
indexLMod.controllerSize = 2
#indexLMod.delete()

name = 'middleFinger'
joints = ['MiddleFinger1_L1',
 'MiddleFinger2_L1',
 'MiddleFinger3_L1',
 'MiddleFinger4_L1']
middleLMod = irm.Finger(name, irm.Module.SIDE.LEFT, skeletonJoints=joints)
middleLMod.preBuild()
middleLMod.build()
middleLMod.controllerColor = irg.Controller.COLOR.BLUE
middleLMod.controllerSize = 2
#middleLMod.delete()

name = 'ringFinger'
joints = ['RingFinger1_L1',
 'RingFinger2_L1',
 'RingFinger3_L1',
 'RingFinger4_L1']
ringLMod = irm.Finger(name, irm.Module.SIDE.LEFT, skeletonJoints=joints)
ringLMod.preBuild()
ringLMod.build()
ringLMod.controllerColor = irg.Controller.COLOR.BLUE
ringLMod.controllerSize = 2
#ringLMod.delete()

name = 'pinkyFinger'
joints = ['PinkyFinger1_L1',
 'PinkyFinger2_L1',
 'PinkyFinger3_L1',
 'PinkyFinger4_L1']
pinkyLMod = irm.Finger(name, irm.Module.SIDE.LEFT, skeletonJoints=joints)
pinkyLMod.preBuild()
pinkyLMod.build()
pinkyLMod.controllerColor = irg.Controller.COLOR.BLUE
pinkyLMod.controllerSize = 2
#pinkyLMod.delete()

name = 'fingers'
fingersLMaster = irmst.FingersMaster(name, irm.Module.SIDE.LEFT)
fingersLMaster.addModules(thumbLMod, indexLMod, middleLMod, ringLMod, pinkyLMod)
fingersLMaster.build()
fingersLMaster.attachTo(armLMod)
globalMst.addMasters(fingersLMaster)
#fingersLMaster.delete()

# ---------------------------------------------------------------------------
# Fingers R Build
name = 'thumbFinger'
joints = ['ThumbFinger1_R1',
 'ThumbFinger2_R1',
 'ThumbFinger3_R1',
 'ThumbFinger4_R1']
thumbRMod = irm.Finger(name, irm.Module.SIDE.RIGHT, skeletonJoints=joints)
thumbRMod.preBuild()
thumbRMod.negateScaleX = True
thumbRMod.build()
thumbRMod.controllerColor = irg.Controller.COLOR.RED
thumbRMod.controllerSize = 2
#thumbRMod.delete()

name = 'indexFinger'
joints = ['IndexFinger1_R1',
 'IndexFinger2_R1',
 'IndexFinger3_R1',
 'IndexFinger4_R1']
indexRMod = irm.Finger(name, irm.Module.SIDE.RIGHT, skeletonJoints=joints)
indexRMod.preBuild()
indexRMod.negateScaleX = True
indexRMod.build()
indexRMod.controllerColor = irg.Controller.COLOR.RED
indexRMod.controllerSize = 2
#indexRMod.delete()

name = 'middleFinger'
joints = ['MiddleFinger1_R1',
 'MiddleFinger2_R1',
 'MiddleFinger3_R1',
 'MiddleFinger4_R1']
middleRMod = irm.Finger(name, irm.Module.SIDE.RIGHT, skeletonJoints=joints)
middleRMod.preBuild()
middleRMod.negateScaleX = True
middleRMod.build()
middleRMod.controllerColor = irg.Controller.COLOR.RED
middleRMod.controllerSize = 2
#middleRMod.delete()

name = 'ringFinger'
joints = ['RingFinger1_R1',
 'RingFinger2_R1',
 'RingFinger3_R1',
 'RingFinger4_R1']
ringRMod = irm.Finger(name, irm.Module.SIDE.RIGHT, skeletonJoints=joints)
ringRMod.preBuild()
ringRMod.negateScaleX = True
ringRMod.build()
ringRMod.controllerColor = irg.Controller.COLOR.RED
ringRMod.controllerSize = 2
#ringRMod.delete()

name = 'pinkyFinger'
joints = ['PinkyFinger1_R1',
 'PinkyFinger2_R1',
 'PinkyFinger3_R1',
 'PinkyFinger4_R1']
pinkyRMod = irm.Finger(name, irm.Module.SIDE.RIGHT, skeletonJoints=joints)
pinkyRMod.preBuild()
pinkyRMod.negateScaleX = True
pinkyRMod.build()
pinkyRMod.controllerColor = irg.Controller.COLOR.RED
pinkyRMod.controllerSize = 2
#pinkyRMod.delete()

name = 'fingers'
fingersRMaster = irmst.FingersMaster(name, irm.Module.SIDE.RIGHT)
fingersRMaster.addModules(thumbRMod, indexRMod, middleRMod, ringRMod, pinkyRMod)
fingersRMaster.build()
fingersRMaster.attachTo(armRMod)
globalMst.addMasters(fingersRMaster)
#fingersRMaster.delete()
