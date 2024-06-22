from imp import reload
import ironRig; reload(ironRig)
import ironRig.api.irSystem as irs
import ironRig.api.irModule as irm
import ironRig.api.irMaster as irmst
import ironRig.api.irGlobal as irg


irScene = irg.scene.Scene()
filePath = 'C:/users/stakl/downloads/test.json'
#irScene.saveToFile(filePath)
irScene.buildFromFile(filePath)

skPath = r"C:\Users\Administrator\Downloads\ironRig\test\metahumanSkel.mb"

# -------------- Pre-Custom Scripts Build ---------------------
name = 'reference_skeletalMesh'
code = '''
from maya import cmds
cmds.file(new=True, f=True)
cmds.file(r"{}", reference=True, namespace='SK')
'''.format(skPath)
preCS = irScene.addPreCustomScript(name, code)
preCS.run()


name = 'addJoints'
code = '''
from maya import cmds
toeL = cmds.duplicate('SK:ball_l', n='toe_l')[0]
cmds.parent(toeL, 'SK:ball_l')
cmds.xform(toeL, t=[9.4958, 0.0, 0.0], os=True)
toeR = cmds.duplicate('SK:ball_r', n='toe_r')[0]
cmds.parent(toeR, 'SK:ball_r')
cmds.xform(toeR, t=[-9.4958, 0.0, 0.0], os=True)
'''
preCS = irScene.addPreCustomScript(name, code)
preCS.run()

# -------------- Module Build ---------------------
globalMst = irScene.addGlobalMaster('SK:root', True)
globalMst.build()
#globalMst.delete()


name = 'spine'
joints = ['SK:pelvis', 'SK:spine_01', 'SK:spine_02', 'SK:spine_03', 'SK:spine_04']
spineMod = irScene.addModule('Spine', name, irm.module.Module.SIDE.CENTER, skeletonJoints=joints)
spineMod.preBuild()
spineMod.build()
spineMod.controllerSize = 20
globalMst.addModules(spineMod)
#spineMod.delete()

name = 'neck'
joints = ['SK:neck_01', 'SK:neck_02', 'SK:head']
neckMod = irScene.addModule('Neck', name, irm.module.Module.SIDE.CENTER, skeletonJoints=joints)
neckMod.numberOfControllers = 2
neckMod.preBuild()
neckMod.build()
neckMod.controllerSize = 10
neckMod.attachTo(spineMod)
globalMst.addModules(neckMod)
#neckMod.delete()
headCtrlSSBuilder = irScene.addSpaceSwitchBuilder(neckMod.headController, [neckMod.neckController, globalMst.mainController], neckMod.neckController)
headCtrlSSBuilder.build(isOrientType=True)

# ---------------------------------------------------------------------------
name = 'leg'
joints = ['SK:thigh_l', 'SK:calf_l', 'SK:foot_l']
legLMod = irScene.addModule('TwoBoneLimb', name, irm.module.Module.SIDE.LEFT, skeletonJoints=joints)
legLMod.preBuild()
legLMod.build()
legLMod.controllerColor = irg.controller.Controller.COLOR.BLUE
legLMod.controllerSize = 10
legLMod.attachTo(spineMod)
globalMst.addModules(legLMod)
#legLMod.delete()
footLIkhCtrlSSBuilder = irScene.addSpaceSwitchBuilder(legLMod.ikController, [globalMst.mainController, spineMod.pelvisController], globalMst.mainController)
footLIkhCtrlSSBuilder.build(isParentType=True)
legLPvCtrlSSBuilder = irScene.addSpaceSwitchBuilder(legLMod.poleVectorController, [globalMst.mainController, legLMod.ikController], globalMst.mainController)
legLPvCtrlSSBuilder.build(isParentType=True)

name = 'foot'
joints = ['SK:foot_l', 'SK:ball_l', 'toe_l']
footLMod = irScene.addModule('Foot', name, irm.module.Module.SIDE.LEFT, skeletonJoints=joints)
footLMod.preBuild()
footLMod.build()
footLMod.controllerColor = irg.controller.Controller.COLOR.BLUE
footLMod.controllerSize = 10
footLMod.attachTo(legLMod)
globalMst.addModules(footLMod)
#footLMod.delete()

legRMod = irScene.mirrorModule('leg', 'l', '_l', '_r', False)
legRMod.attachTo(spineMod)
globalMst.addModules(legRMod)
#legRMod.delete()
footRIkhCtrlSSBuilder = irScene.addSpaceSwitchBuilder(legRMod.ikController, [globalMst.mainController, spineMod.pelvisController], globalMst.mainController)
footRIkhCtrlSSBuilder.build(isParentType=True)
legRPvCtrlSSBuilder = irScene.addSpaceSwitchBuilder(legRMod.poleVectorController, [globalMst.mainController, legRMod.ikController], globalMst.mainController)
legRPvCtrlSSBuilder.build(isParentType=True)

footRMod = irScene.mirrorModule('foot', 'l', '_l', '_r')
footRMod.attachTo(legRMod)
globalMst.addModules(footRMod)
#footRMod.delete()

