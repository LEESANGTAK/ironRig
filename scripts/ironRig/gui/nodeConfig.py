import json
import os

# Define config path relative to the ironRig root directory
# nodeConfig.py is at: .../ironRig/scripts/ironRig/gui/nodeConfig.py
# Root is 3 levels up from gui folder
CUR_DIR = os.path.dirname(os.path.abspath(__file__))
ROOT_DIR = os.path.abspath(os.path.join(CUR_DIR, "..", "..", ".."))
CONFIG_DIR = os.path.join(ROOT_DIR, "config")
CONFIG_FILE = os.path.join(CONFIG_DIR, "node_defaults.json")

def save_node_default(module_type, properties):
    """Save properties as default for a given module type"""
    if not os.path.exists(CONFIG_DIR):
        os.makedirs(CONFIG_DIR)
        
    data = {}
    if os.path.exists(CONFIG_FILE):
        with open(CONFIG_FILE, 'r') as f:
            try:
                data = json.load(f)
            except:
                data = {}
                
    data[module_type] = properties
    
    with open(CONFIG_FILE, 'w') as f:
        json.dump(data, f, indent=4)
    
    print(f"Saved default for {module_type}: {CONFIG_FILE}")

def load_node_defaults():
    """Load all node defaults from disk"""
    if not os.path.exists(CONFIG_FILE):
        return {}
        
    with open(CONFIG_FILE, 'r') as f:
        try:
            return json.load(f)
        except:
            return {}

def get_node_default(module_type):
    """Get default properties for a specific module type"""
    defaults = load_node_defaults()
    return defaults.get(module_type, {})
