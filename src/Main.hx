package ;

#if flash
import flash.Lib;
import flash.desktop.NativeApplication;
import flash.events.InvokeEvent;
#else
import nme.Lib;
import nme.filesystem.File;
#end

/**
 * ...
 * @author Alan Shaw
 */

class Main 
{
	static function main() 
	{
#if flash
		
		var app = NativeApplication.nativeApplication;
		app.addEventListener(InvokeEvent.INVOKE, function(e : InvokeEvent) 
		{
			new REPL();	
		});
		
#else
		
		new REPL();
		
#end
	}
}