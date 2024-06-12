from imp import reload
import ironRig; reload(ironRig)
import ironRig.api.irSystem as irs
import ironRig.api.irModule as irm
import ironRig.api.irMaster as irmst
import ironRig.api.irGlobal as irg


irScene = irg.scene.Scene()
filePath = 'C:/users/stakl/downloads/test.json'
#irScene.saveToFile(filePath)
globalMst = irScene.buildFromFile(filePath)


# -------------- Module Build ---------------------
globalMst = irmst.GlobalMaster('root', True)
globalMst.build()
#globalMst.delete()
irScene.globalMaster = globalMst

name = 'spine'
joints = ['pelvis', 'spine_01', 'spine_02', 'spine_03', 'spine_04']
spineMod = irm.Spine(name, irm.Module.SIDE.CENTER, skeletonJoints=joints)
spineMod.preBuild()
spineMod.build()
spineMod.controllerSize = 15
globalMst.addModules(spineMod)
#spineMod.delete()
irScene.addModule(spineMod)

name = 'neck'
joints = ['neck_01', 'neck_02', 'head']
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
irScene.addModule(neckMod)

# ---------------------------------------------------------------------------
name = 'leg'
joints = ['thigh_l', 'calf_l', 'foot_l']
legLMod = irm.TwoBoneLimb(name, irm.Module.SIDE.LEFT, skeletonJoints=joints)
legLMod.preBuild()
legLMod.build()
legLMod.controllerColor = irg.Controller.COLOR.BLUE
legLMod.controllerSize = 10
legLMod.attachTo(spineMod)
globalMst.addModules(legLMod)
#legLMod.delete()
footLIkhCtrlSSBuilder = irg.SpaceSwitchBuilder(legLMod.ikController, [globalMst.mainController, spineMod.pelvisController], globalMst.mainController)
footLIkhCtrlSSBuilder.build(parent=True)
legLPvCtrlSSBuilder = irg.SpaceSwitchBuilder(legLMod.poleVectorController, [globalMst.mainController, legLMod.ikController], globalMst.mainController)
legLPvCtrlSSBuilder.build(parent=True)

name = 'foot'
joints = ['foot_l', 'ball_l', 'toe_l']
footLMod = irm.Foot(name, irm.Module.SIDE.LEFT, skeletonJoints=joints)
footLMod.preBuild()
footLMod.build()
footLMod.controllerColor = irg.Controller.COLOR.BLUE
footLMod.controllerSize = 10
footLMod.attachTo(legLMod)
globalMst.addModules(footLMod)
#footLMod.delete()

legRMod = legLMod.mirror('_l', '_r', False)
legRMod.attachTo(spineMod)
globalMst.addModules(legRMod)
#legRMod.delete()
footRIkhCtrlSSBuilder = irg.SpaceSwitchBuilder(legRMod.ikController, [globalMst.mainController, spineMod.pelvisController], globalMst.mainController)
footRIkhCtrlSSBuilder.build(parent=True)
legRPvCtrlSSBuilder = irg.SpaceSwitchBuilder(legRMod.poleVectorController, [globalMst.mainController, legRMod.ikController], globalMst.mainController)
legRPvCtrlSSBuilder.build(parent=True)

footRMod = footLMod.mirror('_l', '_r')
footRMod.attachTo(legRMod)
globalMst.addModules(footRMod)
#footRMod.delete()

# ---------------------------------------------------------------------------
name = 'clavicle'
joints = ['clavicle_l', 'upperarm_l']
claLMod = irm.LimbBase(name, irm.Module.SIDE.LEFT, skeletonJoints=joints)
claLMod.preBuild()
claLMod.build()
claLMod.controllerColor = irg.Controller.COLOR.BLUE
claLMod.controllerSize = 20
claLMod.attachTo(spineMod)
globalMst.addModules(claLMod)
#claLMod.delete()

claRMod = claLMod.mirror('_l', '_r')
claRMod.attachTo(spineMod)
globalMst.addModules(claRMod)
#claRMod.delete()

name = 'arm'
joints = ['upperarm_l', 'lowerarm_l', 'hand_l']
armLMod = irm.TwoBoneLimb(name, irm.Module.SIDE.LEFT, skeletonJoints=joints)
armLMod.preBuild()
armLMod.build()
armLMod.controllerColor = irg.Controller.COLOR.BLUE
armLMod.controllerSize = 10
armLMod.attachTo(claLMod)
globalMst.addModules(armLMod)
#armLMod.delete()
handLIkhCtrlSSBuilder = irg.SpaceSwitchBuilder(armLMod.ikController, [globalMst.mainController, spineMod.pelvisController, spineMod.chestController, neckMod.headController], globalMst.mainController)
handLIkhCtrlSSBuilder.build(parent=True)
shoulderLIkhCtrlSSBuilder = irg.SpaceSwitchBuilder(armLMod.fkRootController, [globalMst.mainController, claLMod.fkRootController], claLMod.fkRootController)
shoulderLIkhCtrlSSBuilder.build(orient=True)
armLPvCtrlSSBuilder = irg.SpaceSwitchBuilder(armLMod.poleVectorController, [globalMst.mainController, spineMod.chestController, armLMod.ikController], globalMst.mainController)
armLPvCtrlSSBuilder.build(parent=True)

