from imp import reload

# -------------- Module Build ---------------------
import ironRig as ir; reload(ir)
from ironRig.api import irGlobal
from ironRig.api import irMaster
from ironRig.api import irModule


globalMst = irMaster.GlobalMaster(skeletonRoot='skeleton', cogJoint='Hips')
globalMst.build()
globalMst.controllerSize = 50
globalMst.postBuild()
#globalMst.remove()

prefix = 'spine_'
joints = [u'Hips', u'Spine', u'Spine1', u'Spine2']
spineMod = irModule.Spine(prefix, joints)
spineMod.preBuild()
spineMod.build()
spineMod.controllerSize = 20
spineMod.postBuild()
globalMst.addModules(spineMod)
#spineMod.remove()

prefix = 'neck_'
joints = [u'Neck', 'Neck1', u'Head']
neckMod = irModule.Neck(prefix, joints)
neckMod.preBuild()
neckMod.numControllers = 2
neckMod.build()
neckMod.controllerSize = 20
neckMod.postBuild()
neckMod.attachTo(spineMod)
globalMst.addModules(neckMod)
#neckMod.remove()


# ---------------------------------------------------------------------------

prefix = 'clavicle_L_'
joints = [u'LeftShoulder', u'LeftArm']
claLMod = irModule.Clavicle(prefix, joints)
claLMod.preBuild()
claLMod.build()
claLMod.controllerColor = irGlobal.Controller.COLOR.BLUE
claLMod.controllerSize = 20
claLMod.postBuild()
claLMod.attachTo(spineMod)
globalMst.addModules(claLMod)
#claLMod.remove()

prefix = 'clavicle_R_'
joints = [u'RightShoulder', u'RightArm']
claRMod = irModule.Clavicle(prefix, joints)
claRMod.preBuild()
claRMod.negateScaleX = True
claRMod.build()
claRMod.controllerColor = irGlobal.Controller.COLOR.RED
claRMod.controllerSize = 20
claRMod.postBuild()
claRMod.attachTo(spineMod)
globalMst.addModules(claRMod)
#claRMod.remove()

prefix = 'arm_L_'
joints = [u'LeftArm', u'LeftForeArm', u'LeftHand']
armLMod = irModule.TwoBoneLimb(prefix, joints)
armLMod.preBuild()
armLMod.build()
armLMod.controllerColor = irGlobal.Controller.COLOR.BLUE
armLMod.controllerSize = 7
armLMod.postBuild()
armLMod.attachTo(claLMod)
globalMst.addModules(armLMod)
#armLMod.remove()

prefix = 'arm_R_'
joints = [u'RightArm', u'RightForeArm', u'RightHand']
armRMod = irModule.TwoBoneLimb(prefix, joints)
armRMod.preBuild()
armRMod.negateScaleX = True
armRMod.build()
armRMod.controllerColor = irGlobal.Controller.COLOR.RED
armRMod.controllerSize = 7
armRMod.postBuild()
armRMod.attachTo(claRMod)
globalMst.addModules(armRMod)
#armRMod.remove()

prefix = 'leg_L_'
joints = [u'LeftUpLeg', u'LeftLeg', u'LeftFoot']
legLMod = irModule.TwoBoneLimb(prefix, joints)
legLMod.preBuild()
legLMod.build()
legLMod.controllerColor = irGlobal.Controller.COLOR.BLUE
legLMod.controllerSize = 7
legLMod.postBuild()
legLMod.attachTo(spineMod)
globalMst.addModules(legLMod)
#legLMod.remove()

prefix = 'leg_R_'
joints = [u'RightUpLeg', u'RightLeg', u'RightFoot']
legRMod = irModule.TwoBoneLimb(prefix, joints)
legRMod.preBuild()
legRMod.negateScaleX = True
legRMod.build()
legRMod.controllerColor = irGlobal.Controller.COLOR.RED
legRMod.controllerSize = 7
legRMod.postBuild()
legRMod.attachTo(spineMod)
globalMst.addModules(legRMod)
#legRMod.remove()

prefix = 'foot_L_'
joints = [u'LeftFoot', u'LeftToeBase', u'LeftToe_End']
footLMod = irModule.Foot(prefix, joints)
footLMod.preBuild()
footLMod.build()
footLMod.controllerColor = irGlobal.Controller.COLOR.BLUE
footLMod.controllerSize = 7
footLMod.postBuild()
footLMod.attachTo(legLMod)
globalMst.addModules(footLMod)
#footLMod.remove()

prefix = 'foot_R_'
joints = [u'RightFoot', u'RightToeBase', u'RightToe_End']
footRMod = irModule.Foot(prefix, joints)
footRMod.preBuild()
footRMod.negateScaleX = True
footRMod.build()
footRMod.controllerColor = irGlobal.Controller.COLOR.RED
footRMod.controllerSize = 7
footRMod.postBuild()
footRMod.attachTo(legRMod)
globalMst.addModules(footRMod)
#footRMod.remove()

