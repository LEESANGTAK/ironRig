cmake_minimum_required(VERSION 3.0)

include($ENV{DEVKIT_LOCATION}/cmake/pluginEntry.cmake)
include_directories($ENV{EXTERN_INCLUDES})

set(PROJECT_NAME $ENV{PLUGIN_NAME})
project(${PROJECT_NAME})

set(RESOURCES_FILES
    <myResource.xpm>
)

set(MEL_FILES
    <exampleNode.mel>
)

set(SOURCE_FILES
    pluginMain.cpp
    <myPluginNode.h>
    <myPluginNode.cpp>
    ${MEL_FILES}
)

set(LIBRARIES
    Foundation
    OpenMaya
    OpenMayaAnim
    OpenMayaFX
    OpenMayaRender
    OpenMayaUI
    <Qt5Core>
    <Qt5Gui>
    <Qt5Widgets>
)

<find_tbb()>

<find_alembic()>
<find_boost()>
<find_cg()>
<find_D3DX11Effects()>
<find_libxml2()>
<find_opengl()>
<find_zlib()>
<set(libs d3d9 d3dx9 dxguid)>
<find_directx("${libs}")>

<find_package(MtoA)>

build_plugin()
