package com.culpritgames.smoothiebar.state
{
	import starling.events.Event;

	/**
	 * @author shaunmitchell
	 */
	public interface IState
	{
		/*
		 * Both of these values will be preset when the state is defined
		 */
		function get type() : int;

		function get isSubState() : Boolean;

		function get typeAsString() : String;

		function run(e : Event) : void;

		// -----------------------
		function onEnter() : Boolean;

		function onExit() : Boolean;

		function onPause() : void;

		function get paused() : Boolean;

		function onResume() : void;

		function set running(isRunning : Boolean) : void;

		function destroy() : void;
	}
}
