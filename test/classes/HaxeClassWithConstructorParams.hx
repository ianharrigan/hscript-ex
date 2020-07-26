package test.classes;

@:keep
class HaxeClassWithConstructorParams {
    public var intParam:Int = 100;
    public var floatParam:Float = 222.222;
    public var boolParam:Bool = false;
    public var stringParam:String = "haxe original";
    
    public function new(iparam:Int, fparam:Float, bparam:Bool, sparam:String) {
        intParam = iparam;
        floatParam = fparam;
        boolParam = bparam;
        stringParam = sparam;
    }
}