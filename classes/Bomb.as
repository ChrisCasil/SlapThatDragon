package 
{
	import flash.utils.Timer;
	public class Bomb extends Projectile
	{
		public var crush:Crush = new Crush();
		public function Bomb(gameTimer:Timer,hand:Hand,dragon:Dragon,posX:int,posY:int,theAngle:Number,theSpeed:Number)
		{
			super(gameTimer,hand,dragon,posX,posY,theAngle,theSpeed);
			damage = 18;
		}
		protected override function playSound()
		{
			projChannel = crush.play();
		}
	}
}