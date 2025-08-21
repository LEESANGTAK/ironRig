#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
Iron Rig GUI Command for Maya
Simple command to launch Iron Rig GUI in Maya.
"""

import sys
import os

# Global variable to keep the window alive in Maya
_ironrig_window = None

def run_ironrig():
    """Run Iron Rig GUI in Maya"""
    global _ironrig_window

    try:
        # Get the directory containing this script
        current_dir = os.path.dirname(os.path.abspath(__file__))
        scripts_dir = os.path.dirname(current_dir)

        # Add to Python path
        if scripts_dir not in sys.path:
            sys.path.insert(0, scripts_dir)

        # Import and run the Maya launcher
        from ironRig.gui.maya_launcher import launch_in_maya
        _ironrig_window = launch_in_maya()

        if _ironrig_window:
            print("Iron Rig GUI is now running!")
            return _ironrig_window
        else:
            print("Failed to launch Iron Rig GUI.")
            return None

    except Exception as e:
        print(f"Error: {str(e)}")
        print("Make sure Qt.py is available in the scripts directory.")
        import traceback
        traceback.print_exc()
        return None

def close_ironrig():
    """Close the Iron Rig GUI"""
    global _ironrig_window

    if _ironrig_window is not None:
        try:
            _ironrig_window.close()
            _ironrig_window.deleteLater()
            _ironrig_window = None
            print("Iron Rig GUI closed.")
        except:
            pass


# For Maya command line usage
if __name__ == "__main__":
    run_ironrig()