armRMod = armLMod.mirror('_l', '_r')
armRMod.attachTo(claRMod)
globalMst.addModules(armRMod)
#armRMod.delete()
handRIkhCtrlSSBuilder = irg.SpaceSwitchBuilder(armRMod.ikController, [globalMst.mainController, spineMod.pelvisController, spineMod.chestController, neckMod.headController], globalMst.mainController)
handRIkhCtrlSSBuilder.build(parent=True)
shoulderRIkhCtrlSSBuilder = irg.SpaceSwitchBuilder(armRMod.fkRootController, [globalMst.mainController, claRMod.fkRootController], claRMod.fkRootController)
shoulderRIkhCtrlSSBuilder.build(orient=True)
armRPvCtrlSSBuilder = irg.SpaceSwitchBuilder(armRMod.poleVectorController, [globalMst.mainController, spineMod.chestController, armRMod.ikController], globalMst.mainController)
armRPvCtrlSSBuilder.build(parent=True)

# ---------------------------------------------------------------------------
# Fingers L Build
name = 'thumbFinger'
joints = ['thumb_01_l', 'thumb_02_l', 'thumb_03_l', 'thumb_04_l']
thumbLMod = irm.Finger(name, irm.Module.SIDE.LEFT, skeletonJoints=joints)
thumbLMod.curlStartIndex = 1
thumbLMod.preBuild()
thumbLMod.build()
thumbLMod.controllerColor = irg.Controller.COLOR.BLUE
thumbLMod.controllerSize = 4
#thumbLMod.delete()

name = 'indexFinger'
joints = ['index_metacarpal_l', 'index_01_l', 'index_02_l', 'index_03_l', 'index_04_l']
indexLMod = irm.Finger(name, irm.Module.SIDE.LEFT, skeletonJoints=joints)
indexLMod.preBuild()
indexLMod.build()
indexLMod.controllerColor = irg.Controller.COLOR.BLUE
indexLMod.controllerSize = 4
#indexLMod.delete()

name = 'middleFinger'
joints = ['middle_metacarpal_l', 'middle_01_l', 'middle_02_l', 'middle_03_l', 'middle_04_l']
middleLMod = irm.Finger(name, irm.Module.SIDE.LEFT, skeletonJoints=joints)
middleLMod.preBuild()
middleLMod.build()
middleLMod.controllerColor = irg.Controller.COLOR.BLUE
middleLMod.controllerSize = 4
#middleLMod.delete()

name = 'ringFinger'
joints = ['ring_metacarpal_l', 'ring_01_l', 'ring_02_l', 'ring_03_l', 'ring_04_l']
ringLMod = irm.Finger(name, irm.Module.SIDE.LEFT, skeletonJoints=joints)
ringLMod.preBuild()
ringLMod.build()
ringLMod.controllerColor = irg.Controller.COLOR.BLUE
ringLMod.controllerSize = 4
#ringLMod.delete()

name = 'pinkyFinger'
joints = ['pinky_metacarpal_l', 'pinky_01_l', 'pinky_02_l', 'pinky_03_l', 'pinky_04_l']
pinkyLMod = irm.Finger(name, irm.Module.SIDE.LEFT, skeletonJoints=joints)
pinkyLMod.preBuild()
pinkyLMod.build()
pinkyLMod.controllerColor = irg.Controller.COLOR.BLUE
pinkyLMod.controllerSize = 4
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
thumbRMod = thumbLMod.mirror('_l', '_r')
#thumbRMod.delete()

indexRMod = indexLMod.mirror('_l', '_r')
#indexRMod.delete()

middleRMod = middleLMod.mirror('_l', '_r')
#middleRMod.delete()

ringRMod = ringLMod.mirror('_l', '_r')
#ringRMod.delete()

pinkyRMod = pinkyLMod.mirror('_l', '_r')
#pinkyRMod.delete()

name = 'fingers'
fingersRMaster = irmst.FingersMaster(name, irm.Module.SIDE.RIGHT)
fingersRMaster.addModules(thumbRMod, indexRMod, middleRMod, ringRMod, pinkyRMod)
fingersRMaster.build()
fingersRMaster.attachTo(armRMod)
globalMst.addMasters(fingersRMaster)
#fingersRMaster.delete()
