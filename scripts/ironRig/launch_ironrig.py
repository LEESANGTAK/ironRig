#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
Iron Rig Launch Script for Maya
Simple one-line script to launch Iron Rig GUI in Maya.

Usage in Maya Python console:
exec(open('D:/tools/maya/modules/ironRig/scripts/ironRig/launch_ironrig.py').read())

Or if the module is properly installed:
import ironRig.launch_ironrig
"""

import sys
import os

def main():
    """Main launch function"""
    try:
        # Get the directory containing this script
        current_dir = os.path.dirname(os.path.abspath(__file__))
        scripts_dir = os.path.dirname(current_dir)

        # Add to Python path
        if scripts_dir not in sys.path:
            sys.path.insert(0, scripts_dir)

        # Import and run the command
        from ironRig.gui.ironrig_command import run_ironrig
        window = run_ironrig()

        if window:
            print("Iron Rig GUI launched successfully!")
            return window
        else:
            print("Failed to launch Iron Rig GUI.")
            return None

    except Exception as e:
        print(f"Error launching Iron Rig: {str(e)}")
        import traceback
        traceback.print_exc()
        return None

# Auto-run when script is imported or executed
if __name__ == "__main__":
    main()
else:
    # This will run when the script is imported
    main()
