package com.sitronnier.tests.modules.canvas 
{
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.utilities.modular.mvcs.ModuleContextView;

	/**
	 * @author sitronnier.com aka laurent prodon
	 */
	public class CanvasModule extends ModuleContextView 
	{
		public function CanvasModule()
		{
			super();
			
			context = new CanvasContext(this);
			context.eventDispatcher.addEventListener(ContextEvent.SHUTDOWN_COMPLETE, _onShutDownComplete);
		}		
		
		// PROTECTED, PRIVATE
		//________________________________________________________________________________________________

		private function _onShutDownComplete(event : ContextEvent) : void 
		{			
			context.eventDispatcher.removeEventListener(ContextEvent.SHUTDOWN_COMPLETE, _onShutDownComplete);
			(context as CanvasContext).onShutDownComplete();
			context = null;
		}		

		// PUBLIC
		//________________________________________________________________________________________________

		public function dispose() : void 
		{
			context.shutdown();
		}
	}
}
