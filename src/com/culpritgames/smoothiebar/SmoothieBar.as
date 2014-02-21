package com.culpritgames.smoothiebar 
{
	import starling.core.Starling;

	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	
	[SWF(width='1024', height='768', backgroundColor='#000066', frameRate='60')]

	public class SmoothieBar extends Sprite 
	{
		private var _starling:Starling;
		
		public function SmoothieBar() 
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}

		private function onAddedToStage(event : Event) : void 
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			_starling = new Starling(Game, this.stage);
			_starling.start();
		}
	}
}
