from imp import reload
import ironRig; reload(ironRig)
import ironRig.api.irSystem as irs
import ironRig.api.irModule as irm
import ironRig.api.irMaster as irmst
import ironRig.api.irGlobal as irg


irScene = irg.scene.Scene()
filePath = r'C:\Users\stakl\Downloads\test.json'
#irScene.saveToFile(filePath)
irScene.buildFromFile(filePath)

irScene._preCustomScripts
len(irScene._modules)
for mod in irScene._modules:
    print(mod.name, mod.side)
irScene._masters
len(irScene._spaceSwitchBuilders)
irScene._postCustomScripts

globalMst = irScene.globalMaster
spineMod = irScene.findModule('spine', 'c')
neckMod = irScene.findModule('neck', 'c')
claLMod = irScene.findModule('clavicle', 'l')
claRMod = irScene.findModule('clavicle', 'r')
armLMod = irScene.findModule('arm', 'l')
armRMod = irScene.findModule('arm', 'r')

# -------------- Pre-Custom Scripts Build ---------------------
name = 'referSkelMesh'
preCS = irScene.addPreCustomScript(name)
preCS.addAttribute(
    'skelPath',
    irg.attribute.Attribute.TYPE.STRING,
    "D:\Projects\SourceAssets\Characters\Zombie\Z_M_Mu_builder\SkeletalMesh\Z_M_Mu_builder_skeletalMesh.mb"
)
preCS.addAttribute('poseName', irg.attribute.Attribute.TYPE.STRING, 'SK:rigPose')
preCS.code = '''
from maya import cmds
cmds.file(new=True, f=True)
cmds.file(@skelPath, reference=True, namespace='SK')
cmds.dagPose(@poseName, restore=True)
'''
preCS.run()


