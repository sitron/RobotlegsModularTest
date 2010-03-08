package com.sitronnier.tests.shell.controllers 
{
	import com.sitronnier.tests.shell.models.CanvasManagerModel;
	import org.robotlegs.mvcs.Command;

	/**
	 * @author sitronnier.com aka laurent prodon
	 */
	public class RemoveAllCanvasCommand extends Command 
	{
		[Inject]
		public var model:CanvasManagerModel;
		
		public function RemoveAllCanvasCommand()
		{
		}

		override public function execute() : void 
		{
			model.removeAllCanvas();
		}
	}
}
