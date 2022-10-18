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
MODULE_VERSION = <'1.0.0'>
SHELF_ICON_FILE = <'icon.png'>
SHELF_BUTTON_COMMAND = <'''
Write command here
'''>


def onMayaDroppedPythonFile(*args, **kwargs):
    modulesDir = getModulesDirectory()
    createModuleFile(modulesDir)
    addScriptPath()
    loadPlugins()
    addShelfButtons()


def getModulesDirectory():
    modulesDir = None

    documentDir = os.path.expanduser('~')
    mayaAppDir = os.path.join(documentDir, 'maya')
    modulesDir = os.path.join(mayaAppDir, 'modules')

    if not os.path.exists(modulesDir):
        os.mkdir(modulesDir)

    return modulesDir


def createModuleFile(modulesDir):
    moduleFileName = '{0}.mod'.format(MODULE_NAME)

    contents = '+ MAYAVERSION:{0} {1} {2} {3}\nMAYA_PLUG_IN_PATH +:= plug-ins/{4}'.format(MAYA_VERSION, MODULE_NAME, MODULE_VERSION, MODULE_PATH, MAYA_VERSION)

    with open(os.path.join(modulesDir, moduleFileName), 'w') as f:
        f.write(contents)


def addScriptPath():
    scriptPath = MODULE_PATH + '/scripts'
    if not scriptPath in sys.path:
        sys.path.append(scriptPath)


def loadPlugins():
    pluginsPath = os.path.join(MODULE_PATH, 'plug-ins/{0}'.format(MAYA_VERSION))
    if os.path.exists(pluginsPath):
        pluginFiles = os.listdir(pluginsPath)
        if pluginFiles:
            for pluginFile in pluginFiles:
                cmds.loadPlugin(os.path.join(pluginsPath, pluginFile))


def addShelfButtons():
    curShelf = getCurrentShelf()

    cmds.shelfButton(
        command=SHELF_BUTTON_COMMAND,
        annotation=MODULE_NAME,
        sourceType='Python',
        image=SHELF_ICON_FILE,
        image1=SHELF_ICON_FILE,
        parent=curShelf
    )


def getCurrentShelf():
    curShelf = None

    shelf = mel.eval('$gShelfTopLevel = $gShelfTopLevel')
    curShelf = cmds.tabLayout(shelf, query=True, selectTab=True)

    return curShelf
