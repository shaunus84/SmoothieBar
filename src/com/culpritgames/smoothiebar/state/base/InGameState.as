package com.culpritgames.smoothiebar.state.base
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.text.TextField;

	import com.culpritgames.smoothiebar.state.IState;
	import com.culpritgames.smoothiebar.state.State;
	import com.culpritgames.smoothiebar.state.StateFactory;
	import com.culpritgames.smoothiebar.state.StateMachine;
	import com.culpritgames.smoothiebar.util.Util;

	/**
	 * @author shaunmitchell
	 */
	public class InGameState extends State implements IState
	{
		private var _shopBackground : ShopBackground = new ShopBackground();
		private var _counter : Sprite;
		private var _smoothieBack : Sprite;
		private var _appleButton : Sprite;
		private var _bananaButton : Sprite;
		private var _orangeButton : Sprite;
		private var _appleText : TextField;
		private var _bananaText : TextField;
		private var _orangeText : TextField;
		private var _numApples : int = 0;
		private var _numBananas : int = 0;
		private var _numOranges : int = 0;

		public function InGameState()
		{
		}

		public override function onEnter() : Boolean
		{
			super.onEnter();

			var counter : Image = Util.imageFromVector(_shopBackground.counter);
			_counter = new Sprite();
			_counter.addChild(counter);
			_counter.x = _shopBackground.counter.x;
			_counter.y = _shopBackground.counter.y;
			_shopBackground.removeChild(_shopBackground.counter);

			var background : Image = Util.imageFromVector(_shopBackground);
			addChild(background);

			var player : Player = new Player();
			var playerHolder : Sprite = new Sprite();
			playerHolder.addChild(Util.imageFromVector(player));
			playerHolder.x = 300;
			playerHolder.y = 300;
			addChild(playerHolder);

			addChild(_counter);

			createButtons();

			return true;
		}

		private function createButtons() : void
		{
			var smoothie : SmoothieCreator = new SmoothieCreator();
			var apple : Image = Util.imageFromVector(smoothie.apple);
			_appleButton = new Sprite();
			_appleButton.addChild(apple);
			_appleButton.x = smoothie.apple.x;
			_appleButton.y = smoothie.apple.y;
			smoothie.removeChild(smoothie.apple);

			var orange : Image = Util.imageFromVector(smoothie.orange);
			_orangeButton = new Sprite();
			_orangeButton.addChild(orange);
			_orangeButton.x = smoothie.orange.x;
			_orangeButton.y = smoothie.orange.y;
			smoothie.removeChild(smoothie.orange);

			var banana : Image = Util.imageFromVector(smoothie.banana);
			_bananaButton = new Sprite();
			_bananaButton.addChild(banana);
			_bananaButton.x = smoothie.banana.x;
			_bananaButton.y = smoothie.banana.y;
			smoothie.removeChild(smoothie.banana);

			_smoothieBack = new Sprite();
			_smoothieBack.x = 632;
			_smoothieBack.y = 118;
			addChild(_smoothieBack);

			_appleButton.x += _smoothieBack.x;
			_orangeButton.x += _smoothieBack.x;
			_bananaButton.x += _smoothieBack.x;
			_appleButton.y += _smoothieBack.y;
			_orangeButton.y += _smoothieBack.y;
			_bananaButton.y += _smoothieBack.y;

			addChild(_appleButton);
			addChild(_orangeButton);
			addChild(_bananaButton);

			_appleText = new TextField(smoothie.appleText.width, smoothie.appleText.height, "x " + _numApples, "8bit", 25, 0xffffff);
			_bananaText = new TextField(smoothie.bananaText.width, smoothie.bananaText.height, "x " + _numBananas, "8Bit", 25, 0xffffff);
			_orangeText = new TextField(smoothie.orangeText.width, smoothie.orangeText.height, "x " + _numOranges, "8Bit", 25, 0xffffff);
			_appleText.x += smoothie.appleText.x;
			_bananaText.x += smoothie.bananaText.x;
			_orangeText.x += smoothie.orangeText.x;
			_appleText.y += smoothie.appleText.y;
			_bananaText.y += smoothie.bananaText.y;
			_orangeText.y += smoothie.orangeText.y;

			smoothie.removeChild(smoothie.appleText);
			smoothie.removeChild(smoothie.bananaText);
			smoothie.removeChild(smoothie.orangeText);

			_appleText.x += _smoothieBack.x;
			_bananaText.x += _smoothieBack.x;
			_orangeText.x += _smoothieBack.x;
			_appleText.y += _smoothieBack.y;
			_bananaText.y += _smoothieBack.y;
			_orangeText.y += _smoothieBack.y;

			_smoothieBack.addChild(Util.imageFromVector(smoothie));

			addChild(_appleText);
			addChild(_bananaText);
			addChild(_orangeText);

			_appleButton.addEventListener(TouchEvent.TOUCH, appleClicked);
			_orangeButton.addEventListener(TouchEvent.TOUCH, orangeClicked);
			_bananaButton.addEventListener(TouchEvent.TOUCH, bananaClicked);

			// 632 118
		}

		private function bananaClicked(event : TouchEvent) : void
		{
			var touch : Touch = event.getTouch(_bananaButton, TouchPhase.ENDED);

			if (touch)
			{
				_numBananas++;
				_bananaText.text = "x " + _numBananas;
			}
		}

		private function orangeClicked(event : TouchEvent) : void
		{
			var touch : Touch = event.getTouch(_orangeButton, TouchPhase.ENDED);

			if (touch)
			{
				_numOranges++;
				_orangeText.text = "x " + _numOranges;
			}
		}

		private function appleClicked(event : TouchEvent) : void
		{
			var touch : Touch = event.getTouch(_appleButton, TouchPhase.ENDED);

			if (touch)
			{
				_numApples++;
				_appleText.text = "x " + _numApples;
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
			return StateFactory.IN_GAME;
		}

		public override function get isSubState() : Boolean
		{
			return false;
		}

		public override function destroy() : void
		{
			removeChildren(0, numChildren, true);
		}

		public override function get typeAsString() : String
		{
			return "IN GAME STATE";
		}

		public override function run(e : Event) : void
		{
			if (_isRunning)
			{
			}
		}
	}
}
