package com.sitronnier.tests.modules.canvas.models 
{
	import com.sitronnier.tests.modules.canvas.events.CanvasEvent;
	import com.sitronnier.tests.modules.canvas.models.vos.SquareVO;
	import com.ericfeminella.collections.HashMap;
	import org.robotlegs.mvcs.Actor;

	/**
	 * @author sitronnier.com aka laurent prodon
	 */
	public class SquareModel extends Actor 
	{
		protected var _squares:HashMap = new HashMap();
		protected var _count:int = 0;
		
		public function SquareModel()
		{
			trace(this + " constructor");
		}
		
		public function addSquare():void
		{
			var id:int = ++_count;
			var vo:SquareVO = new SquareVO({id:id});
			_squares.put(id, vo);
			
			dispatch(new CanvasEvent(CanvasEvent.ON_NEW_SQUARE, vo));		
		} 
		
		public function removeSquare(vo:SquareVO):void
		{
			_squares.remove(vo.id);
			
			dispatch(new CanvasEvent(CanvasEvent.ON_SQUARE_REMOVED, vo));		
		} 

		public function reset() : void 
		{
			_count = 0;
			_squares.reset();
			
			dispatch(new CanvasEvent(CanvasEvent.ON_RESET));
		}
		
		public function dispose():void
		{
			_count = 0;
			_squares.clear();
			_squares = null;
		} 

		public function test() : void 
		{
			trace("test");
		}
	}
}
