from imp import reload

# -------------- Module Build ---------------------
import ironRig as ir; reload(ir)
from ironRig.api import irGlobal
from ironRig.api import irMaster
from ironRig.api import irModule


globalMst = irMaster.GlobalMaster(skeletonRoot='SK_Root', cogJoint='SK_Pelvis')
globalMst.build()
globalMst.controllerScale = 14
globalMst.postBuild()
#globalMst.remove()

prefix = 'spine_'
joints = [u'SK_Pelvis', u'SK_Spine1', u'SK_Chest']
spineMod = irModule.Spine(prefix, joints)
spineMod.preBuild()
spineMod.build()
spineMod.controllerScale = 7
spineMod.postBuild()
globalMst.addModules(spineMod)
#spineMod.remove()

prefix = 'tail_'
joints = [u'SK_Tail1', u'SK_Tail2', u'SK_Tail3', u'SK_Tail4', u'SK_TailEnd']
tailMod = irModule.String(prefix, joints)
tailMod.preBuild()
tailMod.numberOfControllers = 3
tailMod.fk = True
tailMod.wave = True
tailMod.dynamic = True
tailMod.build()
tailMod.attachTo(spineMod)
globalMst.addModules(tailMod)
#tailMod.remove()

prefix = 'butt_'
joints = [u'SK_R_Butt', u'SK_L_Butt']
buttMod = irModule.Simple(prefix, joints)
buttMod.preBuild()
buttMod.negateScaleX = True
buttMod.build()
buttMod.attachTo(spineMod)
globalMst.addModules(buttMod)
#buttMod.remove()

prefix = 'belly_'
joints = [u'SK_Belly']
bellyMod = irModule.Simple(prefix, joints)
bellyMod.preBuild()
bellyMod.build()
bellyMod.attachTo(spineMod)
globalMst.addModules(bellyMod)
#bellyMod.remove()

prefix = 'neck_'
joints = [u'SK_Neck', u'SK_Head']
neckMod = irModule.Neck(prefix, joints)
neckMod.preBuild()
neckMod.numControllers = 2
neckMod.build()
neckMod.controllerScale = 7
neckMod.postBuild()
neckMod.attachTo(spineMod)
globalMst.addModules(neckMod)
#neckMod.remove()

prefix = 'head_'
joints = [u'SK_Head', u'SK_HeadEnd']
headMod = irModule.Head(prefix, joints)
headMod.preBuild()
headMod.build()
headMod.attachTo(neckMod)
globalMst.addModules(headMod)
#headMod.remove()

prefix = 'upHead_'
joints = [u'SK_UpperHead']
upHeadMod = irModule.Simple(prefix, joints)
upHeadMod.preBuild()
upHeadMod.build()
upHeadMod.attachTo(headMod)
globalMst.addModules(upHeadMod)
#upHeadMod.remove()

# ------------------------ Eye Build -----------------------------------
prefix = 'upEyelid_L_'
joints = [u'SK_L_UpperEyeLid']
upEyelidLMod = irModule.Simple(prefix, joints)
upEyelidLMod.build()
upEyelidLMod.controllerColor = irGlobal.Controller.COLOR.BLUE
upEyelidLMod.controllerScale = 1
upEyelidLMod.postBuild()
#upEyelidLMod.remove()

prefix = 'lowEyelid_L_'
joints = [u'SK_L_LowerEyeLid']
lowEyelidLMod = irModule.Simple(prefix, joints)
lowEyelidLMod.build()
lowEyelidLMod.controllerColor = irGlobal.Controller.COLOR.BLUE
lowEyelidLMod.controllerScale = 1
lowEyelidLMod.postBuild()
#lowEyelidLMod.remove()

prefix = 'upEyelid_R_'
joints = [u'SK_R_UpperEyeLid']
upEyelidRMod = irModule.Simple(prefix, joints)
upEyelidRMod.build()
upEyelidRMod.controllerColor = irGlobal.Controller.COLOR.RED
upEyelidRMod.controllerScale = 1
upEyelidRMod.postBuild()
#upEyelidRMod.remove()

prefix = 'lowEyelid_R_'
joints = [u'SK_R_LowerEyeLid']
lowEyelidRMod = irModule.Simple(prefix, joints)
lowEyelidRMod.build()
lowEyelidRMod.controllerColor = irGlobal.Controller.COLOR.RED
lowEyelidRMod.controllerScale = 1
lowEyelidRMod.postBuild()
#lowEyelidRMod.remove()

