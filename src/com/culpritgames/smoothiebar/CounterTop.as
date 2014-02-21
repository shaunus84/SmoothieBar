package com.culpritgames.smoothiebar {
	import com.culpritgames.smoothiebar.util.Util;

	import flash.display.DisplayObject;
	import flash.geom.Point;
	/**
	 * @author shaunmitchell
	 */
	public class CounterTop extends GameObject 
	{
		private static const _counterPoints:Vector.<Point> = new <Point>[new Point(70,100), new Point(435,272), new Point(93,434), new Point(460,612)];
		private var _counter:Counter = new Counter();
		private var _index:uint = 0;
		
		public function CounterTop(index:uint) 
		{
			_index = index;
			this.x = _counterPoints[index].x;
			this.y = _counterPoints[index].y;
			addChild(Util.imageFromVector(DisplayObject(_counter)));
		}

		public function get index() : uint 
		{
			return _index;
		}
	}
}
