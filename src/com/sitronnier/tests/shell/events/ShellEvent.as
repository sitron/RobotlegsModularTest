package com.sitronnier.tests.shell.events 
{
	import org.robotlegs.utilities.modular.mvcs.ModuleContextView;
	import flash.events.Event;

	/**
	 * @author sitronnier.com aka laurent prodon
	 */
	public class ShellEvent extends Event 
	{
		public static const ADD_CANVAS : String = "ADD_CANVAS";
		public static const ON_NEW_CANVAS : String = "ON_NEW_CANVAS";
		public static const REMOVE_ALL_CANVAS : String = "REMOVE_ALL_CANVAS";

		public var canvas:ModuleContextView;		

		public function ShellEvent(type : String, bubbles : Boolean = false, cancelable : Boolean = false)
		{
			super(type, bubbles, cancelable);
		}

		override public function clone() : Event 
		{
			return new ShellEvent(type, bubbles, cancelable);
		}
	}
}
