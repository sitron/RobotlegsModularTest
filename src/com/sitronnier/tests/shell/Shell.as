package com.sitronnier.tests.shell 
{
	import org.robotlegs.utilities.modular.mvcs.ModuleContextView;

	/**
	 * @author sitronnier.com aka laurent prodon
	 */
	public class Shell extends ModuleContextView
	{
		public function Shell() 
		{
			trace("shell constructor");
			
			context = new ShellContext(this);
		}
		
		public function addModule(module:ModuleContextView):void
		{
			(context as ShellContext).addModule(module);	
		} 
	}
}
