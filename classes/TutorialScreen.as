package 
{
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	import flash.events.Event;

	public class TutorialScreen extends MovieClip
	{
		public function TutorialScreen()
		{
			backButton.addEventListener(MouseEvent.CLICK, onClickBack);
			leftArrow.addEventListener(MouseEvent.CLICK, goBackward);			
			rightArrow.addEventListener(MouseEvent.CLICK, goForward);
			gotoAndStop(1);
		}

		public function onClickBack(event: MouseEvent):void
		{
			dispatchEvent(new NavigationEvent(NavigationEvent.BACK));
		}

		public function goForward(event: MouseEvent):void
		{
			if (currentFrame < totalFrames)
			{
				gotoAndStop(currentFrame + 1);
			}		
		}

		public function goBackward(event: MouseEvent):void
		{

			if (currentFrame > 1)
			{
				gotoAndStop(currentFrame - 1);
			}
		}
	}
}