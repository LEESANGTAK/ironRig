from ..irModule.spine import Spine
from ..irModule.neck import Neck
from ..irModule.limbBase import LimbBase
from ..irModule.twoBoneLimb import TwoBoneLimb
from ..irModule.threeBoneLimb import ThreeBoneLimb
from ..irModule.foot import Foot
from ..irModule.finger import Finger
from ..irModule.string import String

from ..irMaster.fingersMaster import FingersMaster
from ..irMaster.eyesMaster import EyesMaster


MODULE_TABLE = {
    Spine.__name__: Spine,
    Neck.__name__: Neck,
    LimbBase.__name__: LimbBase,
    TwoBoneLimb.__name__: TwoBoneLimb,
    ThreeBoneLimb.__name__: ThreeBoneLimb,
    Foot.__name__: Foot,
    Finger.__name__: Finger,
    String.__name__: String,
}


MASTER_TABLE = {
    FingersMaster.__name__: FingersMaster,
    EyesMaster.__name__: EyesMaster,
}


class Factory():
    @staticmethod
    def getModule(type, name, side, skeletonJoints):
        return MODULE_TABLE[type](name, side, skeletonJoints)

    @staticmethod
    def getMaster(type, name, side):
        return MASTER_TABLE[type](name, side)
