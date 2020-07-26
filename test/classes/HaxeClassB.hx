package test.classes;

class HaxeClassB extends HaxeClassA {
    public var varClassB:Int = 222;
    
    public function new() {
        super();
    }
    
    public override function test():Int {
        return super.test() + varClassB;
    }
}