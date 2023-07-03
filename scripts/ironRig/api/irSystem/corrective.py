import pymel.core as pm
from ... import utils
from ..irGlobal import Controller
from .system import System


class Corrective(System):
    def __init__(self, prefix='', joints=[]):
        super(Corrective, self).__init__(prefix, joints)

    def _buildSystems(self):
        pass

    def _buildControls(self):
        pass
