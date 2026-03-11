from imp import reload
import ironRig; reload(ironRig)
import ironRig.api.irSystem as irs
import ironRig.api.irModule as irm
import ironRig.api.irMaster as irmst
import ironRig.api.irGlobal as irg


irScene = irg.scene.Scene()
filePath = r'C:\Users\stakl\Downloads\metahumanSkel_build.json'
#irScene.saveToFile(filePath)

# -------------- Module Build ---------------------
globalMst = irScene.addGlobalMaster('root', True)
globalMst.build()


name = 'spine'
joints = ['pelvis', 'spine_01', 'spine_02', 'spine_03', 'spine_04']
spineMod = irScene.addModule('Spine', name, irm.module.Module.SIDE.CENTER, skeletonJoints=joints)
spineMod.preBuild()
spineMod.build()
spineMod.controllerSize = 10
globalMst.addModules(spineMod)
#irScene.removeModule('spine', 'c')

name = 'neck'
joints = ['neck_01', 'neck_02', 'head']
neckMod = irScene.addModule('Neck', name, irm.module.Module.SIDE.CENTER, skeletonJoints=joints)
neckMod.preBuild()
neckMod.numberOfControllers = 2
neckMod.build()
neckMod.controllerSize = 10
neckMod.attachTo(spineMod)
globalMst.addModules(neckMod)
#irScene.removeModule('neck', 'c')
headCtrlSSBuilder = irScene.addSpaceSwitchBuilder(neckMod.headController, [neckMod.neckController, globalMst.mainController], neckMod.neckController)
headCtrlSSBuilder.isOrientType=True
headCtrlSSBuilder.build()