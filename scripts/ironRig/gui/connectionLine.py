from Qt import QtWidgets, QtCore, QtGui


class ConnectionLine(QtWidgets.QGraphicsPathItem):
    """Visual representation of a connection between two nodes"""

    def __init__(self, startNode, startPort, endNode, endPort):
        super().__init__()

        self.startNode = startNode
        self.startPort = startPort
        self.endNode = endNode
        self.endPort = endPort

        # Visual properties
        self.setZValue(-1)  # Draw behind nodes
        self.setFlag(QtWidgets.QGraphicsItem.ItemIsSelectable)

        # Setup appearance
        self.setupAppearance()

        # Update position
        self.updatePath()

    def setupAppearance(self):
        """Setup the visual appearance of the connection line"""
        # Default pen
        self.setPen(QtGui.QPen(QtGui.QColor(200, 200, 200), 2, QtCore.Qt.SolidLine))

        # Selected pen
        self.selectedPen = QtGui.QPen(QtGui.QColor(255, 255, 100), 3, QtCore.Qt.SolidLine)

    def updatePath(self):
        """Update the path of the connection line (Vertical S-Curve)"""
        if not self.startNode or not self.endNode:
            return

        # Get port positions
        startPos = self.getPortPosition(self.startNode, self.startPort, 'output')
        endPos = self.getPortPosition(self.endNode, self.endPort, 'input')

        if startPos and endPos:
            # Create curved path
            path = QtGui.QPainterPath()
            path.moveTo(startPos)

            # Increase the control point distance for deeper Houdini-style curve
            dy_total = endPos.y() - startPos.y()
            offset = max(abs(dy_total) * 0.5, 20)
            
            cp1 = QtCore.QPointF(startPos.x(), startPos.y() + offset if dy_total > 0 else startPos.y() - offset)
            cp2 = QtCore.QPointF(endPos.x(), endPos.y() - offset if dy_total > 0 else endPos.y() + offset)

            path.cubicTo(cp1, cp2, endPos)

            self.setPath(path)

    def getPortPosition(self, node, portName, portType):
        """Get the scene position of a port on a node"""
        if not node:
            return None
            
        # Use the node's own coordinate mapping for maximum precision
        if hasattr(node, 'getPortPositionLocal'):
            localPos = node.getPortPositionLocal(portName, portType)
            return node.mapToScene(localPos)
            
        return None

    def paint(self, painter, option, widget):
        """Paint the connection line"""
        # Set pen based on selection state
        if self.isSelected():
            painter.setPen(self.selectedPen)
        else:
            painter.setPen(self.pen())

        # Draw the path
        painter.drawPath(self.path())

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
        stroker = QtGui.QPainterPathStroker()
        stroker.setWidth(8)

        return stroker.createStroke(path)

    def mousePressEvent(self, event):
        """Handle mouse press events"""
        if event.button() == QtCore.Qt.LeftButton:
            self.setSelected(True)
        super().mousePressEvent(event)

    def contextMenuEvent(self, event):
        """Handle context menu events"""
        menu = QtWidgets.QMenu()

        # Delete action
        deleteAction = menu.addAction("Delete Connection")
        deleteAction.triggered.connect(self.deleteConnection)

        if not self.scene() or not self.scene().views():
            return
        
        menu.exec_(QtGui.QCursor.pos())

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