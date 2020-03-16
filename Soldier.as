package
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.*;
	
	public class Soldier extends MovieClip
	{
		public var soldierRight:Boolean;
		public var soldierHealth:Number = 200;
		
		private var newHealth:Soldier_Health;
		private var newHead:Soldier_Head;
		private var newRifle:Rifle;
		
		public var soldierSpeed:Number = Math.random()+1.5;
		
		private var _root:Object
		
		public function Soldier()
		{
			addEventListener(Event.ENTER_FRAME, eFrame);
			addEventListener(Event.ADDED_TO_STAGE, added);
		}
		private function added(event:Event):void
		{
			_root = MovieClip(root);
			
			//adds health bar
			newHealth = new Soldier_Health;
			addChild(newHealth);
			
			newHealth.x = this.x;
			newHealth.y = this.y-5;
			
			//adds soldier's head
			newHead = new Soldier_Head;
			addChild(newHead);
			
			newHead.x = this.x;
			newHead.y = this.y-9;
			
			//adds Rifle
			newRifle = new Rifle;
			addChild(newRifle);
			
			newRifle.x = this.x;
			newRifle.y = this.y-4;
		}
		private function eFrame(event:Event):void
		{
			newRifle.rifleRight = soldierRight;
			newHead.soldierHeadRight = soldierRight;
			
			if(soldierRight)
			{
				this.scaleX = 1;
				x+=soldierSpeed;
			}
			else
			{
				this.scaleX = -1;
				x-=soldierSpeed;
			}
			
			//removes Soldier if he goes off screen
			if(x > 850)
			{
				this.parent.removeChild(this);
				soldierDeleted();
			}
			if(x < -50)
			{
				this.parent.removeChild(this);
				soldierDeleted();
			}
		}
		public function soldierDeleted()
		{
			_root.soldierRemoved = true;
			newHead.soldierHeadDeleted();
			newRifle.rifleDeleted();
			removeChild(newHead);
			removeChild(newRifle);
			this.removeEventListener(Event.ENTER_FRAME, eFrame);
		}
		public function Soldier_HealthDown()
		{
			newHealth.play();
		}
	}
}