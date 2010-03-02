package com.sitronnier.tests.modules.canvas.events 
{
	import com.sitronnier.tests.modules.canvas.models.vos.SquareVO;
	import flash.events.Event;

	/**
	 * @author sitronnier.com aka laurent prodon
	 */
	public class CanvasEvent extends Event 
	{
		// MODEL EVENTS
		public static const ON_NEW_SQUARE : String = "ON_NEW_SQUARE";
		public static const ON_RESET : String = "ON_RESET";
		public static const ON_SQUARE_REMOVED : String = "ON_SQUARE_REMOVED";
		
		// EVENTS TO COMMANDS
		public static const ADD_SQUARE : String = "ADD_SQUARE";
		public static const REMOVE_SQUARE : String = "REMOVE_SQUARE";
		public static const RESET : String = "RESET";		

		public var vo:SquareVO;

		public function CanvasEvent(type : String, vo:SquareVO = null, bubbles : Boolean = false, cancelable : Boolean = false)
		{
			if (vo != null) this.vo = vo;
			super(type, bubbles, cancelable);
		}

		override public function clone() : Event 
		{
			return new CanvasEvent(type, vo, bubbles, cancelable);
		}
	}
}