# ---------------------------------------------------------------------------

# Fingers L Build
prefix = 'thumbFinger_L_'
joints = [u'LeftHandThumb1',
 u'LeftHandThumb2',
 u'LeftHandThumb3',
 u'LeftHandThumb4']
thumbLMod = irModule.Finger(prefix, joints)
thumbLMod.preBuild()
thumbLMod.build()
thumbLMod.controllerColor = irGlobal.Controller.COLOR.BLUE
thumbLMod.controllerSize = 2
thumbLMod.postBuild()
#thumbLMod.remove()

prefix = 'indexFinger_L_'
joints = [u'LeftHandIndex1',
 u'LeftHandIndex2',
 u'LeftHandIndex3',
 u'LeftHandIndex4']
indexLMod = irModule.Finger(prefix, joints)
indexLMod.preBuild()
indexLMod.build()
indexLMod.controllerColor = irGlobal.Controller.COLOR.BLUE
indexLMod.controllerSize = 2
indexLMod.postBuild()
#indexLMod.remove()

prefix = 'middleFinger_L_'
joints = [u'LeftHandMiddle1',
 u'LeftHandMiddle2',
 u'LeftHandMiddle3',
 u'LeftHandMiddle4']
middleLMod = irModule.Finger(prefix, joints)
middleLMod.preBuild()
middleLMod.build()
middleLMod.controllerColor = irGlobal.Controller.COLOR.BLUE
middleLMod.controllerSize = 2
middleLMod.postBuild()
#middleLMod.remove()

prefix = 'ringFinger_L_'
joints = [u'LeftHandRing1',
 u'LeftHandRing2',
 u'LeftHandRing3',
 u'LeftHandRing4']
ringLMod = irModule.Finger(prefix, joints)
ringLMod.preBuild()
ringLMod.build()
ringLMod.controllerColor = irGlobal.Controller.COLOR.BLUE
ringLMod.controllerSize = 2
ringLMod.postBuild()
#ringLMod.remove()

prefix = 'pinkyFinger_L_'
joints = [u'LeftHandPinky1',
 u'LeftHandPinky2',
 u'LeftHandPinky3',
 u'LeftHandPinky4']
pinkyLMod = irModule.Finger(prefix, joints)
pinkyLMod.preBuild()
pinkyLMod.build()
pinkyLMod.controllerColor = irGlobal.Controller.COLOR.BLUE
pinkyLMod.controllerSize = 2
pinkyLMod.postBuild()
#pinkyLMod.remove()

prefix = 'fingers_L_'
fingersLMaster = irMaster.FingersMaster(prefix)
fingersLMaster.addModules(thumbLMod, indexLMod, middleLMod, ringLMod, pinkyLMod)
fingersLMaster.build()
fingersLMaster.attachTo(armLMod)
globalMst.addMasters(fingersLMaster)
#fingersLMaster.remove()

# ---------------------------------------------------------------------------
# Fingers R Build
prefix = 'thumbFinger_R_'
joints = [u'RightHandThumb1',
 u'RightHandThumb2',
 u'RightHandThumb3',
 u'RightHandThumb4']
thumbRMod = irModule.Finger(prefix, joints)
thumbRMod.preBuild()
thumbRMod.negateScaleX = True
thumbRMod.build()
thumbRMod.controllerColor = irGlobal.Controller.COLOR.RED
thumbRMod.controllerSize = 2
thumbRMod.postBuild()
#thumbRMod.remove()

prefix = 'indexFinger_R_'
joints = [u'RightHandIndex1',
 u'RightHandIndex2',
 u'RightHandIndex3',
 u'RightHandIndex4']
indexRMod = irModule.Finger(prefix, joints)
indexRMod.preBuild()
indexRMod.negateScaleX = True
indexRMod.build()
indexRMod.controllerColor = irGlobal.Controller.COLOR.RED
indexRMod.controllerSize = 2
indexRMod.postBuild()
#indexRMod.remove()

prefix = 'middleFinger_R_'
joints = [u'RightHandMiddle1',
 u'RightHandMiddle2',
 u'RightHandMiddle3',
 u'RightHandMiddle4']
middleRMod = irModule.Finger(prefix, joints)
middleRMod.preBuild()
middleRMod.negateScaleX = True
middleRMod.build()
middleRMod.controllerColor = irGlobal.Controller.COLOR.RED
middleRMod.controllerSize = 2
middleRMod.postBuild()
#middleRMod.remove()

prefix = 'ringFinger_R_'
joints = [u'RightHandRing1',
 u'RightHandRing2',
 u'RightHandRing3',
 u'RightHandRing4']
ringRMod = irModule.Finger(prefix, joints)
ringRMod.preBuild()
ringRMod.negateScaleX = True
ringRMod.build()
ringRMod.controllerColor = irGlobal.Controller.COLOR.RED
ringRMod.controllerSize = 2
ringRMod.postBuild()
#ringRMod.remove()

