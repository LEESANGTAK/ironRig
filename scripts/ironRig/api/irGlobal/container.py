from maya import cmds


class Side:
    LEFT = 'l'
    RIGHT = 'r'
    CENTER = 'c'


class Type:
    FK_SYSTEM = 'fkSys'
    IK_SYSTEM = 'ikSys'
    AIM_SYSTEM = 'aimSys'
    SPLINE_SYSTEM = 'spSys'
    RIBBON_SYSTEM = 'rbSys'
    MODULE = 'mod'
    MASTER = 'mst'


class Container(object):
    SIDE = Side
    TYPE = Type

    def __init__(self, name='new', side=Side.CENTER, type=Type.FK_SYSTEM):
        self._name = name
        self._side = side
        self._type = type
        self._set = cmds.createNode('objectSet', n='{}_set'.format(self.fullName))
        self._topGrp = cmds.createNode('transform', n='{}_grp'.format(self.fullName))
        self.addMembers(self._topGrp)

    @property
    def name(self):
        return self._name

    @name.setter
    def name(self, name):
        self._updateMembersName('{}_'.format(self._name), '{}_'.format(name))
        self._name = name

    @property
    def fullName(self):
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

    def addMembers(self, *args):
        nodes = sum([node if isinstance(node, list) else [node] for node in args], [])
        cmds.sets(nodes, add=self._set)

    def delete(self):
        cmds.delete(self.members)

    def _updateMembersName(self, oldStr, newStr):
        for member in self.members:
            newMemeberName = member.replace(oldStr, newStr)
            cmds.rename(member, newMemeberName)

        newSetName = self._set.replace(oldStr, newStr)
        self._set = cmds.rename(self._set, newSetName)
        self._topGrp = self._topGrp.replace(oldStr, newStr)
