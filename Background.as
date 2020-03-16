package
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.*;
	
	public class Background extends MovieClip
	{
		public function Background()
		{
			addEventListener(Event.ADDED_TO_STAGE, added);
			addEventListener(Event.ENTER_FRAME, eFrame);
		}
		private function added(event:Event):void
		{
			
		}
		private function eFrame(event:Event):void
		{

		}
	}
}