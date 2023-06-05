import imp

from . import master
from . import globalMaster
from . import fingersMaster
from . import eyesMaster

imp.reload(master)
imp.reload(globalMaster)
imp.reload(fingersMaster)
imp.reload(eyesMaster)


from .globalMaster import GlobalMaster
from .fingersMaster import FingersMaster
from .eyesMaster import EyesMaster
