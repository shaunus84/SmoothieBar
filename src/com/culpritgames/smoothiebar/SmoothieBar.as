package com.culpritgames.smoothiebar 
{
	import starling.core.Starling;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.geom.Rectangle;
	
	[SWF(width='1024', height='768', backgroundColor='#000066', frameRate='60')]

	public class SmoothieBar extends Sprite 
	{
		private var _starling:Starling;
		
		[Embed(source="/Users/shaunmitchell/Documents/culprit/SmoothieBar/bin/8Bit.ttf", embedAsCFF="false", fontFamily="8Bit")]
		private static const Arial:Class;
		
		public static var WIDTH:Number;
		public static var HEIGHT:Number;
		
		public function SmoothieBar() 
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}

		private function onAddedToStage(event : Event) : void 
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			_starling = new Starling(Game, this.stage, new Rectangle(0,0,this.stage.fullScreenWidth, this.stage.fullScreenHeight));
			_starling.start();
			_starling.stage.stageWidth = this.stage.fullScreenWidth;
			_starling.stage.stageHeight = this.stage.fullScreenHeight;
			WIDTH = this.stage.fullScreenWidth;
			HEIGHT = this.stage.fullScreenHeight;
			
			_starling.showStats = true;
		}
	}
}
