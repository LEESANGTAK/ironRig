class Serializable(object):
    def serialize(self):
        raise NotImplementedError()

    def deserialize(self, data):
        raise NotImplementedError()
