package
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.*;
	
	public class UFO_Health extends MovieClip
	{
		private var _root:Object;
		
		private var health:int = 100;
		
		public function UFO_Health()
		{
			addEventListener(Event.ENTER_FRAME, eFrame);
			addEventListener(Event.ADDED_TO_STAGE, added);
		}
		private function added(event:Event):void
		{
			_root = MovieClip(root);
		}
		private function eFrame(event:Event):void
		{
			if(health <= 60 && health >= 30)
			{
				_root.newUFO.gotoAndStop(2);
			}
			if(health <= 30 && health >= 15)
			{
				_root.newUFO.gotoAndStop(3);
			}
			if(health <= 15 && health >= 5)
			{
				_root.newUFO.gotoAndStop(4);
			}
			if(health <= 5)
			{
				_root.newUFO.gotoAndStop(5);
			}
		}
		public function UFO_HealthDown()
		{
			this.nextFrame();
			health--;
		}
	}
}