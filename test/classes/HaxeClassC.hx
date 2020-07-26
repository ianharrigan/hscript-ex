package test.classes;

class HaxeClassC extends HaxeClassB {
    public var varClassC:Int = 333;
    
    public function new() {
        super();
    }
    
    public override function test():Int {
        return super.test() + varClassC;
    }
}