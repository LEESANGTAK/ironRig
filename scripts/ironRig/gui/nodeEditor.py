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
            if 'outputPortCount' in defaults:
                node.setOutputPortCount(defaults['outputPortCount'])
            
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
        node.guideFlagChanged.connect(self.onNodeGuideFlagChanged)

        self.moduleCreated.emit(moduleType, moduleName)
        return node

    def mousePressEvent(self, event):
        """Handle mouse press for navigation and connections"""
        # 1. Handle MMB Panning globally (intercept before items get it)
        if event.button() == QtCore.Qt.MiddleButton:
            self._last_pan_pos = event.pos()
            self.setCursor(QtCore.Qt.ClosedHandCursor)
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
        if (event.buttons() & QtCore.Qt.MiddleButton) and self._last_pan_pos is not None:
            delta = event.pos() - self._last_pan_pos
            self._last_pan_pos = event.pos()
            
            hs = self.horizontalScrollBar()
            vs = self.verticalScrollBar()
            hs.setValue(hs.value() - delta.x())
            vs.setValue(vs.value() - delta.y())
            event.accept()
            return
        elif self._last_pan_pos is not None and not (event.buttons() & QtCore.Qt.MiddleButton):
            self._last_pan_pos = None

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
        """Complete a connection (Top-Down: Parent Output -> Child Input)"""
        if (self.connectionStartNode and
            self.connectionStartNode != targetNode and
            self.connectionStartType != targetType): 

            # Normalize direction: Always Source=Parent (Output), Target=Child (Input)
            if self.connectionStartType == 'output':
                parentNode, parentPort = self.connectionStartNode, self.connectionStartPort
                childNode, childPort = targetNode, targetPort
            else:
                parentNode, parentPort = targetNode, targetPort
                childNode, childPort = self.connectionStartNode, self.connectionStartPort

            # Child input port allows only 1 connection (except Build node)
            if childNode.moduleType != 'Build':
                existing = None
                for conn in childNode.connections['input']:
                    if conn.endPort == childPort:
                        existing = conn
                        break
                if existing:
                    self.deleteConnection(existing)

            # Create connection line: startNode=Parent(Output), endNode=Child(Input)
            connection = ConnectionLine(
                parentNode, parentPort,
                childNode, childPort
            )

            self._scene.addItem(connection)
            self.connections.append(connection)

            # Store connection in nodes
            parentNode.addConnection(connection, 'output')
            childNode.addConnection(connection, 'input')

            self.connectionCreated.emit(
                parentNode.moduleName,
                childNode.moduleName
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
        """Houdini style: Unplug an existing connection and start a new drag from the parent"""
        # 1. Get parent info before deletion (startNode is always parent in Top-Down)
        parentNode = connection.startNode
        parentPort = connection.startPort
        parentType = 'output'

        # 2. Delete the connection cleanly
        self.deleteConnection(connection)

        # 3. Start a new connection drag from the parent's output port
        self.startConnection(parentNode, parentPort, parentType)

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

    def onNodeGuideFlagChanged(self, node, state):
        """Handle Guide Flag activation: build parents, preBuild target for guide mode"""
        if state:
            # Only one guide flag at a time
            for otherNode in self.nodes.values():
                if otherNode != node and getattr(otherNode, 'guideFlag', False):
                    otherNode.guideFlag = False
                    otherNode.update()
            
            print(f"Guide Flag active on: {node.moduleName}. Building parents + preBuild...")
            self.buildGuide(node)
        else:
            # Guide flag deactivated: save orient plane data from Maya scene
            print(f"Guide Flag deactivated on: {node.moduleName}. Saving guide data...")
            self.saveGuideData(node)

    def buildGuide(self, guideNode):
        """Build parent chain normally, then only preBuild the guide node"""
        from maya import cmds
        import ironRig.api.irGlobal as irg
        import ironRig.api.irModule as irm
        import traceback
        
        self.logMessage.emit("-" * 50, "info")
        self.logMessage.emit(f"Guide Mode: Building for {guideNode.moduleName}...", "info")
        
        # Temporarily set display flag to build the chain
        origDisplayNode = None
        for n in self.nodes.values():
            if getattr(n, 'displayFlag', False):
                origDisplayNode = n
                break
        
        # Build the full chain (parents) via normal build, stopping at guide node
        # For now, trigger a full build then preBuild the guide module
        # TODO: Optimize to only build parents + preBuild target
        guideNode.displayFlag = True
        guideNode.update()
        self.buildRig()  # Builds up to guideNode including itself
        
        # Restore original display flag
        guideNode.displayFlag = False
        guideNode.update()
        if origDisplayNode:
            origDisplayNode.displayFlag = True
            origDisplayNode.update()
        
        self.logMessage.emit(f"Guide Mode active on: {guideNode.moduleName}", "success")

    def saveGuideData(self, node):
        """Save orient plane locator data from Maya to node properties"""
        try:
            from maya import cmds
            moduleName = node.moduleName
            moduleType = node.moduleType
            
            # Save midLocator position (common to all modules)
            midLocName = f"{moduleName}_orientPlane_loc"
            if cmds.objExists(midLocName):
                pos = cmds.xform(midLocName, q=True, ws=True, t=True)
                node.properties['guideMidLocatorPosition'] = pos
                
                # Save axis attributes if they exist
                axisAttrs = {}
                for attr in ['negateXAxis', 'negateZAxis', 'swapYZAxis']:
                    fullAttr = f"{midLocName}.{attr}"
                    if cmds.attributeQuery(attr, node=midLocName, exists=True):
                        axisAttrs[attr] = cmds.getAttr(fullAttr)
                if axisAttrs:
                    node.properties['guideMidLocatorAxisAttrs'] = axisAttrs
                
                self.logMessage.emit(f"Saved guide data for {moduleName}: midLocator", "info")
            
            # Foot-specific: Save pivot locator positions (in, out, heel, tip)
            if moduleType == 'Foot':
                pivotNames = ['in', 'out', 'heel', 'tip']
                pivotPositions = {}
                for pivotName in pivotNames:
                    locName = f"{moduleName}_{pivotName}_pivot_loc"
                    if cmds.objExists(locName):
                        pivotPositions[pivotName] = cmds.xform(locName, q=True, ws=True, t=True)
                if pivotPositions:
                    node.properties['guidePivotLocatorPositions'] = pivotPositions
                    self.logMessage.emit(f"Saved Foot pivot data: {list(pivotPositions.keys())}", "info")
                    
        except Exception as e:
            self.logMessage.emit(f"Guide data save warning: {str(e)}", "warning")

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
        
        # Re-add the temporary connection line as it was deleted by scene.clear()
        self.tempConnectionLine = TemporaryConnectionLine()
        self._scene.addItem(self.tempConnectionLine)
        self.tempConnectionLine.hide()

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
        """Save the current scene to .ir file (GUI state) + .json file (API data)
        
        .ir file references the .json file for API serialization data (controller CVs etc.)
        """
        import os
        
        sceneData = {
            'version': 2,
            'gui': {
                'nodes': {},
                'connections': []
            }
        }

        # Save node data
        for name, node in self.nodes.items():
            nodeData = {
                'type': node.moduleType,
                'name': node.moduleName,
                'position': {'x': node.pos().x(), 'y': node.pos().y()},
                'properties': node.getProperties(),
                'guideFlag': getattr(node, 'guideFlag', False),
                'bypassFlag': getattr(node, 'bypassFlag', False)
            }
            sceneData['gui']['nodes'][name] = nodeData

        # Save connection data (Top-Down: startNode=Parent, endNode=Child)
        for conn in self.connections:
            sceneData['gui']['connections'].append({
                'startNode': conn.startNode.moduleName,
                'startPort': conn.startPort,
                'endNode': conn.endNode.moduleName,
                'endPort': conn.endPort
            })

        # Save API .json if a build has been done (captures controller CV shapes)
        jsonBasename = os.path.splitext(os.path.basename(filename))[0] + '.json'
        jsonPath = os.path.join(os.path.dirname(filename), jsonBasename)
        sceneData['apiDataFile'] = jsonBasename
        
        lastIrScene = getattr(self, '_lastIrScene', None)
        if lastIrScene:
            try:
                lastIrScene.saveToFile(jsonPath)
                self._apiDataPath = jsonPath
                self.logMessage.emit(f"API data saved: {jsonBasename}", "success")
            except Exception as e:
                self.logMessage.emit(f"API save warning: {str(e)}", "warning")

        with open(filename, 'w') as f:
            json.dump(sceneData, f, indent=2)
        
        self.logMessage.emit(f"Scene saved to: {filename}", "success")

    def loadScene(self, filename):
        """Load a scene from .ir file and optionally restore from .json API data"""
        import os
        
        with open(filename, 'r') as f:
            sceneData = json.load(f)

        self.clearScene()

        # Support both v1 (flat) and v2 (gui/api split) formats
        if 'version' in sceneData and sceneData['version'] >= 2:
            guiData = sceneData.get('gui', {})
            nodesData = guiData.get('nodes', {})
            connsData = guiData.get('connections', [])
        else:
            # Legacy v1 format
            nodesData = sceneData.get('nodes', {})
            connsData = sceneData.get('connections', [])

        # Load nodes
        for name, nodeData in nodesData.items():
            node = self.createModuleNode(nodeData['type'], nodeData['name'])
            node.setPos(nodeData['position']['x'], nodeData['position']['y'])
            
            props = nodeData.get('properties', {})
            # Restore output port count first
            if 'outputPortCount' in props:
                node.setOutputPortCount(props['outputPortCount'])
            node.setProperties(props)
            
            # Restore guide flag state
            if nodeData.get('guideFlag', False):
                node.guideFlag = True
                node.update()

            # Restore bypass flag state
            if nodeData.get('bypassFlag', False):
                node.bypassFlag = True
                node.update()

        # Load connections
        for connData in connsData:
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

        # Store reference to API json for build-time CV restoration
        apiDataFile = sceneData.get('apiDataFile')
        if apiDataFile:
            apiJsonPath = os.path.join(os.path.dirname(filename), apiDataFile)
            if os.path.exists(apiJsonPath):
                self._apiDataPath = apiJsonPath
                self.logMessage.emit(f"API data reference: {apiJsonPath}", "info")
            else:
                self._apiDataPath = None
                self.logMessage.emit(f"API data file not found: {apiJsonPath}", "warning")
        else:
            self._apiDataPath = None

    def getBuildChain(self, buildAll=False):
        """Calculate the build chain (topological sort)
        
        buildAll=False: Only nodes reachable from Display Flag node
        buildAll=True: All nodes in the graph (ignores Display Flag)
        """
        if buildAll:
            # Use all nodes as entry points; DFS visited set handles deduplication
            # and topological sort ensures correct build order
            entryNodes = list(self.nodes.values())
        else:
            displayNode = None
            for node in self.nodes.values():
                if getattr(node, 'displayFlag', False):
                    displayNode = node
                    break
            if not displayNode:
                return []
            entryNodes = [displayNode]

        # Topological Sort using DFS (Top-Down: parent built before child)
        stack = []
        visited = set()
        processing = set()
        
        DATA_CONSUMERS = ['Sender', 'SpaceSwitch', 'ModuleDecompose']
        
        def visit(node):
            if node in visited:
                return
            if node in processing:
                print(f"Cycle detected at node: {node.moduleName}")
                return
                
            processing.add(node)
            
            # --- Dependency 1: Structural Parent (Top-Down) ---
            # My Input port connects from Parent's Output. Parent must be built first.
            for conn in node.connections.get('input', []):
                parent_node = conn.startNode
                if parent_node.moduleType not in DATA_CONSUMERS:
                    visit(parent_node)
                    
            # --- Dependency 2: Data Flow (for data consumers) ---
            if node.moduleType in DATA_CONSUMERS or node.moduleType == 'Build':
                for conn in node.connections.get('input', []):
                    visit(conn.startNode)
                    
            # --- Dependency 3: Wireless Data (Receiver) ---
            if node.moduleType == 'Receiver':
                targetRoute = node.properties.get('routeName')
                if targetRoute:
                    for n in self.nodes.values():
                        if n.moduleType == 'Sender' and n.properties.get('routeName') == targetRoute:
                            visit(n)
                            break
                
            processing.remove(node)
            visited.add(node)
            stack.append(node)

        # Visit entry nodes — DFS will trace up to parents first
        for entryNode in entryNodes:
            visit(entryNode)
        
        return stack

    def buildAll(self):
        """Build the entire node graph (ignores Display Flag)"""
        return self.buildRig(buildAll=True)

    def buildRig(self, buildAll=False):
        """Build the rig from the node graph
        
        buildAll=False: Build up to Display Flag node only
        buildAll=True: Build all nodes in the graph
        """
        from maya import cmds
        import ironRig.api.irGlobal as irg
        import ironRig.api.irMaster as irmst
        import ironRig.api.irModule as irm
        import traceback

        self.logMessage.emit("-" * 50, "info")
        self.logMessage.emit("Starting Build Process...", "info")

        # 1. Scene Cleanup: Aggressive one-shot deletion to avoid DG errors
        clean_targets = ['controlRig', 'controlRig_sets', 'geo_layer']
        nodes_to_delete = []

        # Find all IronRig specific sets (modules, masters, systems)
        all_sets = cmds.ls(type='objectSet')
        iron_sets = [s for s in all_sets if any(sub in s for sub in ['_mod_set', '_mst_set', '_sys_set', '_spSys_set', '_ikSys_set', 'controlRig_sets'])]
        
        for s in iron_sets:
            if not cmds.objExists(s): continue
            nodes_to_delete.append(s)
            
            # Add all members to delete list (DG nodes, constraints, handles, etc)
            members = cmds.sets(s, q=True) or []
            for m in members:
                if not cmds.objExists(m): continue
                # Skip skeleton joints (non-rig joints)
                if cmds.nodeType(m) == 'joint' and not any(suff in m for suff in ['_init', '_ik', '_fk', '_out']):
                    continue
                nodes_to_delete.append(m)

        # Add main groups
        for target in clean_targets:
            if cmds.objExists(target):
                nodes_to_delete.append(target)

        # Add any orphan groups found in the scene
        orphans = cmds.ls('*_mod_grp*', '*_master_grp*', '*_sys_grp*', '*_out_grp*', '*_geo_grp*', '*_blbx_grp*', '*_ctrl_grp*', type='transform')
        nodes_to_delete.extend([o for o in orphans if cmds.objExists(o) and not cmds.listRelatives(o, parent=True)])

        # Execute single Maya delete command for thread safety and dependency handling
        actual_delete = list(set([n for n in nodes_to_delete if cmds.objExists(n)]))
        if actual_delete:
            try:
                cmds.delete(actual_delete)
                self.logMessage.emit(f"Aggressive cleanup complete: {len(actual_delete)} nodes/sets removed.", "info")
            except Exception as e:
                self.logMessage.emit(f"Cleanup warning: {str(e)}", "warning")

        # 2. Setup API Scene
        irScene = irg.scene.Scene()

        # 3. Get the build chain
        buildChain = self.getBuildChain(buildAll=buildAll)
        if not buildChain:
            if buildAll:
                print("No nodes found in graph. Nothing to build.")
            else:
                print("No Display Flag active. Nothing to build.")
            return

        # 4. Build chain: evaluate nodes in topological order
        #    Only nodes in the chain are built — consistent "evaluate up to Display Flag" logic.
        builtItemsMap = {} # Node Name -> API Object (Module or Controller)
        routeDataMap = {}  # Route Name -> API Object (Wireless cache)
        globalMst = None   # Will be set only if GlobalRoot is in the chain

        for node in buildChain:
                
            moduleType = node.moduleType
            properties = node.getProperties()
            name = node.moduleName

            # --- Bypass Check: Skip bypassed nodes ---
            if getattr(node, 'bypassFlag', False):
                self.logMessage.emit(f"Bypassed: {name} ({moduleType})", "warning")
                continue

            # --- Case G: GlobalRoot ---
            if moduleType in ['GlobalRoot', 'GlobalMaster']:
                props = node.getProperties()
                rootJnt = props.get('joints', ['root'])[0]
                if not cmds.objExists(rootJnt):
                    self.logMessage.emit(f"Error: Root joint '{rootJnt}' not found in Maya.", "error")
                    continue
                try:
                    globalMst = irScene.addGlobalMaster(rootJnt, True)
                    globalMst.build()
                    builtItemsMap[name] = globalMst
                    self.logMessage.emit(f"Built GlobalRoot: {name} (root={rootJnt})", "success")
                except Exception as e:
                    self.logMessage.emit(f"GlobalRoot Build Error: {str(e)}", "error")
                continue
            
            # --- Case A: Standard Modules ---
            elif moduleType not in ['SpaceSwitch', 'CustomScript', 'ModuleDecompose', 'Sender', 'Receiver', 'Build']:
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
                    
                    # Apply module-specific properties from PropertyEditor definitions
                    from .propertyEditor import PropertyEditor
                    propDefs = PropertyEditor.getModuleSpecificProperties(moduleType)
                    for propDef in propDefs:
                        propName = propDef['name']
                        if propName in properties:
                            if hasattr(module, propName):
                                setattr(module, propName, properties[propName])
                                self.logMessage.emit(f"  Set {propName} = {properties[propName]}", "info")
                    
                    module.build()
                    builtItemsMap[name] = module

                    # Handle Attachment: find parent from input connections (Top-Down)
                    for conn in node.connections.get('input', []):
                        parent_node = conn.startNode
                        parent_module = builtItemsMap.get(parent_node.moduleName)
                        if not parent_module:
                            continue
                        self.logMessage.emit(f"Parent node: {parent_node.moduleType}", "info")
                        parent_class_names = [cls.__name__ for cls in parent_module.__class__.__mro__]
                        if 'Container' in parent_class_names:
                            if parent_node.moduleType in ['GlobalRoot', 'GlobalMaster']:
                                # GlobalRoot does not have outJoints for attachTo
                                break
                            try:
                                import maya.cmds as cmds
                                cmds.refresh()
                                
                                module.attachTo(parent_module)
                                self.logMessage.emit(f"Attached {name} to {parent_node.moduleName}", "info")
                            except Exception as e:
                                self.logMessage.emit(f"Attachment error for {name}: {str(e)}", "error")
                            break

                    if globalMst:
                        globalMst.addModules(module)
                    self.logMessage.emit(f"Successfully built {name}", "success")
                except Exception as e:
                    self.logMessage.emit(f"Error building {name}: {str(e)}", "error")
                    self.logMessage.emit(traceback.format_exc(), "error")
                    return 


            # --- Case B: ModuleDecompose ---
            elif moduleType == 'ModuleDecompose':
                try:
                    targetCtrlName = properties.get('targetController', 'moduleController')
                    self.logMessage.emit(f"Decomposing {name}: Extracting {targetCtrlName}...", "info")
                    
                    sourceMod = None
                    for conn in node.connections.get('input', []):
                        sourceMod = builtItemsMap.get(conn.startNode.moduleName)
                        break
                    
                    if not sourceMod:
                        # Fallback for Receiver-to-Decompose connection though unusual
                        self.logMessage.emit(f"Warning: No input module for {name}", "warning")
                        continue
                        
                    # Find controller in module
                    ctrl = sourceMod.findController(targetCtrlName)
                    if ctrl:
                        builtItemsMap[name] = ctrl
                        self.logMessage.emit(f"Extracted {targetCtrlName} from {conn.startNode.moduleName}", "success")
                    else:
                        self.logMessage.emit(f"Error: Controller '{targetCtrlName}' not found in {conn.startNode.moduleName}", "error")
                except Exception as e:
                    self.logMessage.emit(f"Decompose Error: {str(e)}", "error")

            # --- Case C: Sender (Wireless) ---
            elif moduleType == 'Sender':
                try:
                    routeName = properties.get('routeName', 'route1')
                    self.logMessage.emit(f"Wireless Sending: Broadcasting to '{routeName}'...", "info")
                    
                    inputData = None
                    for conn in node.connections.get('input', []):
                        inputData = builtItemsMap.get(conn.startNode.moduleName)
                        break
                    
                    if inputData:
                        routeDataMap[routeName] = inputData
                        builtItemsMap[name] = inputData # Pass through
                        self.logMessage.emit(f"Data broadcasted to '{routeName}'", "success")
                    else:
                        self.logMessage.emit(f"Warning: Sender {name} has no input data.", "warning")
                except Exception as e:
                    self.logMessage.emit(f"Sender Error: {str(e)}", "error")

            # --- Case D: Receiver (Wireless) ---
            elif moduleType == 'Receiver':
                try:
                    routeName = properties.get('routeName')
                    self.logMessage.emit(f"Wireless Receiving: Fetching from '{routeName}'...", "info")
                    
                    receivedData = routeDataMap.get(routeName)
                    if receivedData:
                        builtItemsMap[name] = receivedData
                        self.logMessage.emit(f"Data received from '{routeName}'", "success")
                    else:
                        self.logMessage.emit(f"Error: No data found for route '{routeName}'", "error")
                except Exception as e:
                    self.logMessage.emit(f"Receiver Error: {str(e)}", "error")

            # --- Case E: SpaceSwitch ---
            elif moduleType == 'SpaceSwitch':
                try:
                    self.logMessage.emit(f"Setting up SpaceSwitch: {name}...", "info")
                    
                    # Resolve Driven from Port 0
                    drivenItem = None
                    for conn in node.connections.get('input', []):
                        if conn.endPort.split('_')[-1] == '0':
                            drivenItem = builtItemsMap.get(conn.startNode.moduleName)
                            break
                    
                    if not drivenItem:
                        self.logMessage.emit(f"Warning: No driven item connected to {name} Port 0.", "warning")
                        continue
                        
                    # Resolve Drivers from Port 1+
                    driverItems = []
                    for conn in node.connections.get('input', []):
                        portIdx = int(conn.endPort.split('_')[-1])
                        if portIdx > 0:
                            item = builtItemsMap.get(conn.startNode.moduleName)
                            if item: driverItems.append(item)
                    
                    if not driverItems:
                        self.logMessage.emit(f"Warning: No driver items connected to {name}.", "warning")
                        continue
                        
                    # Convert Modules to Controllers if needed (Heuristic: use last controller)
                    def to_ctrl(item):
                        if hasattr(item, 'controllers') and item.controllers: return item.controllers[-1]
                        return item
                        
                    drivenCtrl = to_ctrl(drivenItem)
                    driverCtrls = [to_ctrl(i) for i in driverItems]
                    
                    defaultIdx = properties.get('defaultDriverIndex', 0)
                    defaultIdx = min(max(0, defaultIdx), len(driverCtrls)-1)
                    defaultCtrl = driverCtrls[defaultIdx]
                    
                    ssb = irScene.addSpaceSwitchBuilder(drivenCtrl, driverCtrls, defaultCtrl)
                    ssb.isParentType = properties.get('isParentType', True)
                    ssb.isOrientType = properties.get('isOrientType', False)
                    
                    # Find GlobalRoot in built items to register SpaceSwitch
                    globalRootObj = None
                    for builtName, builtObj in builtItemsMap.items():
                        if hasattr(builtObj, 'addSpaceSwitchBuilder'):
                            globalRootObj = builtObj
                            break
                    
                    if globalRootObj:
                        globalRootObj.addSpaceSwitchBuilder(ssb)
                        self.logMessage.emit(f"SpaceSwitch {name} registered.", "success")
                    else:
                        self.logMessage.emit(f"Warning: GlobalRoot not in chain. SpaceSwitch {name} skipped.", "warning")
                except Exception as e:
                    self.logMessage.emit(f"SpaceSwitch Error: {str(e)}", "error")

            # --- Case F: Build (Aggregation) ---
            elif moduleType == 'Build':
                self.logMessage.emit(f"Aggregation Node {name}: All input chains compiled successfully.", "success")
                # Build node itself doesn't call an API, it just triggers the dependency chain above it.

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
                    
                    # Inject @symbol attributes from Property Editor
                    scriptAttrs = properties.get('scriptAttributes', [])
                    for attr in scriptAttrs:
                        attrName = attr.get('name', '')
                        attrType = 1 if attr.get('type', 'STRING') == 'STRING' else 0  # 1=STRING, 0=NUMBER
                        attrValue = attr.get('value', '')
                        if attrType == 0:  # NUMBER
                            try:
                                attrValue = float(attrValue)
                            except (ValueError, TypeError):
                                attrValue = 0.0
                        cs.addAttribute(attrName, attrType, attrValue)
                        self.logMessage.emit(f"  Attribute @{attrName} = {attrValue}", "info")
                    
                    # Legacy: Inject variables from output port connections
                    for conn in node.connections.get('output', []):
                        portName = conn.startPort
                        childName = conn.endNode.moduleName
                        cs.addAttribute(f'{portName}', 1, childName)  # 1 = STRING
                    
                    # Execute the script now
                    cs.run()
                    builtItemsMap[name] = cs
                    self.logMessage.emit(f"Custom Script {name} executed.", "success")
                except Exception as e:
                    self.logMessage.emit(f"CustomScript Error: {str(e)}", "error")

        self.logMessage.emit(f"Rig Build Complete up to: {buildChain[-1].moduleName}", "success")
        
        # 6. Restore Controller CVs from .json if available
        self._restoreControllerShapes(builtItemsMap)
        
        # Store irScene for Save Scene to serialize later
        self._lastIrScene = irScene
        
        self.logMessage.emit("-" * 50, "info")
        return irScene

    def _autoSaveApiJson(self, irScene):
        """Auto-save API serialization to .json after build for controller shape persistence"""
        import os
        apiPath = getattr(self, '_apiDataPath', None)
        if not apiPath or not irScene:
            return
        try:
            irScene.saveToFile(apiPath)
            self.logMessage.emit(f"API data auto-saved: {os.path.basename(apiPath)}", "success")
        except Exception as e:
            self.logMessage.emit(f"API auto-save warning: {str(e)}", "warning")

    def _restoreControllerShapes(self, builtItemsMap):
        """Restore controller CV positions and colors from saved .json API data"""
        import os
        
        apiPath = getattr(self, '_apiDataPath', None)
        if not apiPath or not os.path.exists(apiPath):
            return
        
        try:
            with open(apiPath, 'r') as f:
                apiData = json.load(f)
        except Exception as e:
            self.logMessage.emit(f"CV restore: could not read {apiPath}: {e}", "warning")
            return
        
        # Collect all controller data from .json (globalMaster, modules, masters)
        savedControllers = {}  # controller name -> {cvsPosition, curvesRGB}
        
        # GlobalMaster controllers
        gm = apiData.get('globalMaster', {})
        for ctrl in gm.get('controllers', []):
            savedControllers[ctrl['name']] = ctrl
        
        # Module controllers
        for mod in apiData.get('modules', []):
            for ctrl in mod.get('controllers', []):
                savedControllers[ctrl['name']] = ctrl
        
        # Master controllers
        for mst in apiData.get('masters', []):
            for ctrl in mst.get('controllers', []):
                savedControllers[ctrl['name']] = ctrl
        
        if not savedControllers:
            return
        
        # Apply to built modules
        from maya import cmds
        restoredCount = 0
        
        for name, builtObj in builtItemsMap.items():
            if not hasattr(builtObj, 'controllers'):
                continue
            for ctrl in builtObj.controllers:
                ctrlName = ctrl.name if hasattr(ctrl, 'name') else str(ctrl)
                if ctrlName in savedControllers:
                    saved = savedControllers[ctrlName]
                    try:
                        cvs = saved.get('cvsPosition')
                        if cvs:
                            ctrl.restoreCVsPosition(cvs)
                            restoredCount += 1
                        rgb = saved.get('curvesRGB')
                        if rgb:
                            ctrl.restoreCurvesRGB(rgb)
                    except Exception as e:
                        self.logMessage.emit(f"CV restore warning for {ctrlName}: {e}", "warning")
        
        if restoredCount:
            self.logMessage.emit(f"Restored {restoredCount} controller shapes from {os.path.basename(apiPath)}", "success")

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
        moduleTypes = ["GlobalRoot", "Spine", "Neck", "LimbBase", "TwoBoneLimb", "Foot", "Finger", "MasterGroup", "SpaceSwitch", "CustomScript"]
        
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