prefix = 'eye_L_'
joints = [u'SK_L_Eye', u'SK_L_EyeEnd']
eyeLMod = irModule.Eye(prefix, joints)
eyeLMod.preBuild()
eyeLMod.build()
eyeLMod.controllerColor = irGlobal.Controller.COLOR.BLUE
eyeLMod.controllerScale = 1
eyeLMod.postBuild()
#eyeLMod.remove()

# Eye R Build
prefix = 'eye_R_'
joints = [u'SK_R_Eye', u'SK_R_EyeEnd']
eyeRMod = irModule.Eye(prefix, joints)
eyeRMod.preBuild()
eyeRMod.build()
eyeRMod.controllerColor = irGlobal.Controller.COLOR.RED
eyeRMod.controllerScale = 1
eyeRMod.postBuild()
#eyeRMod.remove()

prefix = 'eyes_'
eyesMaster = irMaster.EyesMaster(prefix)
eyesMaster.addModules(eyeLMod, eyeRMod)
eyesMaster.build()
eyesMaster.attachTo(upHeadMod)
globalMst.addMasters(eyesMaster)
#eyesMaster.remove()
# ---------------------------------------------------------------------------

prefix = 'nose_'
joints = [u'SK_L_Nose', u'SK_R_Nose']
noseSimpleMod = irModule.Simple(prefix, joints)
noseSimpleMod.preBuild()
noseSimpleMod.negateScaleX = True
noseSimpleMod.build()
noseSimpleMod.attachTo(upHeadMod)
globalMst.addModules(noseSimpleMod)
#noseSimpleMod.remove()

prefix = 'eyebrow_'
joints = [u'SK_L_Eyebrow', u'SK_R_Eyebrow']
eyebrowSimpleMod = irModule.Simple(prefix, joints)
eyebrowSimpleMod.preBuild()
eyebrowSimpleMod.negateScaleX = True
eyebrowSimpleMod.build()
eyebrowSimpleMod.attachTo(upHeadMod)
globalMst.addModules(eyebrowSimpleMod)
#eyebrowSimpleMod.remove()

prefix = 'eyelashA1_L_'
joints = [u'SK_L_EyelashA1',
 u'SK_L_EyelashA2',
 u'SK_L_EyelashA3',
 u'SK_L_EyelashA4',
 u'SK_L_EyelashA5']
LeyelashA1Mod = irModule.String(prefix, joints)
LeyelashA1Mod.preBuild()
LeyelashA1Mod.numberOfControllers = 3
LeyelashA1Mod.build()
LeyelashA1Mod.controllerColor = irGlobal.Controller.COLOR.BLUE
LeyelashA1Mod.postBuild()
LeyelashA1Mod.attachTo(upHeadMod)
globalMst.addModules(LeyelashA1Mod)
#LeyelashA1Mod.remove()

prefix = 'eyelashB1_L_'
joints = [u'SK_L_EyelashB1',
 u'SK_L_EyelashB2',
 u'SK_L_EyelashB3',
 u'SK_L_EyelashB4',
 u'SK_L_EyelashB5']
LeyelashB1Mod = irModule.String(prefix, joints)
LeyelashB1Mod.preBuild()
LeyelashB1Mod.numberOfControllers = 3
LeyelashB1Mod.build()
LeyelashB1Mod.controllerColor = irGlobal.Controller.COLOR.BLUE
LeyelashB1Mod.postBuild()
LeyelashB1Mod.attachTo(upHeadMod)
globalMst.addModules(LeyelashB1Mod)
#LeyelashB1Mod.remove()

prefix = 'eyelashA1_R_'
joints = [u'SK_R_EyelashA1',
 u'SK_R_EyelashA2',
 u'SK_R_EyelashA3',
 u'SK_R_EyelashA4',
 u'SK_R_EyelashA5']
ReyelashA1Mod = irModule.String(prefix, joints)
ReyelashA1Mod.preBuild()
ReyelashA1Mod.numberOfControllers = 3
ReyelashA1Mod.negateScaleX = True
ReyelashA1Mod.build()
ReyelashA1Mod.controllerColor = irGlobal.Controller.COLOR.RED
ReyelashA1Mod.postBuild()
ReyelashA1Mod.attachTo(upHeadMod)
globalMst.addModules(ReyelashA1Mod)
#ReyelashA1Mod.remove()

