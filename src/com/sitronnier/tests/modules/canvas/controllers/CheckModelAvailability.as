package com.sitronnier.tests.modules.canvas.controllers 
{
	import com.sitronnier.tests.modules.canvas.models.SquareModel;
	import org.robotlegs.mvcs.Command;

	/**
	 * @author sitronnier.com aka laurent prodon
	 */
	public class CheckModelAvailability extends Command 
	{
		[Inject]
		public var model:SquareModel;
		
		public function CheckModelAvailability()
		{
		}

		override public function execute() : void 
		{
			model.test();
		}
	}
}
