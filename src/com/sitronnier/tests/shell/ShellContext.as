package com.sitronnier.tests.shell 
{
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
		}
		
		override public function startup() : void 
		{			
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