prefix = 'eyelashB1_R_'
joints = [u'SK_R_EyelashB1',
 u'SK_R_EyelashB2',
 u'SK_R_EyelashB3',
 u'SK_R_EyelashB4',
 u'SK_R_EyelashB5']
ReyelashB1Mod = irModule.String(prefix, joints)
ReyelashB1Mod.preBuild()
ReyelashB1Mod.numberOfControllers = 3
ReyelashB1Mod.negateScaleX = True
ReyelashB1Mod.build()
ReyelashB1Mod.controllerColor = irGlobal.Controller.COLOR.RED
ReyelashB1Mod.postBuild()
ReyelashB1Mod.attachTo(upHeadMod)
globalMst.addModules(ReyelashB1Mod)
#ReyelashB1Mod.remove()

# --------------------------- Hair --------------------------------------------------
prefix = 'hairA1_L_'
joints = [u'SK_L_HairA1',
 u'SK_L_HairA2',
 u'SK_L_HairA3',
 u'SK_L_HairA4',
 u'SK_L_HairA5',
 u'SK_L_HairA6']
LhairA1Mod = irModule.String(prefix, joints)
LhairA1Mod.preBuild()
LhairA1Mod.numberOfControllers = 3
LhairA1Mod.fk = True
LhairA1Mod.dynamic = True
LhairA1Mod.build()
LhairA1Mod.controllerColor = irGlobal.Controller.COLOR.BLUE
LhairA1Mod.controllerScale = 2
LhairA1Mod.postBuild()
LhairA1Mod.attachTo(upHeadMod)
globalMst.addModules(LhairA1Mod)
#LhairA1Mod.remove()

prefix = 'hairB1_L_'
joints = [u'SK_L_HairB1',
 u'SK_L_HairB2',
 u'SK_L_HairB3',
 u'SK_L_HairB4',
 u'SK_L_HairB5',
 u'SK_L_HairB6']
LhairB1Mod = irModule.String(prefix, joints)
LhairB1Mod.preBuild()
LhairB1Mod.numberOfControllers = 3
LhairB1Mod.fk = True
LhairB1Mod.dynamic = True
LhairB1Mod.build()
LhairB1Mod.controllerColor = irGlobal.Controller.COLOR.BLUE
LhairB1Mod.controllerScale = 2
LhairB1Mod.postBuild()
LhairB1Mod.attachTo(upHeadMod)
globalMst.addModules(LhairB1Mod)
#LhairB1Mod.remove()

prefix = 'hairC1_L_'
joints = [u'SK_L_HairC1',
 u'SK_L_HairC2',
 u'SK_L_HairC3',
 u'SK_L_HairC4',
 u'SK_L_HairC5',
 u'SK_L_HairC6']
LhairC1Mod = irModule.String(prefix, joints)
LhairC1Mod.preBuild()
LhairC1Mod.numberOfControllers = 3
LhairC1Mod.fk = True
LhairC1Mod.dynamic = True
LhairC1Mod.build()
LhairC1Mod.controllerColor = irGlobal.Controller.COLOR.BLUE
LhairC1Mod.controllerScale = 2
LhairC1Mod.postBuild()
LhairC1Mod.attachTo(upHeadMod)
globalMst.addModules(LhairC1Mod)
#LhairC1Mod.remove()

prefix = 'hairA1_R_'
joints = [u'SK_R_HairA1',
 u'SK_R_HairA2',
 u'SK_R_HairA3',
 u'SK_R_HairA4',
 u'SK_R_HairA5',
 u'SK_R_HairA6']
RhairA1Mod = irModule.String(prefix, joints)
RhairA1Mod.preBuild()
RhairA1Mod.negateScaleX = True
RhairA1Mod.numberOfControllers = 3
RhairA1Mod.fk = True
RhairA1Mod.dynamic = True
RhairA1Mod.build()
RhairA1Mod.controllerColor = irGlobal.Controller.COLOR.RED
RhairA1Mod.controllerScale = 2
RhairA1Mod.postBuild()
RhairA1Mod.attachTo(upHeadMod)
globalMst.addModules(RhairA1Mod)
#RhairA1Mod.remove()

