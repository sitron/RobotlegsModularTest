package com.sitronnier.tests.modules.input.controllers 
{
	import com.sitronnier.tests.shell.events.ShellEvent;
	import org.robotlegs.utilities.modular.core.IModuleEventDispatcher;
	import org.robotlegs.mvcs.Command;

	/**
	 * @author sitronnier.com aka laurent prodon
	 */
	public class ResetAllCommand extends Command 
	{
		[Inject]
		public var moduleDispatcher : IModuleEventDispatcher;
		
		public function ResetAllCommand()
		{
		}

		override public function execute() : void 
		{
			moduleDispatcher.dispatchEvent(new ShellEvent(ShellEvent.REMOVE_ALL_CANVAS));
		}
	}
}
