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
    guideFlagChanged = QtCore.Signal(object, bool) # node, state

    def __init__(self, moduleType, moduleName):
        super().__init__()

        self.moduleType = moduleType
        self.moduleName = moduleName
        self.properties = {}
        self.displayFlag = False  # Houdini-style Display Flag (Right)
        self.guideFlag = False    # Guide Mode Flag (Left)
        self.bypassFlag = False   # Houdini-style Bypass Flag (Far Left)

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
        """Setup input and output ports (Top-Down: Parent Output [Bottom] -> Child Input [Top])
        
        Input (Top): Port receiving from parent (typically 1)
        Output (Bottom): Ports connecting to children (can be multiple)
        """
        mType = self.moduleType.lower()
        
        if mType == 'spine':
            self.inputPorts = [('master', 'input')]
            self.outputPorts = [('neck', 'output'), ('arm_l', 'output'), ('arm_r', 'output'), ('leg_l', 'output'), ('leg_r', 'output')]
        elif mType == 'neck':
            self.inputPorts = [('spine', 'input')]
            self.outputPorts = [('head', 'output')]
        elif mType == 'limbbase':
            self.inputPorts = [('spine', 'input')]
            self.outputPorts = [('limb', 'output')]
        elif mType == 'twobonelimb':
            self.inputPorts = [('parent', 'input')]
            self.outputPorts = [('hand_foot', 'output')]
        elif mType == 'foot':
            self.inputPorts = [('leg', 'input')]
            self.outputPorts = []
        elif mType in ['globalroot', 'globalmaster']:
            self.inputPorts = [('pre_script', 'input')]
            self.outputPorts = [('spine', 'output'), ('arm_l', 'output'), ('arm_r', 'output'), ('leg_l', 'output'), ('leg_r', 'output'), ('other', 'output')]
        elif mType == 'spaceswitch':
            # Port 0: Driven, Port 1+: Drivers
            self.inputPorts = [('driven_0', 'input'), ('driver_1', 'input')]
            self.outputPorts = [('out_result', 'output')]
        elif mType == 'customscript':
            self.inputPorts = [('in_exec', 'input')]
            self.outputPorts = [('port_0', 'output')]
        elif mType == 'finger':
            self.inputPorts = [('parent', 'input')]
            self.outputPorts = []
        elif mType == 'build':
            # Aggregation node: 1 Array input port (top), 1 output (bottom)
            self.inputPorts = [('chain_0', 'input')]
            self.outputPorts = [('out', 'output')]
        else:
            # Generic ports
            self.inputPorts = [('parent', 'input')]
            self.outputPorts = [('child', 'output')]

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

        # Set module-specific property defaults
        from .propertyEditor import PropertyEditor
        specificProps = PropertyEditor.getModuleSpecificProperties(self.moduleType)
        for propDef in specificProps:
            self.properties[propDef['name']] = propDef['default']

    def setupAppearance(self):
        """Setup the visual appearance of the node"""
        # Add shadow effect
        shadow = QtWidgets.QGraphicsDropShadowEffect()
        shadow.setBlurRadius(10)
        shadow.setColor(QtGui.QColor(0, 0, 0, 100))
        shadow.setOffset(2, 2)
        self.setGraphicsEffect(shadow)

    def boundingRect(self):
        """Return the bounding rectangle of the node (expanded for ports and flags)"""
        portMargin = self.portRadius + self.portOffset + 2  # 24px for ports (top/bottom)
        # Left margin: Bypass flag extends to bodyRect.left() - 47, so 47 + 2 padding
        leftMargin = 49
        # Right margin: Display flag extends to bodyRect.right() + 25, so 25 + 2 padding
        rightMargin = 27
        return QtCore.QRectF(-self.width/2 - leftMargin, -self.height/2 - portMargin, 
                             self.width + leftMargin + rightMargin, self.height + portMargin * 2)

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

        # Bypass visual: reduce opacity for entire node body
        if self.bypassFlag:
            painter.setOpacity(0.4)

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

        # Bypass overlay: diagonal slash across the node body
        if self.bypassFlag:
            painter.setOpacity(0.7)
            slashPen = QtGui.QPen(QtGui.QColor(200, 180, 0), 2.5)
            painter.setPen(slashPen)
            painter.drawLine(bodyRect.topLeft(), bodyRect.bottomRight())
            painter.drawLine(bodyRect.topRight(), bodyRect.bottomLeft())

        # Restore full opacity for flags (always visible)
        painter.setOpacity(1.0)

        # Draw Display Flag (Right)
        self.drawDisplayFlag(painter)

        # Draw Bypass Flag (Far Left)
        self.drawBypassFlag(painter)

        # Draw Guide Flag (Left, between Bypass and Body)
        self.drawGuideFlag(painter)

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

    def drawGuideFlag(self, painter):
        """Draw the Guide Mode flag on the left of the node (between Bypass and Body)"""
        bodyRect = QtCore.QRectF(-self.width/2, -self.height/2, self.width, self.height)
        flagWidth = 20
        flagX = bodyRect.left() - 5 - flagWidth
        flagY = bodyRect.y()
        flagHeight = bodyRect.height()
        
        flagRect = QtCore.QRectF(flagX, flagY, flagWidth, flagHeight)
        
        if self.guideFlag:
            color = QtGui.QColor(0, 180, 80) # Green for Guide Mode
        else:
            color = QtGui.QColor(60, 60, 60) # Dimmed
            
        painter.setBrush(QtGui.QBrush(color))
        painter.setPen(QtGui.QPen(QtGui.QColor(30, 30, 30), 1))
        painter.drawRect(flagRect)

    def drawBypassFlag(self, painter):
        """Draw the Houdini-style Bypass flag to the left of the Guide flag"""
        bodyRect = QtCore.QRectF(-self.width/2, -self.height/2, self.width, self.height)
        flagWidth = 20
        # Position: left of Guide flag (Guide is at bodyRect.left() - 25)
        flagX = bodyRect.left() - 5 - flagWidth - 2 - flagWidth  # Guide gap + Guide width + gap + Bypass width
        flagY = bodyRect.y()
        flagHeight = bodyRect.height()
        
        flagRect = QtCore.QRectF(flagX, flagY, flagWidth, flagHeight)
        
        if self.bypassFlag:
            color = QtGui.QColor(200, 180, 0)  # Houdini Yellow for Bypass
        else:
            color = QtGui.QColor(60, 60, 60)   # Dimmed
            
        painter.setBrush(QtGui.QBrush(color))
        painter.setPen(QtGui.QPen(QtGui.QColor(30, 30, 30), 1))
        painter.drawRect(flagRect)

    def drawPorts(self, painter):
        """Draw input and output ports (Top-Down: Input Top from parent, Output Bottom to children)"""
        bodyRect = QtCore.QRectF(-self.width/2, -self.height/2, self.width, self.height)

        # Draw input ports (Top side - receiving from parent)
        numInputs = len(self.inputPorts)
        for i, (portName, portType) in enumerate(self.inputPorts):
            x = bodyRect.x() + (bodyRect.width() / (numInputs + 1)) * (i + 1)
            y = bodyRect.y() - self.portOffset
            painter.setBrush(QtGui.QBrush(QtGui.QColor(180, 180, 180)))
            painter.setPen(QtGui.QPen(QtGui.QColor(30, 30, 30), 1.5))
            
            # Array Port (Build node) -> Square shape on Input
            if self.moduleType == 'Build':
                side = self.portRadius * 2
                painter.drawRect(QtCore.QRectF(x - self.portRadius, y - self.portRadius, side, side))
            else:
                painter.drawEllipse(QtCore.QPointF(x, y), self.portRadius, self.portRadius)

        # Draw output ports (Bottom side - connecting to children)
        numOutputs = len(self.outputPorts)
        for i, (portName, portType) in enumerate(self.outputPorts):
            x = bodyRect.x() + (bodyRect.width() / (numOutputs + 1)) * (i + 1)
            y = bodyRect.y() + bodyRect.height() + self.portOffset

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

        # Add Display Flag area (Right)
        flagRect = QtCore.QRectF(bodyRect.right() + 5, bodyRect.y(), 20, bodyRect.height())
        path.addRect(flagRect)

        # Add Guide Flag area (Left)
        guideFlagRect = QtCore.QRectF(bodyRect.left() - 25, bodyRect.y(), 20, bodyRect.height())
        path.addRect(guideFlagRect)

        # Add Bypass Flag area (Far Left, left of Guide)
        bypassFlagRect = QtCore.QRectF(bodyRect.left() - 47, bodyRect.y(), 20, bodyRect.height())
        path.addRect(bypassFlagRect)

        return path

    def mousePressEvent(self, event):
        """Handle mouse press events - Precision control for movement/connection"""
        if event.button() == QtCore.Qt.LeftButton:
            # Check if clicking on a port (Highest Priority)
            port = self.getPortAtPosition(event.pos())
            if port:
                portName, portType = port
                
                # Disconnect existing connection?
                # Input ports (from parent) allow only 1 connection.
                if portType == 'input' and self.connections['input']:
                    for conn in self.connections['input']:
                        if conn.endPort == portName:
                            if self.scene():
                                self.scene().clearSelection()
                            self.setSelected(False)
                            self.connectionUnplugged.emit(self, portName, portType, conn)
                            event.accept()
                            return

                # Normal connection start
                # Readjust flags for proper UI feedback during connection
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
                # Mutually exclusive: turn off Guide Flag
                if self.displayFlag and self.guideFlag:
                    self.guideFlag = False
                    self.guideFlagChanged.emit(self, False)
                self.update()
                self.displayFlagChanged.emit(self, self.displayFlag)
                event.accept()
                return

            # Check if clicking Guide Flag
            if self.isOverGuideFlag(event.pos()):
                self.guideFlag = not self.guideFlag
                # Mutually exclusive: turn off Display Flag
                if self.guideFlag and self.displayFlag:
                    self.displayFlag = False
                    self.displayFlagChanged.emit(self, False)
                self.update()
                self.guideFlagChanged.emit(self, self.guideFlag)
                event.accept()
                return

            # Check if clicking Bypass Flag
            if self.isOverBypassFlag(event.pos()):
                self.bypassFlag = not self.bypassFlag
                self.update()
                event.accept()
                return
            
            # Check if clicked inside the main body block
            bodyRect = QtCore.QRectF(-self.width/2, -self.height/2, self.width, self.height)
            if bodyRect.contains(event.pos()):
                # Clicking on the body or title (Selection and Movement)
                super().mousePressEvent(event)
                return
            
        elif event.button() == QtCore.Qt.RightButton:
            self.showContextMenu(event.pos())
            event.accept()
            return
            
        # For MiddleButton or others, pass up
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
            self.setToolTip("Display Flag: 클릭하여 이 노드까지 빌드합니다.")
            self.setCursor(QtCore.Qt.PointingHandCursor)
        elif self.isOverGuideFlag(pos):
            self.setToolTip("Guide Flag: 클릭하여 조인트 방향을 수동 조절합니다.")
            self.setCursor(QtCore.Qt.PointingHandCursor)
        elif self.isOverBypassFlag(pos):
            self.setToolTip("Bypass: 클릭하여 빌드 시 이 노드를 건너뜁니다.")
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
                return f"Exec Input: 실행 순서를 제어하려면 위쪽 노드의 Output에 연결하세요."
            elif mType in ['GlobalRoot', 'GlobalMaster']:
                return f"Pre-Script Input: PreCustomScript 노드를 연결할 수 있습니다."
            else:
                return f"Parent Input ({portName}): 위쪽 부모 모듈의 Output 포트에서 연결하세요."
        else: # output
            if mType == 'SpaceSwitch':
                return "Output: 결과를 다른 노드에 전달합니다."
            elif mType == 'CustomScript':
                return f"Variable Output ({portName}): @{portName}으로 참조 가능한 값을 전달합니다."
            elif mType in ['GlobalRoot', 'GlobalMaster']:
                return f"Child Output ({portName}): 자식 모듈의 Input 포트에 연결하세요."
            else:
                return f"Child Output ({portName}): 아래쪽 자식 모듈의 Input 포트에 연결하세요."

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

    def isOverGuideFlag(self, pos):
        """Check if the position is over the Guide Flag area"""
        bodyRect = QtCore.QRectF(-self.width/2, -self.height/2, self.width, self.height)
        flagRect = QtCore.QRectF(bodyRect.left() - 25, bodyRect.y(), 20, bodyRect.height())
        return flagRect.contains(pos)

    def isOverBypassFlag(self, pos):
        """Check if the position is over the Bypass Flag area (far left)"""
        bodyRect = QtCore.QRectF(-self.width/2, -self.height/2, self.width, self.height)
        flagRect = QtCore.QRectF(bodyRect.left() - 47, bodyRect.y(), 20, bodyRect.height())
        return flagRect.contains(pos)

    def showContextMenu(self, pos):
        """Show context menu for the node"""
        menu = QtWidgets.QMenu()

        # Properties action
        propertiesAction = menu.addAction("Properties")
        propertiesAction.triggered.connect(self.showProperties)

        menu.addSeparator()

        # Bypass toggle
        bypassText = "Bypass OFF" if self.bypassFlag else "Bypass ON"
        bypassAction = menu.addAction(bypassText)
        bypassAction.triggered.connect(self._toggleBypass)

        menu.addSeparator()

        # Delete action
        deleteAction = menu.addAction("Delete")
        deleteAction.triggered.connect(lambda: self.nodeDeleted.emit(self))

        if self.scene() and self.scene().views():
            view = self.scene().views()[0]
            menu.exec_(view.mapToGlobal(view.mapFromScene(self.mapToScene(pos))))

    def _toggleBypass(self):
        """Toggle bypass flag from context menu"""
        self.bypassFlag = not self.bypassFlag
        self.update()

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
        config['outputPortCount'] = len(self.outputPorts)
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
        
        if portType == 'input': # Top (From parent above)
            y = bodyRect.y() - self.portOffset
        else: # Output (Bottom) (To children below)
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

    def setOutputPortCount(self, count):
        """Update node's output port count dynamically (children ports)"""
        base_ports_map = {
            'spine': ['neck', 'arm_l', 'arm_r', 'leg_l', 'leg_r', 'other'],
            'globalroot': ['spine', 'arm_l', 'arm_r', 'leg_l', 'leg_r', 'other'],
            'globalmaster': ['spine', 'arm_l', 'arm_r', 'leg_l', 'leg_r', 'other'],
            'neck': ['head', 'other'],
            'twobonelimb': ['hand_foot', 'other'],
            'limbbase': ['limb', 'other'],
            'spaceswitch': ['driven_0', 'driver_1', 'driver_2', 'driver_3', 'driver_4'],
            'customscript': ['port_0', 'port_1', 'port_2', 'port_3', 'port_4']
        }
        
        mType = self.moduleType.lower()
        base_ports = base_ports_map.get(mType, ['child'])
        
        new_ports = []
        for i in range(count):
            if i < len(base_ports):
                new_ports.append((base_ports[i], 'output'))
            else:
                new_ports.append((f'output_{i}', 'output'))
                
        self.outputPorts = new_ports
        self.update()
        
        # Trigger connection updates
        for conn in self.connections.get('input', []) + self.connections.get('output', []):
            conn.updatePath()

    def contextMenuEvent(self, event):
        """Handle context menu events"""
        self.showContextMenu(event.pos())