package com.sitronnier.tests.shell.events 
{
	import flash.events.Event;

	/**
	 * @author sitronnier.com aka laurent prodon
	 */
	public class ShellEvent extends Event 
	{
		public static const ADD_CANVAS : String = "ADD_CANVAS";

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
