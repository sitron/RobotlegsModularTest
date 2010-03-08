package com.sitronnier.tests.modules.canvas.controllers 
{
	import com.sitronnier.tests.modules.canvas.views.CanvasMediator;
	import com.sitronnier.tests.modules.canvas.models.SquareModel;

	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Command;

	/**
	 * @author sitronnier.com aka laurent prodon
	 */
	public class ShutdownCommand extends Command 
	{
		[Inject]
		public var model:SquareModel;
		
		[Inject]
		public var canvasMediator:CanvasMediator;
		
		public function ShutdownCommand()
		{
		}

		override public function execute() : void 
		{
			model.dispose();
			canvasMediator.dispose();
			
			dispatch(new ContextEvent(ContextEvent.SHUTDOWN_COMPLETE));
		}
	}
}
