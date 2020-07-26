import test.classes.BasicHaxeClass;

class ClassA {
    var varInt:Int = 111;
    
    function setB1(classB:ClassB) {
        classB.varInt = 333;
    }
    
    function setB2(classB:ClassB) {
        this.setB3(classB);
    }
    
    function setB3(classB:ClassB) {
        classB.varInt = 444;
    }
    
    function setB4(classB:ClassB) {
        setB5(classB);
    }
    
    function setB5(classB:ClassB) {
        classB.varInt = 555;
    }
    
    function test():String {
        return "bob" + test2(101, "suffix");
    }
    
    function test2(n:Int, s:String):String {
        return test3(n + 111, s + "additional");
    }

    function test3(n:Int, s:String):String {
        return s + n;
    }
}

class ClassB {
    var varInt:Int = 222;
}

class ClassC {
    var varInt:Int = 111;
    
    function setD1(classD:ClassD) {
        classD.varInt = 333;
        classD.varHaxeInt = 444;
    }
}

class ClassD extends BasicHaxeClass {
    var varInt:Int = 222;
}