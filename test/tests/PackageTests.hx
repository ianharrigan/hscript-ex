package test.tests;

import hscript.AbstractScriptClass;
import massive.munit.Assert;

class PackageTests extends TestBase {
    @Before
    public function setup():Void {
        moduleFromResource("PackagedClasses1.hx");
        moduleFromResource("PackagedClasses2.hx");
    }
    
    @Test
    public function testBasicPackages() {
        var ast = scriptFromString("new a.b.c.ClassA()");
        var r:AbstractScriptClass = interp.execute(ast);
        Assert.areEqual(111, r.varClassA);
        
        var ast = scriptFromString("new a.b.c.ClassB()");
        var r:AbstractScriptClass = interp.execute(ast);
        Assert.areEqual(111, r.varClassA);
        Assert.areEqual(222, r.varClassB);
        
        var ast = scriptFromString("new a.b.c.ClassC()");
        var r:AbstractScriptClass = interp.execute(ast);
        Assert.areEqual(111, r.varClassA);
        Assert.areEqual(222, r.varClassB);
        Assert.areEqual(333, r.varClassC);
    }
    
    @Test
    public function testDifferentPackages() {
        var ast = scriptFromString("new d.e.f.ClassD()");
        var r:AbstractScriptClass = interp.execute(ast);
        Assert.areEqual(111, r.varClassA);
        Assert.areEqual(444, r.varClassD);
        
        var ast = scriptFromString("new d.e.f.ClassE()");
        var r:AbstractScriptClass = interp.execute(ast);
        Assert.areEqual(111, r.varClassA);
        Assert.areEqual(222, r.varClassB);
        Assert.areEqual(555, r.varClassE);
    }
    
    @Test
    public function testCreatingClasses() {
        var ast = scriptFromString("new a.b.c.ClassX()");
        var r:AbstractScriptClass = interp.execute(ast);
        
        var c:AbstractScriptClass = r.test1();
        Assert.areEqual(111, c.varClassA);
        
        var c:AbstractScriptClass = r.test2();
        Assert.areEqual(111, c.varClassA);
        
        var c:AbstractScriptClass = r.test3();
        Assert.areEqual(444, c.varClassD);
        
        var c:AbstractScriptClass = r.test4();
        Assert.areEqual(444, c.varClassD);
    }
}