package com.sitronnier.tests.modules.canvas.views.components 
{
	import com.sitronnier.tests.modules.canvas.models.vos.SquareVO;

	import flash.display.Sprite;

	/**
	 * @author sitronnier.com aka laurent prodon
	 */
	public class Square extends Sprite 
	{
		protected var _data:SquareVO;
		
		public function Square(vo:SquareVO = null)
		{
			if (vo != null)
			{
				data = vo;
			}
		}
		
		protected function _createSquare():void
		{		
			this.graphics.clear();	
			this.graphics.beginFill(_data.color, _data.alpha);
			this.graphics.drawRect(0, 0, _data.dimension, _data.dimension);
			this.graphics.endFill();
		}
		
		public function get id():int
		{
			return _data.id;
		} 

		public function get data() : SquareVO
		{
			return _data;
		}
		
		public function set data(data : SquareVO) : void
		{
			_data = data;
			_createSquare();
			this.buttonMode = true;
		}
	}
}
