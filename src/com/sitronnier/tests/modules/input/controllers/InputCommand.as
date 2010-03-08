package com.sitronnier.tests.modules.input.controllers 
{
	import com.sitronnier.tests.modules.input.events.InputEvent;
	import com.sitronnier.tests.modules.canvas.events.CanvasEvent;

	import org.robotlegs.mvcs.Command;
	import org.robotlegs.utilities.modular.core.IModuleEventDispatcher;

	/**
	 * @author sitronnier.com aka laurent prodon
	 */
	public class InputCommand extends Command 
	{

		[Inject]
		public var moduleDispatcher : IModuleEventDispatcher;

		[Inject]
		public var event : InputEvent;

		public function InputCommand()
		{
		}

		override public function execute() : void 
		{
			// switch is not very nice... maybe better to create a separate command for each event type, but for test purpose...
			switch(event.type)
			{
				case InputEvent.ADD_SQUARE:
					moduleDispatcher.dispatchEvent(new CanvasEvent(CanvasEvent.ADD_SQUARE));
					break;
				
				case InputEvent.RESET:
					moduleDispatcher.dispatchEvent(new CanvasEvent(CanvasEvent.RESET));
					break;
			}
		}
	}
}
