package com.sitronnier.tests.modules.canvas 
{
	import com.sitronnier.tests.modules.canvas.controllers.AddSquareCommand;
	import com.sitronnier.tests.modules.canvas.controllers.ResetCommand;
	import com.sitronnier.tests.modules.canvas.events.CanvasEvent;

	import org.robotlegs.utilities.modular.mvcs.ModuleMediator;

	/**
	 * @author sitronnier.com aka laurent prodon
	 */
	public class CanvasModuleMediator extends ModuleMediator 
	{
		public function CanvasModuleMediator()
		{
		}

		override public function onRegister() : void 
		{			
			// events coming from outside are mapped to internal commands (very handy shortcut)
			moduleCommandMap.mapEvent(CanvasEvent.ADD_SQUARE, AddSquareCommand, CanvasEvent);
			moduleCommandMap.mapEvent(CanvasEvent.RESET, ResetCommand, CanvasEvent);
			
			// redispatch some events externally (could be used to disable buttons for ex.)
			eventMap.mapListener(eventDispatcher, CanvasEvent.ON_SQUARE_REMOVED, redispatchToModules);
		}

		
		override public function onRemove() : void 
		{
			moduleCommandMap.unmapEvent(CanvasEvent.ADD_SQUARE, AddSquareCommand, CanvasEvent);
			moduleCommandMap.unmapEvent(CanvasEvent.RESET, ResetCommand, CanvasEvent);
			
			super.onRemove();
		}
	}
}
