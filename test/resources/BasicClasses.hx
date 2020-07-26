import test.classes.BasicHaxeClass;
import test.classes.HaxeClassWithConstructorParams;

class BasicClass {
    var varInt:Int = 100;
    var varBool:Bool = false;
    var varFloat:Float = 123.456;
    var varString:String = "start string";
    
    function fnVoid() {
    }
    
    function fnInt() {
        return 101;
    }
    
    function fnFloat() {
        return 101.123;
    }
    
    function fnBool() {
        return true;
    }
    
    function fnString() {
        return "BasicClass::fnString";
    }
    
    function fnParamInt_0() {
        return 111;
    }
    
    function fnParamInt_1(d0:Int) {
        return d0;
    }
    
    function fnParamInt_2(d0:Int, d1:String) {
        return d0 + d1;
    }
    
    function fnParamInt_3(d0:Int, d1:String, d2:Bool) {
        return d0 + d1 + d2;
    }
    
    function fnParamInt_4(d0:Int, d1:String, d2:Bool, d3:Float) {
        return d0 + d1 + d2 + d3;
    }
    
    function fnGettingMemberVars() {
        var v = varInt + this.varInt;
        return v;
    }
    
    function fnSettingMemberVars1() {
        varInt = 123;
    }
    
    function fnSettingMemberVars2() {
        this.varInt = 456;
    }
}

class BasicClassExtendedFromHaxeClass extends BasicHaxeClass {
    var varInt:Int = 111;
    var varBool:Bool = false;
    var varFloat:Float = 123.456;
    var varString:String = "start string";
    
    public function new() {
        super();
    }
    
    function fnInt() {
        return 101;
    }
    
    function fnFloat() {
        return 101.123;
    }
    
    function fnBool() {
        return true;
    }
    
    function fnString() {
        return "BasicClassExtendedFromHaxeClass::fnString";
    }
    
    function fnForOverrideHaxeInt() {
        return 104;
    }
    
    function fnForOverrideWithSuperHaxeInt() {
        return 106 + super.fnForOverrideWithSuperHaxeInt();
    }
    
    function fnParamInt_0() {
        return 111;
    }
    
    function fnParamInt_1(d0:Int) {
        return d0;
    }
    
    function fnParamInt_2(d0:Int, d1:String) {
        return d0 + d1;
    }
    
    function fnParamInt_3(d0:Int, d1:String, d2:Bool) {
        return d0 + d1 + d2;
    }
    
    function fnParamInt_4(d0:Int, d1:String, d2:Bool, d3:Float) {
        return d0 + d1 + d2 + d3;
    }
    
    function fnTheUsesSuper_1() {
        var n = super.fnHaxeInt();
        return 222 + n;
    }
    
    function fnTheUsesSuper_2() {
        var n = super.fnHaxeInt();
        var f = super.fnHaxeFloat();
        return 333 + n + f;
    }
    
    function fnTheUsesSuper_3() {
        var n = super.fnHaxeInt();
        var f = super.fnHaxeFloat();
        var s = super.fnHaxeString();
        return 444 + n + f + s;
    }
    
    function fnTheUsesSuper_WithParams(d0:Int, d1:String, d2:Bool, d3:Float) {
        var n = super.fnHaxeInt();
        var f = super.fnHaxeFloat();
        var s = super.fnHaxeString();
        return 555 + n + f + s + d0 + d1 + d2 + d3;
    }
    
    function fnGettingMemberVars() {
        var v = this.varHaxeInt + varHaxeInt + this.varInt + varInt;
        return v;
    }
    
    function fnSettingMemberVars1() {
        varInt = 123;
        varHaxeInt = 444;
    }
    
    function fnSettingMemberVars2() {
        this.varInt = 456;
        this.varHaxeInt = 876;
    }
}

class ScriptClassWithConstructorParams {
    public var intParam:Int = 200;
    public var floatParam:Float = 333.333;
    public var boolParam:Bool = false;
    public var stringParam:String = "script original";
    
    public function new(iparam:Int, fparam:Float, bparam:Bool, sparam:String) {
        intParam = iparam;
        floatParam = fparam;
        boolParam = bparam;
        stringParam = sparam;
    }
}

class ExtendedScriptClassWithConstructorParams extends HaxeClassWithConstructorParams {
    public function new(iparam:Int, fparam:Float, bparam:Bool, sparam:String) {
        super(iparam, fparam, bparam, sparam);
    }
}

class ClassX extends BasicHaxeClass {
    public function test1() {
        return varHaxeInt;
    }
    
    public function test2() {
        return this.varHaxeInt;
    }
}

class ClassY extends ClassX {
    public function test3() {
        return varHaxeInt;
    }
    
    public function test4() {
        return this.varHaxeInt;
    }
}