# ---------------------------------------------------------------------------
name = 'clavicle'
joints = ['clavicle_l', 'upperarm_l']
claLMod = irm.limbBase.LimbBase(name, irm.module.Module.SIDE.LEFT, skeletonJoints=joints)
claLMod.preBuild()
claLMod.build()
claLMod.controllerColor = irg.controller.Controller.COLOR.BLUE
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
armLMod = irm.twoBoneLimb.TwoBoneLimb(name, irm.module.Module.SIDE.LEFT, skeletonJoints=joints)
armLMod.preBuild()
armLMod.build()
armLMod.controllerColor = irg.controller.Controller.COLOR.BLUE
armLMod.controllerSize = 10
armLMod.attachTo(claLMod)
globalMst.addModules(armLMod)
#armLMod.delete()
handLIkhCtrlSSBuilder = irg.spaceSwitchBuilder.SpaceSwitchBuilder(armLMod.ikController, [globalMst.mainController, spineMod.pelvisController, spineMod.chestController, neckMod.headController], globalMst.mainController)
handLIkhCtrlSSBuilder.build(parent=True)
shoulderLIkhCtrlSSBuilder = irg.spaceSwitchBuilder.SpaceSwitchBuilder(armLMod.fkRootController, [globalMst.mainController, claLMod.fkRootController], claLMod.fkRootController)
shoulderLIkhCtrlSSBuilder.build(orient=True)
armLPvCtrlSSBuilder = irg.spaceSwitchBuilder.SpaceSwitchBuilder(armLMod.poleVectorController, [globalMst.mainController, spineMod.chestController, armLMod.ikController], globalMst.mainController)
armLPvCtrlSSBuilder.build(parent=True)

armRMod = armLMod.mirror('_l', '_r')
armRMod.attachTo(claRMod)
globalMst.addModules(armRMod)
#armRMod.delete()
handRIkhCtrlSSBuilder = irg.spaceSwitchBuilder.SpaceSwitchBuilder(armRMod.ikController, [globalMst.mainController, spineMod.pelvisController, spineMod.chestController, neckMod.headController], globalMst.mainController)
handRIkhCtrlSSBuilder.build(parent=True)
shoulderRIkhCtrlSSBuilder = irg.spaceSwitchBuilder.SpaceSwitchBuilder(armRMod.fkRootController, [globalMst.mainController, claRMod.fkRootController], claRMod.fkRootController)
shoulderRIkhCtrlSSBuilder.build(orient=True)
armRPvCtrlSSBuilder = irg.spaceSwitchBuilder.SpaceSwitchBuilder(armRMod.poleVectorController, [globalMst.mainController, spineMod.chestController, armRMod.ikController], globalMst.mainController)
armRPvCtrlSSBuilder.build(parent=True)

# ---------------------------------------------------------------------------
# Fingers L Build
name = 'thumbFinger'
joints = ['thumb_01_l', 'thumb_02_l', 'thumb_03_l', 'thumb_04_l']
thumbLMod = irm.finger.Finger(name, irm.module.Module.SIDE.LEFT, skeletonJoints=joints)
thumbLMod.curlStartIndex = 1
thumbLMod.preBuild()
thumbLMod.build()
thumbLMod.controllerColor = irg.controller.Controller.COLOR.BLUE
thumbLMod.controllerSize = 4
#thumbLMod.delete()

name = 'indexFinger'
joints = ['index_metacarpal_l', 'index_01_l', 'index_02_l', 'index_03_l', 'index_04_l']
indexLMod = irm.finger.Finger(name, irm.module.Module.SIDE.LEFT, skeletonJoints=joints)
indexLMod.preBuild()
indexLMod.build()
indexLMod.controllerColor = irg.controller.Controller.COLOR.BLUE
indexLMod.controllerSize = 4
#indexLMod.delete()

name = 'middleFinger'
joints = ['middle_metacarpal_l', 'middle_01_l', 'middle_02_l', 'middle_03_l', 'middle_04_l']
middleLMod = irm.finger.Finger(name, irm.module.Module.SIDE.LEFT, skeletonJoints=joints)
middleLMod.preBuild()
middleLMod.build()
middleLMod.controllerColor = irg.controller.Controller.COLOR.BLUE
middleLMod.controllerSize = 4
#middleLMod.delete()

name = 'ringFinger'
joints = ['ring_metacarpal_l', 'ring_01_l', 'ring_02_l', 'ring_03_l', 'ring_04_l']
ringLMod = irm.finger.Finger(name, irm.module.Module.SIDE.LEFT, skeletonJoints=joints)
ringLMod.preBuild()
ringLMod.build()
ringLMod.controllerColor = irg.controller.Controller.COLOR.BLUE
ringLMod.controllerSize = 4
#ringLMod.delete()

name = 'pinkyFinger'
joints = ['pinky_metacarpal_l', 'pinky_01_l', 'pinky_02_l', 'pinky_03_l', 'pinky_04_l']
pinkyLMod = irm.finger.Finger(name, irm.module.Module.SIDE.LEFT, skeletonJoints=joints)
pinkyLMod.preBuild()
pinkyLMod.build()
pinkyLMod.controllerColor = irg.controller.Controller.COLOR.BLUE
pinkyLMod.controllerSize = 4
#pinkyLMod.delete()

name = 'fingers'
fingersLMaster = irmst.fingersMaster.FingersMaster(name, irm.module.Module.SIDE.LEFT)
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
fingersRMaster = irmst.fingersMaster.FingersMaster(name, irm.module.Module.SIDE.RIGHT)
fingersRMaster.addModules(thumbRMod, indexRMod, middleRMod, ringRMod, pinkyRMod)
fingersRMaster.build()
fingersRMaster.attachTo(armRMod)
globalMst.addMasters(fingersRMaster)
#fingersRMaster.delete()


# -------------- Post-Custom Scripts Build ---------------------
name = 'connectMetahuman'
code = '''
from maya import cmds
cmds.parentConstraint('head_ctrl', 'SK:facial_rig_grp', mo=True)
cmds.setAttr('SK:L_lookDirection.inheritsTransform', 0)
cmds.setAttr('SK:R_lookDirection.inheritsTransform', 0)
'''
postCS = irScene.addPostCustomScript(name, code)
postCS.run()