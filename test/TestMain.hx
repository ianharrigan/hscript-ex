package test;

import massive.munit.TestRunner;
import massive.munit.client.HTTPClient;
import massive.munit.client.RichPrintClient;
import massive.munit.client.SummaryReportClient;

class TestMain {
    static function main() {
        new TestMain();
    }
    
    public function new() {
        var suites = new Array<Class<massive.munit.TestSuite>>();
        suites.push(TestSuite);
        
		#if MCOVER
			var client = new mcover.coverage.munit.client.MCoverPrintClient();
			var httpClient = new HTTPClient(new mcover.coverage.munit.client.MCoverSummaryReportClient());
		#else
			var client = new RichPrintClient();
			var httpClient = new HTTPClient(new SummaryReportClient());
		#end
        
		var runner:TestRunner = new TestRunner(client); 
		runner.addResultClient(httpClient);

		runner.completionHandler = completionHandler;
		runner.run(suites);
    }
    
    private function completionHandler(successful:Bool):Void {
        try {
			#if flash
				flash.external.ExternalInterface.call("testResult", successful);
			#elseif js
				js.Lib.eval("testResult(" + successful + ");");
			#elseif sys
				Sys.exit(0);
			#end
        } catch (e:Dynamic) {
            
        }
    }
}