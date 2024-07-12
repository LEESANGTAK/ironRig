import re
from .serializable import Serializable
from .attribute import Attribute
from ...common import logger


class CustomScript(Serializable):
    def __init__(self, name='none', code=''):
        super().__init__()
        self._name = name
        self._code = code
        self._attributes = []

    def __repr__(self):
        return "irGlobal.{}('{}')".format(self.__class__.__name__, self._name)

    @property
    def name(self):
        return self._name

    @name.setter
    def name(self, name):
        self._name = name

    @property
    def code(self):
        return self._code

    @code.setter
    def code(self, code):
        self._code = code

    def addAttribute(self, name='', type=None, value=None):
        self._attributes.append(Attribute(name, type, value))

    def _getAttribute(self, name):
        for attr in self._attributes:
            if attr.name == name:
                return attr

    def run(self):
        logger.info('execute "{}" script.'.format(self._name))
        code = self._processCode()
        return exec(code)

    def _processCode(self):
        """Replace attributes used in the code to actual value.
        """
        code = self._code
        attrStrs = re.findall('(@.+?)[^a-zA-Z0-9]', self._code)
        for attrStr in attrStrs:
            attr = self._getAttribute(attrStr.strip('@'))
            attrVal = '"{}"'.format(attr.value) if attr.type == Attribute.TYPE.STRING else str(attr.value)
            code = code.replace(attrStr, attrVal, 1)
        return code

    def serialize(self):
        return {
            'name': self._name,
            'code': self._code,
            'attributes': [attr.serialize() for attr in self._attributes]
        }

    def deserialize(self, data, hashmap={}):
        super().deserialize(data, hashmap)
        self._code = data.get('code')
        for attrData in data.get('attributes'):
            attr = Attribute()
            attr.deserialize(attrData, hashmap)
            self._attributes.append(attr)
        self.run()
