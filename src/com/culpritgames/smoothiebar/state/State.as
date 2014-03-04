package com.culpritgames.smoothiebar.state
{
	import starling.display.Sprite;
	import starling.events.Event;

	/**
	 * @author shaunmitchell
	 */
	public class State extends Sprite implements IState
	{
		protected var _isRunning : Boolean = false;
		protected var _paused : Boolean = false;

		public function State()
		{
		}

		public function onEnter() : Boolean
		{
			trace("entering " + typeAsString);
			//addEventListener(Event.ENTER_FRAME, run);
			return null;
		}

		public function onExit() : Boolean
		{
			trace("exiting " + typeAsString);
			//removeEventListener(Event.ENTER_FRAME, run);
			return null;
		}

		public function onPause() : void
		{
			trace("pausing " + typeAsString);
			_paused = true;
		}

		public function onResume() : void
		{
			trace("resuming " + typeAsString);
			_paused = false;
		}

		public function destroy() : void
		{
		}

		public function get type() : int
		{
			return -1;
			// never create a state of this type
		}

		public function get isSubState() : Boolean
		{
			return null;
		}

		public function set running(isRunning : Boolean) : void
		{
			_isRunning = isRunning;
		}

		public function get typeAsString() : String
		{
			return "";
		}

		public function get paused() : Boolean
		{
			return _paused;
		}

		public function run(e : Event) : void
		{
		}
	}
}