prefix = 'hairB1_R_'
joints = [u'SK_R_HairB1',
 u'SK_R_HairB2',
 u'SK_R_HairB3',
 u'SK_R_HairB4',
 u'SK_R_HairB5',
 u'SK_R_HairB6']
RhairB1Mod = irModule.String(prefix, joints)
RhairB1Mod.preBuild()
RhairB1Mod.negateScaleX = True
RhairB1Mod.numberOfControllers = 3
RhairB1Mod.fk = True
RhairB1Mod.dynamic = True
RhairB1Mod.build()
RhairB1Mod.controllerColor = irGlobal.Controller.COLOR.RED
RhairB1Mod.postBuild()
RhairB1Mod.attachTo(upHeadMod)
globalMst.addModules(RhairB1Mod)
#RhairB1Mod.remove()

prefix = 'hairC1_R_'
joints = [u'SK_R_HairC1',
 u'SK_R_HairC2',
 u'SK_R_HairC3',
 u'SK_R_HairC4',
 u'SK_R_HairC5',
 u'SK_R_HairC6']
RhairC1Mod = irModule.String(prefix, joints)
RhairC1Mod.preBuild()
RhairC1Mod.negateScaleX = True
RhairC1Mod.numberOfControllers = 3
RhairC1Mod.fk = True
RhairC1Mod.dynamic = True
RhairC1Mod.build()
RhairC1Mod.controllerColor = irGlobal.Controller.COLOR.RED
RhairC1Mod.postBuild()
RhairC1Mod.attachTo(upHeadMod)
globalMst.addModules(RhairC1Mod)
#RhairC1Mod.remove()
# -----------------------------------------------------------------------------

prefix = 'upTeeth_'
joints = [u'SK_UpperTeeth']
upTeethSimpleMod = irModule.Simple(prefix, joints)
upTeethSimpleMod.preBuild()
upTeethSimpleMod.build()
upTeethSimpleMod.attachTo(upHeadMod)
globalMst.addModules(upTeethSimpleMod)
#upTeethSimpleMod.remove()

prefix = 'upFrontTeeth_'
joints = [u'SK_L_UpFontTeeth', u'SK_R_UpFrontTeeth']
upFrontTeethSimpleMod = irModule.Simple(prefix, joints)
upFrontTeethSimpleMod.preBuild()
upFrontTeethSimpleMod.negateScaleX = True
upFrontTeethSimpleMod.build()
upFrontTeethSimpleMod.attachTo(upTeethSimpleMod)
globalMst.addModules(upFrontTeethSimpleMod)
#upFrontTeethSimpleMod.remove()

prefix = 'jaw_'
joints = [u'SK_Jaw', u'SK_JawEnd']
jawMod = irModule.Jaw(prefix, joints)
jawMod.preBuild()
jawMod.build()
jawMod.attachTo(headMod)
globalMst.addModules(jawMod)
#jawMod.remove()

prefix = 'LowTeeth_'
joints = [u'SK_LowerTeeth']
lowTeethSimpleMod = irModule.Simple(prefix, joints)
lowTeethSimpleMod.preBuild()
lowTeethSimpleMod.build()
lowTeethSimpleMod.attachTo(jawMod)
globalMst.addModules(lowTeethSimpleMod)
#lowTeethSimpleMod.remove()

prefix = 'tongue_'
joints = [u'SK_Tongue1',
 u'SK_Tongue2',
 u'SK_Tongue3',
 u'SK_Tongue4',
 u'SK_Tongue5',
 u'SK_Tongue6']
tongueMod = irModule.String(prefix, joints)
tongueMod.preBuild()
tongueMod.numberOfControllers = 4
tongueMod.fk = True
tongueMod.build()
tongueMod.attachTo(jawMod)
globalMst.addModules(tongueMod)
#tongueMod.remove()

# ------------------------- Leg ------------------------------
prefix = 'leg_L_'
joints = [u'SK_L_Hip', u'SK_L_Knee', u'SK_L_Ankle']
LlegMod = irModule.TwoBoneLimb(prefix, joints)
LlegMod.preBuild()
LlegMod.build()
LlegMod.controllerColor = irGlobal.Controller.COLOR.BLUE
LlegMod.controllerScale = 2
LlegMod.postBuild()
LlegMod.attachTo(spineMod)
globalMst.addModules(LlegMod)
#LlegMod.remove()

