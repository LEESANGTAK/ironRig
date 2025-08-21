from PyQt5.QtWidgets import QGraphicsItem, QGraphicsPathItem
from PyQt5.QtCore import Qt, QPointF, QRectF
from PyQt5.QtGui import QPen, QBrush, QColor, QPainter, QPainterPath, QPainterPathStroker


class ConnectionLine(QGraphicsPathItem):
    """Visual representation of a connection between two nodes"""
    
    def __init__(self, startNode, startPort, endNode, endPort):
        super().__init__()
        
        self.startNode = startNode
        self.startPort = startPort
        self.endNode = endNode
        self.endPort = endPort
        
        # Visual properties
        self.setZValue(-1)  # Draw behind nodes
        self.setFlag(QGraphicsItem.ItemIsSelectable)
        
        # Setup appearance
        self.setupAppearance()
        
        # Update position
        self.updatePath()
        
    def setupAppearance(self):
        """Setup the visual appearance of the connection line"""
        # Default pen
        self.setPen(QPen(QColor(200, 200, 200), 2, Qt.SolidLine))
        
        # Selected pen
        self.selectedPen = QPen(QColor(255, 255, 100), 3, Qt.SolidLine)
        
    def updatePath(self):
        """Update the path of the connection line"""
        if not self.startNode or not self.endNode:
            return
            
        # Get port positions
        startPos = self.getPortPosition(self.startNode, self.startPort, 'output')
        endPos = self.getPortPosition(self.endNode, self.endPort, 'input')
        
        if startPos and endPos:
            # Create curved path
            path = QPainterPath()
            path.moveTo(startPos)
            
            # Calculate control points for smooth curve
            dx = endPos.x() - startPos.x()
            dy = endPos.y() - startPos.y()
            
            # Control points for smooth curve
            cp1 = QPointF(startPos.x() + dx * 0.3, startPos.y())
            cp2 = QPointF(endPos.x() - dx * 0.3, endPos.y())
            
            path.cubicTo(cp1, cp2, endPos)
            
            self.setPath(path)
            
    def getPortPosition(self, node, portName, portType):
        """Get the position of a port on a node"""
        if not node:
            return None
            
        rect = node.boundingRect()
        nodePos = node.pos()
        
        # Find port index
        ports = node.inputPorts if portType == 'input' else node.outputPorts
        portIndex = -1
        
        for i, (name, ptype) in enumerate(ports):
            if name == portName:
                portIndex = i
                break
                
        if portIndex == -1:
            return None
            
        # Calculate port position
        y = rect.y() + 20 + portIndex * node.portSpacing
        x = rect.x() - node.portRadius if portType == 'input' else rect.x() + rect.width() + node.portRadius
        
        return nodePos + QPointF(x, y)
        
    def paint(self, painter, option, widget):
        """Paint the connection line"""
        # Set pen based on selection state
        if self.isSelected():
            painter.setPen(self.selectedPen)
        else:
            painter.setPen(self.pen())
            
        # Draw the path
        painter.drawPath(self.path())
        
        # Draw arrow at the end
        self.drawArrow(painter)
        
    def drawArrow(self, painter):
        """Draw an arrow at the end of the connection line"""
        if not self.endNode:
            return
            
        # Get end position
        endPos = self.getPortPosition(self.endNode, self.endPort, 'input')
        if not endPos:
            return
            
        # Get path direction at end
        path = self.path()
        if path.elementCount() < 2:
            return
            
        # Calculate direction vector
        lastElement = path.elementAt(path.elementCount() - 1)
        prevElement = path.elementAt(path.elementCount() - 2)
        
        direction = QPointF(lastElement.x - prevElement.x, lastElement.y - prevElement.y)
        length = (direction.x() ** 2 + direction.y() ** 2) ** 0.5
        
        if length > 0:
            direction = direction / length
            
            # Arrow parameters
            arrowSize = 8
            arrowAngle = 0.5  # radians
            
            # Calculate arrow points
            arrowTip = endPos
            arrowBase1 = arrowTip - QPointF(
                direction.x() * arrowSize * (1 + arrowAngle),
                direction.y() * arrowSize * (1 + arrowAngle)
            )
            arrowBase2 = arrowTip - QPointF(
                direction.x() * arrowSize * (1 - arrowAngle),
                direction.y() * arrowSize * (1 - arrowAngle)
            )
            
            # Draw arrow
            arrowPath = QPainterPath()
            arrowPath.moveTo(arrowTip)
            arrowPath.lineTo(arrowBase1)
            arrowPath.lineTo(arrowBase2)
            arrowPath.closeSubpath()
            
            painter.setBrush(QBrush(self.pen().color()))
            painter.drawPath(arrowPath)
            
    def boundingRect(self):
        """Return the bounding rectangle of the connection line"""
        path = self.path()
        rect = path.boundingRect()
        
        # Add some padding for arrow and selection
        padding = 10
        rect.adjust(-padding, -padding, padding, padding)
        
        return rect
        
    def shape(self):
        """Return the shape of the connection line for hit testing"""
        path = self.path()
        
        # Create a wider path for easier selection
        stroker = QPainterPathStroker()
        stroker.setWidth(8)
        
        return stroker.createStroke(path)
        
    def mousePressEvent(self, event):
        """Handle mouse press events"""
        if event.button() == Qt.LeftButton:
            self.setSelected(True)
        super().mousePressEvent(event)
        
    def contextMenuEvent(self, event):
        """Handle context menu events"""
        from PyQt5.QtWidgets import QMenu
        
        menu = QMenu()
        
        # Delete action
        deleteAction = menu.addAction("Delete Connection")
        deleteAction.triggered.connect(self.deleteConnection)
        
        menu.exec_(event.screenPos())
        
    def deleteConnection(self):
        """Delete this connection"""
        # Remove from nodes
        if self.startNode:
            self.startNode.removeConnection(self, 'output')
        if self.endNode:
            self.endNode.removeConnection(self, 'input')
            
        # Remove from scene
        if self.scene():
            self.scene().removeItem(self)
            
    def updatePosition(self):
        """Update the position of the connection line"""
        self.updatePath()
        self.update()