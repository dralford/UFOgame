package
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.*;
	
	public class Rifle_Bullet extends MovieClip
	{
		private var _root:Object;
		
		public function Rifle_Bullet()
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
			//bullet moves in direction shot
			this.x += 20*(Math.cos((this.rotation*Math.PI)/180));
			this.y += 20*(Math.sin((this.rotation*Math.PI)/180));
			
			//bullet is removed when it leaves frame
			if(this.x >= 850 || this.x <= -50 || this.y <= 0)
			{
				BulletRemoved();
			}
			
			//lowers UFO health when bullet hits UFO hitbox
			//and creates ricochet object at impact
			if(hitTestObject(_root.newUFO.Hitbox))
			{
				_root.newUFO_Health.UFO_HealthDown();
				BulletRemoved();
				
				var newBulletHit:Rifle_Bullet_Hit = new Rifle_Bullet_Hit;
				_root.BulletHitContainer.addChild(newBulletHit);
				
				var radians:Number = Math.PI*(Math.abs(this.rotation)/180)
				
				newBulletHit.x = this.x + 35*(Math.cos(radians));
				newBulletHit.y = _root.newUFO.y+_root.newUFO.Hitbox.y;
				newBulletHit.rotation = this.rotation;
			}
		}
		//bullet removal function
		//removes bullet and event listeners
		private function BulletRemoved()
		{
			this.parent.removeChild(this);
			removeEventListener(Event.ENTER_FRAME, eFrame);
			removeEventListener(Event.ADDED_TO_STAGE, added);
		}
	}
}