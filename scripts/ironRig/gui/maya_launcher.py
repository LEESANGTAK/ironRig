#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
Iron Rig Maya Launcher
Launches the Iron Rig GUI within Maya.
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

# Global variable to keep the window alive in Maya
_ironrig_window = None

def launch_in_maya():
    """Launch the Iron Rig GUI in Maya"""
    global _ironrig_window

    try:
        # Close existing window if it exists
        if _ironrig_window is not None:
            try:
                _ironrig_window.close()
                _ironrig_window.deleteLater()
            except:
                pass

        # Create and show main window
        _ironrig_window = MainWindow()
        _ironrig_window.show()

        # Bring window to front
        _ironrig_window.raise_()
        _ironrig_window.activateWindow()

        print("Iron Rig GUI launched successfully!")
        return _ironrig_window

    except Exception as e:
        print(f"Error launching Iron Rig GUI: {str(e)}")
        import traceback
        traceback.print_exc()
        return None


if __name__ == "__main__":
    # This will be called when running the script directly
    launch_in_maya()
