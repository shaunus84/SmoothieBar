package com.culpritgames.smoothiebar.state {
	import com.culpritgames.smoothiebar.SmoothieBar;
	import flash.system.Capabilities;

	import starling.display.DisplayObject;
	import starling.core.Starling;

	/**
	 * @author shaunmitchell
	 */
	public class StateMachine {
		/* 2 states at any one time in this game - a main base state - GAME/MENU etc.
		 * and a sub state smoothie making state, shop closed state etc.
		 * enforce this with a vector of fixed size of 2
		 */
		private var _gameStates : Vector.<IState> = new Vector.<IState>(2, true);
		private static const BASE_STATE : uint = 0;
		private static const SUB_STATE : uint = 1;
		private static var _instance : StateMachine;

		public function StateMachine() : void {
		}

		public static function getInstance() : StateMachine {
			if (!_instance) {
				_instance = new StateMachine();
			}

			return _instance;
		}

		/*
		 * Change state will change the base state only, never the sub states
		 */
		public function changeState(stateType : int) : void {
			if (StateFactory.BASE_STATES.indexOf(stateType) >= 0) {
				if (_gameStates) {
					if (_gameStates[BASE_STATE]) {
						if (_gameStates[BASE_STATE].onExit()) {
							_gameStates[BASE_STATE].running = false;
							_gameStates[BASE_STATE].destroy();
							Starling.current.stage.removeChild(DisplayObject(_gameStates[BASE_STATE]));
							_gameStates[BASE_STATE] = null;

							_gameStates[BASE_STATE] = StateFactory.createState(stateType);

							if (_gameStates[BASE_STATE].onEnter()) {
								_gameStates[BASE_STATE].running = true;
								Starling.current.stage.addChild(DisplayObject(_gameStates[BASE_STATE]));
								DisplayObject(_gameStates[BASE_STATE]).scaleX = SmoothieBar.WIDTH / 1024;
								DisplayObject(_gameStates[BASE_STATE]).scaleY = SmoothieBar.HEIGHT / 768;
							}
						}
					} else {
						_gameStates[BASE_STATE] = StateFactory.createState(stateType);

						if (_gameStates[BASE_STATE].onEnter()) {
							_gameStates[BASE_STATE].running = true;
							Starling.current.stage.addChild(DisplayObject(_gameStates[BASE_STATE]));
							DisplayObject(_gameStates[BASE_STATE]).scaleX = SmoothieBar.WIDTH / 1024;
							DisplayObject(_gameStates[BASE_STATE]).scaleY = SmoothieBar.HEIGHT / 768;
						}
					}
				}
			}
		}

		/*
		 * Push on a sub state 
		 */
		public function pushState(stateType : int) : void {
			if (StateFactory.SUB_STATES.indexOf(stateType) >= 0) {
				if (_gameStates) {
					if (_gameStates[BASE_STATE]) {
						_gameStates[SUB_STATE] = StateFactory.createState(stateType);

						if (ISubState(_gameStates[SUB_STATE]).pausesBaseState) {
							_gameStates[BASE_STATE].onPause();
						}

						if (_gameStates[SUB_STATE].onEnter()) {
							_gameStates[SUB_STATE].running = true;
							Starling.current.stage.addChild(DisplayObject(_gameStates[SUB_STATE]));
						}
					}
				}
			}
		}

		/*
		 * Pop off the sub state
		 */
		public function popState() : void {
			if (_gameStates) {
				if (_gameStates[SUB_STATE]) {
					if (_gameStates[SUB_STATE].onExit()) {
						_gameStates[SUB_STATE].running = false;
						_gameStates[SUB_STATE].destroy();
						Starling.current.stage.removeChild(DisplayObject(_gameStates[SUB_STATE]));
						_gameStates[SUB_STATE] = null;
					}

					if (_gameStates[BASE_STATE].paused) {
						_gameStates[BASE_STATE].onResume();
					}
				}
			}
		}
	}
}
