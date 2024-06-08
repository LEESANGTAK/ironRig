from imp import reload
import ironRig; reload(ironRig)
import ironRig.api.irGlobal as irg
import ironRig.api.irSystem as irs
import ironRig.api.irModule as irm
import ironRig.api.irMaster as irmst


globalMst = irmst.GlobalMaster('root', True)
globalMst.build()
globalMst.controllerScale = 50
#globalMst.remove()

name = 'spine'
joints = ['Pelvis', 'Spine', 'Spine1', 'Spine2', 'Spine3', 'Spine4', 'Spine5']
spineMod = irm.Spine(name, irm.Module.SIDE.CENTER, joints)
spineMod.preBuild()
spineMod.build()
spineMod.controllerSize = 10
globalMst.addModules(spineMod)
#spineMod.delete()

name = 'neck'
joints = ['Neck', 'Neck1', 'Head']
neckMod = irm.Neck(name, irm.Module.SIDE.CENTER, joints)
neckMod.numControllers = 2
neckMod.preBuild()
neckMod.build()
neckMod.controllerSize = 10
neckMod.attachTo(spineMod)
globalMst.addModules(neckMod)
#neckMod.delete()

name = 'clavicle'
joints = ['LClavicle', 'LUpperArm']
claLMod = irm.LimbBase(name, irm.Module.SIDE.LEFT, joints)
claLMod.preBuild()
claLMod.build()
claLMod.controllerColor = irg.Controller.COLOR.BLUE
claLMod.controllerSize = 20
claLMod.attachTo(spineMod)
globalMst.addModules(claLMod)
#claLMod.delete()

claRMod = claLMod.mirror('L')
claRMod.attachTo(spineMod)
globalMst.addModules(claRMod)
#claRMod.delete()

name = 'arm'
joints = ['LUpperArm', 'LForearm', 'LHand']
armLMod = irm.TwoBoneLimb(name, irm.Module.SIDE.LEFT, joints)
armLMod.preBuild()
armLMod.build()
armLMod.controllerColor = irg.Controller.COLOR.BLUE
armLMod.controllerSize = 7
armLMod.attachTo(claLMod)
globalMst.addModules(armLMod)
#armLMod.delete()

armRMod = armLMod.mirror('L')
armRMod.attachTo(claRMod)
globalMst.addModules(armRMod)
#armRMod.delete()


name = 'leg'
joints = ['LThigh', 'LCalf', 'LFoot']
legLMod = irm.TwoBoneLimb(name, irm.Module.SIDE.LEFT, joints)
legLMod.preBuild()
legLMod.build()
legLMod.controllerColor = irg.Controller.COLOR.BLUE
legLMod.controllerSize = 7
legLMod.attachTo(spineMod)
globalMst.addModules(legLMod)
#legLMod.delete()

name = 'leg'
joints = ['RThigh', 'RCalf', 'RFoot']
legRMod = irm.TwoBoneLimb(name, joints)
legRMod.preBuild()
legRMod.build()
legRMod.controllerColor = irg.Controller.COLOR.RED
legRMod.controllerSize = 7
legRMod.attachTo(spineMod)
globalMst.addModules(legRMod)
#legRMod.delete()

name = 'foot'
joints = ['LeftFoot', 'LeftToeBase', 'LeftToe_End']
footLMod = irm.Foot(name, irm.Module.SIDE.LEFT, joints)
footLMod.preBuild()
footLMod.build()
footLMod.controllerColor = irg.Controller.COLOR.BLUE
footLMod.controllerSize = 7
footLMod.attachTo(legLMod)
globalMst.addModules(footLMod)
#footLMod.delete()

name = 'foot'
joints = ['RightFoot', 'RightToeBase', 'RightToe_End']
footRMod = irm.Foot(name, joints)
footRMod.preBuild()
footRMod.negateScaleX = True
footRMod.build()
footRMod.controllerColor = irg.Controller.COLOR.RED
footRMod.controllerSize = 7
footRMod.attachTo(legRMod)
globalMst.addModules(footRMod)
#footRMod.delete()

# ---------------------------------------------------------------------------

# Fingers L Build
name = 'thumbFinger'
joints = ['ThumbFinger1_L1',
 'ThumbFinger2_L1',
 'ThumbFinger3_L1',
 'ThumbFinger4_L1']
thumbLMod = irm.Finger(name, joints)
thumbLMod.preBuild()
thumbLMod.build()
thumbLMod.controllerColor = irg.Controller.COLOR.BLUE
thumbLMod.controllerSize = 2
#thumbLMod.delete()

