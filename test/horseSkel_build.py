from imp import reload

# -------------- Module Build ---------------------
import ironRig as ir; reload(ir)
from ironRig.api import irGlobal
from ironRig.api import irMaster
from ironRig.api import irModule


globalMst = irMaster.GlobalMaster(skeletonRoot='skeleton', cogJoint='horse_sk_cn_pelvis')
globalMst.build()
globalMst.controllerSize = 10
globalMst.postBuild()
#globalMst.remove()

prefix = 'spine_'
joints = [u'horse_sk_cn_pelvis',
 u'horse_sk_cn_spine2',
 u'horse_sk_cn_spine3',
 u'horse_sk_cn_spine4',
 u'horse_sk_cn_spine5',
 u'horse_sk_cn_spine6',
 u'horse_sk_cn_spine7',
 u'horse_sk_cn_spine8',
 u'horse_sk_cn_spine9',
 u'horse_sk_cn_spine10',
 u'horse_sk_cn_spine11',
 u'horse_sk_cn_spine12',
 u'horse_sk_cn_chest']
spineMod = irModule.Spine(prefix, joints)
spineMod.preBuild()
spineMod.build()
spineMod.controllerSize = 3
spineMod.postBuild()
globalMst.addModules(spineMod)
#spineMod.remove()

prefix = 'neck_'
joints = [u'horse_sk_cn_neck1',
 u'horse_sk_cn_neck2',
 u'horse_sk_cn_neck3',
 u'horse_sk_cn_neck4',
 u'horse_sk_cn_head']
neckMod = irModule.Neck(prefix, joints)
neckMod.preBuild()
neckMod.numControllers = 4
neckMod.build()
neckMod.controllerSize = 4
neckMod.postBuild()
neckMod.attachTo(spineMod)
globalMst.addModules(neckMod)
#neckMod.remove()

prefix = 'tail_'
joints = [u'horse_sk_cn_tail_ribbon1',
 u'horse_sk_cn_tail_ribbon2',
 u'horse_sk_cn_tail_ribbon3',
 u'horse_sk_cn_tail_ribbon4',
 u'horse_sk_cn_tail_ribbon5',
 u'horse_sk_cn_tail_ribbon6',
 u'horse_sk_cn_tail_ribbon7',
 u'horse_sk_cn_tail_ribbon8',
 u'horse_sk_cn_tail_ribbon9',
 u'horse_sk_cn_tail_ribbon10',
 u'horse_sk_cn_tail_ribbon11']
tailMod = irModule.String(prefix, joints)
tailMod.preBuild()
tailMod.numberOfControllers = 4
tailMod.hybridIK = True
tailMod.fk = True
tailMod.wave = True
tailMod.dynamic = True
tailMod.build()
tailMod.attachTo(spineMod)
globalMst.addModules(tailMod)
#tailMod.remove()

prefix = 'eye_L_'
joints = [u'horse_sk_lf_eye', 'horse_sk_lf_eye_end']
eyeLMod = irModule.Eye(prefix, joints)
eyeLMod.preBuild()
eyeLMod.build()
eyeLMod.controllerColor = irGlobal.Controller.COLOR.BLUE
eyeLMod.controllerSize = 0.2
eyeLMod.postBuild()
eyeLMod.attachTo(neckMod)
#eyeLMod.remove()

# Eye R Build
prefix = 'eye_R_'
joints = [u'horse_sk_rt_eye', u'horse_sk_rt_eye_end']
eyeRMod = irModule.Eye(prefix, joints)
eyeRMod.preBuild()
eyeRMod.build()
eyeRMod.controllerColor = irGlobal.Controller.COLOR.RED
eyeRMod.controllerSize = 0.2
eyeRMod.postBuild()
eyeRMod.attachTo(neckMod)
#eyeRMod.remove()

# ---------------------------------------------------------------------------
prefix = 'scapula_L_'
joints = [u'horse_sk_lf_front_shoulder', u'horse_sk_lf_front_point_shoulder', 'horse_sk_lf_front_upleg_twist1']
scapLMod = irModule.LimbBase(prefix, joints)
scapLMod.preBuild()
scapLMod.build()
scapLMod.controllerColor = irGlobal.Controller.COLOR.BLUE
scapLMod.controllerSize = 3
scapLMod.postBuild()
scapLMod.attachTo(spineMod)
globalMst.addModules(scapLMod)
#scapLMod.remove()

prefix = 'frontLeg_L_'
joints = [u'horse_sk_lf_front_upleg_twist1', u'horse_sk_lf_front_lowleg_twist1', u'horse_sk_lf_front_toe', u'horse_sk_lf_front_hoof']
frontLegLMod = irModule.ThreeBoneLimb(prefix, joints)
frontLegLMod.preBuild()
frontLegLMod.build()
frontLegLMod.controllerSize = 1
frontLegLMod.controllerColor = irGlobal.Controller.COLOR.BLUE
frontLegLMod.postBuild()
frontLegLMod.attachTo(scapLMod)
globalMst.addModules(frontLegLMod)
#frontLegLMod.remove()

prefix = 'frontFoot_L_'
joints = [u'horse_sk_lf_front_hoof', u'horse_sk_lf_front_hoofend']
frontFootLMod = irModule.Foot(prefix, joints)
frontFootLMod.preBuild()
frontFootLMod.build()
frontFootLMod.controllerColor = irGlobal.Controller.COLOR.BLUE
frontFootLMod.controllerSize = 1
frontFootLMod.postBuild()
frontFootLMod.attachTo(frontLegLMod)
globalMst.addModules(frontFootLMod)
#frontFootLMod.remove()

