import json
from PyQt5.QtWidgets import (QGraphicsView, QGraphicsScene, QGraphicsItem,
                             QVBoxLayout, QWidget, QGraphicsDropShadowEffect)
from PyQt5.QtCore import Qt, QPointF, QRectF, pyqtSignal
from PyQt5.QtGui import QPen, QBrush, QColor, QPainter, QPainterPath

from .moduleNode import ModuleNode
from .connectionLine import ConnectionLine


class NodeEditor(QGraphicsView):
    """Main node editor widget for creating and connecting modules"""
    
    moduleCreated = pyqtSignal(str, str)  # module_type, module_name
    connectionCreated = pyqtSignal(str, str)  # from_node, to_node
    
    def __init__(self):
        super().__init__()
        
        # Setup scene
        self.scene = QGraphicsScene()
        self.setScene(self.scene)
        self.setRenderHint(QPainter.Antialiasing)
        self.setViewportUpdateMode(QGraphicsView.FullViewportUpdate)
        self.setHorizontalScrollBarPolicy(Qt.ScrollBarAsNeeded)
        self.setVerticalScrollBarPolicy(Qt.ScrollBarAsNeeded)
        self.setTransformationAnchor(QGraphicsView.AnchorUnderMouse)
        self.setResizeAnchor(QGraphicsView.AnchorUnderMouse)
        
        # Setup view properties
        self.setDragMode(QGraphicsView.RubberBandDrag)
        self.setAcceptDrops(True)
        
        # Node management
        self.nodes = {}
        self.connections = []
        self.selectedNode = None
        self.connectionStartNode = None
        self.connectionStartPort = None
        
        # Setup grid
        self.setupGrid()
        
        # Connect signals
        self.scene.selectionChanged.connect(self.onSelectionChanged)
        
    def setupGrid(self):
        """Setup the background grid"""
        self.gridSize = 20
        self.gridColor = QColor(50, 50, 50)
        
    def createModuleNode(self, moduleType, moduleName=None):
        """Create a new module node"""
        if moduleName is None:
            moduleName = f"{moduleType}_{len(self.nodes)}"
            
        node = ModuleNode(moduleType, moduleName)
        node.setPos(100 + len(self.nodes) * 150, 100 + len(self.nodes) * 100)
        
        # Add to scene and track
        self.scene.addItem(node)
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
        
    def completeConnection(self, targetNode, targetPort, targetType):
        """Complete a connection to a target node port"""
        if (self.connectionStartNode and 
            self.connectionStartNode != targetNode and
            self.connectionStartType != targetType):  # Different types can connect
            
            # Create connection line
            connection = ConnectionLine(
                self.connectionStartNode, self.connectionStartPort,
                targetNode, targetPort
            )
            
            self.scene.addItem(connection)
            self.connections.append(connection)
            
            # Store connection in nodes
            self.connectionStartNode.addConnection(connection, 'output')
            targetNode.addConnection(connection, 'input')
            
            self.connectionCreated.emit(
                self.connectionStartNode.moduleName, 
                targetNode.moduleName
            )
            
        # Reset connection state
        self.connectionStartNode = None
        self.connectionStartPort = None
        self.connectionStartType = None
        
    def deleteNode(self, node):
        """Delete a node and its connections"""
        if node.moduleName in self.nodes:
            # Remove connections
            connections_to_remove = []
            for conn in self.connections:
                if (conn.startNode == node or conn.endNode == node):
                    connections_to_remove.append(conn)
                    
            for conn in connections_to_remove:
                self.scene.removeItem(conn)
                self.connections.remove(conn)
                
            # Remove node
            self.scene.removeItem(node)
            del self.nodes[node.moduleName]
            
    def onSelectionChanged(self):
        """Handle selection changes"""
        selectedItems = self.scene.selectedItems()
        if selectedItems:
            self.selectedNode = selectedItems[0] if isinstance(selectedItems[0], ModuleNode) else None
        else:
            self.selectedNode = None
            
    def clearScene(self):
        """Clear all nodes and connections"""
        self.scene.clear()
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
                self.scene.addItem(connection)
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
        """Draw the background grid"""
        super().drawBackground(painter, rect)
        
        # Draw grid
        painter.setPen(QPen(self.gridColor, 1, Qt.SolidLine))
        
        left = int(rect.left()) - (int(rect.left()) % self.gridSize)
        top = int(rect.top()) - (int(rect.top()) % self.gridSize)
        
        # Create grid lines
        gridLines = []
        x = left
        while x < rect.right():
            gridLines.append((QPointF(x, rect.top()), QPointF(x, rect.bottom())))
            x += self.gridSize
            
        y = top
        while y < rect.bottom():
            gridLines.append((QPointF(rect.left(), y), QPointF(rect.right(), y)))
            y += self.gridSize
            
        painter.drawLines(gridLines)