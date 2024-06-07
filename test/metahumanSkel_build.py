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
joints = ['pelvis', 'spine_01', 'spine_02', 'spine_03', 'spine_04']
spineMod = irm.Spine(name, irm.Module.SIDE.CENTER, skeletonJoints=joints)
spineMod.preBuild()
spineMod.build()
spineMod.controllerSize = 15
globalMst.addModules(spineMod)
#spineMod.delete()

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


name = 'clavicle'
joints = ['clavicle_l', 'upperarm_l']
claLMod = irm.LimbBase(name, irm.Module.SIDE.LEFT, skeletonJoints=joints)
claLMod.preBuild()
claLMod.build()
claLMod.controllerColor = irg.Controller.COLOR.BLUE
claLMod.controllerSize = 10
claLMod.attachTo(spineMod)
globalMst.addModules(claLMod)
#claLMod.delete()

name = 'clavicle'
joints = ['clavicle_r', 'upperarm_r']
claRMod = irm.LimbBase(name, irm.Module.SIDE.RIGHT, skeletonJoints=joints)
claRMod.preBuild()
claRMod.build()
claRMod.controllerColor = irg.Controller.COLOR.RED
claRMod.controllerSize = 10
claRMod.attachTo(spineMod)
globalMst.addModules(claRMod)
#claRMod.delete()

name = 'arm'
joints = ['upperarm_l', 'lowerarm_l', 'hand_l']
armLMod = irm.TwoBoneLimb(name, irm.Module.SIDE.LEFT, skeletonJoints=joints)
armLMod.preBuild()
armLMod.build()
armLMod.controllerColor = irg.Controller.COLOR.BLUE
armLMod.controllerSize = 5
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
joints = ['upperarm_r', 'lowerarm_r', 'hand_r']
armRMod = irm.TwoBoneLimb(name, irm.Module.SIDE.RIGHT, skeletonJoints=joints)
armRMod.preBuild()
armRMod.build()
armRMod.controllerColor = irg.Controller.COLOR.RED
armRMod.controllerSize = 5
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
joints = ['thigh_l', 'calf_l', 'foot_l']
legLMod = irm.TwoBoneLimb(name, irm.Module.SIDE.LEFT, skeletonJoints=joints)
legLMod.preBuild()
legLMod.build()
legLMod.controllerColor = irg.Controller.COLOR.BLUE
legLMod.controllerSize = 5
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

name = 'leg'
joints = ['thigh_r', 'calf_r', 'foot_r']
legRMod = irm.TwoBoneLimb(name, irm.Module.SIDE.RIGHT, skeletonJoints=joints)
legRMod.preBuild()
legRMod.build()
legRMod.controllerColor = irg.Controller.COLOR.RED
legRMod.controllerSize = 5
legRMod.attachTo(spineMod)
globalMst.addModules(legRMod)
#legRMod.delete()
footRIkhCtrlSSBuilder = irg.SpaceSwitchBuilder(legRMod.ikController, [globalMst.mainController, spineMod.pelvisController], globalMst.mainController)
footRIkhCtrlSSBuilder.build(parent=True)
legRPvCtrlSSBuilder = irg.SpaceSwitchBuilder(legRMod.poleVectorController, [globalMst.mainController, legRMod.ikController], globalMst.mainController)
legRPvCtrlSSBuilder.build(parent=True)

name = 'foot'
joints = ['foot_r', 'ball_r', 'toe_r']
footRMod = irm.Foot(name, irm.Module.SIDE.RIGHT, skeletonJoints=joints)
footRMod.preBuild()
footRMod.build()
footRMod.controllerColor = irg.Controller.COLOR.RED
footRMod.controllerSize = 10
footRMod.attachTo(legRMod)
globalMst.addModules(footRMod)
#footRMod.delete()


# ---------------------------------------------------------------------------

# Fingers L Build
name = 'thumbFinger'
joints = ['thumb_01_l', 'thumb_02_l', 'thumb_03_l', 'thumb_04_l']
thumbLMod = irm.Finger(name, irm.Module.SIDE.LEFT, skeletonJoints=joints)
thumbLMod.preBuild()
thumbLMod.build()
thumbLMod.controllerColor = irg.Controller.COLOR.BLUE
thumbLMod.controllerSize = 2
#thumbLMod.delete()
thumbRMod = thumbLMod.mirror()

