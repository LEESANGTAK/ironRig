"""
Author: TAK
Website: https://ta-note.com
Description:
    Drag and drop install.py file in maya viewport.
    Shelf button will added in the current shelf tab.
    "<moduleName>.mod" file will created in "Documents\maya\modules" directory automatically.
"""

import os
import sys

import maya.cmds as cmds
import maya.mel as mel


MAYA_VERSION = int(cmds.about(version=True))
MODULE_NAME = os.path.dirname(__file__).rsplit('/', 1)[-1]
MODULE_PATH = os.path.dirname(__file__)
# Need to modify below depend on module
MODULE_VERSION = 'any'
SHELF_ICON_FILE = 'pythonFamily.png'
SHELF_BUTTON_COMMAND = '''
Write command here
'''


def onMayaDroppedPythonFile(*args, **kwargs):
    removeOldInstallModule()
    addEnvPaths()
    # addShelfButtons()
    createModuleFile()
    cmds.confirmDialog(title='Info', message='"{}" module is installed successfully.'.format(MODULE_NAME))


def removeOldInstallModule():
    foundOldInstall = False
    for modName in sys.modules:
        if modName == 'install':
            foundOldInstall = True
            break
    if foundOldInstall:
        del(sys.modules[modName])


def addEnvPaths():
    # Add python paths
    pythonPaths = [
        '{}/scripts'.format(MODULE_PATH),
    ]
    for pythonPath in pythonPaths:
        sys.path.append(pythonPath)

    # Add plug-ins paths
    pluginsPaths = mel.eval('getenv "MAYA_PLUG_IN_PATH";')
    pluginsPaths += ';{}/plug-ins'.format(MODULE_PATH)
    pluginsPaths += ';{}/plug-ins/{}'.format(MODULE_PATH, MAYA_VERSION)
    mel.eval('putenv "MAYA_PLUG_IN_PATH" "{}";'.format(pluginsPaths))

    # Add icon folder path
    iconPaths = mel.eval('getenv "XBMLANGPATH";')
    iconPaths += ';{}/icons'.format(MODULE_PATH)
    mel.eval('putenv "XBMLANGPATH" "{}";'.format(iconPaths))


# def addShelfButtons():
#     curShelf = getCurrentShelf()

#     cmds.shelfButton(
#         command=SHELF_BUTTON_COMMAND,
#         annotation=MODULE_NAME,
#         sourceType='Python',
#         image=SHELF_ICON_FILE,
#         image1=SHELF_ICON_FILE,
#         parent=curShelf
#     )


# def getCurrentShelf():
#     curShelf = None

#     shelf = mel.eval('$gShelfTopLevel = $gShelfTopLevel')
#     curShelf = cmds.tabLayout(shelf, query=True, selectTab=True)

#     return curShelf


# Folders in the module directory that named as "icons, plug-ins, scripts" are automatically added to the maya environment variables.
def createModuleFile():
    moduleFileName = '{}.mod'.format(MODULE_NAME)

    contents = '''+ MAYAVERSION:2023 {0} {1} {2}

+ MAYAVERSION:2024 {0} {1} {2}
'''.format(MODULE_NAME, MODULE_VERSION, MODULE_PATH)

    with open(os.path.join(getModulesDirectory(), moduleFileName), 'w') as f:
        f.write(contents)


def getModulesDirectory():
    modulesDir = None

    mayaAppDir = cmds.internalVar(uad=True)
    modulesDir = os.path.join(mayaAppDir, 'modules')

    if not os.path.exists(modulesDir):
        os.mkdir(modulesDir)

    return modulesDir
