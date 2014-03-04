package com.culpritgames.smoothiebar.state.base
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;

	import com.culpritgames.smoothiebar.state.IState;
	import com.culpritgames.smoothiebar.state.State;
	import com.culpritgames.smoothiebar.state.StateFactory;
	import com.culpritgames.smoothiebar.state.StateMachine;
	import com.culpritgames.smoothiebar.util.Util;

	/**
	 * @author shaunmitchell
	 */
	public class MainMenuState extends State implements IState
	{
		private var menuScreen : MenuScreen = new MenuScreen();
		private var playButton : Sprite;

		public function MainMenuState()
		{
			createButtons();
		}

		private function createButtons() : void
		{
			var button : Image = Util.imageFromVector(menuScreen.playButton);
			playButton = new Sprite();
			playButton.addChild(button);
			playButton.x = menuScreen.playButton.x;
			playButton.y = menuScreen.playButton.y;
			menuScreen.removeChild(menuScreen.playButton);
		}

		public override function onEnter() : Boolean
		{
			super.onEnter();

			addChild(Util.imageFromVector(menuScreen));
			addChild(playButton);

			playButton.addEventListener(TouchEvent.TOUCH, clickedButton);

			return true;
		}

		private function clickedButton(event : TouchEvent) : void
		{
			var touch : Touch = event.getTouch(playButton, TouchPhase.ENDED);
			if (touch)
			{
				StateMachine.getInstance().changeState(StateFactory.IN_GAME);
			}
		}

		public override function onExit() : Boolean
		{
			super.onExit();
			return true;
		}

		public override function onPause() : void
		{
			super.onPause();
		}

		public override function onResume() : void
		{
		}

		public override function get type() : int
		{
			return StateFactory.MAIN_MENU;
		}

		public override function get isSubState() : Boolean
		{
			return false;
		}

		public override function destroy() : void
		{
			removeChildren(0, numChildren, true);
			playButton = null;
			menuScreen = null;
		}

		public override function get typeAsString() : String
		{
			return "MAIN MENU STATE";
		}

		public override function run(e : Event) : void
		{
			if (_isRunning)
			{
			}
		}
	}
}