prefix = 'pinkyFinger_R_'
joints = [u'RightHandPinky1',
 u'RightHandPinky2',
 u'RightHandPinky3',
 u'RightHandPinky4']
pinkyRMod = irModule.Finger(prefix, joints)
pinkyRMod.preBuild()
pinkyRMod.negateScaleX = True
pinkyRMod.build()
pinkyRMod.controllerColor = irGlobal.Controller.COLOR.RED
pinkyRMod.controllerSize = 2
pinkyRMod.postBuild()
#pinkyRMod.remove()

prefix = 'fingers_R_'
fingersRMaster = irMaster.FingersMaster(prefix)
fingersRMaster.addModules(thumbRMod, indexRMod, middleRMod, ringRMod, pinkyRMod)
fingersRMaster.build()
fingersRMaster.attachTo(armRMod)
globalMst.addMasters(fingersRMaster)
#fingersRMaster.remove()

# ---------------- Space Switch Setup ---------------------
mainCtrl = globalMst.mainController()
pelvisCtrl = spineMod.controllers()[0]
chestCtrl = spineMod.ikSystem().controllers()[-1]
neckCtrl = neckMod.ikSystem().controllers()[0]
headCtrl = neckMod.ikSystem().controllers()[-1]

claLCtrl = claLMod.fkSystem().controllers()[0]
claRCtrl = claRMod.fkSystem().controllers()[0]

handLCtrl = armLMod.ikSystem().ikHandleController()
shoulderLCtrl = armLMod.fkSystem().controllers()[0]
handRCtrl = armRMod.ikSystem().ikHandleController()
shoulderRCtrl = armRMod.fkSystem().controllers()[0]

footLCtrl = legLMod.ikSystem().ikHandleController()
footRCtrl = legRMod.ikSystem().ikHandleController()


handLIkhCtrlSSBuilder = irGlobal.SpaceSwitchBuilder(handLCtrl,
                                                     [mainCtrl, pelvisCtrl, chestCtrl, headCtrl],
                                                     mainCtrl)
handLIkhCtrlSSBuilder.build(parent=True)
shoulderLIkhCtrlSSBuilder = irGlobal.SpaceSwitchBuilder(shoulderLCtrl,
                                                         [mainCtrl, claLCtrl],
                                                         claLCtrl)
shoulderLIkhCtrlSSBuilder.build(orient=True)
armLPvCtrlSSBuilder = irGlobal.SpaceSwitchBuilder(armLMod.ikSystem().poleVectorController(),
                                                   [mainCtrl, chestCtrl, handLCtrl],
                                                   mainCtrl)
armLPvCtrlSSBuilder.build(parent=True)


handRIkhCtrlSSBuilder = irGlobal.SpaceSwitchBuilder(handRCtrl,
                                                     [mainCtrl, pelvisCtrl, chestCtrl, headCtrl],
                                                     mainCtrl)
handRIkhCtrlSSBuilder.build(parent=True)
shoulderRIkhCtrlSSBuilder = irGlobal.SpaceSwitchBuilder(shoulderRCtrl,
                                                         [mainCtrl, claRCtrl],
                                                         claRCtrl)
shoulderRIkhCtrlSSBuilder.build(orient=True)
armRPvCtrlSSBuilder = irGlobal.SpaceSwitchBuilder(armRMod.ikSystem().poleVectorController(),
                                                   [mainCtrl, chestCtrl, handRCtrl],
                                                   mainCtrl)
armRPvCtrlSSBuilder.build(parent=True)


footLIkhCtrlSSBuilder = irGlobal.SpaceSwitchBuilder(footLCtrl,
                                                     [mainCtrl, pelvisCtrl],
                                                     mainCtrl)
footLIkhCtrlSSBuilder.build(parent=True)
legLPvCtrlSSBuilder = irGlobal.SpaceSwitchBuilder(legLMod.ikSystem().poleVectorController(),
                                                   [mainCtrl, footLCtrl],
                                                   mainCtrl)
legLPvCtrlSSBuilder.build(parent=True)


footRIkhCtrlSSBuilder = irGlobal.SpaceSwitchBuilder(footRCtrl,
                                                     [mainCtrl, pelvisCtrl],
                                                     mainCtrl)
footRIkhCtrlSSBuilder.build(parent=True)
legRPvCtrlSSBuilder = irGlobal.SpaceSwitchBuilder(legRMod.ikSystem().poleVectorController(),
                                                   [mainCtrl, footRCtrl],
                                                   mainCtrl)
legRPvCtrlSSBuilder.build(parent=True)


headCtrlSSBuilder = irGlobal.SpaceSwitchBuilder(headCtrl, [neckCtrl, mainCtrl], neckCtrl)
headCtrlSSBuilder.build(orient=True)


eyesCtrlSSBuilder = irGlobal.SpaceSwitchBuilder(eyesMaster.controller(), [headCtrl, mainCtrl], headCtrl)
eyesCtrlSSBuilder.build(parent=True)