name = 'indexFinger'
joints = ['index_metacarpal_l', 'index_01_l', 'index_02_l', 'index_03_l', 'index_04_l']
indexLMod = irm.Finger(name, irm.Module.SIDE.LEFT, skeletonJoints=joints)
indexLMod.preBuild()
indexLMod.build()
indexLMod.controllerColor = irg.Controller.COLOR.BLUE
indexLMod.controllerSize = 2
#indexLMod.delete()
indexLMod.mirror()

name = 'middleFinger'
joints = ['middle_metacarpal_l', 'middle_01_l', 'middle_02_l', 'middle_03_l', 'middle_04_l']
middleLMod = irm.Finger(name, irm.Module.SIDE.LEFT, skeletonJoints=joints)
middleLMod.preBuild()
middleLMod.build()
middleLMod.controllerColor = irg.Controller.COLOR.BLUE
middleLMod.controllerSize = 2
#middleLMod.delete()

name = 'ringFinger'
joints = ['ring_metacarpal_l', 'ring_01_l', 'ring_02_l', 'ring_03_l', 'ring_04_l']
ringLMod = irm.Finger(name, irm.Module.SIDE.LEFT, skeletonJoints=joints)
ringLMod.preBuild()
ringLMod.build()
ringLMod.controllerColor = irg.Controller.COLOR.BLUE
ringLMod.controllerSize = 2
#ringLMod.delete()

name = 'pinkyFinger'
joints = ['pinky_metacarpal_l', 'pinky_01_l', 'pinky_02_l', 'pinky_03_l', 'pinky_04_l']
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
joints = ['thumb_01_r', 'thumb_02_r', 'thumb_03_r', 'thumb_04_r']
thumbRMod = irm.Finger(name, irm.Module.SIDE.RIGHT, skeletonJoints=joints)
thumbRMod.preBuild()
thumbRMod.symmetrizeGuide()
thumbRMod.build()
thumbRMod.controllerColor = irg.Controller.COLOR.RED
thumbRMod.controllerSize = 2
#thumbRMod.delete()

name = 'indexFinger'
joints = ['index_metacarpal_r', 'index_01_r', 'index_02_r', 'index_03_r', 'index_04_r']
indexRMod = irm.Finger(name, irm.Module.SIDE.RIGHT, skeletonJoints=joints)
indexRMod.preBuild()
indexRMod.symmetrizeGuide()
indexRMod.build()
indexRMod.controllerColor = irg.Controller.COLOR.RED
indexRMod.controllerSize = 2
#indexRMod.delete()

name = 'middleFinger'
joints = ['middle_metacarpal_r', 'middle_01_r', 'middle_02_r', 'middle_03_r', 'middle_04_r']
middleRMod = irm.Finger(name, irm.Module.SIDE.RIGHT, skeletonJoints=joints)
middleRMod.preBuild()
middleRMod.symmetrizeGuide()
middleRMod.build()
middleRMod.controllerColor = irg.Controller.COLOR.RED
middleRMod.controllerSize = 2
#middleRMod.delete()

name = 'ringFinger'
joints = ['ring_metacarpal_r', 'ring_01_r', 'ring_02_r', 'ring_03_r', 'ring_04_r']
ringRMod = irm.Finger(name, irm.Module.SIDE.RIGHT, skeletonJoints=joints)
ringRMod.preBuild()
ringRMod.symmetrizeGuide()
ringRMod.build()
ringRMod.controllerColor = irg.Controller.COLOR.RED
ringRMod.controllerSize = 2
#ringRMod.delete()

name = 'pinkyFinger'
joints = ['pinky_metacarpal_r', 'pinky_01_r', 'pinky_02_r', 'pinky_03_r', 'pinky_04_r']
pinkyRMod = irm.Finger(name, irm.Module.SIDE.RIGHT, skeletonJoints=joints)
pinkyRMod.preBuild()
pinkyRMod.symmetrizeGuide()
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
