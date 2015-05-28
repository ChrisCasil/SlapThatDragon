package
{
	import flash.events.Event;
	
	public class NavigationEvent extends Event
	{
		public static const MENU: String = "menu";
		public static const START: String = "start";
		public static const TUTORIAL: String = "tutorial";
		public static const INFO: String = "info";
		public static const BACK: String = "back";
		
		public function NavigationEvent(type: String)
		{
			super(type);
		}
	}
}