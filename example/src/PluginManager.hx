package;

import hscript.InterpEx;
import plugins.PluginContext;

class PluginManager {
    private static var _interp = new InterpEx();
    
    private static var nextId:Int = 1;
    
    public static function addPlugin(name:String, contents:String) {
        _interp.addModule(contents);
        
        var instance = _interp.createScriptClassInstance(name);
        instance.pluginId = nextId;
        nextId++;
        var info = instance.pluginInfo();
        trace("adding plugin: " + info.name + " - " + info.description);
        
        var context = new PluginContext();
        context.someImportantVar = 222;
        trace("important var before plugin: " + context.someImportantVar);
        
        instance.beforeStart();
        instance.start(context);
        instance.afterStart();
        
        trace("important var after plugin: " + context.someImportantVar);
        trace("---------------------------------------------------------------------");
    }
}