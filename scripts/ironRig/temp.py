from imp import reload
import ironRig; reload(ironRig)
import ironRig.api.irGlobal as irg
import ironRig.api.irSystem as irs


# Container test
irCont = irg.irGlobal.Container()

tmpNode = cmds.createNode('transform', n='newSub_c_grp')
cmds.parent(tmpNode, irCont.topGrp)
irCont.addMembers(tmpNode)

irCont.name = 'myCont'
irCont.side = 'r'
irCont.delete()


# Controller test
ctrl = irg.Controller()
ctrl.shape = irg.Controller.SHAPE.SPHERE
ctrl.size = 3
ctrl.color = irg.Controller.COLOR.BLUE
ctrl.name = 'myNewC'
ctrl.zeroGrp
ctrl.extraGrp
ctrl.controllerNode
ctrl.name
ctrl.hide(False)
ctrl.lockHideChannels(['scale'])


# System test
name = 'eye'
side = irs.System.SIDE.RIGHT
jnts = ['FACIAL_R_Eye', 'FACIAL_R_Pupil']
irAimSys = irs.Aim(name=name, side=side, joints=jnts)
irAimSys.build()
irAimSys.name = 'eyeball'
irAimSys.delete()

name = 'thumb'
side = irs.System.SIDE.LEFT
jnts = ['thumb_01_l', 'thumb_02_l', 'thumb_03_l']
irFKSys = irs.FK(name=name, side=side, joints=jnts)
irFKSys.build()
irFKSys.name = 'thumbA'
irFKSys.controllerColor = irg.Controller.COLOR.BLUE
irFKSys.controllerSize = 1
irFKSys.controllerShape = irg.Controller.SHAPE.CUBE
irFKSys.delete()

name = 'foot'
side = irs.System.SIDE.LEFT
jnts = ['foot_l_jnt', 'ball_l_jnt']
locators = ['locator1', 'locator2', 'locator3', 'locator4']
irFIKSys = irs.FootIK(name=name, side=side, joints=jnts, pivotLocators=locators)
irFIKSys.build()
irFIKSys.controllerSize = 10
irFIKSys.delete()

name = 'hair'
side = irs.System.SIDE.CENTER
jnts = ['joint1', 'joint2', 'joint3', 'joint4', 'joint5', 'joint6']
irRibIKSys = irs.RibbonIK(name=name, side=side, joints=jnts, numControllers=5)
irRibIKSys.build()
irRibIKSys.delete()

name = 'hair'
side = irs.System.SIDE.CENTER
jnts = ['joint1', 'joint2', 'joint3', 'joint4', 'joint5', 'joint6']
irSpIKSys = irs.SplineIK(name=name, side=side, joints=jnts, numberOfControllers=3)
irSpIKSys.build()
irSpIKSys.setupDynamic()
irSpIKSys.delete()

name = 'buttons'
side = irs.System.SIDE.NONE
jnts = ['joint1', 'joint2', 'joint3', 'joint4', 'joint5', 'joint6']
irSGSys = irs.Single(name=name, side=side, joints=jnts)
irSGSys.build()
irSGSys.name = 'btns'
irSGSys.side = irs.System.SIDE.LEFT
irSGSys.controllerShape = irg.Controller.SHAPE.CUBE
irSGSys.controllerColor = irg.Controller.COLOR.BLUE
irSGSys.controllerSize = 1
irSGSys.delete()

name = 'leg'
side = irs.System.SIDE.LEFT
jnts = ['horse_sk_lf_back_hip_jnt', 'horse_sk_lf_back_upleg_twist1_jnt', 'horse_sk_lf_back_lowleg_twist1_jnt']
irTwoIKSys = irs.TwoBoneIK(name=name, side=side, joints=jnts)
irTwoIKSys.build()
irTwoIKSys.controllerSize = 10
irTwoIKSys.delete()

