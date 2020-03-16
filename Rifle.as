package
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.*;
	
	public class Rifle extends MovieClip
	{
		private var _root:Object;
		
		public var rifleRight:Boolean;
		
		private var shootTimer:int = Math.random()*90;
		private var BurstTimer:int = 0;
		private var newBullet:Rifle_Bullet;
		private var newFlash:Rifle_Bullet_Flash;

		private var randomPoint:Number = Math.random()*90;
		
		public function Rifle()
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
			//rotates rifle to point at UFO
			var radians:Number = Math.atan2(75-this.parent.y, (stage.mouseX-this.parent.x-45)+randomPoint);
			var degrees:Number = (radians/Math.PI)*180;
			
			//determines rotation if rifle is pointed left or right
			if(rifleRight)
			{
				this.rotation = degrees;
			}
			else
			{
				this.rotation = -(180+degrees);
			}
			
			if(rifleRight && stage.mouseX >= this.parent.x)
			{
				this.scaleY = 1;
			}
			if(rifleRight && stage.mouseX <= this.parent.x)
			{
				this.scaleY = -1;
			}
			
			if(rifleRight == false && stage.mouseX <= this.parent.x)
			{
				this.scaleY = 1;
			}
			if(rifleRight == false && stage.mouseX >= this.parent.x)
			{
				this.scaleY = -1;
			}
			
			shootTimer++;
			
			//shoots bullet every 90 frames
			if(shootTimer >= 90)
			{
				BurstTimer++;
				
				//shoots burst (three bullets in a row)
				if(BurstTimer == 4 || BurstTimer == 8 || BurstTimer == 12)
				{
					newBullet = new Rifle_Bullet;
					_root.BulletContainer.addChild(newBullet);
					
					newBullet.x = this.parent.x;
					newBullet.y = this.parent.y-6;
					
					newFlash = new Rifle_Bullet_Flash;
					_root.BulletFlashContainer.addChild(newFlash);
					
					newFlash.x = this.parent.x;
					newFlash.y = this.parent.y-4;
					
					if(rifleRight)
					{
						newBullet.rotation = this.rotation;
						newFlash.rotation = this.rotation;
						newFlash.scaleY  = this.scaleY;
						newFlash.flashSpeed = _root.newSoldier.soldierSpeed;
					}
					else
					{
						newBullet.rotation = -(180+this.rotation);
						newFlash.rotation = -(180+this.rotation);
						newFlash.scaleY  = -this.scaleY;
						newFlash.flashSpeed = -_root.newSoldier.soldierSpeed;
					}
				}
				if(BurstTimer >= 12)
				{
					BurstTimer = 0;
				}
				if(shootTimer > 100)
				{
					shootTimer = Math.random()*30;
					randomPoint = Math.random()*100;
				}
			}
		}
		public function rifleDeleted()
		{
			removeEventListener(Event.ENTER_FRAME, eFrame);
		}
	}
}