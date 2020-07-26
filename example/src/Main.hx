package;

import haxe.Resource;

class Main {
	static function main() {
        var pluginContents = Resource.getString("MyPlugin.hscript");
        PluginManager.addPlugin("MyPlugin", pluginContents);
        
        var pluginContents = Resource.getString("MyOtherPlugin.hscript");
        PluginManager.addPlugin("MyOtherPlugin", pluginContents);
	}
}