prefix = 'foot_L_'
joints = [u'SK_L_Ankle', u'SK_L_Ball', u'SK_L_Toe']
LfootMod = irModule.Foot(prefix, joints)
LfootMod.preBuild()
LfootMod.build()
LfootMod.controllerColor = irGlobal.Controller.COLOR.BLUE
LfootMod.controllerScale = 3
LfootMod.postBuild()
LfootMod.attachTo(LlegMod)
globalMst.addModules(LfootMod)
#LfootMod.remove()

prefix = 'leg_R_'
joints = [u'SK_R_Hip', u'SK_R_Knee', u'SK_R_Ankle']
RlegMod = irModule.TwoBoneLimb(prefix, joints)
RlegMod.preBuild()
RlegMod.negateScaleX = True
RlegMod.build()
RlegMod.controllerColor = irGlobal.Controller.COLOR.RED
RlegMod.controllerScale = 2
RlegMod.postBuild()
RlegMod.attachTo(spineMod)
globalMst.addModules(RlegMod)
#RlegMod.remove()

prefix = 'foot_R_'
joints = [u'SK_R_Ankle', u'SK_R_Ball', u'SK_R_Toe']
RfootMod = irModule.Foot(prefix, joints)
RfootMod.preBuild()
RfootMod.build()
RfootMod.controllerColor = irGlobal.Controller.COLOR.RED
RfootMod.controllerScale = 3
RfootMod.postBuild()
RfootMod.attachTo(RlegMod)
globalMst.addModules(RfootMod)
#RfootMod.remove()
# ------------------------------------------------------------------------------

prefix = 'clavicle_L_'
joints = [u'SK_L_Clavicle', u'SK_L_Shoulder']
LclaMod = irModule.Clavicle(prefix, joints)
LclaMod.preBuild()
LclaMod.build()
LclaMod.controllerColor = irGlobal.Controller.COLOR.BLUE
LclaMod.controllerScale = 7
LclaMod.postBuild()
LclaMod.attachTo(spineMod)
globalMst.addModules(LclaMod)
#LclaMod.remove()

prefix = 'arm_L_'
joints = [u'SK_L_Shoulder', u'SK_L_Elbow', u'SK_L_Wrist']
LarmMod = irModule.TwoBoneLimb(prefix, joints)
LarmMod.preBuild()
LarmMod.build()
LarmMod.controllerColor = irGlobal.Controller.COLOR.BLUE
LarmMod.controllerScale = 1.5
LarmMod.postBuild()
LarmMod.attachTo(LclaMod)
globalMst.addModules(LarmMod)
#LarmMod.remove()

prefix = 'clavicle_R_'
joints = [u'SK_R_Clavicle', u'SK_R_Shoulder']
RclaMod = irModule.Clavicle(prefix, joints)
RclaMod.preBuild()
RclaMod.negateScaleX = True
RclaMod.build()
RclaMod.controllerColor = irGlobal.Controller.COLOR.RED
RclaMod.controllerScale = 7
RclaMod.postBuild()
RclaMod.attachTo(spineMod)
globalMst.addModules(RclaMod)
#RclaMod.remove()

prefix = 'arm_R_'
joints = [u'SK_R_Shoulder', u'SK_R_Elbow', u'SK_R_Wrist']
RarmMod = irModule.TwoBoneLimb(prefix, joints)
RarmMod.preBuild()
RarmMod.negateScaleX = True
RarmMod.build()
RarmMod.controllerColor = irGlobal.Controller.COLOR.RED
RarmMod.controllerScale = 1.5
RarmMod.postBuild()
RarmMod.attachTo(RclaMod)
globalMst.addModules(RarmMod)
#RarmMod.remove()

# ---------------- Fingers L Build --------------------------------------------
prefix = 'thumbFinger_L_'
joints = [u'SK_L_Thumb1', u'SK_L_Thumb2', u'SK_L_Thumb3', u'SK_L_ThumbEnd']
LthumbMod = irModule.Finger(prefix, joints)
LthumbMod.preBuild()
LthumbMod.build()
LthumbMod.controllerColor = irGlobal.Controller.COLOR.BLUE
LthumbMod.controllerScale = 1
LthumbMod.postBuild()
#LthumbMod.remove()

