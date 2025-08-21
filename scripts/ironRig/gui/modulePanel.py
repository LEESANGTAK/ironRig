from Qt import QtWidgets, QtCore, QtGui


class ModulePanel(QtWidgets.QWidget):
    """Panel showing available modules that can be added to the node editor"""

    moduleSelected = QtCore.Signal(str, str)  # module_type, module_name

    def __init__(self):
        super().__init__()

        self.setupUI()
        self.populateModules()

    def setupUI(self):
        """Setup the user interface"""
        layout = QtWidgets.QVBoxLayout(self)
        layout.setContentsMargins(5, 5, 5, 5)

        # Title
        titleLabel = QtWidgets.QLabel("Available Modules")
        titleLabel.setFont(QtGui.QFont("Arial", 12, QtGui.QFont.Bold))
        titleLabel.setAlignment(QtCore.Qt.AlignCenter)
        layout.addWidget(titleLabel)

        # Module categories
        self.setupCategories()

        # Module list
        self.moduleList = QtWidgets.QListWidget()
        self.moduleList.setDragEnabled(True)
        self.moduleList.setAcceptDrops(False)
        self.moduleList.setDropIndicatorShown(False)
        self.moduleList.itemDoubleClicked.connect(self.onModuleDoubleClicked)
        self.moduleList.itemSelectionChanged.connect(self.onModuleSelectionChanged)
        layout.addWidget(self.moduleList)

        # Module description
        self.descriptionText = QtWidgets.QTextEdit()
        self.descriptionText.setMaximumHeight(100)
        self.descriptionText.setReadOnly(True)
        layout.addWidget(self.descriptionText)

        # Buttons
        buttonLayout = QtWidgets.QHBoxLayout()

        addButton = QtWidgets.QPushButton("Add Module")
        addButton.clicked.connect(self.addSelectedModule)
        buttonLayout.addWidget(addButton)

        clearButton = QtWidgets.QPushButton("Clear")
        clearButton.clicked.connect(self.moduleList.clearSelection)
        buttonLayout.addWidget(clearButton)

        layout.addLayout(buttonLayout)

    def setupCategories(self):
        """Setup module categories"""
        # Category buttons
        categoryLayout = QtWidgets.QHBoxLayout()

        categories = ["All", "Spine", "Limbs", "Face", "Special"]

        for category in categories:
            btn = QtWidgets.QPushButton(category)
            btn.setCheckable(True)
            btn.clicked.connect(lambda checked, cat=category: self.filterByCategory(cat))
            categoryLayout.addWidget(btn)

            if category == "All":
                btn.setChecked(True)

        self.categoryButtons = {btn.text(): btn for btn in self.findChildren(QtWidgets.QPushButton) if btn.text() in categories}

        # Add to main layout
        self.layout().insertLayout(1, categoryLayout)

    def populateModules(self):
        """Populate the module list with available modules"""
        self.modules = {
            'Spine': {
                'Spine': {
                    'description': 'Creates a spine control system with multiple vertebrae',
                    'icon': 'spine_icon.png',
                    'category': 'Spine'
                },
                'Neck': {
                    'description': 'Creates a neck control system',
                    'icon': 'neck_icon.png',
                    'category': 'Spine'
                }
            },
            'Limbs': {
                'LimbBase': {
                    'description': 'Base class for limb modules',
                    'icon': 'limb_icon.png',
                    'category': 'Limbs'
                },
                'TwoBoneLimb': {
                    'description': 'Creates a two-bone limb with IK/FK controls',
                    'icon': 'arm_icon.png',
                    'category': 'Limbs'
                },
                'Foot': {
                    'description': 'Creates a foot control system',
                    'icon': 'foot_icon.png',
                    'category': 'Limbs'
                }
            },
            'Face': {
                'Eye': {
                    'description': 'Creates eye control system',
                    'icon': 'eye_icon.png',
                    'category': 'Face'
                },
                'Brow': {
                    'description': 'Creates brow control system',
                    'icon': 'brow_icon.png',
                    'category': 'Face'
                },
                'Lip': {
                    'description': 'Creates lip control system',
                    'icon': 'lip_icon.png',
                    'category': 'Face'
                }
            },
            'Special': {
                'Custom': {
                    'description': 'Custom module with user-defined functionality',
                    'icon': 'custom_icon.png',
                    'category': 'Special'
                },
                'Master': {
                    'description': 'Master module that can contain other modules',
                    'icon': 'master_icon.png',
                    'category': 'Special'
                }
            }
        }

        self.updateModuleList()

    def updateModuleList(self, category="All"):
        """Update the module list based on selected category"""
        self.moduleList.clear()

        for groupName, groupModules in self.modules.items():
            for moduleName, moduleInfo in groupModules.items():
                if category == "All" or moduleInfo['category'] == category:
                    item = QtWidgets.QListWidgetItem()
                    item.setText(moduleName)
                    item.setData(QtCore.Qt.UserRole, {
                        'type': moduleName,
                        'description': moduleInfo['description'],
                        'category': moduleInfo['category']
                    })

                    # Set icon if available
                    # TODO: Load actual icons
                    # item.setIcon(QIcon(moduleInfo['icon']))

                    self.moduleList.addItem(item)

    def filterByCategory(self, category):
        """Filter modules by category"""
        # Update button states
        for btn in self.categoryButtons.values():
            btn.setChecked(btn.text() == category)

        # Update module list
        self.updateModuleList(category)

    def onModuleDoubleClicked(self, item):
        """Handle double-click on module item"""
        moduleData = item.data(QtCore.Qt.UserRole)
        if moduleData:
            self.moduleSelected.emit(moduleData['type'], f"{moduleData['type']}_new")

    def addSelectedModule(self):
        """Add the currently selected module"""
        currentItem = self.moduleList.currentItem()
        if currentItem:
            self.onModuleDoubleClicked(currentItem)

    def onModuleSelectionChanged(self):
        """Handle module selection change"""
        currentItem = self.moduleList.currentItem()
        if currentItem:
            moduleData = currentItem.data(QtCore.Qt.UserRole)
            if moduleData:
                self.descriptionText.setText(moduleData['description'])
        else:
            self.descriptionText.clear()

    def getModuleInfo(self, moduleType):
        """Get information about a specific module type"""
        for groupModules in self.modules.values():
            for moduleName, moduleInfo in groupModules.items():
                if moduleName == moduleType:
                    return moduleInfo
        return None

    def createModuleItem(self, moduleType, moduleName):
        """Create a list item for a module"""
        item = QtWidgets.QListWidgetItem()
        item.setText(moduleName)
        item.setData(QtCore.Qt.UserRole, {
            'type': moduleType,
            'name': moduleName
        })
        return item