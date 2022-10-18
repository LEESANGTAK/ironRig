import pymel.core as pm


class Container(object):
    def __init__(self, prefix=''):
        self._prefix = prefix
        self._topGrp = pm.createNode('transform', n='{}grp'.format(self._prefix))
        self.__set = pm.createNode('objectSet', n='{}set'.format(self._prefix))

    @property
    def prefix(self):
        return self._prefix

    @prefix.setter
    def prefix(self, prefix):
        self._prefix = prefix

    def topGrp(self):
        return self._topGrp

    def set(self):
        return self.__set

    def addMembers(self, *args):
        nodes = sum([node if isinstance(node, list) else [node] for node in args], [])
        self.__set.forceElement(nodes)

    def members(self):
        return self.__set.members()

    def remove(self):
        try:
            pm.delete(self.members())
        except:
            pass
        pm.delete(self._topGrp)
