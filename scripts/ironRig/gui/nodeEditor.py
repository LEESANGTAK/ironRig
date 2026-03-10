import json
from Qt import QtWidgets, QtCore, QtGui

from .moduleNode import ModuleNode
from .connectionLine import ConnectionLine
from .nodeConfig import get_node_default


class TemporaryConnectionLine(QtWidgets.QGraphicsPathItem):
    """Temporary line shown while dragging a connection"""
    def __init__(self):
        super().__init__()
        self.setPen(QtGui.QPen(QtGui.QColor(224, 134, 0, 255), 3, QtCore.Qt.SolidLine))
        self.setZValue(100) # Ensure it's on top while dragging
        self.setAcceptedMouseButtons(QtCore.Qt.NoButton)
        self.setAcceptHoverEvents(False)

    def updatePath(self, startPos, endPos):
        path = QtGui.QPainterPath()
        path.moveTo(startPos)
        
        dy = endPos.y() - startPos.y()
        cp1 = QtCore.QPointF(startPos.x(), startPos.y() + dy * 0.5)
        cp2 = QtCore.QPointF(endPos.x(), endPos.y() - dy * 0.5)
        path.cubicTo(cp1, cp2, endPos)
        
        self.setPath(path)


class NodeEditor(QtWidgets.QGraphicsView):
    """Main node editor widget for creating and connecting modules"""

    moduleCreated = QtCore.Signal(str, str)  # module_type, module_name
    connectionCreated = QtCore.Signal(str, str)  # from_node, to_node
    selectionChanged = QtCore.Signal(object) # selected_node
    logMessage = QtCore.Signal(str, str) # message, level
    nodeRenamed = QtCore.Signal(object, str, str) # node, old_name, new_name

    def __init__(self):
        super().__init__()

        # Setup scene
        self._scene = QtWidgets.QGraphicsScene()
        self.setScene(self._scene)
        self.setRenderHint(QtGui.QPainter.Antialiasing)
        self.setViewportUpdateMode(QtWidgets.QGraphicsView.FullViewportUpdate)
        self.setHorizontalScrollBarPolicy(QtCore.Qt.ScrollBarAsNeeded)
        self.setVerticalScrollBarPolicy(QtCore.Qt.ScrollBarAsNeeded)
        self.setTransformationAnchor(QtWidgets.QGraphicsView.AnchorUnderMouse)
        self.setResizeAnchor(QtWidgets.QGraphicsView.AnchorUnderMouse)

        # Explicitly set a very large scene rect to allow panning anywhere
        self._scene.setSceneRect(-50000, -50000, 100000, 100000)

        # Setup view properties
        self.setDragMode(QtWidgets.QGraphicsView.RubberBandDrag)
        self.setAcceptDrops(True)

        # Node management
        self.nodes = {}
        self.connections = []
        self.selectedNode = None
        self.connectionStartNode = None
        self.connectionStartPort = None
        self.connectionStartType = None
        self.tempConnectionLine = TemporaryConnectionLine()
        self._scene.addItem(self.tempConnectionLine)
        self.tempConnectionLine.hide()

        # Setup grid
        self.setupGrid()

        # Connect signals
        self._scene.selectionChanged.connect(self.onSelectionChanged)

        # Tab menu state
        self.tabMenu = None

        # Zoom level
        self._zoom = 1.0
        self.zoomStep = 1.1

        # Pan state
        self._last_pan_pos = None

    def setupGrid(self):
        """Setup the background grid (Houdini style)"""
        self.gridSize = 25
        self.gridColorMajor = QtGui.QColor(35, 35, 35)
        self.gridColorMinor = QtGui.QColor(45, 45, 45)
        self.setBackgroundBrush(QtGui.QBrush(QtGui.QColor(50, 50, 50)))

    def createModuleNode(self, moduleType, moduleName=None):
        """Create a new module node"""
        if moduleName is None:
            moduleName = f"{moduleType}_{len(self.nodes)}"

        # Customization for specialized nodes (handled in ModuleNode.setupPorts)
        node = ModuleNode(moduleType, moduleName)
        
        # Apply stored defaults if available
        defaults = get_node_default(moduleType)
        if defaults:
            # Apply port count first as it affects geometry
            if 'inputPortCount' in defaults:
                node.setInputPortCount(defaults['inputPortCount'])
            
            node.setProperties(defaults)
            print(f"Applied defaults for {moduleType}")
            
        node.setPos(100 + len(self.nodes) * 150, 100 + len(self.nodes) * 100)

        # Add to scene and track
        self._scene.addItem(node)
        self.nodes[moduleName] = node

        # Connect node signals
        node.connectionRequested.connect(self.startConnection)
        node.connectionUnplugged.connect(self.unplugConnection)
        node.connectionCompleted.connect(self.completeConnection)
        node.nodeDeleted.connect(self.deleteNode)
        node.displayFlagChanged.connect(self.onNodeDisplayFlagChanged)

        self.moduleCreated.emit(moduleType, moduleName)
        return node

    def mousePressEvent(self, event):
        """Handle mouse press for navigation and connections"""
        if event.button() == QtCore.Qt.MiddleButton:
            self._last_pan_pos = event.pos()
            self.setCursor(QtCore.Qt.SizeAllCursor)
            event.accept()
            return

        super().mousePressEvent(event)
        # Ensure focus for key events
        self.setFocus()

    def startConnection(self, node, portName, portType):
        """Start creating a connection from a node port"""
        self.connectionStartNode = node
        self.connectionStartPort = portName
        self.connectionStartType = portType
        
        # Clear selection to prevent moving nodes while connecting
        self._scene.clearSelection()
        
        self.tempConnectionLine.show()
        
        # Initial path (Use mapToScene for precision)
        localPortPos = self.connectionStartNode.getPortPositionLocal(portName, portType)
        startPos = self.connectionStartNode.mapToScene(localPortPos)
        self.tempConnectionLine.updatePath(startPos, startPos)

    def mouseMoveEvent(self, event):
        """Handle mouse move for panning and temporary connection line"""
        # 1. Handle MMB Panning
        if self._last_pan_pos is not None:
            delta = event.pos() - self._last_pan_pos
            self._last_pan_pos = event.pos()
            
            hs = self.horizontalScrollBar()
            vs = self.verticalScrollBar()
            hs.setValue(hs.value() - delta.x())
            vs.setValue(vs.value() - delta.y())
            event.accept()
            return

        # 2. Handle Connection Dragging
        if self.connectionStartNode:
            # Calculate scene positions dynamically
            localPortPos = self.connectionStartNode.getPortPositionLocal(self.connectionStartPort, self.connectionStartType)
            startPos = self.connectionStartNode.mapToScene(localPortPos)
            endPos = self.mapToScene(event.pos())
            
            # Use encapsulated updatePath with scene coordinates
            self.tempConnectionLine.updatePath(startPos, endPos)
            
        super().mouseMoveEvent(event)

    def mouseReleaseEvent(self, event):
        """Handle mouse release to complete connection or stop panning"""
        # 1. Stop MMB Panning
        if event.button() == QtCore.Qt.MiddleButton:
            self._last_pan_pos = None
            self.setCursor(QtCore.Qt.ArrowCursor)
            event.accept()
            return

        # 2. Complete Connection
        if self.connectionStartNode:
            # Check if we released over a port
            items = self.items(event.pos())
            for item in items:
                if isinstance(item, ModuleNode):
                    localPos = item.mapFromScene(self.mapToScene(event.pos()))
                    port = item.getPortAtPosition(localPos)
                    if port:
                        self.completeConnection(item, port[0], port[1])
                        break
            
            # Reset if no connection made
            if self.connectionStartNode:
                self.connectionStartNode = None
                self.connectionStartPort = None
                self.connectionStartType = None
                self.tempConnectionLine.hide()

        super().mouseReleaseEvent(event)

    def dragEnterEvent(self, event):
        """Allow drop if mime data contains text (module type)"""
        if event.mimeData().hasText():
            event.acceptProposedAction()

    def dragMoveEvent(self, event):
        """Accept move for drag & drop feedack"""
        if event.mimeData().hasText():
            event.acceptProposedAction()

    def dropEvent(self, event):
        """Create a new node at the drop position"""
        if event.mimeData().hasText():
            moduleType = event.mimeData().text()
            
            # map drop position from View coords to Scene coords
            scenePos = self.mapToScene(event.pos())
            
            # Create node at the drop position
            node = self.createModuleNode(moduleType)
            node.setPos(scenePos)
            
            event.acceptProposedAction()

    def completeConnection(self, targetNode, targetPort, targetType):
        """Complete a connection to a target node port (Normalized as Output -> Input)"""
        if (self.connectionStartNode and
            self.connectionStartNode != targetNode and
            self.connectionStartType != targetType): 

            # Normalize direction: Always Source=Child (Output), Target=Parent (Input)
            if self.connectionStartType == 'output':
                childNode, childPort = self.connectionStartNode, self.connectionStartPort
                parentNode, parentPort = targetNode, targetPort
            else:
                childNode, childPort = targetNode, targetPort
                parentNode, parentPort = self.connectionStartNode, self.connectionStartPort

            # Create connection line
            connection = ConnectionLine(
                childNode, childPort,
                parentNode, parentPort
            )

            self._scene.addItem(connection)
            self.connections.append(connection)

            # Store connection in nodes
            childNode.addConnection(connection, 'output')
            parentNode.addConnection(connection, 'input')

            self.connectionCreated.emit(
                childNode.moduleName,
                parentNode.moduleName
            )

        # Reset connection state
        self.connectionStartNode = None
        self.connectionStartPort = None
        self.connectionStartType = None
        self.tempConnectionLine.hide()

    def deleteConnection(self, connection):
        """Delete a connection line and cleanup references"""
        if not connection:
            return

        # 1. Remove from editor's tracking list
        if connection in self.connections:
            self.connections.remove(connection)

        # 2. Call the connection's own cleanup (removes from nodes and scene)
        connection.deleteConnection()

    def unplugConnection(self, node, portName, portType, connection):
        """Houdini style: Unplug an existing connection and start a new drag from the source"""
        # 1. Get origin info before deletion
        sourceNode = connection.startNode
        sourcePort = connection.startPort
        sourceType = 'output' # Connections always start from output in our internal data

        # 2. Delete the connection cleanly
        self.deleteConnection(connection)

        # 3. Start a new connection drag from the original source
        self.startConnection(sourceNode, sourcePort, sourceType)

    def renameNode(self, node, oldName, newName):
        """Update node name and dictionary key"""
        if oldName in self.nodes:
            del self.nodes[oldName]
        
        node.moduleName = newName
        self.nodes[newName] = node
        print(f"Node renamed: {oldName} -> {newName}")

    def deleteNode(self, node):
        """Delete a node and its connections"""
        # Find which key this node is stored under (robust search)
        key_to_del = None
        for name, n in self.nodes.items():
            if n == node:
                key_to_del = name
                break

        # Remove connections associated with this node
        connections_to_remove = []
        for conn in self.connections:
            if (conn.startNode == node or conn.endNode == node):
                connections_to_remove.append(conn)

        for conn in connections_to_remove:
            self.deleteConnection(conn)

        # Remove node from scene and tracking
        if self._scene and node.scene() == self._scene:
            self._scene.removeItem(node)
            
        if key_to_del:
            del self.nodes[key_to_del]
        
        print(f"Node deleted: {getattr(node, 'moduleName', 'Unknown')}")

    def onNodeDisplayFlagChanged(self, node, state):
        """Ensure only one node has the display flag active and trigger build"""
        if state:
            for otherNode in self.nodes.values():
                if otherNode != node and getattr(otherNode, 'displayFlag', False):
                    otherNode.displayFlag = False
                    otherNode.update()
            
            # TRIGGER BUILD: Build up to the newly flagged node
            print(f"Display Flag active on: {node.moduleName}. Triggering Build...")
            self.buildRig()

    def deleteSelectedItems(self):
        """Delete currently selected nodes and connections"""
        selectedItems = self._scene.selectedItems()
        if not selectedItems:
            return

        # Separate items by type
        nodes_to_delete = [item for item in selectedItems if isinstance(item, ModuleNode)]
        conns_to_delete = [item for item in selectedItems if isinstance(item, ConnectionLine)]

        # Delete connections first
        for conn in conns_to_delete:
            self.deleteConnection(conn)

        # Delete nodes
        for node in nodes_to_delete:
            self.deleteNode(node)

    def onSelectionChanged(self):
        """Handle selection changes"""
        selectedItems = self._scene.selectedItems()
        if selectedItems:
            node = selectedItems[0] if isinstance(selectedItems[0], ModuleNode) else None
            self.selectedNode = node
        else:
            self.selectedNode = None
            
        self.selectionChanged.emit(self.selectedNode)

    def clearScene(self):
        """Clear all nodes and connections"""
        self._scene.clear()
        self.nodes.clear()
        self.connections.clear()
        self.selectedNode = None
        self.connectionStartNode = None

    def selectAll(self):
        """Select all nodes"""
        for node in self.nodes.values():
            node.setSelected(True)

    def undo(self):
        """Undo last action"""
        # TODO: Implement undo functionality
        pass

    def redo(self):
        """Redo last action"""
        # TODO: Implement redo functionality
        pass

    def saveScene(self, filename):
        """Save the current scene to a file"""
        sceneData = {
            'nodes': {},
            'connections': []
        }

        # Save node data
        for name, node in self.nodes.items():
            sceneData['nodes'][name] = {
                'type': node.moduleType,
                'name': node.moduleName,
                'position': {'x': node.pos().x(), 'y': node.pos().y()},
                'properties': node.getProperties()
            }

        # Save connection data
        for conn in self.connections:
            sceneData['connections'].append({
                'startNode': conn.startNode.moduleName,
                'startPort': conn.startPort,
                'endNode': conn.endNode.moduleName,
                'endPort': conn.endPort
            })

        with open(filename, 'w') as f:
            json.dump(sceneData, f, indent=2)

    def loadScene(self, filename):
        """Load a scene from a file"""
        with open(filename, 'r') as f:
            sceneData = json.load(f)

        self.clearScene()

        # Load nodes
        for name, nodeData in sceneData['nodes'].items():
            node = self.createModuleNode(nodeData['type'], nodeData['name'])
            node.setPos(nodeData['position']['x'], nodeData['position']['y'])
            node.setProperties(nodeData.get('properties', {}))

        # Load connections
        for connData in sceneData['connections']:
            startNode = self.nodes.get(connData['startNode'])
            endNode = self.nodes.get(connData['endNode'])

            if startNode and endNode:
                connection = ConnectionLine(
                    startNode, connData['startPort'],
                    endNode, connData['endPort']
                )
                self._scene.addItem(connection)
                self.connections.append(connection)

                startNode.addConnection(connection, 'output')
                endNode.addConnection(connection, 'input')

    def getBuildChain(self):
        """Calculate the build chain from GlobalMaster to the node with Display Flag active"""
        # 1. Find the node with Display Flag
        displayNode = None
        for node in self.nodes.values():
            if getattr(node, 'displayFlag', False):
                displayNode = node
                break
        
        if not displayNode:
            return []

        # 2. Trace back to GlobalMaster
        chain = []
        curr = displayNode
        while curr:
            chain.append(curr)
            # Find parent (Input port of curr is connected to Output port of parent)
            parent = None
            for conn in curr.connections.get('output', []):
                # In our logic: child.output -> parent.input
                # So conn.endNode is the parent
                parent = conn.endNode
                break
            curr = parent
            
            # Safety break for cycles
            if curr in chain:
                break
                
        # 3. Reverse to get GlobalMaster -> DisplayNode order
        chain.reverse()
        return chain

    def buildRig(self):
        """Build the rig incrementally from the node graph based on Display Flag"""
        from maya import cmds
        import ironRig.api.irGlobal as irg
        import ironRig.api.irMaster as irmst
        import ironRig.api.irModule as irm
        import traceback

        self.logMessage.emit("-" * 50, "info")
        self.logMessage.emit("Starting Build Process...", "info")

        # 1. Scene Cleanup: Remove old controlRig and orphaned groups
        for rig_root in ['controlRig', 'controlRig_sets']:
            if cmds.objExists(rig_root):
                try:
                    cmds.delete(rig_root)
                    self.logMessage.emit(f"Cleaned up: {rig_root}", "info")
                except Exception as e:
                    self.logMessage.emit(f"Cleanup error ({rig_root}): {str(e)}", "error")
        
        # Cleanup potential orphaned module groups
        orphans = cmds.ls('*_mod_grp*', '*_master_grp*', type='transform')
        for orphan in orphans:
            if not cmds.listRelatives(orphan, parent=True):
                try: 
                    cmds.delete(orphan)
                    self.logMessage.emit(f"Cleaned up orphan: {orphan}", "info")
                except: pass

        # 2. Setup API Scene
        irScene = irg.scene.Scene()

        # 3. Get the build chain
        buildChain = self.getBuildChain()
        if not buildChain:
            print("No Display Flag active. Nothing to build.")
            return

        # 4. Build GlobalMaster
        globalMasterNode = None
        for node in buildChain:
            if node.moduleType == 'GlobalMaster':
                globalMasterNode = node
                break
        
        if not globalMasterNode:
            print("Warning: GlobalMaster not found in build chain. Using default 'root'.")
            globalMst = irScene.addGlobalMaster('root', True)
        else:
            props = globalMasterNode.getProperties()
            rootJnt = props.get('joints', ['root'])[0]
            if not cmds.objExists(rootJnt):
                print(f"Error: Root joint '{rootJnt}' not found in Maya.")
                return
            globalMst = irScene.addGlobalMaster(rootJnt, True)

        globalMst.build()
        builtModulesMap = {} # Node Name -> API Module Object

        # 5. Build modules and Advanced Nodes in chain order
        for node in buildChain:
            if node.moduleType == 'GlobalMaster':
                continue
                
            moduleType = node.moduleType
            properties = node.getProperties()
            name = node.moduleName
            
            # --- Case A: Standard Modules ---
            if moduleType not in ['SpaceSwitch', 'CustomScript']:
                side_str = properties.get('side', 'CENTER')
                side = getattr(irg.container.Container.SIDE, side_str)
                joints = properties.get('joints', [])
                
                try:
                    module = irScene.addModule(moduleType, name, side, skeletonJoints=joints)
                except KeyError:
                    self.logMessage.emit(f"Warning: Module type '{moduleType}' not found in API Factory. Skipping.", "warning")
                    continue
                
                if 'controllerSize' in properties:
                    module.controllerSize = properties.get('controllerSize')
                if 'controllerColor' in properties:
                    module.controllerColor = properties.get('controllerColor')
                
                try:
                    self.logMessage.emit(f"Building Module {moduleType}: {name}...", "info")
                    module.preBuild()
                    
                    # Apply specific properties AFTER preBuild
                    if moduleType == 'Neck' and 'inputPortCount' in properties:
                        module.numberOfControllers = properties.get('inputPortCount', 2)
                    
                    module.build()
                    globalMst.addModules(module)
                    builtModulesMap[name] = module
                    self.logMessage.emit(f"Successfully built {name}", "success")
                except Exception as e:
                    self.logMessage.emit(f"Error building {name}: {str(e)}", "error")
                    self.logMessage.emit(traceback.format_exc(), "error")
                    return 

                # Handle Standard Attachment
                for conn in node.connections.get('output', []):
                    parent_node = conn.endNode
                    parent_module = builtModulesMap.get(parent_node.moduleName)
                    if parent_module:
                        try:
                            module.attachTo(parent_module)
                            self.logMessage.emit(f"Attached {name} to {parent_node.moduleName}", "info")
                        except Exception as e:
                            self.logMessage.emit(f"Attachment error: {str(e)}", "error")
                        break 

            # --- Case B: SpaceSwitch ---
            elif moduleType == 'SpaceSwitch':
                try:
                    self.logMessage.emit(f"Setting up SpaceSwitch: {name}...", "info")
                    
                    # Resolve Driven from Port 0
                    drivenMod = None
                    for conn in node.connections.get('input', []):
                        if conn.endPort.split('_')[-1] == '0':
                            drivenMod = builtModulesMap.get(conn.startNode.moduleName)
                            break
                    
                    if not drivenMod:
                        self.logMessage.emit(f"Warning: No driven module connected to {name} Port 0.", "warning")
                        continue
                        
                    # Resolve Drivers from Port 1+
                    driverMods = []
                    for conn in node.connections.get('input', []):
                        portIdx = int(conn.endPort.split('_')[-1])
                        if portIdx > 0:
                            mod = builtModulesMap.get(conn.startNode.moduleName)
                            if mod: driverMods.append(mod)
                    
                    if not driverMods:
                        self.logMessage.emit(f"Warning: No driver modules connected to {name}.", "warning")
                        continue

                    # API call (Heuristic: Use last controller)
                    drivenCtrl = drivenMod.controllers[-1]
                    driverCtrls = [m.controllers[-1] for m in driverMods]
                    
                    defaultIdx = properties.get('defaultDriverIndex', 0)
                    defaultIdx = min(max(0, defaultIdx), len(driverCtrls)-1)
                    defaultCtrl = driverCtrls[defaultIdx]
                    
                    ssb = irScene.addSpaceSwitchBuilder(drivenCtrl, driverCtrls, defaultCtrl)
                    ssb.isParentType = properties.get('isParentType', True)
                    ssb.isOrientType = properties.get('isOrientType', False)
                    
                    globalMst.addSpaceSwitchBuilder(ssb)
                    self.logMessage.emit(f"SpaceSwitch {name} registered.", "success")
                except Exception as e:
                    self.logMessage.emit(f"SpaceSwitch Error: {str(e)}", "error")

            # --- Case C: CustomScript ---
            elif moduleType == 'CustomScript':
                try:
                    timing = properties.get('timing', 'Post-Build')
                    code = properties.get('code', '# No code defined')
                    self.logMessage.emit(f"Adding Custom Script ({timing}): {name}...", "info")
                    
                    if timing == 'Pre-Build':
                        cs = irScene.addPreCustomScript(name, code)
                    else:
                        cs = irScene.addPostCustomScript(name, code)
                    
                    # Inject variables from inputs
                    for conn in node.connections.get('input', []):
                        portIdx = conn.endPort.split('_')[-1]
                        modName = conn.startNode.moduleName
                        cs.addAttribute(f'port{portIdx}', 1, modName) # 1 = STRING
                    
                    self.logMessage.emit(f"Custom Script {name} added.", "success")
                except Exception as e:
                    self.logMessage.emit(f"CustomScript Error: {str(e)}", "error")

        self.logMessage.emit(f"Rig Build Complete up to: {buildChain[-1].moduleName}", "success")
        self.logMessage.emit("-" * 50, "info")
        return irScene

    def drawBackground(self, painter, rect):
        """Draw the background grid (Major and Minor)"""
        super().drawBackground(painter, rect)

        left = int(rect.left())
        top = int(rect.top())
        right = int(rect.right())
        bottom = int(rect.bottom())

        # Major grid pen
        majorPen = QtGui.QPen(self.gridColorMajor, 1)
        # Minor grid pen
        minorPen = QtGui.QPen(self.gridColorMinor, 0.5)

        # Draw lines
        gridLinesMajor = []
        gridLinesMinor = []

        # Vertical lines
        for x in range(left - (left % self.gridSize), right, self.gridSize):
            if x % (self.gridSize * 4) == 0:
                gridLinesMajor.append(QtCore.QLineF(x, top, x, bottom))
            else:
                gridLinesMinor.append(QtCore.QLineF(x, top, x, bottom))

        # Horizontal lines
        for y in range(top - (top % self.gridSize), bottom, self.gridSize):
            if y % (self.gridSize * 4) == 0:
                gridLinesMajor.append(QtCore.QLineF(left, y, right, y))
            else:
                gridLinesMinor.append(QtCore.QLineF(left, y, right, y))

        painter.setPen(minorPen)
        painter.drawLines(gridLinesMinor)
        painter.setPen(majorPen)
        painter.drawLines(gridLinesMajor)

    def wheelEvent(self, event):
        """Handle mouse wheel for zooming"""
        if event.angleDelta().y() > 0:
            factor = self.zoomStep
            self._zoom *= factor
        else:
            factor = 1.0 / self.zoomStep
            self._zoom *= factor

        self.scale(factor, factor)

    def keyPressEvent(self, event):
        """Handle key press events (Delete, Tab menu)"""
        if event.key() == QtCore.Qt.Key_Tab:
            self.showTabMenu()
        elif event.key() in [QtCore.Qt.Key_Delete, QtCore.Qt.Key_Backspace]:
            self.deleteSelectedItems()
        else:
            super().keyPressEvent(event)

    def showTabMenu(self):
        """Show a search menu for creating modules (Tab menu)"""
        menu = QtWidgets.QMenu(self)
        menu.setStyleSheet("""
            QMenu {
                background-color: #333333;
                color: #DDDDDD;
                border: 1px solid #555555;
            }
            QMenu::item:selected {
                background-color: #E08600;
                color: #FFFFFF;
            }
        """)

        # Get available modules from ModulePanel if possible, or use defaults
        moduleTypes = ["GlobalMaster", "Spine", "Neck", "LimbBase", "TwoBoneLimb", "Foot", "Finger", "MasterGroup", "SpaceSwitch", "CustomScript"]
        
        for mType in moduleTypes:
            action = menu.addAction(mType)
            # Use local position for placement
            action.triggered.connect(lambda t=mType: self.createModuleAtMouse(t))

        menu.exec_(QtGui.QCursor.pos())

    def createModuleAtMouse(self, moduleType):
        """Create a module at the current mouse position"""
        mousePos = self.mapToScene(self.mapFromGlobal(QtGui.QCursor.pos()))
        node = self.createModuleNode(moduleType)
        node.setPos(mousePos)