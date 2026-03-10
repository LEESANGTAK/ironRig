from Qt import QtWidgets, QtCore, QtGui

import ironRig.api.irModule as irm


class ModuleNode(QtWidgets.QGraphicsObject):
    """Visual representation of a module in the node editor"""

    connectionRequested = QtCore.Signal(object, str, str)  # node, port_name, port_type
    connectionCompleted = QtCore.Signal(object, str, str)  # target_node, port_name, port_type
    nodeDeleted = QtCore.Signal(object)  # node

    def __init__(self, moduleType, moduleName):
        super().__init__()

        self.moduleType = moduleType
        self.moduleName = moduleName
        self.properties = {}

        # Node dimensions
        self.width = 160
        self.height = 40
        self.headerHeight = 20
        self.portRadius = 10 # Doubled from 5
        self.portOffset = 12 # Increased from 8
        self.portSpacing = 20

        # Setup ports
        self.inputPorts = []
        self.outputPorts = []
        self.setupPorts()

        # Setup properties
        self.setupProperties()

        # Visual properties
        # Remove ItemIsMovable by default, it will be enabled on header click
        self.setFlags(QtWidgets.QGraphicsItem.ItemIsSelectable |
                      QtWidgets.QGraphicsItem.ItemIsFocusable |
                      QtWidgets.QGraphicsItem.ItemSendsGeometryChanges)
        self.setAcceptHoverEvents(True)

        # Setup appearance
        self.setupAppearance()

        # Connections
        self.connections = {'input': [], 'output': []}

    def setupPorts(self):
        """Setup input and output ports based on module type"""
        if self.moduleType == 'Spine':
            self.inputPorts = [('attach', 'input')]
            self.outputPorts = [('neck', 'output'), ('clavicle', 'output'), ('leg', 'output')]
        elif self.moduleType == 'Neck':
            self.inputPorts = [('spine', 'input')]
            self.outputPorts = [('head', 'output')]
        elif self.moduleType == 'LimbBase':
            self.inputPorts = [('spine', 'input')]
            self.outputPorts = [('limb', 'output')]
        elif self.moduleType == 'TwoBoneLimb':
            self.inputPorts = [('parent', 'input')]
            self.outputPorts = [('hand', 'output'), ('foot', 'output')]
        elif self.moduleType == 'Foot':
            self.inputPorts = [('leg', 'input')]
            self.outputPorts = []
        else:
            # Generic ports
            self.inputPorts = [('input', 'input')]
            self.outputPorts = [('output', 'output')]

    def setupProperties(self):
        """Setup default properties based on module type"""
        self.properties = {
            'joints': [],
            'side': 'CENTER',
            'controllerSize': 10,
            'controllerColor': 'BLUE'
        }

        # Set default joints based on type
        if self.moduleType == 'Spine':
            self.properties['joints'] = ['Pelvis', 'Spine', 'Spine1', 'Spine2', 'Spine3']
        elif self.moduleType == 'Neck':
            self.properties['joints'] = ['Neck', 'Neck1', 'Head']
        elif self.moduleType == 'TwoBoneLimb':
            self.properties['joints'] = ['UpperArm', 'Forearm', 'Hand']
        elif self.moduleType == 'Foot':
            self.properties['joints'] = ['Foot', 'ToeBase', 'Toe_End']

    def setupAppearance(self):
        """Setup the visual appearance of the node"""
        # Add shadow effect
        shadow = QtWidgets.QGraphicsDropShadowEffect()
        shadow.setBlurRadius(10)
        shadow.setColor(QtGui.QColor(0, 0, 0, 100))
        shadow.setOffset(2, 2)
        self.setGraphicsEffect(shadow)

    def boundingRect(self):
        """Return the bounding rectangle of the node (expanded for ports)"""
        margin = self.portRadius + self.portOffset + 2
        return QtCore.QRectF(-self.width/2 - margin, -self.height/2 - margin, 
                             self.width + margin * 2, self.height + margin * 2)

    def paint(self, painter, option, widget):
        """Paint the node"""
        # Setup painter
        painter.setRenderHint(QtGui.QPainter.Antialiasing)

        # Colors
        if self.isSelected():
            headerColor = QtGui.QColor(224, 134, 0)  # Houdini Orange
            bgColor = QtGui.QColor(60, 60, 60)
            borderColor = QtGui.QColor(255, 255, 255)
        else:
            headerColor = QtGui.QColor(80, 80, 80)
            bgColor = QtGui.QColor(45, 45, 45)
            borderColor = QtGui.QColor(30, 30, 30)

        # Draw node body (use fixed size, not full boundingRect)
        bodyRect = QtCore.QRectF(-self.width/2, -self.height/2, self.width, self.height)
        
        painter.setBrush(QtGui.QBrush(bgColor))
        
        # Only show border if selected, and draw it ONLY on the body
        if self.isSelected():
            painter.setPen(QtGui.QPen(QtGui.QColor(255, 255, 255), 1.5))
        else:
            painter.setPen(QtGui.QPen(borderColor, 1))
            
        painter.drawRect(bodyRect)

        # Draw header
        headerRect = QtCore.QRectF(bodyRect.x(), bodyRect.y(), bodyRect.width(), self.headerHeight)
        painter.setBrush(QtGui.QBrush(headerColor))
        painter.setPen(QtCore.Qt.NoPen)
        painter.drawRect(headerRect)

        # Draw title (moduleType)
        painter.setPen(QtGui.QColor(220, 220, 220))
        font = QtGui.QFont("Inter", 9)
        font.setBold(True)
        painter.setFont(font)
        painter.drawText(headerRect.adjusted(5, 0, -5, 0), QtCore.Qt.AlignLeft | QtCore.Qt.AlignVCenter, self.moduleType)

        # Draw module name
        font.setBold(False)
        font.setPointSize(8)
        painter.setFont(font)
        painter.setPen(QtGui.QColor(180, 180, 180))
        nameRect = QtCore.QRectF(bodyRect.x(), bodyRect.y() + self.headerHeight, bodyRect.width(), bodyRect.height() - self.headerHeight)
        painter.drawText(nameRect.adjusted(5, 0, -5, 0), QtCore.Qt.AlignLeft | QtCore.Qt.AlignVCenter, self.moduleName)

        # Draw ports
        self.drawPorts(painter)

    def drawPorts(self, painter):
        """Draw input and output ports with better aesthetics"""
        bodyRect = QtCore.QRectF(-self.width/2, -self.height/2, self.width, self.height)

        # Draw input ports (Top side - Offset upwards)
        numInputs = len(self.inputPorts)
        for i, (portName, portType) in enumerate(self.inputPorts):
            x = bodyRect.x() + (bodyRect.width() / (numInputs + 1)) * (i + 1)
            y = bodyRect.y() - self.portOffset

            # Port circle (Houdini style)
            painter.setBrush(QtGui.QBrush(QtGui.QColor(180, 180, 180)))
            painter.setPen(QtGui.QPen(QtGui.QColor(30, 30, 30), 1))
            painter.drawEllipse(QtCore.QPointF(x, y), self.portRadius, self.portRadius)
            
            # Inner dot
            painter.setBrush(QtGui.QBrush(QtGui.QColor(60, 60, 60)))
            painter.setPen(QtCore.Qt.NoPen)
            painter.drawEllipse(QtCore.QPointF(x, y), self.portRadius * 0.4, self.portRadius * 0.4)

        # Draw output ports (Bottom side - Offset downwards)
        numOutputs = len(self.outputPorts)
        for i, (portName, portType) in enumerate(self.outputPorts):
            x = bodyRect.x() + (bodyRect.width() / (numOutputs + 1)) * (i + 1)
            y = bodyRect.y() + bodyRect.height() + self.portOffset

            # Port circle
            painter.setBrush(QtGui.QBrush(QtGui.QColor(180, 180, 180)))
            painter.setPen(QtGui.QPen(QtGui.QColor(30, 30, 30), 1))
            painter.drawEllipse(QtCore.QPointF(x, y), self.portRadius, self.portRadius)
            
            # Inner dot
            painter.setBrush(QtGui.QBrush(QtGui.QColor(60, 60, 60)))
            painter.setPen(QtCore.Qt.NoPen)
            painter.drawEllipse(QtCore.QPointF(x, y), self.portRadius * 0.4, self.portRadius * 0.4)

    def shape(self):
        """Return a precise shape for hit testing (Header + Ports)"""
        path = QtGui.QPainterPath()
        
        # Add ONLY header for moving/selecting the node
        bodyRect = QtCore.QRectF(-self.width/2, -self.height/2, self.width, self.height)
        headerRect = QtCore.QRectF(bodyRect.x(), bodyRect.y(), bodyRect.width(), self.headerHeight)
        path.addRect(headerRect)
        
        # Add port shapes (circles)
        # Input ports
        numInputs = len(self.inputPorts)
        for i in range(numInputs):
            x = bodyRect.x() + (bodyRect.width() / (numInputs + 1)) * (i + 1)
            y = bodyRect.y() - self.portOffset
            path.addEllipse(QtCore.QPointF(x, y), self.portRadius * 2, self.portRadius * 2)
            
        # Output ports
        numOutputs = len(self.outputPorts)
        for i in range(numOutputs):
            x = bodyRect.x() + (bodyRect.width() / (numOutputs + 1)) * (i + 1)
            y = bodyRect.y() + bodyRect.height() + self.portOffset
            path.addEllipse(QtCore.QPointF(x, y), self.portRadius * 2, self.portRadius * 2)
            
        return path

    def mousePressEvent(self, event):
        """Handle mouse press events - Precision control for movement/connection"""
        if event.button() == QtCore.Qt.LeftButton:
            # Check if clicking on a port
            port = self.getPortAtPosition(event.pos())
            if port:
                # 1. Block movement and selection
                self.setFlag(QtWidgets.QGraphicsItem.ItemIsMovable, False)
                if self.scene():
                    self.scene().clearSelection()
                self.setSelected(False)
                
                # 2. Request connection
                self.connectionRequested.emit(self, port[0], port[1])
                
                # 3. Accept and stop event propagation
                event.accept()
                return 
            
            # Check if clicking on header (for moving)
            bodyRect = QtCore.QRectF(-self.width/2, -self.height/2, self.width, self.height)
            headerRect = QtCore.QRectF(bodyRect.x(), bodyRect.y(), bodyRect.width(), self.headerHeight)
            if headerRect.contains(event.pos()):
                # Enable movement ONLY when clicking header
                self.setFlag(QtWidgets.QGraphicsItem.ItemIsMovable, True)
            else:
                # Disable movement for body clicks
                self.setFlag(QtWidgets.QGraphicsItem.ItemIsMovable, False)
                
            super().mousePressEvent(event)
            
        elif event.button() == QtCore.Qt.RightButton:
            self.showContextMenu(event.pos())

    def mouseReleaseEvent(self, event):
        """Handle mouse release events"""
        # Always disable movement flag on release for safety
        self.setFlag(QtWidgets.QGraphicsItem.ItemIsMovable, False)
        
        if event.button() == QtCore.Qt.LeftButton:
            # Check if releasing on a port
            port = self.getPortAtPosition(event.pos())
            if port:
                self.connectionCompleted.emit(self, port[0], port[1])
            else:
                super().mouseReleaseEvent(event)

    def getPortAtPosition(self, pos):
        """Get the port at the given position (Top/Bottom)"""
        bodyRect = QtCore.QRectF(-self.width/2, -self.height/2, self.width, self.height)

        # Check input ports (Top side)
        numInputs = len(self.inputPorts)
        for i, (portName, portType) in enumerate(self.inputPorts):
            x = bodyRect.x() + (bodyRect.width() / (numInputs + 1)) * (i + 1)
            y = bodyRect.y() - self.portOffset

            portRect = QtCore.QRectF(x - self.portRadius * 2, y - self.portRadius * 2,
                                     self.portRadius * 4, self.portRadius * 4)
            if portRect.contains(pos):
                return (portName, portType)

        # Check output ports (Bottom side)
        numOutputs = len(self.outputPorts)
        for i, (portName, portType) in enumerate(self.outputPorts):
            x = bodyRect.x() + (bodyRect.width() / (numOutputs + 1)) * (i + 1)
            y = bodyRect.y() + bodyRect.height() + self.portOffset

            portRect = QtCore.QRectF(x - self.portRadius * 2, y - self.portRadius * 2,
                                     self.portRadius * 4, self.portRadius * 4)
            if portRect.contains(pos):
                return (portName, portType)

        return None

    def showContextMenu(self, pos):
        """Show context menu for the node"""
        menu = QtWidgets.QMenu()

        # Properties action
        propertiesAction = menu.addAction("Properties")
        propertiesAction.triggered.connect(self.showProperties)

        menu.addSeparator()

        # Delete action
        deleteAction = menu.addAction("Delete")
        deleteAction.triggered.connect(lambda: self.nodeDeleted.emit(self))

        if self.scene() and self.scene().views():
            view = self.scene().views()[0]
            menu.exec_(view.mapToGlobal(view.mapFromScene(self.mapToScene(pos))))

    def showProperties(self):
        """Show properties dialog for the node"""
        # TODO: Implement properties dialog
        pass

    def addConnection(self, connection, direction):
        """Add a connection to this node"""
        self.connections[direction].append(connection)

    def removeConnection(self, connection, direction):
        """Remove a connection from this node"""
        if connection in self.connections[direction]:
            self.connections[direction].remove(connection)

    def getProperties(self):
        """Get the current properties of the node"""
        return self.properties.copy()

    def getPortPositionLocal(self, portName, portType):
        """Get the local position of a port (Relative to Node center)"""
        bodyRect = QtCore.QRectF(-self.width/2, -self.height/2, self.width, self.height)
        
        # Find port index
        ports = self.inputPorts if portType == 'input' else self.outputPorts
        portIndex = -1
        for i, (name, ptype) in enumerate(ports):
            if name == portName:
                portIndex = i
                break
        
        if portIndex == -1:
            return QtCore.QPointF(0, 0)

        # Calculate local position (Matching drawPorts logic)
        numPorts = len(ports)
        x_offset = (bodyRect.width() / (numPorts + 1)) * (portIndex + 1)
        
        if portType == 'input':
            y = bodyRect.y() - self.portOffset
        else:
            y = bodyRect.y() + bodyRect.height() + self.portOffset
            
        x = bodyRect.x() + x_offset
        
        return QtCore.QPointF(x, y)

    def setProperties(self, properties):
        """Set the properties of the node"""
        self.properties.update(properties)
        self.update()

    def contextMenuEvent(self, event):
        """Handle context menu events"""
        self.showContextMenu(event.pos())