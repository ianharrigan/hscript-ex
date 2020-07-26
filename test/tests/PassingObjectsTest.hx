package test.tests;

import hscript.AbstractScriptClass;
import massive.munit.Assert;

class PassingObjectsTest extends TestBase {
    @Before
    public function setup():Void {
        moduleFromResource("PassingObjectsClasses.hx");
    }
    
    @Test
    public function testScriptClassPassingScriptClasses() {
        var ast = scriptFromString("new ClassA()");
        var classA:AbstractScriptClass = interp.execute(ast);
        
        var ast = scriptFromString("new ClassB()");
        var classB:AbstractScriptClass = interp.execute(ast);
        
        Assert.areEqual(111, classA.varInt);
        Assert.areEqual(222, classB.varInt);
        classA.setB1(classB);
        Assert.areEqual(333, classB.varInt);
        classA.setB2(classB);
        Assert.areEqual(444, classB.varInt);
        classA.setB4(classB);
        Assert.areEqual(555, classB.varInt);
        Assert.areEqual("bobsuffixadditional212", classA.test());
    }

    @Test
    public function testScriptClassPassingHaxeClasses() {
        var ast = scriptFromString("new ClassC()");
        var classC:AbstractScriptClass = interp.execute(ast);
        
        var ast = scriptFromString("new ClassD()");
        var classD:AbstractScriptClass = interp.execute(ast);
        
        Assert.areEqual(111, classC.varInt);
        Assert.areEqual(222, classD.varInt);
        classC.setD1(classD);
        Assert.areEqual(333, classD.varInt);
    }
}