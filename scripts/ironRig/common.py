import logging

# Get logger
logger = logging.getLogger("ironRig")
logger.setLevel(logging.DEBUG)


# Version info
VERSION_MAJOR = 1
VERSION_MINOR = 2
VERSION_MICRO = 5


SYMMETRY_CHAR_TABLE = {
    'l': 'r',
    'r': 'l',
    'c': 'c',
    'L': 'R',
    'R': 'L',
    'M': 'M',
}


SYMMETRY_COLOR_TABLE = {
    'red': 'blue',
    'blue': 'red',
    'yellow': 'yellow',
}