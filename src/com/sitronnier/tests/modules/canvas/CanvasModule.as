package com.sitronnier.tests.modules.canvas 
{
	import org.robotlegs.utilities.modular.mvcs.ModuleContextView;

	/**
	 * @author sitronnier.com aka laurent prodon
	 */
	public class CanvasModule extends ModuleContextView 
	{
		public function CanvasModule()
		{
			super();
			
			context = new CanvasContext(this);
		}
	}
}
