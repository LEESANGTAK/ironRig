from .serializable import Serializable
from ...common import logger


class CustomScript(Serializable):
    def __init__(self, name='', code=''):
        self._name = name
        self._code = code

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

    def run(self):
        logger.info('execute "{}" script.'.format(self._name))
        return exec(self._code)

    def serialize(self):
        return {
            'name': self._name,
            'code': self._code,
        }

    def deserialize(self, data, hashmap={}):
        super().deserialize(data, hashmap)
        self._code = data.get('code')
        self.run()
