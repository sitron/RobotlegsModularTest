package com.sitronnier.tests.modules.canvas 
{
	import org.robotlegs.base.ContextEvent;
	import com.sitronnier.tests.modules.canvas.controllers.CheckModelAvailability;
	import com.sitronnier.tests.modules.canvas.controllers.ShutdownCommand;
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
		private var _canvasView : CanvasView;

		public function CanvasContext(contextView : DisplayObjectContainer = null)
		{
			super(contextView);
		}	

		override public function startup() : void 
		{
			trace(this + " startup");
			
			// register a mediator for this module
			mediatorMap.mapView(CanvasModule, CanvasModuleMediator);
			mediatorMap.createMediator(contextView);
			
			// register a mediator for the CanvasView
			mediatorMap.mapView(CanvasView, CanvasMediator);
			
			// register the model
			injector.mapSingleton(SquareModel);	
			
			// map commands to events (internal)
			commandMap.mapEvent(CanvasEvent.REMOVE_SQUARE, RemoveSquareCommand, CanvasEvent);
			commandMap.mapEvent(CanvasEvent.ADD_SQUARE, AddSquareCommand, CanvasEvent);
			commandMap.mapEvent(CanvasEvent.RESET, ResetCommand, CanvasEvent);
			commandMap.mapEvent(ContextEvent.SHUTDOWN, ShutdownCommand, CanvasEvent);	
			commandMap.mapEvent(CanvasEvent.TEST, CheckModelAvailability, CanvasEvent);
						
			super.startup();
			init();
		}

		public function init() : void 
		{
			_canvasView = new CanvasView();
			contextView.addChild(_canvasView);
		}

		override public function shutdown() : void 
		{
			dispatchEvent(new CanvasEvent(ContextEvent.SHUTDOWN));
		}
		
		public function onShutDownComplete():void
		{
			// unmap the model
			dispatchEvent(new CanvasEvent(CanvasEvent.TEST));
			injector.unmap(SquareModel);
//			dispatchEvent(new CanvasEvent(CanvasEvent.TEST));
						
			// remove the module mediator
			var hasmedBefore:Boolean = mediatorMap.hasMediatorForView(contextView);
			mediatorMap.removeMediatorByView(contextView);
			var hasmedAfter:Boolean = mediatorMap.hasMediatorForView(contextView);
			
			contextView.removeChild(_canvasView);
			_canvasView = null;
		} 
	}
}
