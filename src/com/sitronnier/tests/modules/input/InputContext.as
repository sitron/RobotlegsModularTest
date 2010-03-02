package com.sitronnier.tests.modules.input 
{
	import com.sitronnier.tests.modules.input.controllers.InputCommand;
	import com.sitronnier.tests.modules.input.events.InputEvent;
	import com.sitronnier.tests.modules.input.views.InputMediator;
	import com.sitronnier.tests.modules.input.views.components.InputView;

	import org.robotlegs.utilities.modular.mvcs.ModuleContext;

	import flash.display.DisplayObjectContainer;

	/**
	 * @author sitronnier.com aka laurent prodon
	 */
	public class InputContext extends ModuleContext 
	{
		public function InputContext(contextView : DisplayObjectContainer = null)
		{
			super(contextView);
		}

		override public function startup() : void 
		{
			trace(this + " startup");
			
			// we could register a mediator for this module (like CanvasModuleMediator)
			// but as this module is only firing events to the outside, I decided to make those calls in Commands (see InputCommand)
//			mediatorMap.mapView(InputModule, InputModuleMediator);
			
			// register a mediator for the InputView
			mediatorMap.mapView(InputView, InputMediator);
			
			// map a command to the local events
			commandMap.mapEvent(InputEvent.ADD_SQUARE, InputCommand, InputEvent);
			commandMap.mapEvent(InputEvent.RESET, InputCommand, InputEvent);
			
			super.startup();			
			init();
		}

		private function init() : void 
		{
			contextView.addChild(new InputView());
		}
	}
}
