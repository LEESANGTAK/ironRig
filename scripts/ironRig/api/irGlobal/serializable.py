class Serializable(object):
    def __init__(self):
        self._id = id(self)

    @property
    def id(self):
        return self._id

    def serialize(self):
        """Write data to restore object
        """
        raise NotImplementedError()

    def deserialize(self, data, hashmap={}):
        """Restore object with data

        :param data: objects information in json format
        :param hashmap: id key and object value data, defaults to {}
        """
        # Assign instance to id key for using other class deserialize
        hashmap[data.get('id')] = self
        self._id = data.get('id')
