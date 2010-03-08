package com.sitronnier.tests.shell 
{
	import com.sitronnier.tests.shell.views.components.Container;
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
		
		override public function startup() : void 
		{
			super.startup();
			init();
		}
		
		public function init():void
		{
			var container:Container = new Container();
			addChild(container);	
		} 

		public function addModule(module:ModuleContextView):void
		{
			(context as ShellContext).addModule(module);	
			addChild(module);
		} 
	}
}
