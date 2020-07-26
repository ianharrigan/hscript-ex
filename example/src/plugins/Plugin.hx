package plugins;

class Plugin {
    public var pluginId:Int = -1;
    
    public function new() {
    }
    
    public function pluginInfo():PluginInfo {
        var info = new PluginInfo();
        info.name = "default";
        info.description = "this is the default plugin";
        return info;
    }
    
    public function beforeStart() {
        trace("Plugin::beforeStart");
    }
    
    public function start(context:PluginContext) {
        trace("Plugin::start - " + context.someImportantVar);
    }
    
    public function afterStart() {
        trace("Plugin::afterStart");
    }
}