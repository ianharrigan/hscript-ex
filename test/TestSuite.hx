package test;

class TestSuite extends massive.munit.TestSuite {
    public function new() {
		super();
		add(test.tests.BasicClassFunctionTests);
		add(test.tests.BasicClassVarTests);
		add(test.tests.InheritanceTests);
		add(test.tests.PassingObjectsTest);
		add(test.tests.PackageTests);
    }
}