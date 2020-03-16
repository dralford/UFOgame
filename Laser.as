package
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.*
	
	public class Laser extends MovieClip
	{
		public var LaserTarget_Ground:MovieClip;
		private var HitTimer:Number = 0;
		
		private var PersonDeath:Person_Death;
		private var SoldierDeath:Soldier_Death;
		
		private var _root:Object;
		
		public var laserExists:Boolean;
		
		public function Laser()
		{
			addEventListener(Event.ENTER_FRAME, eFrame);
			addEventListener(Event.ADDED, added);
		}
		private function added(event:Event):void
		{
			_root = MovieClip(root);
		}
		private function eFrame(event:Event):void
		{
			//makes laser x position equal to mouse x position
			this.x = stage.mouseX;
						
			//creates Explosion when Laser hits the ground.
			if(hitTestObject(LaserTarget_Ground))
			{
				var newExplosion:Explosion = new Explosion;
				_root.ExplosionContainer.addChild(newExplosion);
				
				newExplosion.y = LaserTarget_Ground.y-0.5;
				newExplosion.x = (this.x-15)+(Math.random() * 30);
			}
			
			//takes away health from Person when Laser hits it
			//and kills Person after health reaches zero.
			for(var p:int = 0;p<_root.personContainer.numChildren;p++)
			{
				var LaserTarget_Person:MovieClip = _root.personContainer.getChildAt(p);
				
				if(hitTestObject(LaserTarget_Person))
				{
					LaserTarget_Person.personHealth -= 10;
					LaserTarget_Person.Person_HealthDown();
					if(LaserTarget_Person.personHealth <= 0)
					{
						_root.personContainer.removeChild(LaserTarget_Person);
						LaserTarget_Person.personDeleted();
						
						PersonDeath = new Person_Death;
						_root.personDeathContainer.addChild(PersonDeath);
						
						PersonDeath.x = LaserTarget_Person.x;
						PersonDeath.y = LaserTarget_Person.y+1;
						PersonDeath.PersonDeathRight = LaserTarget_Person.personRight;
					}
				}
			}
			
			//takes away health from Soldier when Laser hits it
			//and kills Soldier after health reaches zero.
			for(var s:int = 0;s<_root.soldierContainer.numChildren;s++)
			{
				var LaserTarget_Soldier:MovieClip = _root.soldierContainer.getChildAt(s);
				
				if(hitTestObject(LaserTarget_Soldier))
				{
					LaserTarget_Soldier.soldierHealth -= 10;
					LaserTarget_Soldier.Soldier_HealthDown();
					if(LaserTarget_Soldier.soldierHealth <= 0)
					{
						_root.soldierContainer.removeChild(LaserTarget_Soldier);
						LaserTarget_Soldier.soldierDeleted();
						
						SoldierDeath = new Soldier_Death;
						_root.soldierDeathContainer.addChild(SoldierDeath);
						
						SoldierDeath.x = LaserTarget_Soldier.x;
						SoldierDeath.y = LaserTarget_Soldier.y+1;
						SoldierDeath.SoldierDeathRight = LaserTarget_Soldier.soldierRight;
					}
				}
			}
		}
		public function laserDeleted():void
		{
			this.parent.removeChild(this);
			removeEventListener(Event.ENTER_FRAME, eFrame);
			laserExists = false;
		}
	}
}