package 
{
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	import flash.media.SoundChannel;
	import flash.events.Event;

	public class MenuScreen extends MovieClip
	{
		//public var backgroundMusic:AllegroStrings = new AllegroStrings  ;
		//public var bgmSoundChannel:SoundChannel;
		public function MenuScreen()
		{
			startButton.addEventListener(MouseEvent.CLICK, onClickStart, false, 0, true);
			infoButton.addEventListener(MouseEvent.CLICK, onClickInfo, false, 0, true);
			tutorialButton.addEventListener(MouseEvent.CLICK, onClickTutorial, false, 0, true);
			//bgmSoundChannel = backgroundMusic.play();
			//bgmSoundChannel.addEventListener( Event.SOUND_COMPLETE, onBackgroundMusicFinished );
		}
		public function onClickStart(event: MouseEvent):void
		{
			//bgmSoundChannel.stop();
			dispatchEvent(new NavigationEvent(NavigationEvent.START));
		}

		public function onClickInfo(event: MouseEvent):void
		{
			//bgmSoundChannel.stop();
			dispatchEvent(new NavigationEvent(NavigationEvent.INFO));
		}

		public function onClickTutorial(event: MouseEvent):void
		{
			dispatchEvent(new NavigationEvent(NavigationEvent.TUTORIAL));
			//bgmSoundChannel.stop();
		}
		/*private function onBackgroundMusicFinished(e:Event)
		{
			bgmSoundChannel = backgroundMusic.play();
			bgmSoundChannel.addEventListener( Event.SOUND_COMPLETE, onBackgroundMusicFinished );
		}*/
	}
}