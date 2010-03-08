package com.sitronnier.tests.shell.models 
{
	import org.robotlegs.mvcs.Actor;

	/**
	 * @author sitronnier.com aka laurent prodon
	 */
	public class CanvasManagerModel extends Actor 
	{		
		public static const MAX_CANVAS:int = 4;
		protected var _nbCanvas:int = 0;

		public function CanvasManagerModel()
		{
			
		}

		public function addCanvas() : void 
		{
			_nbCanvas++;			
		}
		
		public function removeAllCanvas():void
		{
			_nbCanvas = 0;
		} 

		public function areMoreCanvasAllowed() : Boolean 
		{
			// no more than 4 canvas allowed (just for design purpose)
			if (_nbCanvas + 1 >= MAX_CANVAS) return false;			
			return true;
		}
	}
}