name = 'addJoints'
code = '''
from maya import cmds
toeL = cmds.duplicate('SK:ball_l', n='toe_l', po=True)[0]
cmds.parent(toeL, 'SK:ball_l')
cmds.xform(toeL, t=[5.4958, 0.0, 0.0], os=True)

toeR = cmds.duplicate('SK:ball_r', n='toe_r', po=True)[0]
cmds.parent(toeR, 'SK:ball_r')
cmds.xform(toeR, t=[-5.4958, 0.0, 0.0], os=True)

thumbL = cmds.duplicate('SK:thumb_03_l', n='thumb_04_l', po=True)[0]
cmds.parent(thumbL, 'SK:thumb_03_l')
cmds.xform(thumbL, t=[2.347, 0.0, 0.0], os=True)

indexL = cmds.duplicate('SK:index_03_l', n='index_04_l', po=True)[0]
cmds.parent(indexL, 'SK:index_03_l')
cmds.xform(indexL, t=[2.347, 0.0, 0.0], os=True)

middleL = cmds.duplicate('SK:middle_03_l', n='middle_04_l', po=True)[0]
cmds.parent(middleL, 'SK:middle_03_l')
cmds.xform(middleL, t=[2.347, 0.0, 0.0], os=True)

ringL = cmds.duplicate('SK:ring_03_l', n='ring_04_l', po=True)[0]
cmds.parent(ringL, 'SK:ring_03_l')
cmds.xform(ringL, t=[2.347, 0.0, 0.0], os=True)

pinkyL = cmds.duplicate('SK:pinky_03_l', n='pinky_04_l', po=True)[0]
cmds.parent(pinkyL, 'SK:pinky_03_l')
cmds.xform(pinkyL, t=[2.347, 0.0, 0.0], os=True)


thumbR = cmds.duplicate('SK:thumb_03_r', n='thumb_04_r', po=True)[0]
cmds.parent(thumbR, 'SK:thumb_03_r')
cmds.xform(thumbR, t=[-2.347, 0.0, 0.0], os=True)

indexR = cmds.duplicate('SK:index_03_r', n='index_04_r', po=True)[0]
cmds.parent(indexR, 'SK:index_03_r')
cmds.xform(indexR, t=[-2.347, 0.0, 0.0], os=True)

middleR = cmds.duplicate('SK:middle_03_r', n='middle_04_r', po=True)[0]
cmds.parent(middleR, 'SK:middle_03_r')
cmds.xform(middleR, t=[-2.347, 0.0, 0.0], os=True)

ringR = cmds.duplicate('SK:ring_03_r', n='ring_04_r', po=True)[0]
cmds.parent(ringR, 'SK:ring_03_r')
cmds.xform(ringR, t=[-2.347, 0.0, 0.0], os=True)

pinkyR = cmds.duplicate('SK:pinky_03_r', n='pinky_04_r', po=True)[0]
cmds.parent(pinkyR, 'SK:pinky_03_r')
cmds.xform(pinkyR, t=[-2.347, 0.0, 0.0], os=True)
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
#irScene.removeModule('neck', 'c')
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
#irScene.removeModule('leg', 'l')
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
joints = ['SK:clavicle_l', 'SK:upperarm_l']
claLMod = irScene.addModule('LimbBase', name, irm.module.Module.SIDE.LEFT, skeletonJoints=joints)
claLMod.preBuild()
claLMod.build()
claLMod.controllerColor = irg.controller.Controller.COLOR.BLUE
claLMod.controllerSize = 20
claLMod.attachTo(spineMod)
globalMst.addModules(claLMod)
#claLMod.delete()

claRMod = irScene.mirrorModule('clavicle', 'l', '_l', '_r')
claRMod.attachTo(spineMod)
globalMst.addModules(claRMod)
#irScene.removeModule('clavicle', 'r')

name = 'arm'
joints = ['SK:upperarm_l', 'SK:lowerarm_l', 'SK:hand_l']
armLMod = irScene.addModule('TwoBoneLimb', name, irm.module.Module.SIDE.LEFT, skeletonJoints=joints)
armLMod.preBuild()
armLMod.build()
armLMod.controllerColor = irg.controller.Controller.COLOR.BLUE
armLMod.controllerSize = 10
armLMod.attachTo(claLMod)
globalMst.addModules(armLMod)
#armLMod.delete()
handLIkhCtrlSSBuilder = irScene.addSpaceSwitchBuilder(armLMod.ikController, [globalMst.mainController, spineMod.pelvisController, spineMod.chestController, neckMod.headController], globalMst.mainController)
handLIkhCtrlSSBuilder.build(isParentType=True)
shoulderLIkhCtrlSSBuilder = irScene.addSpaceSwitchBuilder(armLMod.fkRootController, [globalMst.mainController, claLMod.fkRootController], claLMod.fkRootController)
shoulderLIkhCtrlSSBuilder.build(isOrientType=True)
armLPvCtrlSSBuilder = irScene.addSpaceSwitchBuilder(armLMod.poleVectorController, [globalMst.mainController, spineMod.chestController, armLMod.ikController], globalMst.mainController)
armLPvCtrlSSBuilder.build(isParentType=True)

armRMod = irScene.mirrorModule('arm', 'l', '_l', '_r', True)
armRMod.attachTo(claRMod)
globalMst.addModules(armRMod)
#irScene.removeModule('arm', 'r')
handRIkhCtrlSSBuilder = irScene.addSpaceSwitchBuilder(armRMod.ikController, [globalMst.mainController, spineMod.pelvisController, spineMod.chestController, neckMod.headController], globalMst.mainController)
handRIkhCtrlSSBuilder.build(isParentType=True)
shoulderRIkhCtrlSSBuilder = irScene.addSpaceSwitchBuilder(armRMod.fkRootController, [globalMst.mainController, claRMod.fkRootController], claRMod.fkRootController)
shoulderRIkhCtrlSSBuilder.build(isOrientType=True)
armRPvCtrlSSBuilder = irScene.addSpaceSwitchBuilder(armRMod.poleVectorController, [globalMst.mainController, spineMod.chestController, armRMod.ikController], globalMst.mainController)
armRPvCtrlSSBuilder.build(isParentType=True)

# ---------------------------------------------------------------------------
# Fingers L Build
name = 'thumbFinger'
joints = ['SK:thumb_01_l', 'SK:thumb_02_l', 'SK:thumb_03_l', 'thumb_04_l']
thumbLMod = irScene.addModule('Finger', name, irm.module.Module.SIDE.LEFT, skeletonJoints=joints)
thumbLMod.curlStartIndex = 1
thumbLMod.preBuild()
thumbLMod.build()
thumbLMod.controllerColor = irg.controller.Controller.COLOR.BLUE
thumbLMod.controllerSize = 4
#thumbLMod.delete()

name = 'indexFinger'
joints = ['SK:index_metacarpal_l', 'SK:index_01_l', 'SK:index_02_l', 'SK:index_03_l', 'index_04_l']
indexLMod = irScene.addModule('Finger', name, irm.module.Module.SIDE.LEFT, skeletonJoints=joints)
indexLMod.preBuild()
indexLMod.build()
indexLMod.controllerColor = irg.controller.Controller.COLOR.BLUE
indexLMod.controllerSize = 4
#indexLMod.delete()

name = 'middleFinger'
joints = ['SK:middle_metacarpal_l', 'SK:middle_01_l', 'SK:middle_02_l', 'SK:middle_03_l', 'middle_04_l']
middleLMod = irScene.addModule('Finger', name, irm.module.Module.SIDE.LEFT, skeletonJoints=joints)
middleLMod.preBuild()
middleLMod.build()
middleLMod.controllerColor = irg.controller.Controller.COLOR.BLUE
middleLMod.controllerSize = 4
#middleLMod.delete()

name = 'ringFinger'
joints = ['SK:ring_metacarpal_l', 'SK:ring_01_l', 'SK:ring_02_l', 'SK:ring_03_l', 'ring_04_l']
ringLMod = irScene.addModule('Finger', name, irm.module.Module.SIDE.LEFT, skeletonJoints=joints)
ringLMod.preBuild()
ringLMod.build()
ringLMod.controllerColor = irg.controller.Controller.COLOR.BLUE
ringLMod.controllerSize = 4
#ringLMod.delete()

name = 'pinkyFinger'
joints = ['SK:pinky_metacarpal_l', 'SK:pinky_01_l', 'SK:pinky_02_l', 'SK:pinky_03_l', 'pinky_04_l']
pinkyLMod = irScene.addModule('Finger', name, irm.module.Module.SIDE.LEFT, skeletonJoints=joints)
pinkyLMod.preBuild()
pinkyLMod.build()
pinkyLMod.controllerColor = irg.controller.Controller.COLOR.BLUE
pinkyLMod.controllerSize = 4
#pinkyLMod.delete()

name = 'fingers'
fingersLMaster = irScene.addMaster('FingersMaster', name, irm.module.Module.SIDE.LEFT)
fingersLMaster.addModules(thumbLMod, indexLMod, middleLMod, ringLMod, pinkyLMod)
fingersLMaster.build()
fingersLMaster.attachTo(armLMod)
globalMst.addMasters(fingersLMaster)
#fingersLMaster.delete()

# ---------------------------------------------------------------------------
# Fingers R Build
thumbRMod = irScene.mirrorModule('thumbFinger', 'l', '_l', '_r')
#irScene.removeModule('thumbFinger', 'r')

indexRMod = irScene.mirrorModule('indexFinger', 'l', '_l', '_r')
#irScene.removeModule('indexFinger', 'r')

middleRMod = irScene.mirrorModule('middleFinger', 'l', '_l', '_r')
#irScene.removeModule('middleFinger', 'r')

ringRMod = irScene.mirrorModule('ringFinger', 'l', '_l', '_r')
#irScene.removeModule('ringFinger', 'r')

pinkyRMod = irScene.mirrorModule('pinkyFinger', 'l', '_l', '_r')
#irScene.removeModule('pinkyFinger', 'r')

name = 'fingers'
fingersRMaster = irScene.addMaster('FingersMaster', name, irm.module.Module.SIDE.RIGHT)
fingersRMaster.addModules(thumbRMod, indexRMod, middleRMod, ringRMod, pinkyRMod)
fingersRMaster.build()
fingersRMaster.attachTo(armRMod)
globalMst.addMasters(fingersRMaster)
#fingersRMaster.delete()


# -------------- Post-Custom Scripts Build ---------------------
name = 'connectMetahuman'
code = '''
from maya import cmds
cmds.parentConstraint('head_ctrl', 'facial_rig_grp', mo=True)
cmds.setAttr('L_lookDirection.inheritsTransform', 0)
cmds.setAttr('R_lookDirection.inheritsTransform', 0)
'''
postCS = irScene.addPostCustomScript(name, code)
postCS.run()