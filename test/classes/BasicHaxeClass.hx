package test.classes;

@:keep
class BasicHaxeClass {
    public var superHasRun:Bool = false;
 
    var varHaxeInt:Int = 222;
    var varHaxeBool:Bool = true;
    var varHaxeFloat:Float = 789.123;
    var varHaxeString:String = "haxe start string";
    
    public function new() {
        superHasRun = true;
    }
    
    public function fnHaxeInt() {
        return 102;
    }
    
    public function fnHaxeFloat() {
        return 102.456;
    }
    
    public function fnHaxeBool() {
        return false;
    }
    
    public function fnHaxeString() {
        return "BasicHaxeClass::fnHaxeString";
    }
    
    public function fnForOverrideHaxeInt() {
        return 103;
    }
    
    public function fnForOverrideWithSuperHaxeInt() {
        return 105;
    }
    
    function fnHaxeParamInt_0() {
        return 222;
    }
    
    function fnHaxeParamInt_1(d0:Int) {
        return d0;
    }
    
    function fnHaxeParamInt_2(d0:Int, d1:String) {
        return d0 + d1;
    }
    
    function fnHaxeParamInt_3(d0:Int, d1:String, d2:Bool) {
        return d0 + d1 + d2;
    }
    
    function fnHaxeParamInt_4(d0:Int, d1:String, d2:Bool, d3:Float) {
        return d0 + d1 + d2 + d3;
    }
}