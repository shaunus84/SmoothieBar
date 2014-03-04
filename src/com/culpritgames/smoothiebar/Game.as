package com.culpritgames.smoothiebar
{
	import starling.display.Sprite;

	import com.culpritgames.smoothiebar.state.StateFactory;
	import com.culpritgames.smoothiebar.state.StateMachine;

	/**
	 * @author shaunmitchell
	 */
	public class Game extends Sprite
	{
		public function Game()
		{
			StateMachine.getInstance().changeState(StateFactory.MAIN_MENU);
		}
	}
}
