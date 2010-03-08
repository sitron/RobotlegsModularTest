package com.sitronnier.tests.shell 
{
	import com.sitronnier.tests.shell.controllers.AddCanvasCommand;
	import com.sitronnier.tests.shell.controllers.RemoveAllCanvasCommand;
	import com.sitronnier.tests.shell.events.ShellEvent;
	import com.sitronnier.tests.shell.models.CanvasManagerModel;
	import com.sitronnier.tests.shell.views.ShellMediator;
	import com.sitronnier.tests.shell.views.components.Container;

	import org.robotlegs.utilities.modular.base.ModuleEventDispatcher;
	import org.robotlegs.utilities.modular.mvcs.ModuleContext;
	import org.robotlegs.utilities.modular.mvcs.ModuleContextView;

	import flash.display.DisplayObjectContainer;

	/**
	 * @author sitronnier.com aka laurent prodon
	 */
	public class ShellContext extends ModuleContext 
	{
		private var _moduleEventDispatcher : ModuleEventDispatcher;

		public function ShellContext(contextView : DisplayObjectContainer = null)
		{
			super(contextView);
			
			_moduleEventDispatcher = new ModuleEventDispatcher();
			setModuleDispatcher(_moduleEventDispatcher);
		}
		
		override public function startup() : void 
		{
			trace(this + " startup");
												
			// map a mediator to the container view
			mediatorMap.mapView(Container, ShellMediator);
			
			// map a mediator to the shell module
			mediatorMap.mapView(Shell, ShellModuleMediator);
			mediatorMap.createMediator(contextView);
			
			// map the CanvasManager model
			injector.mapSingleton(CanvasManagerModel);
			
			// commands
			commandMap.mapEvent(ShellEvent.ADD_CANVAS, AddCanvasCommand, ShellEvent);
			commandMap.mapEvent(ShellEvent.REMOVE_ALL_CANVAS, RemoveAllCanvasCommand, ShellEvent);
			
			super.startup();			
		}

		/**
		 * Helper to add a module (= give it a reference to inter-module dispatcher)
		 * 
		 * @param module Module to be added
		 */
		public function addModule(module:ModuleContextView):void
		{
			module.setModuleDispatcher(_moduleEventDispatcher);
			module.startup();
		} 
	}
}
