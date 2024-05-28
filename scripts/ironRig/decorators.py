from functools import wraps
from maya import cmds


def undoAtOnce(func):
    @wraps(func)
    def wrapper(*args, **kwargs):
        cmds.undoInfo(openChunk=True)
        result = func(*args, **kwargs)
        cmds.undoInfo(closeChunk=True)
        return result
    return wrapper
