package test.classes;

class HaxeClassD extends HaxeClassB {
    public var varClassD:Int = 444;
    
    public override function test():Int {
        return super.test() + varClassD;
    }
}