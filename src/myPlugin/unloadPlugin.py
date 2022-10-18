import sys
from telnetlib import Telnet
from argparse import ArgumentParser


def str2bool(v):
    if isinstance(v, bool):
        return v
    if v.lower() in ('yes', 'true', 't', 'y', '1'):
        return True
    elif v.lower() in ('no', 'false', 'f', 'n', '0'):
        return False
    else:
        sys.stdout.write('Boolean value expected.')


# A port number to connect with maya or other application
port = 20200

# Define system argument parser
parser = ArgumentParser()
parser.add_argument('-pn', '--pluginName', type=str,
                    metavar='Plugin name to load.',
                    nargs='?', default='', const='',
                    help='...')
parser.add_argument('-ns', '--newScene', type=str2bool,
                    metavar='Option for open new scene.',
                    nargs='?', default=True, const='',
                    help='...')

# Get values from arg parser
args = parser.parse_args()
pluginName = args.pluginName
newScene = args.newScene
print('{0}\n# Pre-Build Info\n Plugin Name: {1}\n New Scene: {2}\n{3}'.format('-'*80, pluginName, newScene, '-'*80))

# Construct commands string
cmdStr = 'flushUndo;'  # Unload plugin could be failed if command instance exists in the undo stack
if newScene:  # Unload plugin could be failed if nodes exists in the current scene
    cmdStr += 'file -newFile -force;'
cmdStr += 'catchQuiet(`unloadPlugin "{0}"`);'.format(pluginName)

# Throw the command to the connected application(maya)
try:
    tn = Telnet('localhost', port)
    tn.write(cmdStr.encode())
    tn.close()
except:
    sys.stdout.write('# Faild unload plugin "{0}"'.format(pluginName))
