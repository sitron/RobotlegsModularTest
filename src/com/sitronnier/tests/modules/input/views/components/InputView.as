package com.sitronnier.tests.modules.input.views.components 
{
	import flash.events.Event;
	import com.bit101.components.VBox;
	import flash.events.MouseEvent;
	import com.bit101.components.PushButton;
	import flash.display.Sprite;

	/**
	 * @author sitronnier.com aka laurent prodon
	 */
	public class InputView extends Sprite 
	{
		public static const RESET : String = "RESET";
		public static const ADD : String = "ADD";
		public static const ADD_CANVAS : String = "ADD_CANVAS";

		public function InputView()
		{
			init();
		}

		private function init() : void 
		{
			var vbox:VBox = new VBox(this, 10, 10);
			var addBt:PushButton = new PushButton(vbox, 0, 0, "Add Square", _onAddClick);
			var resetBt:PushButton = new PushButton(vbox, 0, 0, "Reset", _onResetClick);
			var addCanvasBt:PushButton = new PushButton(vbox, 0, 0, "Add Canvas", _onAddCanvasClick);
		}

		private function _onAddCanvasClick(event:MouseEvent) : void 
		{
			dispatchEvent(new Event(ADD_CANVAS));
		}

		private function _onResetClick(event:MouseEvent) : void 
		{
			dispatchEvent(new Event(RESET));
		}

		private function _onAddClick(event:MouseEvent) : void 
		{
			dispatchEvent(new Event(ADD));
		}
	}
}