prefix = 'indexFinger_L_'
joints = [u'SK_L_IndexFinger1',
 u'SK_L_IndexFinger2',
 u'SK_L_IndexFinger3',
 u'SK_L_IndexFingerEnd']
LindexMod = irModule.Finger(prefix, joints)
LindexMod.preBuild()
LindexMod.build()
LindexMod.controllerColor = irGlobal.Controller.COLOR.BLUE
LindexMod.controllerScale = 1
LindexMod.postBuild()
#LindexMod.remove()

prefix = 'middleFinger_L_'
joints = [u'SK_L_MiddleFinger1',
 u'SK_L_MiddleFinger2',
 u'SK_L_MiddleFinger3',
 u'SK_L_MiddleFingerEnd']
LmiddleMod = irModule.Finger(prefix, joints)
LmiddleMod.preBuild()
LmiddleMod.build()
LmiddleMod.controllerColor = irGlobal.Controller.COLOR.BLUE
LmiddleMod.controllerScale = 1
LmiddleMod.postBuild()
#LmiddleMod.remove()

prefix = 'ringFinger_L_'
joints = [u'SK_L_RingFinger1',
 u'SK_L_RingFinger2',
 u'SK_L_RingFinger3',
 u'SK_L_RingFingerEnd']
LringMod = irModule.Finger(prefix, joints)
LringMod.preBuild()
LringMod.build()
LringMod.controllerColor = irGlobal.Controller.COLOR.BLUE
LringMod.controllerScale = 1
LringMod.postBuild()
#LringMod.remove()

prefix = 'fingers_L_'
LfingersMaster = irMaster.FingersMaster(prefix)
LfingersMaster.curlAxis = 'Z'
LfingersMaster.addModules(LthumbMod, LindexMod, LmiddleMod, LringMod)
LfingersMaster.build()
LfingersMaster.attachTo(LarmMod)
globalMst.addMasters(LfingersMaster)
#LfingersMaster.remove()

# ----------------------- Fingers R Build ----------------------------------------
prefix = 'thumbFinger_R_'
joints = [u'SK_R_Thumb1', u'SK_R_Thumb2', u'SK_R_Thumb3', u'SK_R_ThumbEnd']
RthumbMod = irModule.Finger(prefix, joints)
RthumbMod.preBuild()
RthumbMod.negateScaleX = True
RthumbMod.build()
RthumbMod.controllerColor = irGlobal.Controller.COLOR.RED
RthumbMod.controllerScale = 1
RthumbMod.postBuild()
#RthumbMod.remove()

prefix = 'indexFinger_R_'
joints = [u'SK_R_IndexFinger1',
 u'SK_R_IndexFinger2',
 u'SK_R_IndexFinger3',
 u'SK_R_IndexFingerEnd']
RindexMod = irModule.Finger(prefix, joints)
RindexMod.preBuild()
RindexMod.negateScaleX = True
RindexMod.build()
RindexMod.controllerColor = irGlobal.Controller.COLOR.RED
RindexMod.controllerScale = 1
RindexMod.postBuild()
#RindexMod.remove()

prefix = 'middleFinger_R_'
joints = [u'SK_R_MiddleFinger1',
 u'SK_R_MiddleFinger2',
 u'SK_R_MiddleFinger3',
 u'SK_R_MiddleFingerEnd']
RmiddleMod = irModule.Finger(prefix, joints)
RmiddleMod.preBuild()
RmiddleMod.negateScaleX = True
RmiddleMod.build()
RmiddleMod.controllerColor = irGlobal.Controller.COLOR.RED
RmiddleMod.controllerScale = 1
RmiddleMod.postBuild()
#RmiddleMod.remove()

prefix = 'ringFinger_R_'
joints = [u'SK_R_RingFinger1',
 u'SK_R_RingFinger2',
 u'SK_R_RingFinger3',
 u'SK_R_RingFingerEnd']
RringMod = irModule.Finger(prefix, joints)
RringMod.preBuild()
RringMod.negateScaleX = True
RringMod.build()
RringMod.controllerColor = irGlobal.Controller.COLOR.RED
RringMod.controllerScale = 1
RringMod.postBuild()
#RringMod.remove()

prefix = 'fingers_R_'
RfingersMaster = irMaster.FingersMaster(prefix)
RfingersMaster.curlAxis = 'Z'
RfingersMaster.addModules(RthumbMod, RindexMod, RmiddleMod, RringMod)
RfingersMaster.build()
RfingersMaster.attachTo(RarmMod)
globalMst.addMasters(RfingersMaster)
#RfingersMaster.remove()

