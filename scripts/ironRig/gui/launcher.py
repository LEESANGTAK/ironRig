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
    from PyQt5.QtWidgets import QApplication
    from PyQt5.QtCore import Qt
    from PyQt5.QtGui import QIcon
except ImportError:
    print("Error: PyQt5 is required to run the Iron Rig GUI.")
    print("Please install PyQt5: pip install PyQt5")
    sys.exit(1)

from ironRig.gui.mainWindow import MainWindow


def main():
    """Main function to launch the Iron Rig GUI"""
    # Create Qt application
    app = QApplication(sys.argv)
    app.setApplicationName("Iron Rig Node Editor")
    app.setApplicationVersion("1.0")
    app.setOrganizationName("Iron Rig")
    
    # Set application style
    app.setStyle('Fusion')
    
    # Create and show main window
    mainWindow = MainWindow()
    mainWindow.show()
    
    # Set window icon if available
    # icon_path = os.path.join(scripts_dir, "icons", "ironrig_icon.png")
    # if os.path.exists(icon_path):
    #     mainWindow.setWindowIcon(QIcon(icon_path))
    
    # Run the application
    sys.exit(app.exec_())


if __name__ == "__main__":
    main()