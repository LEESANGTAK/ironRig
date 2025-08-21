#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
Iron Rig GUI Runner for Maya
Simple script to launch Iron Rig GUI in Maya.
"""

import sys
import os

# Get the directory containing this script
current_dir = os.path.dirname(os.path.abspath(__file__))
scripts_dir = os.path.dirname(current_dir)

# Add to Python path
if scripts_dir not in sys.path:
    sys.path.insert(0, scripts_dir)

try:
    # Import and run the Maya launcher
    from ironRig.gui.maya_launcher import launch_in_maya
    main_window = launch_in_maya()

    if main_window:
        print("Iron Rig GUI is now running!")
    else:
        print("Failed to launch Iron Rig GUI.")

except Exception as e:
    print(f"Error: {str(e)}")
    print("Make sure Qt.py is available in the scripts directory.")
