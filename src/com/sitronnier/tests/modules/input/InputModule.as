package com.sitronnier.tests.modules.input 
{
	import org.robotlegs.utilities.modular.mvcs.ModuleContextView;

	/**
	 * @author sitronnier.com aka laurent prodon
	 */
	public class InputModule extends ModuleContextView 
	{
		public function InputModule()
		{
			super();			
			context = new InputContext(this);
		}
	}
}
