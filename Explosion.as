package
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.*;
	
	public class Explosion extends MovieClip
	{
		private var scale:Number = (Math.random()+.6)/2;
		private var timer:Number = 0;
		
		public function Explosion()
		{
			addEventListener(Event.ADDED, added);
			addEventListener(Event.ENTER_FRAME, eFrame);
		}
		private function added(event:Event):void
		{
			this.scaleX = scale;
			this.scaleY = scale;
		}
		private function eFrame(event:Event):void
		{
			timer++;
			
			if(timer >= 6)
			{
				this.alpha-=.2
			}
			
			if(timer >= 12)
			{
				removeEventListener(Event.ENTER_FRAME, eFrame);
				this.parent.removeChild(this);
			}
		}
	}
}