from imp import reload

from . import master; reload(master)
from . import globalMaster; reload(globalMaster)
from . import fingersMaster; reload(fingersMaster)
from . import eyesMaster; reload(eyesMaster)


from .globalMaster import GlobalMaster
from .fingersMaster import FingersMaster
from .eyesMaster import EyesMaster
