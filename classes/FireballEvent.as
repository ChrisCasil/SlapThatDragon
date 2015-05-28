package 
{
	import flash.events.Event;
	
	public class FireballEvent extends Event
	{
		public static const FIREBALL_ADDED:String = "Sir, the dragon has breathed another fireball.";

		public function FireballEvent(type:String)
		{	
			super(type, true);
		}

	}

}