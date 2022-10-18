import sys
import os
import glob
from telnetlib import Telnet
from argparse import ArgumentParser


# A port number to connect with maya or other application
port = 20200

# Define system argument parser
parser = ArgumentParser()
parser.add_argument('-pn', '--pluginName', type=str,
                    metavar='Plugin name to load.',
                    nargs='?', default='', const='',
                    help='...')
parser.add_argument('-ts', '--testScene', type=str,
                    metavar='Test scene path to open.',
                    nargs='?', default='', const='',
                    help='...')

# Get values from arg parser
args = parser.parse_args()
pluginName = args.pluginName.replace('\\', '/')
scriptDir = pluginName.rsplit('plug-ins', 1)[0] + 'scripts'
testScene = args.testScene
print('{0}\n# Post-Build Info\n Plugin Name: {1}\n Test Scene: {2}\n{3}'.format('-'*80, pluginName, testScene, '-'*80))

# Construct commands string
def addMelScripts(scriptDir, commandStr):
    melScripts = glob.glob('{0}/*.mel'.format(scriptDir))
    if melScripts:
        for script in [os.path.basename(melScript) for melScript in melScripts]:
            commandStr += 'source "{0}/{1}"'.format(scriptDir, script)
    return commandStr

cmdStr = 'catchQuiet(`loadPlugin "{0}"`);'.format(pluginName)
cmdStr = addMelScripts(scriptDir, cmdStr)
if testScene:
    testScene = testScene.replace('\\', '/')
    cmdStr += 'file -open -force "{0}";'.format(testScene)

# Throw the command to the connected application(maya)
try:
    tn = Telnet('localhost', port)
    tn.write(cmdStr.encode())
    tn.close()
except:
    sys.stdout.write('# Faild load plugin "{0}"'.format(pluginName))
