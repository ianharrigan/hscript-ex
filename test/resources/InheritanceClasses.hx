import test.classes.HaxeClassA;
import test.classes.HaxeClassB;
import test.classes.HaxeClassC;
import test.classes.HaxeClassD;

class ScriptClassA extends HaxeClassA {
    public function test():Int {
        return super.test() + 1;
    }
}

class ScriptClassB extends HaxeClassB {
    public function test():Int {
        return super.test() + 2;
    }
}

class ScriptClassC extends HaxeClassC {
    public function test():Int {
        return super.test() + 3;
    }
}

class ScriptClassD extends HaxeClassD {
    public function test():Int {
        return super.test() + 4;
    }
}










class ScriptClassE {
    public var varClassE = 111;
    public function new() {
    }
    
    public function test() {
        return varClassE;
    }
}

class ScriptClassF extends ScriptClassE {
    public var varClassF = 222;
    public function new() {
        super();
    }
    
    public function test():Int {
        return super.test() + varClassF;
    }
}

class ScriptClassG extends ScriptClassF {
    public var varClassG = 333;
    public function new() {
        super();
    }
    
    public function test():Int {
        return super.test() + varClassG;
    }
}

class ScriptClassH extends ScriptClassF {
    public var varClassH = 444;
    
    public function test():Int {
        return return super.test() + varClassH;
    }
}

