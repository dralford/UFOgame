package
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.*;
	
	public class Soldier_Death extends MovieClip
	{
		public var SoldierDeathRight:Boolean;
		private var timer:int = 0;
		private var timer2:int = 0;
		
		public function Soldier_Death()
		{
			addEventListener(Event.ENTER_FRAME, eFrame);
		}
		private function eFrame(event:Event):void
		{
			if(SoldierDeathRight)
			{
				this.scaleX = 1;
			}
			else
			{
				this.scaleX = -1;
			}
			
			timer++;
			if(timer >= 60)
			{
				timer2++;
				if(timer2 >= 4)
				{
					this.alpha -= 0.04;
					timer2 = 0;
				}
			}
			
			if(this.alpha <= 0)
			{
				this.parent.removeChild(this);
				removeEventListener(Event.ENTER_FRAME, eFrame);
			}
		}
	}
}