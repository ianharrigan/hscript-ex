package test.tests;

import hscript.AbstractScriptClass;
import massive.munit.Assert;

class BasicClassVarTests extends TestBase {
    @Before
    public function setup():Void {
        moduleFromResource("BasicClasses.hx");
    }
    
    @Test
    public function testBasicScriptClassVars() {
        var ast = scriptFromString("new BasicClass()");
        var r:AbstractScriptClass = interp.execute(ast);
        
        Assert.isType(r, hscript.ScriptClass);
        
        Assert.areEqual(100, r.varInt);
        r.varInt = 101;
        Assert.areEqual(101, r.varInt);
        r.varInt = r.varInt + 222;
        Assert.areEqual(323, r.varInt);
        //r.varInt += 100;
        
        Assert.areEqual(false, r.varBool);
        r.varBool = true;
        Assert.areEqual(true, r.varBool);
        r.varBool = !r.varBool;
        Assert.areEqual(false, r.varBool);
        
        Assert.areEqual(123.456, r.varFloat);
        r.varFloat = 101.837;
        Assert.areEqual(101.837, r.varFloat);
        r.varFloat = r.varFloat + 293.483;
        Assert.areEqual(395.32, r.varFloat);
        
        Assert.areEqual("start string", r.varString);
        r.varString = "new string";
        Assert.areEqual("new string", r.varString);
        r.varString = r.varString + "suffix";
        Assert.areEqual("new stringsuffix", r.varString);
    }

    @Test
    public function testBasicScriptClassUsingMemberVars() {
        var ast = scriptFromString("new BasicClass()");
        var r:AbstractScriptClass = interp.execute(ast);
        
        Assert.isType(r, hscript.ScriptClass);
        
        Assert.areEqual(200, r.fnGettingMemberVars());
        
        Assert.areEqual(100, r.varInt);
        r.fnSettingMemberVars1();
        Assert.areEqual(123, r.varInt);
        
        r.fnSettingMemberVars2();
        Assert.areEqual(456, r.varInt);
    }

    @Test
    public function testHaxeClassVars() {
        var ast = scriptFromString("new BasicClassExtendedFromHaxeClass()");
        var r:AbstractScriptClass = interp.execute(ast);
        
        Assert.isType(r, hscript.ScriptClass);
        Assert.isType(r.superClass, test.classes.BasicHaxeClass);
        Assert.isTrue(r.superClass.superHasRun);
        
        Assert.areEqual(222, r.varHaxeInt);
        r.varHaxeInt = 333;
        Assert.areEqual(333, r.varHaxeInt);
        r.varHaxeInt = r.varHaxeInt + 444;
        Assert.areEqual(777, r.varHaxeInt);
        //r.varInt += 100;
        
        Assert.areEqual(true, r.varHaxeBool);
        r.varHaxeBool = false;
        Assert.areEqual(false, r.varHaxeBool);
        r.varHaxeBool = !r.varHaxeBool;
        Assert.areEqual(true, r.varHaxeBool);
        
        Assert.areEqual(789.123, r.varHaxeFloat);
        r.varHaxeFloat = 101.837;
        Assert.areEqual(101.837, r.varHaxeFloat);
        r.varHaxeFloat = r.varHaxeFloat + 293.483;
        Assert.areEqual(395.32, r.varHaxeFloat);
        
        Assert.areEqual("haxe start string", r.varHaxeString);
        r.varHaxeString = "new string";
        Assert.areEqual("new string", r.varHaxeString);
        r.varHaxeString = r.varHaxeString + "suffix";
        Assert.areEqual("new stringsuffix", r.varHaxeString);
    }

    @Test
    public function testHaxeClassUsingMemberVars() {
        var ast = scriptFromString("new BasicClassExtendedFromHaxeClass()");
        var r:AbstractScriptClass = interp.execute(ast);
        
        Assert.isType(r, hscript.ScriptClass);
        Assert.isType(r.superClass, test.classes.BasicHaxeClass);
        Assert.isTrue(r.superClass.superHasRun);
        
        Assert.areEqual(111, r.varInt);
        Assert.areEqual(222, r.varHaxeInt);
        r.fnSettingMemberVars1();
        Assert.areEqual(123, r.varInt);
        Assert.areEqual(444, r.varHaxeInt);
        r.fnSettingMemberVars2();
        Assert.areEqual(456, r.varInt);
        Assert.areEqual(876, r.varHaxeInt);
    }
}