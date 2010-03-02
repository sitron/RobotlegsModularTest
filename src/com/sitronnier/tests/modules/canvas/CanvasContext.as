package com.sitronnier.tests.modules.canvas 
{
	import com.sitronnier.tests.modules.canvas.controllers.ResetCommand;
	import com.sitronnier.tests.modules.canvas.controllers.RemoveSquareCommand;
	import com.sitronnier.tests.modules.canvas.controllers.AddSquareCommand;
	import com.sitronnier.tests.modules.canvas.events.CanvasEvent;
	import com.sitronnier.tests.modules.canvas.models.SquareModel;
	import com.sitronnier.tests.modules.canvas.views.CanvasMediator;
	import com.sitronnier.tests.modules.canvas.views.components.CanvasView;
	import org.robotlegs.utilities.modular.mvcs.ModuleContext;

	import flash.display.DisplayObjectContainer;

	/**
	 * @author sitronnier.com aka laurent prodon
	 */
	public class CanvasContext extends ModuleContext 
	{
		public function CanvasContext(contextView : DisplayObjectContainer = null)
		{
			super(contextView);
		}	

		override public function startup() : void 
		{
			trace(this + " startup");
			
			// register a mediator for this module
			mediatorMap.mapView(CanvasModule, CanvasModuleMediator);
			
			// register a mediator for the CanvasView
			mediatorMap.mapView(CanvasView, CanvasMediator);
			
			// register the model
			injector.mapSingleton(SquareModel);	
			
			// map commands to events (internal)
			commandMap.mapEvent(CanvasEvent.REMOVE_SQUARE, RemoveSquareCommand, CanvasEvent);
			commandMap.mapEvent(CanvasEvent.ADD_SQUARE, AddSquareCommand, CanvasEvent);
			commandMap.mapEvent(CanvasEvent.RESET, ResetCommand, CanvasEvent);	
						
			super.startup();
			init();
		}

		private function init() : void 
		{
			contextView.addChild(new CanvasView());
		}
	}
}
