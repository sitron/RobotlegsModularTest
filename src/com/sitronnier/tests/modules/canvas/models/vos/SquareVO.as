package com.sitronnier.tests.modules.canvas.models.vos 
{

	/**
	 * @author sitronnier.com aka laurent prodon
	 */
	public class SquareVO 
	{
		public var dimension:int = Math.round((Math.random() * 140) + 20);
		public var color:int = Math.round(Math.random() * 0xffffff);
		public var alpha:Number = (Math.random() * .7) + .3;
		public var id : int;

		public function SquareVO(o:Object = null) 
		{
			if (o != null && !isNaN(o.id))
			{
				id = o.id;
			}
		}
	}
}
