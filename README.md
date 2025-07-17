# Iron Rig
![License: MIT](https://img.shields.io/badge/license-MIT-green.svg)

## What is Iron Rig?
Iron Rig allows you to attach control rig modules to parts of a `Skeletal Mesh`, similar to **Iron Man**.
- Minimizes the guide placement process
- Enables flexible connection and disconnection of modules
- Allows rebuilding of individual parts instead of the entire rig
- Supports parallel evaluation
- Provides a complete control rig by connecting modules

## Components
- **Scene**: A space where all components are added. Scenes can be saved and loaded.
- **System**: Contains solvers and controllers (e.g., SplineIK, Two Bone IK).
- **Module**: Contains systems and may have a controller to manage systems (e.g., FK/IK Switch).
- **Master**: Contains modules and may have a controller to manage modules (e.g., Fingers, Hair).
- **Custom Script**: This component allows users to add custom procedures, similar to VEX in Houdini. You can create various types of attributes and use them within your scripts, providing flexibility to tailor processes to your needs.
There are both **Pre Custom Script** and **Post Custom Script** options available, allowing you to execute custom logic before or after the main build process.

### Example: Using the Custom Script Component
Below is an example of how to use the **Custom Script** component to reference a skeletal mesh and restore a pose in Maya:

```python
import ironRig.api.irSystem as irs
import ironRig.api.irModule as irm
import ironRig.api.irMaster as irmst
import ironRig.api.irGlobal as irg

irScene = irg.scene.Scene()

# Add a custom script for pre process
name = 'referSkelMesh'
preCS = irScene.addPreCustomScript(name)
preCS.addAttribute(
    'skelPath',
    irg.attribute.Attribute.TYPE.STRING,
    "D:/Projects/SourceAssets/Characters/NPC/Builder/SkeletalMesh/Builder_skeletalMesh.mb"
)
preCS.addAttribute('poseName', irg.attribute.Attribute.TYPE.STRING, 'SK:rigPose')
preCS.code = '''
from maya import cmds
cmds.file(new=True, f=True)
cmds.file(@skelPath, reference=True, namespace='SK')
cmds.dagPose(@poseName, restore=True)
'''
preCS.run()
```

This script demonstrates how to:
- Add custom attributes (`skelPath` and `poseName`)
- Reference a skeletal mesh file in Maya
- Restore a specific pose using Maya commands

You can modify the attributes and code to fit your workflow.

## Module Stages
- **Pre-Build**: Create and orient joints
- **Build**: Create systems and controllers
- **Post-Build**: Modify controller shapes and scales

## Roadmap
[Trello Board Link](https://trello.com/b/rdtV0nDj/ironrig)
