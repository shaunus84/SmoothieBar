package com.culpritgames.smoothiebar.state
{
	import com.culpritgames.smoothiebar.state.base.InGameState;
	import com.culpritgames.smoothiebar.state.base.MainMenuState;

	/**
	 * @author shaunmitchell
	 */
	public class StateFactory
	{
		// set of consts for state IDS
		public static const MAIN_MENU : int = 0;
		public static const IN_GAME : int = 1;
		// used to ensure that a sub state is never used as a base state in change state
		public static const BASE_STATES : Vector.<int> = new <int>[MAIN_MENU, IN_GAME];
		public static const SUB_STATES : Vector.<int> = new <int>[];

		public static function createState(type : int) : IState
		{
			switch(type)
			{
				case MAIN_MENU:
					return new MainMenuState();
				case IN_GAME:
					return new InGameState();
				default:
					return null;
			}
		}
	}
}
