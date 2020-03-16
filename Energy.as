package
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.*;
	
	public class Energy extends MovieClip
	{
		public var EnergyTarget:Object;
		private var scale:Number = Math.random();
		private var timer:Number = 10;
		
		private var radians:Number;
		
		private var Xspeed:Number;
		private var Yspeed:Number;
		
		public function Energy()
		{
			addEventListener(Event.ADDED, beginClass);
			addEventListener(Event.ENTER_FRAME, eFrame);
		}
		private function beginClass(event:Event):void
		{
			if(scale <= .5)
			{
				scale += .5
			}
			
			this.scaleX = scale;
			this.scaleY = scale;
		}
		private function eFrame(event:Event):void
		{
			Xspeed = (EnergyTarget.x-x)/5;
			Yspeed = ((EnergyTarget.y-y)/5)+1.5;
			
			timer -= 1;
			
			if(timer <= 0)
			{
				removeEventListener(Event.ENTER_FRAME, eFrame);
				this.parent.removeChild(this);
			}
			
			this.x += Xspeed;
			this.y += Yspeed;
		}
	}
}