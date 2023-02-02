# -------------- Module Build ---------------------
import ironRig as ir; reload(ir)
from ironRig.api import irGlobal
from ironRig.api import irMaster
from ironRig.api import irModule
from ironRig.api import irSystem


prefix = 'hip_L_'
joints = [u'horse_sk_lf_back_hip', u'horse_sk_lf_back_upleg_twist1']
hipLMod = irModule.LimbBase(prefix, joints)
hipLMod.preBuild()
hipLMod.build()
hipLMod.controllerColor = irGlobal.Controller.COLOR.BLUE
hipLMod.controllerSize = 3
hipLMod.postBuild()
hipLMod.attachTo(spineMod)
globalMst.addModules(hipLMod)
#hipLMod.remove()


prefix = 'backLeg_L_'
joints = [u'horse_sk_lf_back_upleg_twist1', u'horse_sk_lf_back_lowleg_twist1', u'horse_sk_lf_back_toe', u'horse_sk_lf_back_hoof']
backLegLMod = irModule.ThreeBoneLimb(prefix, joints)
backLegLMod.preBuild()
backLegLMod.build()
backLegLMod.controllerSize = 1
backLegLMod.controllerColor = irGlobal.Controller.COLOR.BLUE
backLegLMod.postBuild()
backLegLMod.attachTo(hipLMod)
globalMst.addModules(backLegLMod)
#backLegLMod.remove()

prefix = 'backFoot_L_'
joints = [u'horse_sk_lf_back_hoof', u'horse_sk_lf_back_hoofend']
backFootLMod = irModule.Foot(prefix, joints)
backFootLMod.preBuild()
backFootLMod.build()
backFootLMod.controllerColor = irGlobal.Controller.COLOR.BLUE
backFootLMod.controllerSize = 1
backFootLMod.postBuild()
backFootLMod.attachTo(backLegLMod)
globalMst.addModules(backFootLMod)
#backFootLMod.remove()


prefix = 'hip_R_'
joints = [u'horse_sk_rt_back_hip', u'horse_sk_rt_back_upleg_twist1']
hipRMod = irModule.LimbBase(prefix, joints)
hipRMod.preBuild()
hipRMod.build()
hipRMod.controllerColor = irGlobal.Controller.COLOR.RED
hipRMod.controllerSize = 3
hipRMod.postBuild()
hipRMod.attachTo(spineMod)
globalMst.addModules(hipRMod)
#hipRMod.remove()

prefix = 'backLeg_R_'
joints = [u'horse_sk_rt_back_upleg_twist1', u'horse_sk_rt_back_lowleg_twist1', u'horse_sk_rt_back_toe', u'horse_sk_rt_back_hoof']
backLegRMod = irModule.ThreeBoneLimb(prefix, joints)
backLegRMod.preBuild()
backLegRMod.build()
backLegRMod.controllerSize = 1
backLegRMod.controllerColor = irGlobal.Controller.COLOR.RED
backLegRMod.postBuild()
backLegRMod.attachTo(hipRMod)
globalMst.addModules(backLegRMod)
#backLegRMod.remove()

prefix = 'backFoot_R_'
joints = [u'horse_sk_rt_back_hoof', u'horse_sk_rt_back_hoof_end']
backFootRMod = irModule.Foot(prefix, joints)
backFootRMod.preBuild()
backFootRMod.build()
backFootRMod.controllerColor = irGlobal.Controller.COLOR.RED
backFootRMod.controllerSize = 1
backFootRMod.postBuild()
backFootRMod.attachTo(backLegRMod)
globalMst.addModules(backFootRMod)
#backFootRMod.remove()
