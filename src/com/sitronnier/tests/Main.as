package com.sitronnier.tests 
{
	import com.sitronnier.tests.modules.input.InputModule;
	import com.sitronnier.tests.shell.Shell;

	import flash.display.Sprite;
	import flash.events.Event;

	/**
	 * @author sitronnier.com aka laurent prodon
	 */
	 
	[SWF(frameRate="30", width="450", height="350")] 
	public class Main extends Sprite 
	{
		private var _shell : Shell;

		public function Main()
		{
			if (stage == null) addEventListener(Event.ADDED_TO_STAGE, _onAddedToStage);
			else _checkStageDimension();
		}
		
		
		// PROTECTED, PRIVATE
		//________________________________________________________________________________________________
		
		/**
		 * Stage is defined
		 */
		protected function _onAddedToStage(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, _onAddedToStage);
			_checkStageDimension();
		} 
		
		/**
		 * Check that Stage dimension are not null (Mac Firefox bug)
		 */
		protected function _checkStageDimension(event:Event = null):void
		{
			if (stage.stageWidth == 0 && stage.stageHeight == 0) 
			{
				if (event == null) addEventListener(Event.ENTER_FRAME, _checkStageDimension);
				return;
			}
			removeEventListener(Event.ENTER_FRAME, _checkStageDimension);
			_initApp();
		}
		
		/**
		 * Start application
		 */
		protected function _initApp():void
		{			
			// create the shell (which integrates all the modules)
			_shell = new Shell();			
			addChild(_shell);			
			_shell.startup();
			
			// create the input module (buttons) and start it up
			var inputModule:InputModule = new InputModule();
			_shell.addModule(inputModule);		
		}
	}
}