name = 'indexFinger'
joints = ['IndexFinger1_L1',
 'IndexFinger2_L1',
 'IndexFinger3_L1',
 'IndexFinger4_L1']
indexLMod = irm.Finger(name, joints)
indexLMod.preBuild()
indexLMod.build()
indexLMod.controllerColor = irg.Controller.COLOR.BLUE
indexLMod.controllerSize = 2
#indexLMod.delete()

name = 'middleFinger'
joints = ['MiddleFinger1_L1',
 'MiddleFinger2_L1',
 'MiddleFinger3_L1',
 'MiddleFinger4_L1']
middleLMod = irm.Finger(name, joints)
middleLMod.preBuild()
middleLMod.build()
middleLMod.controllerColor = irg.Controller.COLOR.BLUE
middleLMod.controllerSize = 2
#middleLMod.delete()

name = 'ringFinger'
joints = ['RingFinger1_L1',
 'RingFinger2_L1',
 'RingFinger3_L1',
 'RingFinger4_L1']
ringLMod = irm.Finger(name, joints)
ringLMod.preBuild()
ringLMod.build()
ringLMod.controllerColor = irg.Controller.COLOR.BLUE
ringLMod.controllerSize = 2
#ringLMod.delete()

name = 'pinkyFinger'
joints = ['PinkyFinger1_L1',
 'PinkyFinger2_L1',
 'PinkyFinger3_L1',
 'PinkyFinger4_L1']
pinkyLMod = irm.Finger(name, joints)
pinkyLMod.preBuild()
pinkyLMod.build()
pinkyLMod.controllerColor = irg.Controller.COLOR.BLUE
pinkyLMod.controllerSize = 2
#pinkyLMod.delete()

name = 'fingers'
fingersLMaster = irmst.FingersMaster(name)
fingersLMaster.addModules(thumbLMod, indexLMod, middleLMod, ringLMod, pinkyLMod)
fingersLMaster.build()
fingersLMaster.attachTo(armLMod)
globalMst.addMasters(fingersLMaster)
#fingersLMaster.delete()

# ---------------------------------------------------------------------------
# Fingers R Build
name = 'thumbFinger'
joints = ['ThumbFinger1_R1',
 'ThumbFinger2_R1',
 'ThumbFinger3_R1',
 'ThumbFinger4_R1']
thumbRMod = irm.Finger(name, joints)
thumbRMod.preBuild()
thumbRMod.negateScaleX = True
thumbRMod.build()
thumbRMod.controllerColor = irg.Controller.COLOR.RED
thumbRMod.controllerSize = 2
#thumbRMod.delete()

name = 'indexFinger'
joints = ['IndexFinger1_R1',
 'IndexFinger2_R1',
 'IndexFinger3_R1',
 'IndexFinger4_R1']
indexRMod = irm.Finger(name, joints)
indexRMod.preBuild()
indexRMod.negateScaleX = True
indexRMod.build()
indexRMod.controllerColor = irg.Controller.COLOR.RED
indexRMod.controllerSize = 2
#indexRMod.delete()

name = 'middleFinger'
joints = ['MiddleFinger1_R1',
 'MiddleFinger2_R1',
 'MiddleFinger3_R1',
 'MiddleFinger4_R1']
middleRMod = irm.Finger(name, joints)
middleRMod.preBuild()
middleRMod.negateScaleX = True
middleRMod.build()
middleRMod.controllerColor = irg.Controller.COLOR.RED
middleRMod.controllerSize = 2
#middleRMod.delete()

name = 'ringFinger'
joints = ['RingFinger1_R1',
 'RingFinger2_R1',
 'RingFinger3_R1',
 'RingFinger4_R1']
ringRMod = irm.Finger(name, joints)
ringRMod.preBuild()
ringRMod.negateScaleX = True
ringRMod.build()
ringRMod.controllerColor = irg.Controller.COLOR.RED
ringRMod.controllerSize = 2
#ringRMod.delete()

name = 'pinkyFinger'
joints = ['PinkyFinger1_R1',
 'PinkyFinger2_R1',
 'PinkyFinger3_R1',
 'PinkyFinger4_R1']
pinkyRMod = irm.Finger(name, joints)
pinkyRMod.preBuild()
pinkyRMod.negateScaleX = True
pinkyRMod.build()
pinkyRMod.controllerColor = irg.Controller.COLOR.RED
pinkyRMod.controllerSize = 2
#pinkyRMod.delete()

