package
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.*;
	
	public class UFOclass extends MovieClip
	{
		public var UFOx:Number;
		
		public function UFOclass()
		{
			addEventListener(Event.ENTER_FRAME, eFrame);
		}
		private function eFrame(event:Event):void
		{
			//makes UFO x position equal to mouse x position
			x = stage.mouseX
		}
	}
}