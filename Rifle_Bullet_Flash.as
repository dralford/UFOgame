package
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.*;
	
	public class Rifle_Bullet_Flash extends MovieClip
	{
		private var _root:Object;
		
		private var timer:int = 0;
		
		public var flashSpeed:Number;
		public var flashRight:Boolean;
		
		private var rand:int = Math.floor(Math.random()*4);
		
		public function Rifle_Bullet_Flash()
		{
			addEventListener(Event.ENTER_FRAME, eFrame);
			addEventListener(Event.ADDED_TO_STAGE, added);
		}
		private function added(event:Event):void
		{
			_root = MovieClip(root);
			
			//randomizes flash animation (1 of 4)
			if(rand == 0)
			{
				gotoAndPlay(1);
			}
			if(rand == 1)
			{
				gotoAndPlay(5);
			}
			if(rand == 2)
			{
				gotoAndPlay(9);
			}
			if(rand == 3)
			{
				gotoAndPlay(13);
			}
		}
		private function eFrame(event:Event):void
		{
		 	timer++;
			
			//decreases opacity then deletes object
			if(timer >= 4)
			{
				this.alpha -= .2;
			}
			if(timer >= 10)
			{
				this.parent.removeChild(this);
				removeEventListener(Event.ENTER_FRAME, eFrame);
				removeEventListener(Event.ADDED_TO_STAGE, added);
			}
			
			//moves along with rifle
			this.x += flashSpeed;
		}
	}
}