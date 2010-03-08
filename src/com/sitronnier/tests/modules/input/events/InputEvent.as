package com.sitronnier.tests.modules.input.events 
{
	import flash.events.Event;

	/**
	 * @author sitronnier.com aka laurent prodon
	 */
	public class InputEvent extends Event 
	{
		public static const ADD_SQUARE:String = "ADD_SQUARE";
		public static const RESET:String = "RESET";
		public static const ADD_CANVAS : String = "ADD_CANVAS";
		public static const RESET_ALL : String = "RESET_ALL";

		public function InputEvent(type : String, bubbles : Boolean = false, cancelable : Boolean = false)
		{
			super(type, bubbles, cancelable);
		}

		override public function clone() : Event 
		{
			return new InputEvent(type, bubbles, cancelable);
		}
	}
}
