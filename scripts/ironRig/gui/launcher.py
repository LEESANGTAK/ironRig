#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
Iron Rig Node Editor Launcher
Launches the Iron Rig node-based GUI for creating and connecting modules.
"""

import sys
import os

# Add the scripts directory to the Python path
scripts_dir = os.path.dirname(os.path.abspath(__file__))
if scripts_dir not in sys.path:
    sys.path.insert(0, scripts_dir)

try:
    from Qt import QtWidgets, QtCore, QtGui
except ImportError:
    print("Error: Qt.py is required to run the Iron Rig GUI.")
    print("Please ensure Qt.py is available in the scripts directory.")
    sys.exit(1)

from ironRig.gui.mainWindow import MainWindow


def main():
    """Main function to launch the Iron Rig GUI"""
    # Check if we're running in Maya
    try:
        import maya.cmds as cmds
        in_maya = True
    except ImportError:
        in_maya = False

    if not in_maya:
        # Create Qt application for standalone mode
        app = QtWidgets.QApplication(sys.argv)
        app.setApplicationName("Iron Rig Node Editor")
        app.setApplicationVersion("1.0")
        app.setOrganizationName("Iron Rig")
        app.setStyle('Fusion')

    # Create and show main window
    mainWindow = MainWindow()
    mainWindow.show()

    # Set window icon if available
    # icon_path = os.path.join(scripts_dir, "icons", "ironrig_icon.png")
    # if os.path.exists(icon_path):
    #     mainWindow.setWindowIcon(QtGui.QIcon(icon_path))

    # Run the application
    if not in_maya:
        sys.exit(app.exec_())


if __name__ == "__main__":
    main()