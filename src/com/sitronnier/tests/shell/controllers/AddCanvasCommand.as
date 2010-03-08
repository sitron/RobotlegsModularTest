package com.sitronnier.tests.shell.controllers 
{
	import com.sitronnier.tests.modules.canvas.CanvasModule;
	import com.sitronnier.tests.shell.events.ShellEvent;
	import com.sitronnier.tests.shell.models.CanvasManagerModel;

	import org.robotlegs.mvcs.Command;
	import org.robotlegs.utilities.modular.core.IModuleEventDispatcher;

	/**
	 * @author sitronnier.com aka laurent prodon
	 */
	public class AddCanvasCommand extends Command 
	{		
		[Inject]
		public var canvasModel:CanvasManagerModel;
		
		[Inject]
		public var moduleDispatcher:IModuleEventDispatcher;
		
		public function AddCanvasCommand()
		{
		}

		override public function execute() : void 
		{
			if (!canvasModel.areMoreCanvasAllowed()) return;
			
			// create a new CanvasModule
			var canvasModule:CanvasModule = new CanvasModule();
			canvasModule.setModuleDispatcher(moduleDispatcher);
			canvasModule.startup();
			
			// inform others
			var e:ShellEvent = new ShellEvent(ShellEvent.ON_NEW_CANVAS);
			e.canvas = canvasModule;
			dispatch(e);
		}
	}
}
