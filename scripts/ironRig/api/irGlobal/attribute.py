import os
from .serializable import Serializable


class Type:
    NUMBER = 0
    STRING = 1


class Attribute(Serializable):
    TYPE = Type

    def __init__(self, name='new', type=None, value=None):
        super().__init__()
        self._name = name
        self._type = type
        self._value = value

        self._handleBackslash()

    def __repr__(self):
        return "irGlobal.{}('{}')".format(self.__class__.__name__, self._name)

    @property
    def name(self):
        return self._name

    @name.setter
    def name(self, name):
        self._name = name

    @property
    def type(self):
        return self._type

    @type.setter
    def type(self, type):
        self._type = type

    @property
    def value(self):
        return self._value

    @value.setter
    def value(self, value):
        self._value = value
        self._handleBackslash()

    def _handleBackslash(self):
        if self._value and self._type == Type.STRING:
            encodedString = self._value.encode('unicode_escape').decode('utf-8')
            self._value = os.path.normpath(encodedString).replace('\\', '/')

    def serialize(self):
        return {
            'name': self._name,
            'type': self._type,
            'value': self._value
        }

    def deserialize(self, data, hashmap={}):
        super().deserialize(data, hashmap)
        self._name = data.get('name')
        self._type = data.get('type')
        self._value = data.get('value')
