import sys
from PyQt5.QtWidgets import (QMainWindow, QVBoxLayout, QHBoxLayout, 
                             QWidget, QToolBar, QAction, QMenuBar, 
                             QMenu, QFileDialog, QMessageBox, QDockWidget)
from PyQt5.QtCore import Qt, QSize
from PyQt5.QtGui import QIcon, QKeySequence

from .nodeEditor import NodeEditor
from .modulePanel import ModulePanel


class MainWindow(QMainWindow):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("Iron Rig - Node Editor")
        self.setGeometry(100, 100, 1400, 900)
        
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
        centralWidget = QWidget()
        self.setCentralWidget(centralWidget)
        
        # Main layout
        mainLayout = QHBoxLayout(centralWidget)
        mainLayout.setContentsMargins(0, 0, 0, 0)
        
        # Add node editor as central widget
        mainLayout.addWidget(self.nodeEditor)
        
    def setupMenuBar(self):
        """Setup the menu bar"""
        menubar = self.menuBar()
        
        # File menu
        fileMenu = menubar.addMenu('File')
        
        newAction = QAction('New Scene', self)
        newAction.setShortcut(QKeySequence.New)
        newAction.triggered.connect(self.newScene)
        fileMenu.addAction(newAction)
        
        openAction = QAction('Open Scene', self)
        openAction.setShortcut(QKeySequence.Open)
        openAction.triggered.connect(self.openScene)
        fileMenu.addAction(openAction)
        
        saveAction = QAction('Save Scene', self)
        saveAction.setShortcut(QKeySequence.Save)
        saveAction.triggered.connect(self.saveScene)
        fileMenu.addAction(saveAction)
        
        fileMenu.addSeparator()
        
        exitAction = QAction('Exit', self)
        exitAction.setShortcut(QKeySequence.Quit)
        exitAction.triggered.connect(self.close)
        fileMenu.addAction(exitAction)
        
        # Edit menu
        editMenu = menubar.addMenu('Edit')
        
        undoAction = QAction('Undo', self)
        undoAction.setShortcut(QKeySequence.Undo)
        undoAction.triggered.connect(self.nodeEditor.undo)
        editMenu.addAction(undoAction)
        
        redoAction = QAction('Redo', self)
        redoAction.setShortcut(QKeySequence.Redo)
        redoAction.triggered.connect(self.nodeEditor.redo)
        editMenu.addAction(redoAction)
        
        editMenu.addSeparator()
        
        selectAllAction = QAction('Select All', self)
        selectAllAction.setShortcut(QKeySequence.SelectAll)
        selectAllAction.triggered.connect(self.nodeEditor.selectAll)
        editMenu.addAction(selectAllAction)
        
        # Build menu
        buildMenu = menubar.addMenu('Build')
        
        buildAction = QAction('Build Rig', self)
        buildAction.triggered.connect(self.buildRig)
        buildMenu.addAction(buildAction)
        
        clearAction = QAction('Clear Scene', self)
        clearAction.triggered.connect(self.clearScene)
        buildMenu.addAction(clearAction)
        
    def setupToolBar(self):
        """Setup the toolbar"""
        toolbar = QToolBar()
        toolbar.setIconSize(QSize(32, 32))
        self.addToolBar(toolbar)
        
        # Add toolbar actions
        newAction = QAction('New', self)
        newAction.triggered.connect(self.newScene)
        toolbar.addAction(newAction)
        
        toolbar.addSeparator()
        
        buildAction = QAction('Build', self)
        buildAction.triggered.connect(self.buildRig)
        toolbar.addAction(buildAction)
        
    def setupDockWidgets(self):
        """Setup dock widgets"""
        # Module panel dock
        moduleDock = QDockWidget("Modules", self)
        moduleDock.setWidget(self.modulePanel)
        moduleDock.setAllowedAreas(Qt.LeftDockWidgetArea | Qt.RightDockWidgetArea)
        self.addDockWidget(Qt.LeftDockWidgetArea, moduleDock)
        
    def newScene(self):
        """Create a new scene"""
        reply = QMessageBox.question(self, 'New Scene', 
                                   'Are you sure you want to create a new scene?',
                                   QMessageBox.Yes | QMessageBox.No)
        if reply == QMessageBox.Yes:
            self.nodeEditor.clearScene()
            
    def openScene(self):
        """Open a scene file"""
        fileName, _ = QFileDialog.getOpenFileName(self, "Open Scene", "", 
                                                "Iron Rig Files (*.ir);;All Files (*)")
        if fileName:
            try:
                self.nodeEditor.loadScene(fileName)
            except Exception as e:
                QMessageBox.critical(self, "Error", f"Failed to open scene: {str(e)}")
                
    def saveScene(self):
        """Save the current scene"""
        fileName, _ = QFileDialog.getSaveFileName(self, "Save Scene", "", 
                                                "Iron Rig Files (*.ir);;All Files (*)")
        if fileName:
            try:
                self.nodeEditor.saveScene(fileName)
            except Exception as e:
                QMessageBox.critical(self, "Error", f"Failed to save scene: {str(e)}")
                
    def buildRig(self):
        """Build the rig from the node graph"""
        try:
            self.nodeEditor.buildRig()
            QMessageBox.information(self, "Success", "Rig built successfully!")
        except Exception as e:
            QMessageBox.critical(self, "Error", f"Failed to build rig: {str(e)}")
            
    def clearScene(self):
        """Clear the current scene"""
        reply = QMessageBox.question(self, 'Clear Scene', 
                                   'Are you sure you want to clear the scene?',
                                   QMessageBox.Yes | QMessageBox.No)
        if reply == QMessageBox.Yes:
            self.nodeEditor.clearScene()