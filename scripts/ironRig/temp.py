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
irSpIKSys = irs.SplineIK(name=name, side=side, joints=jnts, numControllers=3)
irSpIKSys.build()
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
