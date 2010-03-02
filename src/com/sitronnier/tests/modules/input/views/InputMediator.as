package com.sitronnier.tests.modules.input.views 
{
	import com.sitronnier.tests.modules.input.events.InputEvent;
	import com.sitronnier.tests.modules.input.views.components.InputView;

	import org.robotlegs.mvcs.Mediator;

	import flash.events.Event;

	/**
	 * @author sitronnier.com aka laurent prodon
	 */
	public class InputMediator extends Mediator 
	{
		[Inject]
		public var view:InputView;
		
		public function InputMediator()
		{
		}
		
		// PROTECTED, PRIVATE
		//________________________________________________________________________________________________

		private function _reset(event : Event) : void 
		{
			dispatch(new InputEvent(InputEvent.RESET));
		}

		private function _addSquare(event : Event) : void 
		{
			dispatch(new InputEvent(InputEvent.ADD_SQUARE));
		}

		private function _addCanvas(event:Event) : void 
		{
			dispatch(new InputEvent(InputEvent.ADD_CANVAS));
		}		
		
		// PUBLIC
		//________________________________________________________________________________________________
		
		override public function onRegister() : void 
		{
			eventMap.mapListener(view, InputView.ADD, _addSquare, Event);
			eventMap.mapListener(view, InputView.RESET, _reset, Event);
			eventMap.mapListener(view, InputView.ADD_CANVAS, _addCanvas, Event);
		}	
	}
}
