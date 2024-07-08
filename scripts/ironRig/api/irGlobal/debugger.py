class Debugger(object):
    instance = None

    def __init__(self):
        self._breakID = None

    @property
    def breakID(self):
        return self._breakID

    def setBreakPoint(self, id):
        self._breakID = id

    @classmethod
    def getDebugger(cls):
        if cls.instance:
            return cls.instance
        cls.instance = cls()
        return cls.instance
