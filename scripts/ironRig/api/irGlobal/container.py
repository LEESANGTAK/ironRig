from maya import cmds
from .serializable import Serializable

class Side:
    NONE = 'n'
    LEFT = 'l'
    RIGHT = 'r'
    CENTER = 'c'


class Type:
    FK_SYSTEM = 'fkSys'
    IK_SYSTEM = 'ikSys'
    AIM_SYSTEM = 'aimSys'
    SPLINE_SYSTEM = 'spSys'
    RIBBON_SYSTEM = 'rbSys'
    FOOTIK_SYSTEM = 'fikSys'
    SINGLE_SYSTEM = 'sgSys'
    SQUASH_SYSTEM = 'sqSys'
    MODULE = 'mod'
    MASTER = 'mst'


class Container(Serializable):
    SIDE = Side
    TYPE = Type

    def __init__(self, name='new', side=Side.CENTER, type=Type.FK_SYSTEM):
        super().__init__()

        self._scene = None

        self._name = name
        self._side = side
        self._type = type

        self._set = None
        self._topGrp = None

        self._children = []
        self._parentModule = None
        self._parentModuleOutJointIndex = -1000000
        self._attachInfo = {
            'nodes': [],
            'attributes': [],
            'connections': [],
        }

    @property
    def scene(self):
        return self._scene

    @scene.setter
    def scene(self, scene):
        self._scene = scene

    @property
    def name(self):
        return self._name

    @name.setter
    def name(self, name):
        self._updateMembersName('{}_'.format(self._name), '{}_'.format(name))
        self._name = name

    @property
    def shortName(self):
        return '{}_{}'.format(self._name, self._side)

    @property
    def longName(self):
        return '{}_{}_{}'.format(self._name, self._side, self._type)

    @property
    def side(self):
        return self._side

    @side.setter
    def side(self, side):
        self._updateMembersName('_{}_'.format(self._side), '_{}_'.format(side))
        self._side = side

    @property
    def type(self):
        return self._type

    @type.setter
    def type(self, type):
        self._updateMembersName('_{}_'.format(self._type), '_{}_'.format(type))
        self._type = type

    @property
    def members(self):
        return cmds.sets(self._set, q=True)

    @property
    def set(self):
        return self._set

    @property
    def topGrp(self):
        return self._topGrp

    @property
    def parentModule(self):
        return self._parentModule

    @property
    def parentModuleOutJointIndex(self):
        return self._parentModuleOutJointIndex

    def addMembers(self, *args):
        nodes = sum([node if isinstance(node, list) else [node] for node in args], [])
        cmds.sets(nodes, add=self._set)

    def clear(self):
        cmds.delete(self.members)

    def _updateMembersName(self, oldStr, newStr):
        for member in self.members:
            newMemeberName = member.replace(oldStr, newStr)
            cmds.rename(member, newMemeberName)

        newSetName = self._set.replace(oldStr, newStr)
        self._set = cmds.rename(self._set, newSetName)
        self._topGrp = self._topGrp.replace(oldStr, newStr)

    def attachTo(self, parentModule, parentModuleOutJointIndex=-1000000):
        self._parentModule = parentModule
        self._parentModuleOutJointIndex = parentModuleOutJointIndex
        self._parentModule.addChildren(self)

    def addChildren(self, container):
        if not container in self._children:
            self._children.append(container)

    def detach(self):
        """Detach from the parent sapce. And remove created nodes, attributes when attached.
        """
        if not self._parentModule:
            return

        for node in self._attachInfo.get('nodes'):
            if cmds.objExists(node):
                cmds.delete(node)
        for driver, driven in self._attachInfo.get('connections'):
            cmds.disconnectAttr(driver, driven)
        for attr in self._attachInfo.get('attributes'):
            cmds.deleteAttr(attr)

        self._parentModule.removeChildren(self)

        # Initialize parent module data
        self._parentModule = None
        self._parentModuleOutJointIndex = -1000000
        self._attachInfo = {
            'nodes': [],
            'attributes': [],
            'connections': [],
        }

    def detachChildren(self):
        if self._children:
            for child in self._children:
                child.detach()

    def removeChildren(self, container):
        if container in self._children:
            self._children.remove(container)
