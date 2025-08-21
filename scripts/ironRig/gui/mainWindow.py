import sys
from Qt import QtWidgets, QtCore, QtGui

from .nodeEditor import NodeEditor
from .modulePanel import ModulePanel


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
        self.setWindowTitle("Iron Rig - Node Editor")
        self.setGeometry(100, 100, 1400, 900)

        # Set window flags to keep it on top
        self.setWindowFlags(QtCore.Qt.Window)

        # Initialize components
        self.nodeEditor = NodeEditor()
        self.modulePanel = ModulePanel()

        self.setupUI()
        self.setupMenuBar()
        self.setupToolBar()
        self.setupDockWidgets()

        # Connect signals
        self.modulePanel.moduleSelected.connect(self.nodeEditor.createModuleNode)

    def setupUI(self):
        """Setup the main UI layout"""
        centralWidget = QtWidgets.QWidget()
        self.setCentralWidget(centralWidget)

        # Main layout
        mainLayout = QtWidgets.QHBoxLayout(centralWidget)
        mainLayout.setContentsMargins(0, 0, 0, 0)

        # Add node editor as central widget
        mainLayout.addWidget(self.nodeEditor)

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