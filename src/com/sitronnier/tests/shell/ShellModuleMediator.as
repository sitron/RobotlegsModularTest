package com.sitronnier.tests.shell 
{
	import com.sitronnier.tests.shell.events.ShellEvent;

	import org.robotlegs.utilities.modular.mvcs.ModuleMediator;

	/**
	 * @author sitronnier.com aka laurent prodon
	 */
	public class ShellModuleMediator extends ModuleMediator 
	{
		public function ShellModuleMediator()
		{
		}

		override public function onRegister() : void 
		{
			// very handy shortcut to redispatch external event internally
			eventMap.mapListener(moduleDispatcher, ShellEvent.ADD_CANVAS, redispatchInternally);
			eventMap.mapListener(moduleDispatcher, ShellEvent.REMOVE_ALL_CANVAS, redispatchInternally);
		}
	}
}
