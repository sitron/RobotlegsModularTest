package com.sitronnier.tests.shell.views.components 
{
	import com.sitronnier.tests.modules.canvas.CanvasModule;

	import org.robotlegs.utilities.modular.mvcs.ModuleContextView;

	import flash.display.Sprite;

	/**
	 * @author sitronnier.com aka laurent prodon
	 */
	public class Container extends Sprite 
	{
		protected var _canvasOnStage:Array = [];
		
		public function Container()
		{
		}

		public function addCanvas(canvas:ModuleContextView) : void 
		{			
			addChild(canvas);
			canvas.scaleX = canvas.scaleY = .5;
			canvas.x = ((_canvasOnStage.length) % 2) * (stage.stageWidth / 2);
			canvas.y = Math.floor((_canvasOnStage.length) / 2) * (stage.stageHeight / 2);
			_canvasOnStage.push(canvas);
		}
		
		public function removeAllCanvas():void
		{
			var nb:int = _canvasOnStage.length;
			for (var i:int=0; i<nb; i++)
			{
				var canvas:CanvasModule = _canvasOnStage.pop() as CanvasModule;
				canvas.dispose();	
				removeChild(canvas);
				canvas = null;	
			}
		} 
	}
}
