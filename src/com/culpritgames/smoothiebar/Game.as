package com.culpritgames.smoothiebar {
	import starling.display.Sprite;

	import com.culpritgames.smoothiebar.util.Util;

	/**
	 * @author shaunmitchell
	 */
	public class Game extends Sprite 
	{
		private var menu:MenuScreen = new MenuScreen();
		
		public function Game() 
		{
			addChild(Util.imageFromVector(menu));
			for (var i : uint = 0; i < 4; i++) 
			{
				var counter:CounterTop = new CounterTop(i);
				addChild(counter);
			}
		}
	}
}
