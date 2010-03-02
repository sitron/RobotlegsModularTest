package com.sitronnier.tests.modules.input 
{
	import org.robotlegs.utilities.modular.mvcs.ModuleMediator;

	/**
	 * @author sitronnier.com aka laurent prodon
	 */
	public class InputModuleMediator extends ModuleMediator 
	{
		/**
		 * DEPRECATED
		 * see InputCommand for external event dispatch
		 */
		
		public function InputModuleMediator()
		{
		}

		override public function onRegister() : void 
		{
			// internal events, to be redispatched externally (see handlers below)
//			eventMap.mapListener(eventDispatcher, InputEvent.ADD_SQUARE, _onAddSquareRequest);
//			eventMap.mapListener(eventDispatcher, InputEvent.RESET, _onResetRequest);
		}

//		private function _onResetRequest(event:InputEvent) : void 
//		{
//			moduleDispatcher.dispatchEvent(new CanvasEvent(CanvasEvent.RESET));
//		}
//
//		private function _onAddSquareRequest(event:InputEvent) : void 
//		{
//			moduleDispatcher.dispatchEvent(new CanvasEvent(CanvasEvent.ADD_SQUARE));
//		}
	}
}
