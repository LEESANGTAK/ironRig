# Iron Rig
![License: MIT](https://img.shields.io/badge/license-MIT-green.svg)

## What is the iron rig?
Attaching control rig modules to the parts of a `Skeletal Mesh` like **Iron Man**.
- Minimizing guide placement process
- Flexible connect/disconnect moduels
- Rebuild a part not the whole rig
- Friendly to parallel evaluation
- Control rig completed with connecting modules

## Terms
- System: Has a solver and controllers (e.g. SplineIK, Two Bone IK)
- Module: Has systems and can has a controller to control systems (e.g. FK/IK Swtich)
- Master: Has modules and can has a controller to control modules (e.g. Fingers, Hairs)

## Roadmap
[Trello Board Link](https://trello.com/b/rdtV0nDj/ironrig)
- Adding wing module
- Adding facial modules (e.g. Brow, Lid, Lip, ...)
- Adding milliped module for creatures who has a bunch of legs
- Building node editor GUI
- Adding animation dynamic marking menu
