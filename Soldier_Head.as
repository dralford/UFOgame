package
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.*;
	
	public class Soldier_Head extends MovieClip
	{
		public var soldierHeadRight:Boolean;
		
		public function Soldier_Head()
		{
			addEventListener(Event.ENTER_FRAME, eFrame);
		}
		private function eFrame(event:Event):void
		{
			var radians:Number = Math.atan2(100-this.parent.y, stage.mouseX-this.parent.x);
			var degrees:Number = (radians/Math.PI)*180;
			
			if(soldierHeadRight)
			{
				this.rotation = degrees;
			}
			else
			{
				this.rotation = -(180+degrees);
			}
			
			if(soldierHeadRight && stage.mouseX >= this.parent.x)
			{
				this.scaleY = 1;
			}
			if(soldierHeadRight && stage.mouseX <= this.parent.x)
			{
				this.scaleY = -1;
			}
			
			if(soldierHeadRight == false && stage.mouseX <= this.parent.x)
			{
				this.scaleY = 1;
			}
			if(soldierHeadRight == false && stage.mouseX >= this.parent.x)
			{
				this.scaleY = -1;
			}
		}
		public function soldierHeadDeleted()
		{
			removeEventListener(Event.ENTER_FRAME, eFrame);
		}
	}
}