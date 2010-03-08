package com.sitronnier.tests.shell.views 
{
	import com.sitronnier.tests.shell.events.ShellEvent;
	import com.sitronnier.tests.shell.views.components.Container;

	import org.robotlegs.mvcs.Mediator;

	/**
	 * @author sitronnier.com aka laurent prodon
	 */
	public class ShellMediator extends Mediator 
	{
		[Inject]
		public var view:Container;
		
				
		public function ShellMediator()
		{
			trace("ShellMediator created");
		}

		override public function onRegister() : void 
		{
			eventMap.mapListener(eventDispatcher, ShellEvent.ON_NEW_CANVAS, _addCanvas, ShellEvent);
			eventMap.mapListener(eventDispatcher, ShellEvent.REMOVE_ALL_CANVAS, _removeAllCanvas, ShellEvent);
		}

		private function _removeAllCanvas(event:ShellEvent) : void 
		{
			view.removeAllCanvas();
		}

		private function _addCanvas(event:ShellEvent) : void 
		{
			view.addCanvas(event.canvas);			
		}
	}
}