name = 'fingers'
fingersRMaster = irmst.FingersMaster(name)
fingersRMaster.addModules(thumbRMod, indexRMod, middleRMod, ringRMod, pinkyRMod)
fingersRMaster.build()
fingersRMaster.attachTo(armRMod)
globalMst.addMasters(fingersRMaster)
#fingersRMaster.delete()

# ---------------- Space Switch Setup ---------------------
mainCtrl = globalMst.mainController()
pelvisCtrl = spineMod.controllers()[0]
chestCtrl = spineMod.ikSystem().controllers()[-1]
neckCtrl = neckMod.ikSystem().controllers()[-1]
headCtrl = headMod.fkSystem().controllers()[0]

claLCtrl = claLMod.fkSystem().controllers()[0]
claRCtrl = claRMod.fkSystem().controllers()[0]

handLCtrl = armLMod.ikSystem().ikHandleController()
shoulderLCtrl = armLMod.fkSystem().controllers()[0]
handRCtrl = armRMod.ikSystem().ikHandleController()
shoulderRCtrl = armRMod.fkSystem().controllers()[0]

footLCtrl = legLMod.ikSystem().ikHandleController()
footRCtrl = legRMod.ikSystem().ikHandleController()


handLIkhCtrlSSBuilder = irg.SpaceSwitchBuilder(handLCtrl,
                                                     [mainCtrl, pelvisCtrl, chestCtrl, headCtrl],
                                                     mainCtrl)
handLIkhCtrlSSBuilder.build(parent=True)
shoulderLIkhCtrlSSBuilder = irg.SpaceSwitchBuilder(shoulderLCtrl,
                                                         [mainCtrl, claLCtrl],
                                                         claLCtrl)
shoulderLIkhCtrlSSBuilder.build(orient=True)
armLPvCtrlSSBuilder = irg.SpaceSwitchBuilder(armLMod.ikSystem().poleVectorController(),
                                                   [mainCtrl, chestCtrl, handLCtrl],
                                                   mainCtrl)
armLPvCtrlSSBuilder.build(parent=True)


handRIkhCtrlSSBuilder = irg.SpaceSwitchBuilder(handRCtrl,
                                                     [mainCtrl, pelvisCtrl, chestCtrl, headCtrl],
                                                     mainCtrl)
handRIkhCtrlSSBuilder.build(parent=True)
shoulderRIkhCtrlSSBuilder = irg.SpaceSwitchBuilder(shoulderRCtrl,
                                                         [mainCtrl, claRCtrl],
                                                         claRCtrl)
shoulderRIkhCtrlSSBuilder.build(orient=True)
armRPvCtrlSSBuilder = irg.SpaceSwitchBuilder(armRMod.ikSystem().poleVectorController(),
                                                   [mainCtrl, chestCtrl, handRCtrl],
                                                   mainCtrl)
armRPvCtrlSSBuilder.build(parent=True)


footRIkhCtrlSSBuilder = irg.SpaceSwitchBuilder(footLCtrl,
                                                     [mainCtrl, pelvisCtrl],
                                                     mainCtrl)
footRIkhCtrlSSBuilder.build(parent=True)
legRPvCtrlSSBuilder = irg.SpaceSwitchBuilder(legLMod.ikSystem().poleVectorController(),
                                                   [mainCtrl, footLCtrl],
                                                   mainCtrl)
legRPvCtrlSSBuilder.build(parent=True)


footRIkhCtrlSSBuilder = irg.SpaceSwitchBuilder(footRCtrl,
                                                     [mainCtrl, pelvisCtrl],
                                                     mainCtrl)
footRIkhCtrlSSBuilder.build(parent=True)
legRPvCtrlSSBuilder = irg.SpaceSwitchBuilder(legRMod.ikSystem().poleVectorController(),
                                                   [mainCtrl, footRCtrl],
                                                   mainCtrl)
legRPvCtrlSSBuilder.build(parent=True)


headCtrlSSBuilder = irg.SpaceSwitchBuilder(headCtrl, [neckCtrl, mainCtrl], neckCtrl)
headCtrlSSBuilder.build(orient=True)


eyesCtrlSSBuilder = irg.SpaceSwitchBuilder(eyesMaster.controller(), [headCtrl, mainCtrl], headCtrl)
eyesCtrlSSBuilder.build(parent=True)