# ---------------- Space Switch Setup ---------------------
mainCtrl = globalMst.mainController()
pelvisCtrl = spineMod.controllers()[0]
chestCtrl = spineMod.ikSystem().controllers()[-1]
neckCtrl = neckMod.ikSystem().controllers()[-1]
headCtrl = headMod.fkSystem().controllers()[0]
upHeadCtrl = upHeadMod.singleSystem().controllers()[0]

claLCtrl = LclaMod.fkSystem().controllers()[0]
claRCtrl = RclaMod.fkSystem().controllers()[0]

handLCtrl = LarmMod.ikSystem().ikHandleController()
shoulderLCtrl = LarmMod.fkSystem().controllers()[0]
handRCtrl = RarmMod.ikSystem().ikHandleController()
shoulderRCtrl = RarmMod.fkSystem().controllers()[0]

footLCtrl = LlegMod.ikSystem().ikHandleController()
footRCtrl = RlegMod.ikSystem().ikHandleController()


handLIkhCtrlSSBuilder = irGlobal.SpaceSwitchBuilder(handLCtrl,
                                                     [mainCtrl, pelvisCtrl, chestCtrl, headCtrl],
                                                     mainCtrl)
handLIkhCtrlSSBuilder.build(parent=True)
armLPvCtrlSSBuilder = irGlobal.SpaceSwitchBuilder(LarmMod.ikSystem().poleVectorController(),
                                                   [mainCtrl, chestCtrl, handLCtrl],
                                                   mainCtrl)
armLPvCtrlSSBuilder.build(parent=True)
shoulderLCtrlSSBuilder = irGlobal.SpaceSwitchBuilder(shoulderLCtrl,
                                                         [mainCtrl, claLCtrl],
                                                         claLCtrl)
shoulderLCtrlSSBuilder.build(orient=True)


handRIkhCtrlSSBuilder = irGlobal.SpaceSwitchBuilder(handRCtrl,
                                                     [mainCtrl, pelvisCtrl, chestCtrl, headCtrl],
                                                     mainCtrl)
handRIkhCtrlSSBuilder.build(parent=True)
armRPvCtrlSSBuilder = irGlobal.SpaceSwitchBuilder(RarmMod.ikSystem().poleVectorController(),
                                                   [mainCtrl, chestCtrl, handRCtrl],
                                                   mainCtrl)
armRPvCtrlSSBuilder.build(parent=True)
shoulderRCtrlSSBuilder = irGlobal.SpaceSwitchBuilder(shoulderRCtrl,
                                                         [mainCtrl, claRCtrl],
                                                         claRCtrl)
shoulderRCtrlSSBuilder.build(orient=True)


footRIkhCtrlSSBuilder = irGlobal.SpaceSwitchBuilder(footLCtrl,
                                                     [mainCtrl, pelvisCtrl],
                                                     mainCtrl)
footRIkhCtrlSSBuilder.build(parent=True)
legRPvCtrlSSBuilder = irGlobal.SpaceSwitchBuilder(LlegMod.ikSystem().poleVectorController(),
                                                   [mainCtrl, footLCtrl],
                                                   mainCtrl)
legRPvCtrlSSBuilder.build(parent=True)


footRIkhCtrlSSBuilder = irGlobal.SpaceSwitchBuilder(footRCtrl,
                                                     [mainCtrl, pelvisCtrl],
                                                     mainCtrl)
footRIkhCtrlSSBuilder.build(parent=True)
legRPvCtrlSSBuilder = irGlobal.SpaceSwitchBuilder(RlegMod.ikSystem().poleVectorController(),
                                                   [mainCtrl, footRCtrl],
                                                   mainCtrl)
legRPvCtrlSSBuilder.build(parent=True)


headCtrlSSBuilder = irGlobal.SpaceSwitchBuilder(headCtrl, [neckCtrl, mainCtrl], neckCtrl)
headCtrlSSBuilder.build(orient=True)


eyesCtrlSSBuilder = irGlobal.SpaceSwitchBuilder(eyesMaster.controller(), [upHeadCtrl, mainCtrl], upHeadCtrl)
eyesCtrlSSBuilder.build(parent=True)


