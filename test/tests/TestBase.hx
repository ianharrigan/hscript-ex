package test.tests;

import haxe.Resource;
import hscript.InterpEx;
import org.hamcrest.MatchersBase;

class TestBase extends MatchersBase {
    private var interp:InterpEx = null;
    
    @After
    public function tearDown():Void {
        interp = null;
    }
    
    private function moduleFromResource(r:String) {
        moduleFromString(Resource.getString(r));
    }
    
    private function moduleFromString(s:String) {
        if (interp == null) {
            interp = new InterpEx();
        }
        
        var parser = new hscript.ParserEx();
        var module = parser.parseModule(s);
        interp.registerModule(module);
    }
    
    private function scriptFromResource(r:String) {
        return scriptFromString(Resource.getString(r));
    }
    
    private function scriptFromString(s:String) {
        if (interp == null) {
            interp = new InterpEx();
        }
        
        var parser = new hscript.ParserEx();
        var ast = parser.parseString(s);
        return ast;
    }
}