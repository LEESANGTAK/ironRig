#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
Iron Rig Quick Launch for Maya
Place this file in ironRig root directory and run in Maya.

Usage in Maya:
exec(open('D:/tools/maya/modules/ironRig/launch_ironrig_maya.py').read())
"""

import sys
import os

# Get the directory containing this script (ironRig root)
ironrig_root = os.path.dirname(os.path.abspath(__file__))
scripts_dir = os.path.join(ironrig_root, 'scripts')

# Add to Python path
if scripts_dir not in sys.path:
    sys.path.insert(0, scripts_dir)

try:
    # Import and run Iron Rig
    from ironRig.gui.ironrig_command import run_ironrig
    window = run_ironrig()

    if window:
        print("🎉 Iron Rig GUI launched successfully!")
        print("Window reference stored globally to prevent garbage collection.")
    else:
        print("❌ Failed to launch Iron Rig GUI.")

except Exception as e:
    print(f"❌ Error launching Iron Rig: {str(e)}")
    import traceback
    traceback.print_exc()
