import json
from Qt import QtWidgets, QtCore, QtGui

from .moduleNode import ModuleNode
from .connectionLine import ConnectionLine


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

        node = ModuleNode(moduleType, moduleName)
        node.setPos(100 + len(self.nodes) * 150, 100 + len(self.nodes) * 100)

        # Add to scene and track
        self._scene.addItem(node)
        self.nodes[moduleName] = node

        # Connect node signals
        node.connectionRequested.connect(self.startConnection)
        node.connectionCompleted.connect(self.completeConnection)
        node.nodeDeleted.connect(self.deleteNode)

        self.moduleCreated.emit(moduleType, moduleName)
        return node

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
        """Handle mouse move for temporary connection line"""
        if self.connectionStartNode:
            # Calculate scene positions dynamically
            localPortPos = self.connectionStartNode.getPortPositionLocal(self.connectionStartPort, self.connectionStartType)
            startPos = self.connectionStartNode.mapToScene(localPortPos)
            endPos = self.mapToScene(event.pos())
            
            # Use encapsulated updatePath with scene coordinates
            self.tempConnectionLine.updatePath(startPos, endPos)
            
        super().mouseMoveEvent(event)

    def mouseReleaseEvent(self, event):
        """Handle mouse release to complete connection"""
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

    def completeConnection(self, targetNode, targetPort, targetType):
        """Complete a connection to a target node port (Normalized as Output -> Input)"""
        if (self.connectionStartNode and
            self.connectionStartNode != targetNode and
            self.connectionStartType != targetType): 

            # Normalize direction: Always Start=Output, End=Input
            if self.connectionStartType == 'output':
                sourceNode, sourcePort = self.connectionStartNode, self.connectionStartPort
                sinkNode, sinkPort = targetNode, targetPort
            else:
                sourceNode, sourcePort = targetNode, targetPort
                sinkNode, sinkPort = self.connectionStartNode, self.connectionStartPort

            # Create connection line
            connection = ConnectionLine(
                sourceNode, sourcePort,
                sinkNode, sinkPort
            )

            self._scene.addItem(connection)
            self.connections.append(connection)

            # Store connection in nodes using normalized direction
            sourceNode.addConnection(connection, 'output')
            sinkNode.addConnection(connection, 'input')

            self.connectionCreated.emit(
                sourceNode.moduleName,
                sinkNode.moduleName
            )

        # Reset connection state
        self.connectionStartNode = None
        self.connectionStartPort = None
        self.connectionStartType = None
        self.tempConnectionLine.hide()

    def deleteNode(self, node):
        """Delete a node and its connections"""
        if node.moduleName in self.nodes:
            # Remove connections
            connections_to_remove = []
            for conn in self.connections:
                if (conn.startNode == node or conn.endNode == node):
                    connections_to_remove.append(conn)

            for conn in connections_to_remove:
                self._scene.removeItem(conn)
                self.connections.remove(conn)

            # Remove node
            self._scene.removeItem(node)
            del self.nodes[node.moduleName]

    def onSelectionChanged(self):
        """Handle selection changes"""
        selectedItems = self._scene.selectedItems()
        if selectedItems:
            self.selectedNode = selectedItems[0] if isinstance(selectedItems[0], ModuleNode) else None
        else:
            self.selectedNode = None

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

    def buildRig(self):
        """Build the rig from the node graph"""
        # Import Iron Rig modules
        import ironRig.api.irGlobal as irg
        import ironRig.api.irSystem as irs
        import ironRig.api.irModule as irm
        import ironRig.api.irMaster as irmst

        # Create global master
        globalMst = irmst.GlobalMaster('root', True)
        globalMst.build()

        # Build modules in dependency order
        builtModules = {}

        # First pass: create all modules
        for name, node in self.nodes.items():
            moduleType = node.moduleType
            properties = node.getProperties()

            # Create module based on type
            if moduleType == 'Spine':
                joints = properties.get('joints', [])
                module = irm.Spine(name, irm.Module.SIDE.CENTER, joints)
            elif moduleType == 'Neck':
                joints = properties.get('joints', [])
                module = irm.Neck(name, irm.Module.SIDE.CENTER, joints)
            elif moduleType == 'LimbBase':
                joints = properties.get('joints', [])
                side = properties.get('side', irm.Module.SIDE.LEFT)
                module = irm.LimbBase(name, side, joints)
            elif moduleType == 'TwoBoneLimb':
                joints = properties.get('joints', [])
                side = properties.get('side', irm.Module.SIDE.LEFT)
                module = irm.TwoBoneLimb(name, side, joints)
            elif moduleType == 'Foot':
                joints = properties.get('joints', [])
                side = properties.get('side', irm.Module.SIDE.LEFT)
                module = irm.Foot(name, side, joints)
            else:
                # Generic module creation
                joints = properties.get('joints', [])
                side = properties.get('side', irm.Module.SIDE.CENTER)
                module = irm.Module(name, side, joints)

            # Set properties
            if 'controllerSize' in properties:
                module.controllerSize = properties['controllerSize']
            if 'controllerColor' in properties:
                module.controllerColor = properties['controllerColor']

            builtModules[name] = module

        # Second pass: build modules and create connections
        for name, node in self.nodes.items():
            module = builtModules[name]

            # Build the module
            module.preBuild()
            module.build()

            # Add to global master
            globalMst.addModules(module)

            # Handle connections (attachments)
            for conn in self.connections:
                if conn.startNode == node:
                    targetModule = builtModules.get(conn.endNode.moduleName)
                    if targetModule:
                        module.attachTo(targetModule)

        return globalMst

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
            conn.deleteConnection()
            if conn in self.connections:
                self.connections.remove(conn)

        # Delete nodes
        for node in nodes_to_delete:
            self.deleteNode(node)

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
        moduleTypes = ["Spine", "Neck", "LimbBase", "TwoBoneLimb", "Foot", "Eye", "Brow", "Lip"]
        
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