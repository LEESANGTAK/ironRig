from functools import wraps
import pymel.core as pm


def undoAtOnce(func):
    @wraps(func)
    def wrapper(*args, **kwargs):
        pm.undoInfo(openChunk=True)
        result = func(*args, **kwargs)
        pm.undoInfo(closeChunk=True)
        return result
    return wrapper
