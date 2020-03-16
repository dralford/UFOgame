package
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.*;
	
	public class Person extends MovieClip
	{
		public var personRight:Boolean;
		public var personHealth:Number = 100;
		
		private var newHealth:Person_Health;
		
		private var speed:Number = (Math.random()*2.5)+3;
		
		private var _root:Object
		
		public function Person()
		{
			addEventListener(Event.ENTER_FRAME, eFrame);
			addEventListener(Event.ADDED_TO_STAGE, added);
		}
		private function added(event:Event):void
		{
			_root = MovieClip(root);
			
			newHealth = new Person_Health;
			addChild(newHealth);
			
			newHealth.x = this.x;
			newHealth.y = this.y-5;
		}
		private function eFrame(event:Event):void
		{
			if(personRight)
			{
				this.scaleX = 1;
				x+=speed;
			}
			else
			{
				this.scaleX = -1;
				x-=speed;
			}
			
			if(x > 850)
			{
				this.parent.removeChild(this);
				personDeleted();
			}
			if(x < -50)
			{
				this.parent.removeChild(this);
				personDeleted();
			}
		}
		public function personDeleted()
		{
			_root.personRemoved = true;
			this.removeEventListener(Event.ENTER_FRAME, eFrame);
		}
		public function Person_HealthDown()
		{
			newHealth.play();
		}
	}
}