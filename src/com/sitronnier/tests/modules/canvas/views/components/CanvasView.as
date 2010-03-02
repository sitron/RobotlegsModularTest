package com.sitronnier.tests.modules.canvas.views.components 
{
	import com.ericfeminella.collections.HashMap;
	import com.sitronnier.tests.modules.canvas.events.CanvasEvent;
	import com.sitronnier.tests.modules.canvas.models.vos.SquareVO;

	import flash.display.Sprite;
	import flash.events.MouseEvent;

	/**
	 * @author sitronnier.com aka laurent prodon
	 */
	public class CanvasView extends Sprite 
	{		
		protected var _squares:HashMap = new HashMap();
		
		public function CanvasView()
		{
			init();
		}
		
		
		// PROTECTED, PRIVATE
		//________________________________________________________________________________________________

		private function init() : void 
		{
			
		}

		private function _onSquareClick(event : MouseEvent) : void 
		{
			dispatchEvent(new CanvasEvent(CanvasEvent.REMOVE_SQUARE, (event.currentTarget as Square).data));
		}
		
		
		// PUBLIC
		//________________________________________________________________________________________________
		
		public function addSquare(vo:SquareVO):void
		{
			var s:Square = new Square(vo); 
			s.addEventListener(MouseEvent.CLICK, _onSquareClick);
			addChild(s);
			_squares.put(s.id, s);
			s.x = Math.round(Math.random() * (stage.stageWidth - s.width));
			s.y = Math.round(Math.random() * (stage.stageHeight - s.height));		
		}
		
		public function removeSquare(vo:SquareVO):void
		{
			var s:Square = _squares.getValue(vo.id) as Square;
			_squares.remove(vo.id);
			s.removeEventListener(MouseEvent.CLICK, _onSquareClick);
			removeChild(s);
			s = null;	
		}
		
		public function removeAllSquares():void
		{
			var a:Array = _squares.getValues();
			for each (var s : Square in a) 
			{
				removeSquare(s.data);	
			}
		}  
	}
}
