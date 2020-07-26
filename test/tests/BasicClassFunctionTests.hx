package test.tests;

import hscript.AbstractScriptClass;
import massive.munit.Assert;

class BasicClassFunctionTests extends TestBase {
    @Before
    public function setup():Void {
        moduleFromResource("BasicClasses.hx");
    }
    
    @Test
    public function testBasicScriptClass() {
        var ast = scriptFromString("new BasicClass()");
        var r:AbstractScriptClass = interp.execute(ast);
        
        Assert.isType(r, hscript.ScriptClass);
        
        Assert.areEqual(101, r.fnInt());
        Assert.areEqual(101.123, r.fnFloat());
        Assert.areEqual(true, r.fnBool());
        Assert.areEqual("BasicClass::fnString", r.fnString());
        
        try {
            r.fnNonExistent();
            throw "Exception expected";
        } catch (e:Dynamic) {
            Assert.areEqual("field 'fnNonExistent' does not exist in script class 'BasicClass'", e);
        }
    }
    
    @Test
    public function testScriptClassExtendedFromHaxeClass() {
        var ast = scriptFromString("new BasicClassExtendedFromHaxeClass()");
        var r:AbstractScriptClass = interp.execute(ast);

        Assert.isType(r, hscript.ScriptClass);
        Assert.isType(r.superClass, test.classes.BasicHaxeClass);
        Assert.isTrue(r.superClass.superHasRun);
        
        Assert.areEqual(101, r.fnInt());
        Assert.areEqual(101.123, r.fnFloat());
        Assert.areEqual(true, r.fnBool());
        Assert.areEqual("BasicClassExtendedFromHaxeClass::fnString", r.fnString());

        Assert.areEqual(102, r.fnHaxeInt());
        Assert.areEqual(102.456, r.fnHaxeFloat());
        Assert.areEqual(false, r.fnHaxeBool());
        Assert.areEqual("BasicHaxeClass::fnHaxeString", r.fnHaxeString());
        
        try {
            r.fnNonExistent();
            throw "Exception expected";
        } catch (e:Dynamic) {
            Assert.areEqual("field 'fnNonExistent' does not exist in script class 'BasicClassExtendedFromHaxeClass' or super class 'test.classes.BasicHaxeClass'", e);
        }
    }
    
    @Test
    public function testOverridesInScriptClassExtendedFromHaxeClass() {
        var ast = scriptFromString("new BasicClassExtendedFromHaxeClass()");
        var r:AbstractScriptClass = interp.execute(ast);
        
        Assert.isType(r, hscript.ScriptClass);
        Assert.isType(r.superClass, test.classes.BasicHaxeClass);
        Assert.isTrue(r.superClass.superHasRun);
        
        Assert.areEqual(103, r.superClass.fnForOverrideHaxeInt());
        Assert.areEqual(104, r.fnForOverrideHaxeInt());
        Assert.areEqual(105, r.superClass.fnForOverrideWithSuperHaxeInt());
        Assert.areEqual(105 + 106, r.fnForOverrideWithSuperHaxeInt());
    }

    @Test
    public function testBasicScriptClassWithFunctionParams() {
        var ast = scriptFromString("new BasicClass()");
        var r:AbstractScriptClass = interp.execute(ast);
        
        Assert.isType(r, hscript.ScriptClass);
        
        Assert.areEqual(111, r.fnParamInt_0());
        Assert.areEqual(123, r.fnParamInt_1(123));
        Assert.areEqual("123bob", r.fnParamInt_2(123, "bob"));
        Assert.areEqual("123timtrue", r.fnParamInt_3(123, "tim", true));
        Assert.areEqual("123jimtrue456.789", r.fnParamInt_4(123, "jim", true, 456.789));
    }

    @Test
    public function testHaxeClassWithFunctionParams() {
        var ast = scriptFromString("new BasicClassExtendedFromHaxeClass()");
        var r:AbstractScriptClass = interp.execute(ast);
        
        Assert.isType(r, hscript.ScriptClass);
        Assert.isType(r.superClass, test.classes.BasicHaxeClass);
        Assert.isTrue(r.superClass.superHasRun);
        
        Assert.areEqual(111, r.fnParamInt_0());
        Assert.areEqual(123, r.fnParamInt_1(123));
        Assert.areEqual("123bob", r.fnParamInt_2(123, "bob"));
        Assert.areEqual("123timtrue", r.fnParamInt_3(123, "tim", true));
        Assert.areEqual("123jimtrue456.789", r.fnParamInt_4(123, "jim", true, 456.789));
        
        Assert.areEqual(222, r.fnHaxeParamInt_0());
        Assert.areEqual(123, r.fnHaxeParamInt_1(123));
        Assert.areEqual("123bob", r.fnHaxeParamInt_2(123, "bob"));
        Assert.areEqual("123timtrue", r.fnHaxeParamInt_3(123, "tim", true));
        Assert.areEqual("123jimtrue456.789", r.fnHaxeParamInt_4(123, "jim", true, 456.789));
    }

    @Test
    public function testScriptClassThatUsesSuper() {
        var ast = scriptFromString("new BasicClassExtendedFromHaxeClass()");
        var r:AbstractScriptClass = interp.execute(ast);
        
        Assert.isType(r, hscript.ScriptClass);
        Assert.isType(r.superClass, test.classes.BasicHaxeClass);
        Assert.isTrue(r.superClass.superHasRun);
        
        Assert.areEqual(324, r.fnTheUsesSuper_1());
        Assert.areEqual(537.456, r.fnTheUsesSuper_2());
        Assert.areEqual("648.456BasicHaxeClass::fnHaxeString", r.fnTheUsesSuper_3());
        Assert.areEqual("759.456BasicHaxeClass::fnHaxeString123jimtrue456.789", r.fnTheUsesSuper_WithParams(123, "jim", true, 456.789));
    }

    @Test
    public function testBasicScriptConstructorParams() {
        var ast = scriptFromString("new ScriptClassWithConstructorParams(444, 555.55, true, 'cparam')");
        var r:AbstractScriptClass = interp.execute(ast);
        
        Assert.isType(r, hscript.ScriptClass);
        
        Assert.areEqual(444, r.intParam);
        Assert.areEqual(555.55, r.floatParam);
        Assert.areEqual(true, r.boolParam);
        Assert.areEqual("cparam", r.stringParam);
    }
    
    @Test
    public function testExtendedScriptClassWithConstructorParams() {
        var ast = scriptFromString("new ExtendedScriptClassWithConstructorParams(444, 555.55, true, 'cparam')");
        var r:AbstractScriptClass = interp.execute(ast);
        
        Assert.isType(r, hscript.ScriptClass);
        Assert.isType(r.superClass, test.classes.HaxeClassWithConstructorParams);
        
        Assert.areEqual(444, r.intParam);
        Assert.areEqual(555.55, r.floatParam);
        Assert.areEqual(true, r.boolParam);
        Assert.areEqual("cparam", r.stringParam);
    }
    
    @Test
    public function testSuperVars() {
        var ast = scriptFromString("new ClassX()");
        var r:AbstractScriptClass = interp.execute(ast);
        
        Assert.areEqual(222, r.varHaxeInt);
        Assert.areEqual(222, r.test1());
        Assert.areEqual(222, r.test2());

        var ast = scriptFromString("new ClassY()");
        var r:AbstractScriptClass = interp.execute(ast);
        
        Assert.areEqual(222, r.varHaxeInt);
        Assert.areEqual(222, r.test1());
        Assert.areEqual(222, r.test2());
        Assert.areEqual(222, r.test3());
        Assert.areEqual(222, r.test4());
    }
}