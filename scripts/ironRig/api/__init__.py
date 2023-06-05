import imp

from . import irGlobal
from . import irSystem
from . import irModule
from . import irMaster

imp.reload(irGlobal)
imp.reload(irSystem)
imp.reload(irModule)
imp.reload(irMaster)

