package 
{

	import flash.display.MovieClip;


	public class PauseScreen extends MovieClip
	{
		var bigFireballPurchased:BigFireballPurchased = new BigFireballPurchased();
		var dragonBreathPurchased:DragonBreathPurchased = new DragonBreathPurchased();
		var dragonRoarPurchased:DragonRoarPurchased = new DragonRoarPurchased();



		public function PauseScreen()
		{

		}

		public function addBigFireballPurchased()
		{
			addChild(bigFireballPurchased);
			bigFireballPurchased.x = bigFireballButton.x;
			bigFireballPurchased.y = bigFireballButton.y;				
			removeChild(bigFireballButton);
			bigFireballButton = null;
		}
		
		public function addDragonBreathPurchased()
		{
			addChild(dragonBreathPurchased);
			dragonBreathPurchased.x = dragonBreathButton.x;
			dragonBreathPurchased.y = dragonBreathButton.y;				
			removeChild(dragonBreathButton);
			dragonBreathButton = null;
		}
		
		public function addDragonRoarPurchased()
		{
			addChild(dragonRoarPurchased);
			dragonRoarPurchased.x = dragonRoarButton.x;
			dragonRoarPurchased.y = dragonRoarButton.y;		
			removeChild(dragonRoarButton);
			dragonRoarButton = null;
		}
	}

}