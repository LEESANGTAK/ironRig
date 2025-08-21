from PyQt5.QtWidgets import (QGraphicsItem, QGraphicsTextItem, QGraphicsRectItem,
                             QGraphicsEllipseItem, QGraphicsDropShadowEffect,
                             QGraphicsProxyWidget, QWidget, QVBoxLayout, QHBoxLayout,
                             QLabel, QLineEdit, QComboBox, QPushButton, QMenu)
from PyQt5.QtCore import Qt, QRectF, QPointF, pyqtSignal, QPropertyAnimation, QEasingCurve
from PyQt5.QtGui import QPen, QBrush, QColor, QPainter, QPainterPath, QFont, QContextMenuEvent

import ironRig.api.irModule as irm


class ModuleNode(QGraphicsItem):
    """Visual representation of a module in the node editor"""
    
    connectionRequested = pyqtSignal(object, str, str)  # node, port_name, port_type
    connectionCompleted = pyqtSignal(object, str, str)  # target_node, port_name, port_type
    nodeDeleted = pyqtSignal(object)  # node
    
    def __init__(self, moduleType, moduleName):
        super().__init__()
        
        self.moduleType = moduleType
        self.moduleName = moduleName
        self.properties = {}
        
        # Node dimensions
        self.width = 200
        self.height = 120
        self.portRadius = 8
        self.portSpacing = 25
        
        # Setup ports
        self.inputPorts = []
        self.outputPorts = []
        self.setupPorts()
        
        # Setup properties
        self.setupProperties()
        
        # Visual properties
        self.setFlag(QGraphicsItem.ItemIsMovable)
        self.setFlag(QGraphicsItem.ItemIsSelectable)
        self.setFlag(QGraphicsItem.ItemSendsGeometryChanges)
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
        shadow = QGraphicsDropShadowEffect()
        shadow.setBlurRadius(10)
        shadow.setColor(QColor(0, 0, 0, 100))
        shadow.setOffset(2, 2)
        self.setGraphicsEffect(shadow)
        
    def boundingRect(self):
        """Return the bounding rectangle of the node"""
        return QRectF(-self.width/2, -self.height/2, self.width, self.height)
        
    def paint(self, painter, option, widget):
        """Paint the node"""
        # Setup painter
        painter.setRenderHint(QPainter.Antialiasing)
        
        # Node background
        if self.isSelected():
            bgColor = QColor(80, 120, 200)
            borderColor = QColor(120, 180, 255)
        else:
            bgColor = QColor(60, 60, 60)
            borderColor = QColor(100, 100, 100)
            
        # Draw node body
        painter.setBrush(QBrush(bgColor))
        painter.setPen(QPen(borderColor, 2))
        
        rect = self.boundingRect()
        painter.drawRoundedRect(rect, 10, 10)
        
        # Draw title
        painter.setPen(QColor(255, 255, 255))
        font = QFont()
        font.setBold(True)
        font.setPointSize(10)
        painter.setFont(font)
        
        titleRect = QRectF(rect.x(), rect.y() - 30, rect.width(), 30)
        painter.drawText(titleRect, Qt.AlignCenter, self.moduleType)
        
        # Draw module name
        font.setBold(False)
        font.setPointSize(8)
        painter.setFont(font)
        nameRect = QRectF(rect.x(), rect.y() - 15, rect.width(), 15)
        painter.drawText(nameRect, Qt.AlignCenter, self.moduleName)
        
        # Draw ports
        self.drawPorts(painter)
        
    def drawPorts(self, painter):
        """Draw input and output ports"""
        rect = self.boundingRect()
        
        # Draw input ports (left side)
        for i, (portName, portType) in enumerate(self.inputPorts):
            y = rect.y() + 20 + i * self.portSpacing
            x = rect.x() - self.portRadius
            
            # Port circle
            painter.setBrush(QBrush(QColor(100, 150, 255)))
            painter.setPen(QPen(QColor(255, 255, 255), 1))
            painter.drawEllipse(QPointF(x, y), self.portRadius, self.portRadius)
            
            # Port label
            painter.setPen(QColor(255, 255, 255))
            font = QFont()
            font.setPointSize(7)
            painter.setFont(font)
            painter.drawText(QRectF(x - 50, y - 10, 45, 20), 
                           Qt.AlignRight | Qt.AlignVCenter, portName)
            
        # Draw output ports (right side)
        for i, (portName, portType) in enumerate(self.outputPorts):
            y = rect.y() + 20 + i * self.portSpacing
            x = rect.x() + rect.width() + self.portRadius
            
            # Port circle
            painter.setBrush(QBrush(QColor(255, 150, 100)))
            painter.setPen(QPen(QColor(255, 255, 255), 1))
            painter.drawEllipse(QPointF(x, y), self.portRadius, self.portRadius)
            
            # Port label
            painter.setPen(QColor(255, 255, 255))
            font = QFont()
            font.setPointSize(7)
            painter.setFont(font)
            painter.drawText(QRectF(x + 5, y - 10, 45, 20), 
                           Qt.AlignLeft | Qt.AlignVCenter, portName)
            
    def mousePressEvent(self, event):
        """Handle mouse press events"""
        if event.button() == Qt.LeftButton:
            # Check if clicking on a port
            port = self.getPortAtPosition(event.pos())
            if port:
                self.connectionRequested.emit(self, port[0], port[1])
            else:
                super().mousePressEvent(event)
        elif event.button() == Qt.RightButton:
            self.showContextMenu(event.pos())
            
    def mouseReleaseEvent(self, event):
        """Handle mouse release events"""
        if event.button() == Qt.LeftButton:
            # Check if releasing on a port
            port = self.getPortAtPosition(event.pos())
            if port:
                self.connectionCompleted.emit(self, port[0], port[1])
            else:
                super().mouseReleaseEvent(event)
                
    def getPortAtPosition(self, pos):
        """Get the port at the given position"""
        rect = self.boundingRect()
        
        # Check input ports (left side)
        for i, (portName, portType) in enumerate(self.inputPorts):
            y = rect.y() + 20 + i * self.portSpacing
            x = rect.x() - self.portRadius
            
            portRect = QRectF(x - self.portRadius, y - self.portRadius, 
                             self.portRadius * 2, self.portRadius * 2)
            if portRect.contains(pos):
                return (portName, portType)
                
        # Check output ports (right side)
        for i, (portName, portType) in enumerate(self.outputPorts):
            y = rect.y() + 20 + i * self.portSpacing
            x = rect.x() + rect.width() + self.portRadius
            
            portRect = QRectF(x - self.portRadius, y - self.portRadius, 
                             self.portRadius * 2, self.portRadius * 2)
            if portRect.contains(pos):
                return (portName, portType)
                
        return None
        
    def showContextMenu(self, pos):
        """Show context menu for the node"""
        menu = QMenu()
        
        # Properties action
        propertiesAction = menu.addAction("Properties")
        propertiesAction.triggered.connect(self.showProperties)
        
        menu.addSeparator()
        
        # Delete action
        deleteAction = menu.addAction("Delete")
        deleteAction.triggered.connect(lambda: self.nodeDeleted.emit(self))
        
        menu.exec_(self.scene().views()[0].mapToGlobal(
            self.scene().views()[0].mapFromScene(self.mapToScene(pos))))
            
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
        
    def setProperties(self, properties):
        """Set the properties of the node"""
        self.properties.update(properties)
        self.update()
        
    def contextMenuEvent(self, event):
        """Handle context menu events"""
        self.showContextMenu(event.pos())