name = 'hindLeg'
side = irs.System.SIDE.LEFT
jnts = ['horse_sk_lf_back_hip_jnt', 'horse_sk_lf_back_upleg_twist1_jnt', 'horse_sk_lf_back_lowleg_twist1_jnt', 'horse_sk_lf_back_toe_jnt']
irThreeIKSys = irs.ThreeBoneIK(name=name, side=side, joints=jnts)
irThreeIKSys.build()
irThreeIKSys.controllerSize = 10
irThreeIKSys.delete()



from imp import reload
import ironRig; reload(ironRig)
import ironRig.api.irGlobal as irg
import ironRig.api.irSystem as irs
import ironRig.api.irModule as irm

# Modules
name = 'eye'
side = irm.Module.SIDE.LEFT
jnts = ['FACIAL_L_Eye', 'FACIAL_L_Pupil']
eyeMod = irm.Eye(name, side, jnts)
eyeMod.preBuild()
eyeMod.build()
eyeMod.controllerColor = irg.Controller.COLOR.BLUE
eyeMod.delete()

name = 'thumb'
side = irm.Module.SIDE.LEFT
jnts = ['thumb_01_l', 'thumb_02_l', 'thumb_03_l']
fingerMod = irm.Finger(name, side, jnts)
fingerMod.fkSystem.endController = True
fingerMod.preBuild()
fingerMod.build()
fingerMod.controllerSize = 2
fingerMod.controllerColor = irg.Controller.COLOR.BLUE
fingerMod.delete()

name = 'foot'
side = irm.Module.SIDE.LEFT
jnts = ['foot_l', 'ball_l', 'toe_l']
footMod = irm.Foot(name, side, jnts)
footMod.preBuild()
footMod.build()
footMod.controllerSize = 10
footMod.controllerColor = irg.Controller.COLOR.BLUE
footMod.delete()

name = 'head'
side = irm.Module.SIDE.CENTER
jnts = ['head', 'head_end']
headMod = irm.Head(name, side, jnts)
headMod.preBuild()
headMod.build()
headMod.delete()

name = 'jaw'
side = irm.Module.SIDE.CENTER
jnts = ['FACIAL_C_Jaw', 'FACIAL_C_Jawline']
jawMod = irm.Jaw(name, side, jnts)
jawMod.preBuild()
jawMod.build()
jawMod.delete()

name = 'rope'
side = irm.Module.SIDE.CENTER
jnts = ['joint1', 'joint2', 'joint3', 'joint4', 'joint5', 'joint6']
ropeMod = irm.Rope(name, side, jnts)
ropeMod.dynamic = True
ropeMod.preBuild()
ropeMod.build()
ropeMod.delete()

name = 'simple'
side = irm.Module.SIDE.CENTER
jnts = ['joint1', 'joint2', 'joint3', 'joint4', 'joint5', 'joint6']
simpMod = irm.Simple(name, side, jnts, irm.Simple.SYSTEM_TYPE.FK)
simpMod.preBuild()
simpMod.build()
simpMod.delete()

name = 'spine'
side = irm.Module.SIDE.CENTER
jnts = ['pelvis', 'spine_01', 'spine_02', 'spine_03', 'spine_04', 'spine_05']
ropeMod = irm.Spine(name, side, jnts)
ropeMod.preBuild()
ropeMod.build()
ropeMod.delete()

name = 'tail'
side = irm.Module.SIDE.CENTER
jnts = ['joint1', 'joint2', 'joint3', 'joint4', 'joint5', 'joint6']
tailMod = irm.String(name, side, jnts, irm.String.IK_TYPE.SPLINE)
tailMod.numberOfControllers = 5
tailMod.wave = True
tailMod.hybridIK = True
tailMod.fk = True
tailMod.coil = True
tailMod.dynamic = True
tailMod.preBuild()
tailMod.build()
#tailMod.delete()

name = 'arm'
side = irm.Module.SIDE.LEFT
jnts = ['upperarm_l', 'lowerarm_l', 'hand_l']
armMod = irm.TwoBoneLimb(name, side, jnts, True)
armMod.preBuild()
armMod.build()
#armMod.delete()
