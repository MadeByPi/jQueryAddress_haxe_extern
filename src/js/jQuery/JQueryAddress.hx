/*Copyright (c) 2012 Mike Almond, MadeByPi

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

/**
 *
 * @author Mike Almond - @mikedotalmond
 * http://www.asual.com/jquery/address/docs/#api-reference
 *
 *
 * Haxe extern class for JQueryAddress that gives type-safe compilation for the static fields of jQueryAddress (1.4)
 *
 *
 * Will use the default js.JQuery library by default, but
 * if you prefer jQueryExtern, set the usejQueryExtern compiler flag.
 * http://lib.haxe.org/p/jQueryExtern
 *
 * Compiler options/flags:
 *
 * -debug
 * the unminified version of the jquery.address js file is used when building a debug release
 *
 * noEmbedJS - use to stop the build from including the js source for jQueryAddress in the output.
 * -D noEmbedJS
 *
 * usejQueryExtern - use to compile against the jQueryExtern haxlib rather than the core js.JQuery
 * -D usejQueryExtern
 *
 */


package js.jQuery;

import js.Dom;
import js.Lib;

#if usejQueryExtern
import jQuery.JQuery;
typedef JqAddressEvent = { > Event, // cascading typedef - http://haxe.org/ref/type_advanced
	var value			:String;
	var path			:String;
	var pathNames		:Array<String>;
	var parameterNames	:Array<String>;
	var parameters		:Dynamic; // name value object pairs
	var queryString		:String;
}
#else
import js.JQuery;
typedef JqAddressEvent = { > JqEvent, // cascading typedef - http://haxe.org/ref/type_advanced
	var value			:String;
	var path			:String;
	var pathNames		:Array<String>;
	var parameterNames	:Array<String>;
	var parameters		:Dynamic; // name value object pairs
	var queryString		:String;
}
#end


#if JQUERY_NOCONFLICT
@:native("jQuery.address")
#else
@:native("$.address")
#end
extern class JQueryAddress extends JQuery {
	
	private static function __init__() : Void untyped {
		
		// set compiler flag using '-D noEmbedJS'
		#if !noEmbedJS
			#if debug
				haxe.macro.Tools.includeFile("../lib/js/jqplugins/address/jquery.address-1.4.js");
			#else
				haxe.macro.Tools.includeFile("../lib/js/jqplugins/address/jquery.address-1.4.min.js");
			#end
		#end
		
		JQueryAddress = window.jQuery.address;
	}
	
	
	/**
	  *
	  * @param	callb
	  * @return
	  */
	public static function init(callb:JqAddressEvent -> Void):JQueryAddress;
	
	/**
	 *
	 * @param	callb
	 * @return
	 */
	public static function change(callb:JqAddressEvent -> Void):JQueryAddress;
	
	/**
	 *
	 * @param	callb
	 * @return
	 */
	public static function externalChange(callb:JqAddressEvent -> Void):JQueryAddress;
	
	/**
	 *
	 * @param	callb
	 * @return
	 */
	public static function onInternalChange(callb:JqAddressEvent -> Void):JQueryAddress;
	
	/**
	 *
	 * @param	type
	 * @param	?data
	 * @param	callb
	 * @return
	 */
	public static function bind(type:String, ?data:Dynamic, callb:JqAddressEvent -> Void):JQueryAddress;
	
	
	
	
	
	
	/**
	 * .baseURL
	 */
	public static function baseURL():String;
	
	/**
	 * .autoUpdate
	 */
	@:overload(function(value:Bool):JQueryAddress{})
	public static function autoUpdate():Bool;
	
	/**
	 * .crawlable
	 */
	@:overload(function(value:Bool):JQueryAddress{})
	public static function crawlable():Bool;
	
	/**
	 * .hash
	 */
	@:overload(function(value:String):JQueryAddress{})
	public static function hash():String;
	
	/**
	 * .history
	 */
	@:overload(function(value:Bool):Bool{})
	public static function history():Bool;
	
	/**
	 * .parameter
	 */
	@:overload(function(name:String, value:String, ?append:Bool=false):JQueryAddress{})
	public static function parameter(name:String):String;
	public static function parameterNames():Array<String>;
	
	/**
	 * .path
	 */
	@:overload(function(value:String):JQueryAddress{})
	public static function path():String;
	public static function pathNames():Array<String>;
	
	/**
	 * .queryString
	 */
	@:overload(function(value:String):JQueryAddress{})
	public static function queryString():String;
		
	/**
	 * .state
	 */
	@:overload(function(value:String):JQueryAddress{})
	public static function state():String;
	
	/**
	 * .strict
	 */
	@:overload(function(value:Bool):JQueryAddress{})
	public static function strict():Bool;
		
	/**
	 * .title
	 */
	@:overload(function(value:String):JQueryAddress{})
	public static function title():String;
	
	/**
	 * .tracker
	 */
	@:overload(function():JqEvent{})
	@:overload(function(value:String):JQueryAddress{})
	public static function tracker():String;
	
	/**
	 * .value
	 */
	@:overload(function(value:String):JQueryAddress{})
	public static function value():String;
	
	/**
	 * .update
	 */
	public static function update():JQueryAddress;
	
	/**
	 * .wrap
	 */
	@:overload(function(value:Bool):JQueryAddress{})
	public static function wrap():Bool;
}