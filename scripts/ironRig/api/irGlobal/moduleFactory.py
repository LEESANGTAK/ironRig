from ..irModule.spine import Spine
from ..irModule.neck import Neck
from ..irModule.twoBoneLimb import TwoBoneLimb
from ..irModule.threeBoneLimb import ThreeBoneLimb
from ..irModule.foot import Foot
from ..irModule.finger import Finger


MODULE_TABLE = {
    Spine.__name__: Spine,
    Neck.__name__: Neck,
    TwoBoneLimb.__name__: TwoBoneLimb,
    ThreeBoneLimb.__name__: ThreeBoneLimb,
    Foot.__name__: Foot,
    Finger.__name__: Finger,
}

class ModuleFactory():
    @staticmethod
    def getModule(type, name, side, skeletonJoints):
        return MODULE_TABLE[type](name, side, skeletonJoints)
