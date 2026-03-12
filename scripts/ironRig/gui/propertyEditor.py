from Qt import QtWidgets, QtCore, QtGui
import maya.cmds as cmds

class PropertyEditor(QtWidgets.QWidget):
    """Panel for editing node properties and joint selection"""
    
    propertyChanged = QtCore.Signal(object, dict) # node, properties
    nodeRenamed = QtCore.Signal(object, str, str) # node, oldName, newName
    storeDefaultRequested = QtCore.Signal(str, dict) # moduleType, properties
    
    def __init__(self, parent=None):
        super().__init__(parent)
        self.currentNode = None
        self.setupUI()

    def setupUI(self):
        self.layout = QtWidgets.QVBoxLayout(self)
        self.layout.setContentsMargins(10, 10, 10, 10)
        self.layout.setSpacing(10)

        # Title / Node info with Gear Button
        titleLayout = QtWidgets.QHBoxLayout()
        self.titleLabel = QtWidgets.QLabel("Property Editor")
        self.titleLabel.setStyleSheet("font-weight: bold; font-size: 14px; color: #E08600;")
        titleLayout.addWidget(self.titleLabel)
        
        self.gearBtn = QtWidgets.QPushButton("\u2699") # Gear unicode
        self.gearBtn.setFixedSize(24, 24)
        self.gearBtn.setStyleSheet("""
            QPushButton { 
                border: none; 
                background: transparent; 
                font-size: 16px; 
                color: #888; 
            }
            QPushButton:hover { color: #BBB; }
        """)
        self.gearBtn.clicked.connect(self.showGearMenu)
        self.gearBtn.hide() # Hide by default
        titleLayout.addWidget(self.gearBtn)
        self.layout.addLayout(titleLayout)

        # Scroll Area for properties
        self.scrollArea = QtWidgets.QScrollArea()
        self.scrollArea.setWidgetResizable(True)
        self.scrollContent = QtWidgets.QWidget()
        self.scrollLayout = QtWidgets.QVBoxLayout(self.scrollContent)
        self.scrollLayout.setAlignment(QtCore.Qt.AlignTop)
        self.scrollArea.setWidget(self.scrollContent)
        self.layout.addWidget(self.scrollArea)

        # Empty state label
        self.emptyLabel = QtWidgets.QLabel("Select a node to edit properties")
        self.emptyLabel.setAlignment(QtCore.Qt.AlignCenter)
        self.scrollLayout.addWidget(self.emptyLabel)

    def setNode(self, node):
        """Display properties for the selected node"""
        self.currentNode = node
        
        # Robustly clear existing layout including sub-layouts
        self.clearLayout(self.scrollLayout)

        if not node:
            self.titleLabel.setText("Property Editor")
            self.gearBtn.hide() # Hide gear when no selection
            emptyLabel = QtWidgets.QLabel("Select a node to edit properties")
            emptyLabel.setAlignment(QtCore.Qt.AlignCenter)
            emptyLabel.setStyleSheet("color: #888; margin-top: 20px;")
            self.scrollLayout.addWidget(emptyLabel)
            return
        
        self.gearBtn.show() # Show gear when node is selected

        self.titleLabel.setText(f"Properties: {node.moduleName} ({node.moduleType})")

        # 1. Base Properties (Name, Side)
        self.addHeader("Base Settings")
        
        self.nameEdit = self.addStringField("Module Name", node.moduleName, self.onNameChanged)
        self.sideCombo = self.addComboField("Side", ["CENTER", "LEFT", "RIGHT"], node.properties.get('side', 'CENTER'), self.onSideChanged)

        # 2. Dynamic Port Settings (children output ports)
        self.addHeader("Connectivity")
        current_ports = len(node.outputPorts)
        self.portCountSpin = self.addSpinField("Output Port Count", 0, 10, current_ports, self.onPortCountChanged)
        
        # 3. GlobalRoot Specific
        if node.moduleType in ['GlobalRoot', 'GlobalMaster']:
            self.addHeader("Global Root Settings")
            self.buildRootCheck = self.addCheckField("Build Root Controller", node.properties.get('buildRootController', True), 
                                                   lambda v: self.onToggleProperty(node, 'buildRootController', v))

        # --- Module-Specific Properties ---
        moduleSpecificProps = self.getModuleSpecificProperties(node.moduleType)
        if moduleSpecificProps:
            self.addHeader("Module Settings")
            for propDef in moduleSpecificProps:
                propName = propDef['name']
                propType = propDef['type']
                propDefault = propDef['default']
                propLabel = propDef.get('label', propName)
                currentVal = node.properties.get(propName, propDefault)
                
                if propType == 'int':
                    minVal = propDef.get('min', 0)
                    maxVal = propDef.get('max', 100)
                    self.addSpinField(propLabel, minVal, maxVal, currentVal,
                                      lambda v, key=propName: self.onToggleProperty(node, key, v))
                elif propType == 'bool':
                    self.addCheckField(propLabel, currentVal,
                                       lambda v, key=propName: self.onToggleProperty(node, key, v))
                elif propType == 'enum':
                    items = propDef.get('items', [])
                    # Map integer back to string for combo display
                    if isinstance(currentVal, int) and currentVal < len(items):
                        currentStr = items[currentVal]
                    else:
                        currentStr = str(currentVal) if currentVal in items else items[0]
                    self.addComboField(propLabel, items, currentStr,
                                       lambda v, key=propName, itms=items: self.onToggleProperty(node, key, itms.index(v) if v in itms else v))
        
        # 4. SpaceSwitch Specific
        elif node.moduleType == 'SpaceSwitch':
            self.addHeader("Space Switch Settings")
            items = ['Parent', 'Orient']
            currType = 'Parent' if node.properties.get('isParentType', True) else 'Orient'
            
            def updateType(val):
                self.currentNode.properties['isParentType'] = (val == 'Parent')
                self.currentNode.properties['isOrientType'] = (val == 'Orient')
            
            self.addComboField("Constraint Type", items, currType, updateType)
            
            def updateDefIdx(val): self.currentNode.properties['defaultDriverIndex'] = val
            self.addSpinField("Default Driver Index", 0, 10, node.properties.get('defaultDriverIndex', 0), updateDefIdx)

        # 5. ModuleDecompose Specific
        elif node.moduleType == 'ModuleDecompose':
            self.addHeader("Extraction Settings")
            
            # Resolve actual source module node across physical and wireless connections
            sourceNode = self.getSourceNode(self.currentNode)
            inputModType = sourceNode.moduleType if sourceNode else "Generic"
            
            # Logic controller list per type
            ctrl_map = {
                'Spine': ['pelvisController', 'chestController', 'midController'],
                'Neck': ['headController', 'neckController'],
                'TwoBoneLimb': ['ikController', 'fkRootController', 'poleVectorController', 'moduleController'],
                'Foot': ['moduleController', 'ikController'],
                'LimbBase': ['fkRootController'],
                'GlobalRoot': ['mainController', 'rootController'],
                'Finger': ['fkRootController', 'moduleController']
            }
            
            items = ctrl_map.get(inputModType, ['moduleController', 'fkRootController', 'ikController'])
            current = node.properties.get('targetController', items[0])
            
            def updateTarget(val):
                self.currentNode.properties['targetController'] = val
            
            self.addComboField("Target Controller", items, current, updateTarget)

        # 6. CustomScript Specific — Enhanced with @symbol attribute system
        if node.moduleType == 'CustomScript':
            self.addHeader("Custom Script Settings")
            self.addComboField("Execution Timing", ["Pre-Build", "Post-Build"], 
                               node.properties.get('timing', 'Post-Build'), 
                               lambda v: self.onToggleProperty(node, 'timing', v))
            self.addTextAreaField("Python Code", node.properties.get('code', ''), 
                                  self.onScriptCodeChanged)
            
            # Dynamic Attribute List (@symbol system)
            self.addHeader("Script Attributes (@symbol)")
            
            attrs = node.properties.get('scriptAttributes', [])
            self.attrWidgets = []
            
            self.attrContainer = QtWidgets.QWidget()
            self.attrContainerLayout = QtWidgets.QVBoxLayout(self.attrContainer)
            self.attrContainerLayout.setContentsMargins(0, 0, 0, 0)
            self.attrContainerLayout.setSpacing(4)
            
            for attr in attrs:
                self._addAttributeRow(attr)
            
            self.scrollLayout.addWidget(self.attrContainer)
            
            addAttrBtn = QtWidgets.QPushButton("+ Add Attribute")
            addAttrBtn.setStyleSheet("background-color: #3a5a3a; color: #ccc; padding: 4px;")
            addAttrBtn.clicked.connect(self._onAddAttribute)
            self.scrollLayout.addWidget(addAttrBtn)

        # 8. Sender Specific
        elif node.moduleType == 'Sender':
            self.addHeader("Wireless Sender Settings")
            currentName = node.properties.get('routeName', 'route1')
            def updateRoute():
                node.properties['routeName'] = routeField.text()
            routeField = self.addStringField("Route Name", currentName, updateRoute)

        # 9. Receiver Specific
        elif node.moduleType == 'Receiver':
            self.addHeader("Wireless Receiver Settings")
            senders = self.getAllSenderNames()
            current = node.properties.get('routeName', senders[0] if senders else 'None')
            def updateTarget(val):
                node.properties['routeName'] = val
            self.addComboField("Source Sender", senders if senders else ['None'], current, updateTarget)

        # 7. Skeleton Selection
        headerText = "Skeleton (Root Joint)" if node.moduleType in ['GlobalRoot', 'GlobalMaster'] else "Skeleton (Joint List)"
        # Hide skeleton for non-module types
        if node.moduleType not in ['SpaceSwitch', 'CustomScript', 'ModuleDecompose', 'Sender', 'Receiver']:
            self.addHeader(headerText)
            self.jointList = QtWidgets.QListWidget()
            self.jointList.setSelectionMode(QtWidgets.QAbstractItemView.ExtendedSelection)
            for jnt in node.properties.get('joints', []):
                self.jointList.addItem(jnt)
            self.scrollLayout.addWidget(self.jointList)
    
            btnLayout = QtWidgets.QHBoxLayout()
            self.addJntBtn = QtWidgets.QPushButton("Add Selected Joints")
            self.addJntBtn.clicked.connect(self.addMayaSelectedJoints)
            self.clearJntBtn = QtWidgets.QPushButton("Clear")
            self.clearJntBtn.clicked.connect(self.clearJoints)
            btnLayout.addWidget(self.addJntBtn)
            btnLayout.addWidget(self.clearJntBtn)
            self.scrollLayout.addLayout(btnLayout)

    def clearLayout(self, layout):
        """Recursively clear all widgets and sub-layouts"""
        if layout is None:
            return
            
        while layout.count():
            item = layout.takeAt(0)
            widget = item.widget()
            if widget:
                widget.deleteLater()
            else:
                subLayout = item.layout()
                if subLayout:
                    self.clearLayout(subLayout)

    def addHeader(self, text):
        header = QtWidgets.QLabel(text)
        header.setStyleSheet("font-weight: bold; border-bottom: 1px solid #555; margin-top: 10px; color: #AAA;")
        self.scrollLayout.addWidget(header)

    def addStringField(self, label, value, callback):
        layout = QtWidgets.QHBoxLayout()
        layout.addWidget(QtWidgets.QLabel(label))
        edit = QtWidgets.QLineEdit(value)
        edit.editingFinished.connect(callback)
        layout.addWidget(edit)
        self.scrollLayout.addLayout(layout)
        return edit

    def addComboField(self, label, items, current, callback):
        layout = QtWidgets.QHBoxLayout()
        layout.addWidget(QtWidgets.QLabel(label))
        combo = QtWidgets.QComboBox()
        combo.addItems(items)
        combo.setCurrentText(current)
        combo.currentTextChanged.connect(callback)
        layout.addWidget(combo)
        self.scrollLayout.addLayout(layout)
        return combo

    def addSpinField(self, label, min, max, value, callback):
        layout = QtWidgets.QHBoxLayout()
        layout.addWidget(QtWidgets.QLabel(label))
        spin = QtWidgets.QSpinBox()
        spin.setRange(min, max)
        spin.setValue(value)
        spin.valueChanged.connect(callback)
        layout.addWidget(spin)
        self.scrollLayout.addLayout(layout)
        return spin

    def addCheckField(self, label, value, callback):
        layout = QtWidgets.QHBoxLayout()
        check = QtWidgets.QCheckBox(label)
        check.setChecked(value)
        check.stateChanged.connect(lambda state: callback(state == QtCore.Qt.Checked))
        layout.addWidget(check)
        self.scrollLayout.addLayout(layout)
        return check

    def addTextAreaField(self, label, value, callback):
        self.addHeader(label)
        edit = QtWidgets.QPlainTextEdit()
        edit.setPlainText(value)
        edit.setMinimumHeight(150)
        edit.setStyleSheet("background-color: #222; color: #EEE; font-family: 'Consolas', monospace;")
        edit.textChanged.connect(lambda: callback(edit.toPlainText()))
        self.scrollLayout.addWidget(edit)
        return edit

    # --- Module-Specific Properties Definition ---

    @staticmethod
    def getModuleSpecificProperties(moduleType):
        """Return property definitions for each module type"""
        PROPS = {
            'Neck': [
                {'name': 'numberOfControllers', 'label': 'Number of Controllers', 'type': 'int', 'default': 3, 'min': 2, 'max': 10},
            ],
            'TwoBoneLimb': [
                {'name': 'ikRootController', 'label': 'IK Root Controller', 'type': 'bool', 'default': False},
                {'name': 'nonroll', 'label': 'Non-Roll', 'type': 'bool', 'default': True},
                {'name': 'detectInbetweenJoints', 'label': 'Detect In-Between Joints', 'type': 'bool', 'default': False},
            ],
            'ThreeBoneLimb': [
                {'name': 'ikRootController', 'label': 'IK Root Controller', 'type': 'bool', 'default': False},
            ],
            'Finger': [
                {'name': 'curlStartIndex', 'label': 'Curl Start Index', 'type': 'int', 'default': 1, 'min': 0, 'max': 10},
            ],
            'Simple': [
                {'name': 'simpleType', 'label': 'Simple Type', 'type': 'enum', 'default': 0, 'items': ['FK', 'SINGLE']},
                {'name': 'controllerShape', 'label': 'Controller Shape', 'type': 'enum', 'default': 'CIRCLE',
                 'items': ['CIRCLE', 'SQUARE', 'TRIANGLE', 'DIAMOND', 'CROSS', 'ARROW', 'CUBE', 'SPHERE']},
            ],
        }
        # Common properties for all standard modules
        COMMON = [
            {'name': 'globalController', 'label': 'Global Controller', 'type': 'bool', 'default': False},
            {'name': 'mirrorTranslate', 'label': 'Mirror Translate', 'type': 'bool', 'default': False},
        ]
        
        specific = PROPS.get(moduleType, [])
        # Only add common props for non-special nodes
        if moduleType not in ['GlobalRoot', 'GlobalMaster', 'SpaceSwitch', 'CustomScript', 
                              'ModuleDecompose', 'Sender', 'Receiver', 'Build']:
            return specific + COMMON
        return specific

    # --- CustomScript Attribute Management ---

    def _addAttributeRow(self, attrData=None):
        """Add a row for a CustomScript @attribute"""
        if attrData is None:
            attrData = {'name': 'newAttr', 'type': 'STRING', 'value': ''}
        
        row = QtWidgets.QWidget()
        rowLayout = QtWidgets.QHBoxLayout(row)
        rowLayout.setContentsMargins(0, 0, 0, 0)
        rowLayout.setSpacing(4)
        
        nameEdit = QtWidgets.QLineEdit(attrData.get('name', 'newAttr'))
        nameEdit.setPlaceholderText("attr name")
        nameEdit.setFixedWidth(80)
        nameEdit.setStyleSheet("background: #333; color: #eee; padding: 2px;")
        rowLayout.addWidget(nameEdit)
        
        typeCombo = QtWidgets.QComboBox()
        typeCombo.addItems(['STRING', 'NUMBER'])
        typeCombo.setCurrentText(attrData.get('type', 'STRING'))
        typeCombo.setFixedWidth(75)
        rowLayout.addWidget(typeCombo)
        
        valueEdit = QtWidgets.QLineEdit(str(attrData.get('value', '')))
        valueEdit.setPlaceholderText("value")
        valueEdit.setStyleSheet("background: #333; color: #eee; padding: 2px;")
        rowLayout.addWidget(valueEdit)
        
        removeBtn = QtWidgets.QPushButton("×")
        removeBtn.setFixedSize(20, 20)
        removeBtn.setStyleSheet("background: #5a3a3a; color: #ccc; border: none; font-weight: bold;")
        removeBtn.clicked.connect(lambda: self._onRemoveAttribute(row))
        rowLayout.addWidget(removeBtn)
        
        # Connect signals for live sync
        nameEdit.editingFinished.connect(self._syncAttributes)
        typeCombo.currentTextChanged.connect(self._syncAttributes)
        valueEdit.editingFinished.connect(self._syncAttributes)
        
        self.attrContainerLayout.addWidget(row)
        self.attrWidgets.append({'widget': row, 'name': nameEdit, 'type': typeCombo, 'value': valueEdit})

    def _onAddAttribute(self):
        """Add a new empty attribute row"""
        self._addAttributeRow()
        self._syncAttributes()

    def _onRemoveAttribute(self, rowWidget):
        """Remove an attribute row"""
        self.attrWidgets = [w for w in self.attrWidgets if w['widget'] != rowWidget]
        rowWidget.deleteLater()
        self._syncAttributes()

    def _syncAttributes(self):
        """Sync attribute widgets back to node properties"""
        if not self.currentNode:
            return
        attrs = []
        for w in self.attrWidgets:
            if not w['widget'].parent():
                continue
            attrs.append({
                'name': w['name'].text(),
                'type': w['type'].currentText(),
                'value': w['value'].text()
            })
        self.currentNode.properties['scriptAttributes'] = attrs

    # --- Callbacks ---

    def onNameChanged(self):
        if self.currentNode:
            oldName = self.currentNode.moduleName
            newName = self.nameEdit.text()
            if oldName != newName:
                self.nodeRenamed.emit(self.currentNode, oldName, newName)
                self.currentNode.update()
            
    def onSideChanged(self, value):
        if self.currentNode:
            self.currentNode.properties['side'] = value

    def onToggleProperty(self, node, key, value):
        if node:
            node.properties[key] = value

    def onSpaceConstraintTypeChanged(self, value):
        if self.currentNode:
            self.currentNode.properties['isParentType'] = (value == "Parent")
            self.currentNode.properties['isOrientType'] = (value == "Orient")

    def onScriptCodeChanged(self, value):
        if self.currentNode:
            self.currentNode.properties['code'] = value

    def onPortCountChanged(self, value):
        """Update node's output port count dynamically (children ports)"""
        if self.currentNode:
            self.currentNode.setOutputPortCount(value)

    def addMayaSelectedJoints(self):
        sel = cmds.ls(sl=True, type='joint')
        if not sel:
            return
        
        current_jnts = self.currentNode.properties.get('joints', [])
        for s in sel:
            if s not in current_jnts:
                current_jnts.append(s)
                self.jointList.addItem(s)
        
        self.currentNode.properties['joints'] = current_jnts
        # Emit signal if needed or just let node hold it
        if self.currentNode:
             self.currentNode.update()

    def clearJoints(self):
        self.jointList.clear()
        if self.currentNode:
            self.currentNode.properties['joints'] = []

    def showGearMenu(self):
        """Show Houdini-style gear menu"""
        if not self.currentNode:
            return
            
        menu = QtWidgets.QMenu(self)
        
        # Save as Defaults
        saveAction = menu.addAction("Save Options as Defaults")
        saveAction.triggered.connect(self.onStoreRequested)
        
        menu.addSeparator()
        
        # Add some mock items for Houdini look
        menu.addAction("Revert to Base Parameter Layout").setEnabled(False)
        menu.addAction("Revert to Base Parameters").setEnabled(False)
        
        menu.exec_(QtGui.QCursor.pos())

    def onStoreRequested(self):
        """Request storing current node state as default"""
        if self.currentNode:
            config = self.currentNode.getProperties()
            # We don't want to store the instance name as default
            if 'name' in config: del config['name'] 
            self.storeDefaultRequested.emit(self.currentNode.moduleType, config)
            
            # Show a brief message or status
            self.titleLabel.setText("Settings Saved!")
            QtCore.QTimer.singleShot(1500, lambda: self.titleLabel.setText(f"Properties: {self.currentNode.moduleName} ({self.currentNode.moduleType})"))
    def getAllSenderNames(self):
        """Helper to find all Sender nodes in the scene and return their route names"""
        from .nodeEditor import NodeEditor
        
        # We need to find the NodeEditor instance. Usually PropertyEditor is paired with it in MainWindow.
        # For now, let's assume we can traverse or it's accessible.
        # More robust: Look for all ModuleNodes of type 'Sender' in the current scene's graph.
        
        sender_names = []
        # Accessing nodes via parent or global might be needed depending on UI structure
        # In ironRig, MainWindow typically holds both. 
        # Let's try to get it from the node's scene if possible, or search via parent
        parent = self.parent()
        while parent:
            if hasattr(parent, 'nodeEditor'):
                for n in parent.nodeEditor.nodes.values():
                    if n.moduleType == 'Sender':
                        name = n.properties.get('routeName', 'route1')
                        if name not in sender_names:
                            sender_names.append(name)
                break
            parent = parent.parent()
        
        return sorted(sender_names)

    def getSourceNode(self, node):
        """Follow input connections or wireless links to find the source provider node (recursively)"""
        # 1. Physical connection
        for conn in node.connections.get('input', []):
            startNode = conn.startNode
            # If it's a Sender, follow its input
            if startNode.moduleType == 'Sender':
                return self.getSourceNode(startNode)
            # If it's a Receiver, follow its wireless source
            if startNode.moduleType == 'Receiver':
                return self.getWirelessSource(startNode)
            return startNode
            
        # 2. If node itself is a Receiver (direct check)
        if node.moduleType == 'Receiver':
            return self.getWirelessSource(node)
            
        return None

    def getWirelessSource(self, receiverNode):
        """Find the corresponding Sender node for a Receiver wirelessly"""
        routeName = receiverNode.properties.get('routeName')
        if not routeName:
            return None
            
        parent = self.parent()
        while parent:
            if hasattr(parent, 'nodeEditor'):
                for n in parent.nodeEditor.nodes.values():
                    if n.moduleType == 'Sender' and n.properties.get('routeName') == routeName:
                        # Follow the sender's input to find what it's broadcasting
                        return self.getSourceNode(n)
                break
            parent = parent.parent()
        return None
