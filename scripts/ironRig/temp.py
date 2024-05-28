from imp import reload
import ironRig.api.irGlobal as irg; reload(irg)
import ironRig.api.irSystem as irs; reload(irs)


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
ctrl.size = 2
ctrl.color = (1.0, 0.0, 0.0)
ctrl.name = 'myNewC'
ctrl.zeroGrp
ctrl.extraGrp
ctrl.controllerNode
ctrl.name
ctrl.hide(False)
ctrl.lockHideChannels(['scale'])


# System test