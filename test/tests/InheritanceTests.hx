package test.tests;

import hscript.AbstractScriptClass;
import massive.munit.Assert;

class InheritanceTests extends TestBase {
    @Before
    public function setup():Void {
        moduleFromResource("InheritanceClasses.hx");
    }
    
    @Test
    public function testBasicScriptToHaxeInheritance() {
        var ast = scriptFromString("new ScriptClassA()");
        var r:AbstractScriptClass = interp.execute(ast);
        Assert.isType(r, hscript.ScriptClass);
        Assert.isType(r.superClass, test.classes.HaxeClassA);
        Assert.areEqual(111, r.varClassA);
        
        var ast = scriptFromString("new ScriptClassB()");
        var r:AbstractScriptClass = interp.execute(ast);
        Assert.isType(r, hscript.ScriptClass);
        Assert.isType(r.superClass, test.classes.HaxeClassB);
        Assert.areEqual(111, r.varClassA);
        Assert.areEqual(222, r.varClassB);
        
        var ast = scriptFromString("new ScriptClassC()");
        var r:AbstractScriptClass = interp.execute(ast);
        Assert.isType(r, hscript.ScriptClass);
        Assert.isType(r.superClass, test.classes.HaxeClassC);
        Assert.areEqual(111, r.varClassA);
        Assert.areEqual(222, r.varClassB);
        Assert.areEqual(333, r.varClassC);
        
        var ast = scriptFromString("new ScriptClassD()");
        var r:AbstractScriptClass = interp.execute(ast);
        Assert.isType(r, hscript.ScriptClass);
        Assert.isType(r.superClass, test.classes.HaxeClassD);
        Assert.areEqual(111, r.varClassA);
        Assert.areEqual(222, r.varClassB);
        Assert.areEqual(444, r.varClassD);
    }
    
    @Test
    public function testScriptMultipleHaxeSupers() {
        var ast = scriptFromString("new ScriptClassA()");
        var r:AbstractScriptClass = interp.execute(ast);
        Assert.isType(r.superClass, test.classes.HaxeClassA);
        Assert.areEqual(112, r.test());
        
        var ast = scriptFromString("new ScriptClassB()");
        var r:AbstractScriptClass = interp.execute(ast);
        Assert.isType(r.superClass, test.classes.HaxeClassB);
        Assert.areEqual(335, r.test());
        
        var ast = scriptFromString("new ScriptClassC()");
        var r:AbstractScriptClass = interp.execute(ast);
        Assert.isType(r.superClass, test.classes.HaxeClassC);
        Assert.areEqual(669, r.test());
        
        var ast = scriptFromString("new ScriptClassD()");
        var r:AbstractScriptClass = interp.execute(ast);
        Assert.isType(r.superClass, test.classes.HaxeClassD);
        Assert.areEqual(781, r.test());
        r.varClassD = 888;
        Assert.areEqual(888, r.varClassD);
        r.varClassB = 222;
        Assert.areEqual(222, r.varClassB);
    }
    
    @Test
    public function testBasicScriptToScriptInheritance() {
        var ast = scriptFromString("new ScriptClassE()");
        var r:AbstractScriptClass = interp.execute(ast);
        Assert.isType(r, hscript.ScriptClass);
        Assert.areEqual(111, r.varClassE);
        
        var ast = scriptFromString("new ScriptClassF()");
        var r:AbstractScriptClass = interp.execute(ast);
        Assert.isType(r, hscript.ScriptClass);
        Assert.areEqual(111, r.varClassE);
        Assert.areEqual(222, r.varClassF);
        
        var ast = scriptFromString("new ScriptClassG()");
        var r:AbstractScriptClass = interp.execute(ast);
        Assert.isType(r, hscript.ScriptClass);
        Assert.areEqual(111, r.varClassE);
        Assert.areEqual(222, r.varClassF);
        Assert.areEqual(333, r.varClassG);
        
        var ast = scriptFromString("new ScriptClassH()");
        var r:AbstractScriptClass = interp.execute(ast);
        Assert.isType(r, hscript.ScriptClass);
        Assert.areEqual(111, r.varClassE);
        Assert.areEqual(222, r.varClassF);
        Assert.areEqual(444, r.varClassH);
    }
    
    @Test
    public function testScriptMultipleScriptSupers() {
        var ast = scriptFromString("new ScriptClassE()");
        var r:AbstractScriptClass = interp.execute(ast);
        Assert.areEqual(111, r.test());
        
        var ast = scriptFromString("new ScriptClassF()");
        var r:AbstractScriptClass = interp.execute(ast);
        Assert.areEqual(333, r.test());
        
        var ast = scriptFromString("new ScriptClassG()");
        var r:AbstractScriptClass = interp.execute(ast);
        Assert.areEqual(666, r.test());
        
        var ast = scriptFromString("new ScriptClassH()");
        var r:AbstractScriptClass = interp.execute(ast);
        Assert.areEqual(777, r.test());
    }
}
