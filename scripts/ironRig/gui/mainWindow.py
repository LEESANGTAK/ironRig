import sys
from Qt import QtWidgets, QtCore, QtGui

from .nodeEditor import NodeEditor
from .modulePanel import ModulePanel
from .propertyEditor import PropertyEditor
from .nodeConfig import save_node_default


class MainWindow(QtWidgets.QMainWindow):
    def __init__(self, parent=None):
        # Try to get Maya main window as parent if available
        if parent is None:
            try:
                import maya.OpenMayaUI as omui
                from shiboken2 import wrapInstance
                maya_main_window = wrapInstance(int(omui.MQtUtil.mainWindow()), QtWidgets.QWidget)
                parent = maya_main_window
            except ImportError:
                # Not in Maya, use default parent
                pass
            except:
                # shiboken2 not available, try PySide2
                try:
                    from shiboken2 import wrapInstance
                    maya_main_window = wrapInstance(int(omui.MQtUtil.mainWindow()), QtWidgets.QWidget)
                    parent = maya_main_window
                except:
                    pass

        super().__init__(parent)
        self.setObjectName("ironRigMainWindow") # Unique ID for searching
        self.setWindowTitle("Iron Rig - Node Editor")
        self.setGeometry(100, 100, 1400, 900)

        # Set window flags to keep it on top
        self.setWindowFlags(QtCore.Qt.Window)

        # Initialize components
        self.nodeEditor = NodeEditor()
        self.modulePanel = ModulePanel()
        self.propertyEditor = PropertyEditor()

        self.setupUI()
        self.setupMenuBar()
        self.setupToolBar()
        self.setupDockWidgets()

        # Connect signals
        self.modulePanel.moduleSelected.connect(self.nodeEditor.createModuleNode)
        self.nodeEditor.selectionChanged.connect(self.onNodeSelectionChanged)
        self.propertyEditor.nodeRenamed.connect(self.nodeEditor.renameNode)
        self.propertyEditor.storeDefaultRequested.connect(self.onStoreNodeDefault)

    def setupUI(self):
        """Setup the main UI layout"""
        centralWidget = QtWidgets.QWidget()
        self.setCentralWidget(centralWidget)

        # Main layout
        mainLayout = QtWidgets.QVBoxLayout(centralWidget)
        mainLayout.setContentsMargins(0, 0, 0, 0)
        mainLayout.setSpacing(0)

        # Create Splitter for NodeEditor and LogPanel
        self.splitter = QtWidgets.QSplitter(QtCore.Qt.Vertical)
        mainLayout.addWidget(self.splitter)

        # Add node editor to splitter
        self.splitter.addWidget(self.nodeEditor)

        # Log Panel
        self.logPanel = QtWidgets.QPlainTextEdit()
        self.logPanel.setReadOnly(True)
        self.logPanel.setPlaceholderText("Iron Rig Build Logs...")
        self.logPanel.setContextMenuPolicy(QtCore.Qt.CustomContextMenu)
        self.logPanel.customContextMenuRequested.connect(self.showLogContextMenu)
        self.logPanel.setStyleSheet("""
            QPlainTextEdit {
                background-color: #1a1a1a;
                color: #ccc;
                font-family: 'Consolas', 'Courier New', monospace;
                font-size: 10pt;
                border-top: 1px solid #333;
            }
        """)
        self.splitter.addWidget(self.logPanel)

        # Set initial sizes (4:1 ratio)
        self.splitter.setSizes([700, 200])

        # Connect NodeEditor log signal to logPanel
        self.nodeEditor.logMessage.connect(self.appendLog)
    
    def showLogContextMenu(self, pos):
        """Show context menu for log panel"""
        menu = self.logPanel.createStandardContextMenu()
        menu.addSeparator()
        clearAction = menu.addAction("Clear Log")
        clearAction.triggered.connect(self.logPanel.clear)
        menu.exec_(self.logPanel.mapToGlobal(pos))
    
    def appendLog(self, message, level="info"):
        """Append a message to the log panel with color coding if needed"""
        color = "#ccc" # info
        if level == "error": color = "#f44"
        elif level == "warning": color = "#fb0"
        elif level == "success": color = "#4f4"

        # Simple HTML formatting for color
        self.logPanel.appendHtml(f'<span style="color:{color};">{message}</span>')
        # Auto-scroll to bottom
        self.logPanel.verticalScrollBar().setValue(self.logPanel.verticalScrollBar().maximum())

    def setupMenuBar(self):
        """Setup the menu bar"""
        menubar = self.menuBar()

        # File menu
        fileMenu = menubar.addMenu('File')

        newAction = QtWidgets.QAction('New Scene', self)
        newAction.setShortcut(QtGui.QKeySequence.New)
        newAction.triggered.connect(self.newScene)
        fileMenu.addAction(newAction)

        openAction = QtWidgets.QAction('Open Scene', self)
        openAction.setShortcut(QtGui.QKeySequence.Open)
        openAction.triggered.connect(self.openScene)
        fileMenu.addAction(openAction)

        saveAction = QtWidgets.QAction('Save Scene', self)
        saveAction.setShortcut(QtGui.QKeySequence.Save)
        saveAction.triggered.connect(self.saveScene)
        fileMenu.addAction(saveAction)

        fileMenu.addSeparator()

        exitAction = QtWidgets.QAction('Exit', self)
        exitAction.setShortcut(QtGui.QKeySequence.Quit)
        exitAction.triggered.connect(self.close)
        fileMenu.addAction(exitAction)

        # Edit menu
        editMenu = menubar.addMenu('Edit')

        undoAction = QtWidgets.QAction('Undo', self)
        undoAction.setShortcut(QtGui.QKeySequence.Undo)
        undoAction.triggered.connect(self.nodeEditor.undo)
        editMenu.addAction(undoAction)

        redoAction = QtWidgets.QAction('Redo', self)
        redoAction.setShortcut(QtGui.QKeySequence.Redo)
        redoAction.triggered.connect(self.nodeEditor.redo)
        editMenu.addAction(redoAction)

        editMenu.addSeparator()

        selectAllAction = QtWidgets.QAction('Select All', self)
        selectAllAction.setShortcut(QtGui.QKeySequence.SelectAll)
        selectAllAction.triggered.connect(self.nodeEditor.selectAll)
        editMenu.addAction(selectAllAction)

        # Build menu
        buildMenu = menubar.addMenu('Build')

        buildAction = QtWidgets.QAction('Build Rig', self)
        buildAction.triggered.connect(self.buildRig)
        buildMenu.addAction(buildAction)

        clearAction = QtWidgets.QAction('Clear Scene', self)
        clearAction.triggered.connect(self.clearScene)
        buildMenu.addAction(clearAction)

    def setupToolBar(self):
        """Setup the toolbar"""
        toolbar = QtWidgets.QToolBar()
        toolbar.setIconSize(QtCore.QSize(32, 32))
        self.addToolBar(toolbar)

        # Add toolbar actions
        newAction = QtWidgets.QAction('New', self)
        newAction.triggered.connect(self.newScene)
        toolbar.addAction(newAction)

        toolbar.addSeparator()

        buildAction = QtWidgets.QAction('Build', self)
        buildAction.triggered.connect(self.buildRig)
        toolbar.addAction(buildAction)

    def setupDockWidgets(self):
        """Setup dock widgets"""
        # Module panel dock
        moduleDock = QtWidgets.QDockWidget("Modules", self)
        moduleDock.setWidget(self.modulePanel)
        moduleDock.setAllowedAreas(QtCore.Qt.LeftDockWidgetArea | QtCore.Qt.RightDockWidgetArea)
        self.addDockWidget(QtCore.Qt.LeftDockWidgetArea, moduleDock)

        # Property editor dock
        propertyDock = QtWidgets.QDockWidget("Property Editor", self)
        propertyDock.setWidget(self.propertyEditor)
        propertyDock.setAllowedAreas(QtCore.Qt.LeftDockWidgetArea | QtCore.Qt.RightDockWidgetArea)
        self.addDockWidget(QtCore.Qt.RightDockWidgetArea, propertyDock)

    def onNodeSelectionChanged(self, node):
        """Update property editor when a node is selected"""
        self.propertyEditor.setNode(node)

    def onStoreNodeDefault(self, moduleType, config):
        """Save node defaults to disk"""
        save_node_default(moduleType, config)

    def newScene(self):
        """Create a new scene"""
        reply = QtWidgets.QMessageBox.question(self, 'New Scene',
                                   'Are you sure you want to create a new scene?',
                                   QtWidgets.QMessageBox.Yes | QtWidgets.QMessageBox.No)
        if reply == QtWidgets.QMessageBox.Yes:
            self.nodeEditor.clearScene()

    def openScene(self):
        """Open a scene file"""
        fileName, _ = QtWidgets.QFileDialog.getOpenFileName(self, "Open Scene", "",
                                                "Iron Rig Files (*.ir);;All Files (*)")
        if fileName:
            try:
                self.nodeEditor.loadScene(fileName)
            except Exception as e:
                QtWidgets.QMessageBox.critical(self, "Error", f"Failed to open scene: {str(e)}")

    def saveScene(self):
        """Save the current scene"""
        fileName, _ = QtWidgets.QFileDialog.getSaveFileName(self, "Save Scene", "",
                                                "Iron Rig Files (*.ir);;All Files (*)")
        if fileName:
            try:
                self.nodeEditor.saveScene(fileName)
            except Exception as e:
                QtWidgets.QMessageBox.critical(self, "Error", f"Failed to save scene: {str(e)}")

    def buildRig(self):
        """Build the rig from the node graph"""
        try:
            self.nodeEditor.buildRig()
            QtWidgets.QMessageBox.information(self, "Success", "Rig built successfully!")
        except Exception as e:
            QtWidgets.QMessageBox.critical(self, "Error", f"Failed to build rig: {str(e)}")

    def clearScene(self):
        """Clear the current scene"""
        reply = QtWidgets.QMessageBox.question(self, 'Clear Scene',
                                   'Are you sure you want to clear the scene?',
                                   QtWidgets.QMessageBox.Yes | QtWidgets.QMessageBox.No)
        if reply == QtWidgets.QMessageBox.Yes:
            self.nodeEditor.clearScene()