prefix = 'scapula_R_'
joints = [u'horse_sk_rt_front_shoulder', u'horse_sk_rt_front_point_shoulder', 'horse_sk_rt_front_upleg_twist1']
scapRMod = irModule.LimbBase(prefix, joints)
scapRMod.type = irModule.Simple.TYPE.FK
scapRMod.preBuild()
scapRMod.build()
scapRMod.controllerColor = irGlobal.Controller.COLOR.RED
scapRMod.controllerSize = 3
scapRMod.postBuild()
scapRMod.attachTo(spineMod)
globalMst.addModules(scapRMod)
#scapRMod.remove()

prefix = 'frontLeg_R_'
joints = [u'horse_sk_rt_front_upleg_twist1', u'horse_sk_rt_front_lowleg_twist1', u'horse_sk_rt_front_toe', u'horse_sk_rt_front_hoof']
frontLegRMod = irModule.ThreeBoneLimb(prefix, joints)
frontLegRMod.preBuild()
frontLegRMod.build()
frontLegRMod.controllerSize = 1
frontLegRMod.controllerColor = irGlobal.Controller.COLOR.RED
frontLegRMod.postBuild()
frontLegRMod.attachTo(scapRMod)
globalMst.addModules(frontLegRMod)
#frontLegRMod.remove()

prefix = 'frontFoot_R_'
joints = [u'horse_sk_rt_front_hoof', u'horse_sk_rt_front_hoof_end']
frontFootRMod = irModule.Foot(prefix, joints)
frontFootRMod.preBuild()
frontFootRMod.build()
frontFootRMod.controllerColor = irGlobal.Controller.COLOR.RED
frontFootRMod.controllerSize = 1
frontFootRMod.postBuild()
frontFootRMod.attachTo(frontLegRMod)
globalMst.addModules(frontFootRMod)
#frontFootRMod.remove()

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


# ---------------- Space Switch Setup ---------------------
mainCtrl = globalMst.mainController()
pelvisCtrl = spineMod.controllers()[0]
chestCtrl = spineMod.ikSystem().controllers()[-1]
neckCtrl = neckMod.ikSystem().controllers()[-2]
headCtrl = neckMod.ikSystem().controllers()[-1]

frontLegLCtrl = frontLegLMod.ikSystem().ikHandleController()
frontLegRCtrl = frontLegRMod.ikSystem().ikHandleController()
backLegLCtrl = backLegLMod.ikSystem().ikHandleController()
backLegRCtrl = backLegRMod.ikSystem().ikHandleController()


frontLegLIkhCtrlSSBuilder = irGlobal.SpaceSwitchBuilder(frontLegLCtrl,
                                                     [mainCtrl, pelvisCtrl, chestCtrl, headCtrl],
                                                     mainCtrl)
frontLegLIkhCtrlSSBuilder.build(parent=True)
frontLegLPvCtrlSSBuilder = irGlobal.SpaceSwitchBuilder(frontLegLMod.ikSystem().poleVectorController(),
                                                   [mainCtrl, chestCtrl, frontLegLCtrl],
                                                   mainCtrl)
frontLegLPvCtrlSSBuilder.build(parent=True)


frontLegRIkhCtrlSSBuilder = irGlobal.SpaceSwitchBuilder(frontLegRCtrl,
                                                     [mainCtrl, pelvisCtrl, chestCtrl, headCtrl],
                                                     mainCtrl)
frontLegRIkhCtrlSSBuilder.build(parent=True)
frontLegRPvCtrlSSBuilder = irGlobal.SpaceSwitchBuilder(frontLegRMod.ikSystem().poleVectorController(),
                                                   [mainCtrl, chestCtrl, frontLegRCtrl],
                                                   mainCtrl)
frontLegRPvCtrlSSBuilder.build(parent=True)


backLegLIkhCtrlSSBuilder = irGlobal.SpaceSwitchBuilder(backLegLCtrl,
                                                     [mainCtrl, pelvisCtrl],
                                                     mainCtrl)
backLegLIkhCtrlSSBuilder.build(parent=True)
backLegLPvCtrlSSBuilder = irGlobal.SpaceSwitchBuilder(backLegLMod.ikSystem().poleVectorController(),
                                                   [mainCtrl, backLegLCtrl],
                                                   mainCtrl)
backLegLPvCtrlSSBuilder.build(parent=True)


backLegRIkhCtrlSSBuilder = irGlobal.SpaceSwitchBuilder(backLegRCtrl,
                                                     [mainCtrl, pelvisCtrl],
                                                     mainCtrl)
backLegRIkhCtrlSSBuilder.build(parent=True)
backLegRPvCtrlSSBuilder = irGlobal.SpaceSwitchBuilder(backLegRMod.ikSystem().poleVectorController(),
                                                   [mainCtrl, backLegRCtrl],
                                                   mainCtrl)
backLegRPvCtrlSSBuilder.build(parent=True)


headCtrlSSBuilder = irGlobal.SpaceSwitchBuilder(headCtrl, [neckCtrl, mainCtrl], neckCtrl)
headCtrlSSBuilder.build(orient=True)