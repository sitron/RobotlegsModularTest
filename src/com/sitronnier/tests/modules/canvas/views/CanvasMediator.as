package com.sitronnier.tests.modules.canvas.views 
{
	import com.sitronnier.tests.modules.canvas.events.CanvasEvent;
	import com.sitronnier.tests.modules.canvas.views.components.CanvasView;

	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Mediator;

	/**
	 * @author sitronnier.com aka laurent prodon
	 */
	public class CanvasMediator extends Mediator 
	{
		[Inject]
		public var view:CanvasView;
		
		public function CanvasMediator()
		{
		}		
		
		// PROTECTED, PRIVATE
		//________________________________________________________________________________________________

		private function _onRemoveSquareRequest(event:CanvasEvent) : void 
		{
			dispatch(event);
		}

		private function _reset(event:CanvasEvent) : void 
		{
			view.removeAllSquares();
		}

		private function _addSquare(event:CanvasEvent) : void 
		{
			view.addSquare(event.vo);
		}	

		private function _removeSquare(event:CanvasEvent) : void 
		{
			view.removeSquare(event.vo);
		}		
		
		// PUBLIC
		//________________________________________________________________________________________________
		
		override public function onRegister() : void 
		{
			eventMap.mapListener(eventDispatcher, CanvasEvent.ON_NEW_SQUARE, _addSquare);
			eventMap.mapListener(eventDispatcher, CanvasEvent.ON_RESET, _reset);
			eventMap.mapListener(eventDispatcher, CanvasEvent.ON_SQUARE_REMOVED, _removeSquare);	
			eventMap.mapListener(view, CanvasEvent.REMOVE_SQUARE, _onRemoveSquareRequest);
		}
		
		public function dispose():void
		{
			view.dispose();
		} 	
	}
}
