package 
{
	import flash.display.MovieClip;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.display.Sprite;

	public class HealthBar extends MovieClip
	{
		public var shownHealth:int = 0;
		public var healthBar:Sprite = new Sprite();

		public function HealthBar()
		{
			addChild(healthBar);
			healthBar.graphics.lineStyle(3,0x00ff00);
			healthBar.graphics.beginFill(0x0000FF);
			healthBar.graphics.drawRect(0,0,shownHealth,20);
			healthBar.graphics.endFill();
			healthBar.x = 450;
			healthBar.y = 550;
		}

		public function updateHealth(dragonHealth:int):void
		{
			if (dragonHealth > 100)
			{
				dragonHealth = 100;
			}

			if (shownHealth < dragonHealth && shownHealth < 100)
			{
				shownHealth++;
			}
			else if (shownHealth > dragonHealth && shownHealth > 0)
			{
				shownHealth--;
			}

			/*if (shownHealth <= 0 && counter > 100)
			{
				tickTimer.stop();
				var over:GameOverScreen = new GameOverScreen();
				over.x = 640;
				over.y = 360;
				addChild(over);
			}*/
			healthBar.graphics.drawRect(0,0,shownHealth,20);
		}
	}
}
/*public var healthArray:Array = new Array;
public var healthBar:HealthBar = new HealthBar();


private function updateHealth():void
{
if (shownHealth <= 0 && counter > 100)
{
tickTimer.stop();
var over:GameOverScreen = new GameOverScreen();
over.x = 640;
over.y = 360;
addChild(over);
}

if (shownHealth < actualHealth && shownHealth < 100)
{
healthBar = new HealthBar();

shownHealth++;
healthArray.push(healthBar);
addChild(healthBar);
healthBar.x = 525 + 2 * shownHealth;
healthBar.y = 550;
}
else if (shownHealth > actualHealth && shownHealth > 0)
{
shownHealth--;
healthBar = healthArray[shownHealth];

removeChild(healthBar);
healthBar = null;
healthArray.pop();
}
if (actualHealth > 100)
{
actualHealth = 100;
}
}
*/