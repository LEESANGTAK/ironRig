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
