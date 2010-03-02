package com.sitronnier.tests.modules.canvas.controllers 
{
	import com.sitronnier.tests.modules.canvas.events.CanvasEvent;
	import com.sitronnier.tests.modules.canvas.models.SquareModel;
	import org.robotlegs.mvcs.Command;

	/**
	 * @author sitronnier.com aka laurent prodon
	 */
	public class RemoveSquareCommand extends Command 
	{
		[Inject]
		public var model:SquareModel;
		
		[Inject]
		public var event:CanvasEvent;
		
		public function RemoveSquareCommand()
		{
		}

		override public function execute() : void 
		{
			model.removeSquare(event.vo);
		}
	}
}
