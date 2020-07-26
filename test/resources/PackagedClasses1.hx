package a.b.c;

import d.e.f.ClassD;

class ClassA {
    var varClassA:Int = 111;
    
    public function new() {
    }
}

class ClassB extends ClassA {
    var varClassB:Int = 222;
}

class ClassC extends a.b.c.ClassB {
    var varClassC:Int = 333;
}

class ClassX {
    public function test1():ClassA {
        return new a.b.c.ClassA();
    }
    
    public function test2():ClassA {
        return new ClassA();
    }
    
    public function test3():ClassD {
        return new d.e.f.ClassD();
    }
    
    public function test4():ClassD {
        return new ClassD();
    }
}