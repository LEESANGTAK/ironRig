from Qt import QtWidgets, QtCore, QtGui

import ironRig.api.irModule as irm


class ModuleNode(QtWidgets.QGraphicsObject):
    """Visual representation of a module in the node editor"""

    # Signals
    connectionRequested = QtCore.Signal(object, str, str)  # node, portName, portType
    connectionUnplugged = QtCore.Signal(object, str, str, object)  # node, portName, portType, connection
    connectionCompleted = QtCore.Signal(object, str, str)  # node, portName, portType
    nodeDeleted = QtCore.Signal(object)  # node
    displayFlagChanged = QtCore.Signal(object, bool) # node, state

    def __init__(self, moduleType, moduleName):
        super().__init__()

        self.moduleType = moduleType
        self.moduleName = moduleName
        self.properties = {}
        self.displayFlag = False  # Houdini-style Display Flag

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
                      QtWidgets.QGraphicsItem.ItemIsMovable |
                      QtWidgets.QGraphicsItem.ItemIsFocusable |
                      QtWidgets.QGraphicsItem.ItemSendsGeometryChanges)
        self.setAcceptHoverEvents(True)

        # Setup appearance
        self.setupAppearance()

        # Connections
        self.connections = {'input': [], 'output': []}

    def setupPorts(self):
        """Setup input and output ports (Tree-growth: Child Output [Bottom] -> Parent Input [Top])"""
        # Case-insensitive matching for robustness
        mType = self.moduleType.lower()
        
        if mType == 'spine':
            self.inputPorts = [('neck', 'input'), ('arm_l', 'input'), ('arm_r', 'input'), ('leg_l', 'input'), ('leg_r', 'input')]
            self.outputPorts = [('master', 'output')]
        elif mType == 'neck':
            self.inputPorts = [('head', 'input')]
            self.outputPorts = [('spine', 'output')]
        elif mType == 'limbbase':
            self.inputPorts = [('limb', 'input')]
            self.outputPorts = [('spine', 'output')]
        elif mType == 'twobonelimb':
            self.inputPorts = [('hand_foot', 'input')]
            self.outputPorts = [('parent', 'output')]
        elif mType == 'foot':
            self.inputPorts = []
            self.outputPorts = [('leg', 'output')]
        elif mType in ['globalmaster', 'master']:
            self.inputPorts = [('spine', 'input'), ('arm_l', 'input'), ('arm_r', 'input'), ('leg_l', 'input'), ('leg_r', 'input'), ('other', 'input')]
            self.outputPorts = []
        elif mType == 'spaceswitch':
            # Port 0: Driven, Port 1+: Drivers
            self.inputPorts = [('driven_0', 'input'), ('driver_1', 'input')]
            self.outputPorts = [('out_parent', 'output')]
        elif mType == 'customscript':
            self.inputPorts = [('port_0', 'input')]
            self.outputPorts = [('out_exec', 'output')]
        else:
            # Generic ports
            self.inputPorts = [('in_child', 'input')]
            self.outputPorts = [('out_parent', 'output')]

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

        # Draw Display Flag (Houdini-style on the right)
        self.drawDisplayFlag(painter)

    def drawDisplayFlag(self, painter):
        """Draw the Houdini-style display flag on the right of the node"""
        bodyRect = QtCore.QRectF(-self.width/2, -self.height/2, self.width, self.height)
        flagWidth = 20
        flagX = bodyRect.right() + 5
        flagY = bodyRect.y()
        flagHeight = bodyRect.height()
        
        flagRect = QtCore.QRectF(flagX, flagY, flagWidth, flagHeight)
        
        if self.displayFlag:
            color = QtGui.QColor(0, 150, 255) # Houdini Blue
        else:
            color = QtGui.QColor(60, 60, 60) # Dimmed
            
        painter.setBrush(QtGui.QBrush(color))
        painter.setPen(QtGui.QPen(QtGui.QColor(30, 30, 30), 1))
        painter.drawRect(flagRect)

    def drawPorts(self, painter):
        """Draw input and output ports with tree-growth layout (Input Top, Output Bottom)"""
        bodyRect = QtCore.QRectF(-self.width/2, -self.height/2, self.width, self.height)

        # Draw input ports (Top side - Target for children above)
        numInputs = len(self.inputPorts)
        for i, (portName, portType) in enumerate(self.inputPorts):
            x = bodyRect.x() + (bodyRect.width() / (numInputs + 1)) * (i + 1)
            y = bodyRect.y() - self.portOffset

            # Port circle (Improved visually without inner dot as requested)
            painter.setBrush(QtGui.QBrush(QtGui.QColor(180, 180, 180)))
            painter.setPen(QtGui.QPen(QtGui.QColor(30, 30, 30), 1.5))
            painter.drawEllipse(QtCore.QPointF(x, y), self.portRadius, self.portRadius)

        # Draw output ports (Bottom side - Connects to parent below)
        numOutputs = len(self.outputPorts)
        for i, (portName, portType) in enumerate(self.outputPorts):
            x = bodyRect.x() + (bodyRect.width() / (numOutputs + 1)) * (i + 1)
            y = bodyRect.y() + bodyRect.height() + self.portOffset

            # Port circle
            painter.setBrush(QtGui.QBrush(QtGui.QColor(180, 180, 180)))
            painter.setPen(QtGui.QPen(QtGui.QColor(30, 30, 30), 1.5))
            painter.drawEllipse(QtCore.QPointF(x, y), self.portRadius, self.portRadius)

    def shape(self):
        """Return the shape for hit testing (Body + Ports)"""
        path = QtGui.QPainterPath()
        
        # Add the entire body for selecting/moving
        bodyRect = QtCore.QRectF(-self.width/2, -self.height/2, self.width, self.height)
        path.addRect(bodyRect)
        
        # Add port shapes (circles) with slightly larger hit area for easier clicking
        # Input ports (Top)
        numInputs = len(self.inputPorts)
        for i in range(numInputs):
            x = bodyRect.x() + (bodyRect.width() / (numInputs + 1)) * (i + 1)
            y = bodyRect.y() - self.portOffset
            path.addEllipse(QtCore.QPointF(x, y), self.portRadius * 1.5, self.portRadius * 1.5)

        # Output ports (Bottom)
        numOutputs = len(self.outputPorts)
        for i in range(numOutputs):
            x = bodyRect.x() + (bodyRect.width() / (numOutputs + 1)) * (i + 1)
            y = bodyRect.y() + bodyRect.height() + self.portOffset
            path.addEllipse(QtCore.QPointF(x, y), self.portRadius * 1.5, self.portRadius * 1.5)

        # Add Display Flag area
        flagRect = QtCore.QRectF(bodyRect.right() + 5, bodyRect.y(), 20, bodyRect.height())
        path.addRect(flagRect)

        return path

    def mousePressEvent(self, event):
        """Handle mouse press events - Precision control for movement/connection"""
        if event.button() == QtCore.Qt.LeftButton:
            # Check if clicking on a port (Highest Priority)
            port = self.getPortAtPosition(event.pos())
            if port:
                portName, portType = port
                
                # Houdini Style: If clicking an already connected input port, 
                # disconnect it and start dragging from the source output port.
                if portType == 'input' and self.connections['input']:
                    # Find the connection for this specific port
                    for conn in self.connections['input']:
                        if conn.endPort == portName:
                            # 1. Clear selection to allow pure connection drag
                            if self.scene():
                                self.scene().clearSelection()
                            self.setSelected(False)
                            
                            # 2. Defer deletion and re-start to NodeEditor
                            self.connectionUnplugged.emit(self, portName, portType, conn)
                            event.accept()
                            return

                # Normal connection start
                # 1. Block movement and selection to allow pure connection drag
                self.setFlag(QtWidgets.QGraphicsItem.ItemIsMovable, False)
                if self.scene():
                    self.scene().clearSelection()
                self.setSelected(False)
                
                # 2. Request connection
                self.connectionRequested.emit(self, port[0], port[1])
                
                # 3. Accept and stop event propagation
                event.accept()
                return 

            # Check if clicking Display Flag
            if self.isOverDisplayFlag(event.pos()):
                self.displayFlag = not self.displayFlag
                self.update()
                self.displayFlagChanged.emit(self, self.displayFlag)
                event.accept()
                return
            
            # Clicking on the body (Selection and Movement)
            super().mousePressEvent(event)
            
        elif event.button() == QtCore.Qt.RightButton:
            self.showContextMenu(event.pos())
            event.accept()
            return
            
        # For MiddleButton or others, propagate to the View for panning
        super().mousePressEvent(event)

    def mouseReleaseEvent(self, event):
        """Handle mouse release events"""
        # Always restore movement flag on release
        self.setFlag(QtWidgets.QGraphicsItem.ItemIsMovable, True)
        self.setCursor(QtCore.Qt.ArrowCursor) # Added cursor reset
        
        if event.button() == QtCore.Qt.LeftButton:
            # Check if releasing on a port
            port = self.getPortAtPosition(event.pos())
            if port:
                self.connectionCompleted.emit(self, port[0], port[1])
            else:
                super().mouseReleaseEvent(event)

    def hoverMoveEvent(self, event):
        """Handle hover move events to show tooltips for ports"""
        pos = event.pos()
        port = self.getPortAtPosition(pos)
        
        if port:
            portName, portType = port
            tooltip = self.getPortToolTip(portName, portType)
            self.setToolTip(tooltip)
            # Use specific cursor over ports
            self.setCursor(QtCore.Qt.CrossCursor)
        elif self.isOverDisplayFlag(pos):
            self.setToolTip("Build Visibility Flag: 클릭하여 이 노드까지 빌드합니다.")
            self.setCursor(QtCore.Qt.PointingHandCursor)
        else:
            self.setToolTip(f"{self.moduleType}: {self.moduleName}")
            self.setCursor(QtCore.Qt.ArrowCursor)
            
        super().hoverMoveEvent(event)

    def getPortToolTip(self, portName, portType):
        """Get the tooltip for a port based on its name and module context"""
        mType = self.moduleType
        
        if portType == 'input':
            if mType == 'SpaceSwitch':
                try:
                    idx = int(portName.split('_')[-1])
                    if idx == 0: return "Driven Input: 다른 타겟으로 전환될 대상 모듈을 연결하세요."
                    return f"Driver Input {idx}: 공간의 기준이 될 타겟 모듈을 연결하세요."
                except: return "Space Driver Input"
            elif mType == 'CustomScript':
                return f"Variable Input ({portName}): 스크립트 내에서 @{portName}으로 참조할 수 있습니다."
            elif mType == 'GlobalMaster':
                return f"Root Child ({portName}): 리그 루트 아래에 연결될 모듈을 여기에 연결하세요."
            else:
                return f"Child Input ({portName}): 자식 모듈을 여기에 연결하여 리깅 구조를 만드세요."
        else: # output
            if mType == 'SpaceSwitch':
                return "Output: 부모 모듈에 연결하거나 다른 SpaceSwitch의 Driven으로 연결 가능합니다."
            elif mType == 'CustomScript':
                return "Execution Output: 빌드 실행 순서를 제어하기 위해 사용합니다."
            else:
                return f"Connect to Parent: 위쪽에 있는 부모 모듈의 Input 포트에 연결하세요."

    def getPortAtPosition(self, pos):
        """Get the port at the given position (Matching shape() hit area)"""
        bodyRect = QtCore.QRectF(-self.width/2, -self.height/2, self.width, self.height)
        hitSize = self.portRadius * 1.5

        # Check input ports (Top side)
        numInputs = len(self.inputPorts)
        for i, (portName, portType) in enumerate(self.inputPorts):
            x = bodyRect.x() + (bodyRect.width() / (numInputs + 1)) * (i + 1)
            y = bodyRect.y() - self.portOffset

            portRect = QtCore.QRectF(x - hitSize, y - hitSize, hitSize * 2, hitSize * 2)
            if portRect.contains(pos):
                return (portName, portType)

        # Check output ports (Bottom side)
        numOutputs = len(self.outputPorts)
        for i, (portName, portType) in enumerate(self.outputPorts):
            x = bodyRect.x() + (bodyRect.width() / (numOutputs + 1)) * (i + 1)
            y = bodyRect.y() + bodyRect.height() + self.portOffset

            portRect = QtCore.QRectF(x - hitSize, y - hitSize, hitSize * 2, hitSize * 2)
            if portRect.contains(pos):
                return (portName, portType)

        return None

    def isOverDisplayFlag(self, pos):
        """Check if the position is over the Display Flag area"""
        bodyRect = QtCore.QRectF(-self.width/2, -self.height/2, self.width, self.height)
        flagRect = QtCore.QRectF(bodyRect.right() + 5, bodyRect.y(), 20, bodyRect.height())
        return flagRect.contains(pos)

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
        """Get the current properties and metadata of the node for storage"""
        config = self.properties.copy()
        config['inputPortCount'] = len(self.inputPorts)
        return config

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
        
        if portType == 'input': # Top (From children above)
            y = bodyRect.y() - self.portOffset
        else: # Output (Bottom) (To parent below)
            y = bodyRect.y() + bodyRect.height() + self.portOffset
            
        x = bodyRect.x() + x_offset
        
        return QtCore.QPointF(x, y)

    def setProperties(self, properties):
        """Set the properties of the node"""
        self.properties.update(properties)
        self.update()

    def itemChange(self, change, value):
        """Handle item changes (Position change) to update connections"""
        if change == QtWidgets.QGraphicsItem.ItemPositionHasChanged:
            # Update all connected lines
            for conn in self.connections['input'] + self.connections['output']:
                conn.updatePath()
                
        return super().itemChange(change, value)

    def setInputPortCount(self, count):
        """Update node's input port count dynamically for any node type"""
        # Map of base ports for known modules to keep consistent naming
        base_ports_map = {
            'spine': ['neck', 'arm_l', 'arm_r', 'leg_l', 'leg_r', 'other'],
            'globalmaster': ['spine', 'arm_l', 'arm_r', 'leg_l', 'leg_r', 'other'],
            'master': ['spine', 'arm_l', 'arm_r', 'leg_l', 'leg_r', 'other'],
            'neck': ['head', 'other'],
            'twobonelimb': ['hand_foot', 'other'],
            'limbbase': ['limb', 'other'],
            'spaceswitch': ['driven_0', 'driver_1', 'driver_2', 'driver_3', 'driver_4'],
            'customscript': ['port_0', 'port_1', 'port_2', 'port_3', 'port_4']
        }
        
        mType = self.moduleType.lower()
        base_ports = base_ports_map.get(mType, ['input'])
        
        new_ports = []
        for i in range(count):
            if i < len(base_ports):
                new_ports.append((base_ports[i], 'input'))
            else:
                new_ports.append((f'input_{i}', 'input'))
                
        self.inputPorts = new_ports
        self.update()
        
        # Trigger connection updates
        for conn in self.connections.get('input', []) + self.connections.get('output', []):
            conn.updatePath()

    def contextMenuEvent(self, event):
        """Handle context menu events"""
        self.showContextMenu(event.pos())