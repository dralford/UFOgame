package
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.*;
	
	public class Rifle_Bullet_Hit extends MovieClip
	{
		private var _root:Object;
		
		private var rand:int = Math.floor(Math.random()*4);
		private var timer:int;
		
		public function Rifle_Bullet_Hit()
		{
			addEventListener(Event.ADDED_TO_STAGE, added);
			addEventListener(Event.ENTER_FRAME, eFrame);
		}
		private function added(event:Event):void
		{
			_root = MovieClip(root);
			
			if(rand == 0)
			{
				gotoAndPlay(1);
			}
			if(rand == 1)
			{
				gotoAndPlay(4);
			}
			if(rand == 2)
			{
				gotoAndPlay(7);
			}
			if(rand == 3)
			{
				gotoAndPlay(10);
			}
		}
		private function eFrame(event:Event):void
		{
			timer++;
			
			if(timer >= 4)
			{
				this.alpha -= .25;
			}
			if(timer >= 8)
			{
				this.parent.removeChild(this);
				this.removeEventListener(Event.ADDED_TO_STAGE, added);
				this.removeEventListener(Event.ENTER_FRAME, eFrame);
			}
		}
	}
}