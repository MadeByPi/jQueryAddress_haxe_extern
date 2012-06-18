/*Copyright (c) 2012 Mike.Almond, MadeByPi

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.*/

package;

/**
 * ...
 * @author Mike Almond
 */


import js.Lib;
import js.JQuery;
import js.jQuery.JQueryAddress;

import haxe.Firebug;

class Main {
	
	static function main() {
		
		new JQuery(Lib.document).ready(function(e:JqEvent):Void {
			// JQuery document ready... start things up.
			
			if (Firebug.detect()) Firebug.redirectTraces();
			
			// testing JQueryAddress things
			
			JQueryAddress.title("Testing JQueryAddress.hx");
			JQueryAddress.path("test-path");
			JQueryAddress.queryString("testQueryString=test");
			
			trace("path: " + JQueryAddress.path());
			trace("pathNames: " + JQueryAddress.pathNames());
			trace("queryString: " + JQueryAddress.queryString());
			
			JQueryAddress.change(onAddressChange);
		});
	}
	
	static private function onAddressChange(e:JqAddressEvent):Void {
		trace("onAddressChange: path:" + e.path + ", queryString:" + e.queryString);
	}
}