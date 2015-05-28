package 
{
	import flash.events.Event;

	public class CoinEvent extends Event
	{
		public static const HAND_CONTACT:String = "CONTACT";

		public function CoinEvent(type:String)
		{
			super(type, true);
		}
	}
}