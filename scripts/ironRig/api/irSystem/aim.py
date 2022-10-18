import pymel.core as pm
from ..irGlobal import Controller
from ... import utils
from .system import System


class Aim(System):
    def __init__(self, prefix='', joints=[]):
        super(Aim, self).__init__(prefix, joints)

        self.__aimLoc = None

    def _buildSystems(self):
        super(Aim, self)._buildSystems()
        aimVec = utils.getWorldPoint(self._joints[1]) - utils.getWorldPoint(self._joints[0])
        self.__aimLoc = pm.spaceLocator(n='{}aim_loc'.format(self._prefix))
        pm.xform(self.__aimLoc, t=utils.getWorldPoint(self._joints[0])+aimVec*3, ws=True)
        self._blbxGrp | self.__aimLoc

        upLoc =  pm.spaceLocator(n='{}up_loc'.format(self._prefix))
        pm.matchTransform(upLoc, self._joints[0])
        self._joints[0] | upLoc
        upLoc.translate.set(0, 1, 0)
        self._blbxGrp | upLoc

        pm.aimConstraint(self.__aimLoc,
                         self._joints[0],
                         aimVector=self._aimSign*utils.axisToVector(self._aimAxis),
                         upVector=[0, 1, 0],
                         worldUpType='object',
                         worldUpObject=upLoc)

    def _buildControls(self):
        aimCtrl = Controller('{}aim_ctrl'.format(self._prefix), Controller.SHAPE.LOCATOR)
        aimCtrl.matchTo(self.__aimLoc, position=True)
        if self._negateScaleX:
            aimCtrl.zeroGrp().sx.set(-1)
        aimCtrl.constraint(self.__aimLoc, point=True)
        aimCtrl.lockChannels(['rotate', 'scale', 'visibility'], ['X', 'Y', 'Z'])

        self._controllers.append(aimCtrl)
        self._controllerGrp | aimCtrl.zeroGrp()

        self.addMembers(aimCtrl.controllerNode())
