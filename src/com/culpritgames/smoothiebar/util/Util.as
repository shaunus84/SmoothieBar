package com.culpritgames.smoothiebar.util {
	import starling.display.Image;

	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	/**
	 * @author shaunmitchell
	 */
	public class Util 
	{
		public static function imageFromVector(clip : DisplayObject) : Image 
		{
			var bitmapDataForVector:BitmapData = new BitmapData(clip.width, clip.height, true, 0xff0000);
			bitmapDataForVector.draw(clip);
			var bitmapForVector:Bitmap = new Bitmap(bitmapDataForVector);
			
			var img:Image = Image.fromBitmap(bitmapForVector, true);
			
			bitmapDataForVector.dispose();
			
			return img;
		}
	}
}
