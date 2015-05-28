package
{
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	
	public class InfoScreen extends MovieClip
	{
		public function InfoScreen()
		{
			backButton.addEventListener(MouseEvent.CLICK, onClickBack, false, 0, true);
		}
		
		public function onClickBack(event: MouseEvent): void
		{
			dispatchEvent(new NavigationEvent(NavigationEvent.BACK));
		}
	}
}