package 
{
	import flash.display.MovieClip;
	import flash.utils.Timer;
	import flash.events.*;
	import flash.media.SoundChannel;

	public class DocumentClass extends MovieClip
	{
		public var menuScreen:MenuScreen;
		public var gameScreen:MLDMain;
		public var transitionScreen:TransitionScreen;
		public var gameOverScreen:GameOverScreen;
		public var infoScreen:InfoScreen;
		public var tutorialScreen:TutorialScreen;
		public var smackThatDragon:SmackThatDragon = new SmackThatDragon();
		public var myLittleDragon:MyLittleDragon = new MyLittleDragon();
		public var sFXChannel:SoundChannel;
		public var bgmSoundChannel:SoundChannel;
		public var backgroundMusic:AllegroStrings = new AllegroStrings  ;
		public var backgroundMusic2:TheComing = new TheComing  ;
		
		public var timeAlive:int;
		public var totalGold:int;

		public function DocumentClass()
		{
			if(parent)
			stage.stageFocusRect = false;

			menuScreen = new MenuScreen();
			menuScreen.addEventListener(NavigationEvent.START, onRequestStart, false, 0, true);
			menuScreen.addEventListener(NavigationEvent.INFO, onRequestInfo, false, 0, true);
			menuScreen.addEventListener(NavigationEvent.TUTORIAL, onRequestTutorial, false, 0, true);
			menuScreen.x = 0;
			menuScreen.y = 0;
			addChild(menuScreen);

			bgmSoundChannel = backgroundMusic.play();
			bgmSoundChannel.addEventListener( Event.SOUND_COMPLETE, onBackgroundMusicFinished );
		}

		public function onDragonDeath(dragondeathEvent: AvatarEvent):void
		{
			bgmSoundChannel.stop();			
			gameScreen.hand.holding = false;
			gameScreen.gameTimer.stop();
			gameScreen.stopWatch.stop();
			totalGold = gameScreen.totalGold;
			timeAlive = gameScreen.timeAlive;
			
			removeChild(gameScreen);
			gameScreen = null;
			gameOverScreen = new GameOverScreen();
			gameOverScreen.addEventListener(NavigationEvent.MENU, onRequestMenu);
			gameOverScreen.x = 0;
			gameOverScreen.y = 0;
			addChild(gameOverScreen);
			gameOverScreen.setFinalScore(totalGold,timeAlive);

			stage.focus = gameOverScreen;
		}

		public function onRequestStart(navigationEvent: NavigationEvent):void
		{
			removeChild(menuScreen);
			menuScreen = null;
			
			transitionScreen = new TransitionScreen();
			addChild(transitionScreen);
			stage.focus = transitionScreen;
			bgmSoundChannel.stop();
			if (Math.random() < .5)
			{
				sFXChannel = smackThatDragon.play();
			}
			else
			{
				sFXChannel = myLittleDragon.play();
			}
			sFXChannel.addEventListener(Event.SOUND_COMPLETE, setUpGameScreen);
		}
		private function setUpGameScreen(e:Event):void
		{
			removeChild(transitionScreen);
			transitionScreen = null;
			
			gameScreen = new MLDMain();
			gameScreen.addEventListener(AvatarEvent.DEAD, onDragonDeath);
			addChild(gameScreen);
			stage.focus = gameScreen;

			bgmSoundChannel = backgroundMusic2.play();
			bgmSoundChannel.addEventListener( Event.SOUND_COMPLETE, onBackgroundMusic2Finished );
		}

		public function onRequestMenu(navigationEvent: NavigationEvent):void
		{
			removeChild(gameOverScreen);
			gameOverScreen = null;
			gotoMenuScreen();
			bgmSoundChannel = backgroundMusic.play();
			bgmSoundChannel.addEventListener( Event.SOUND_COMPLETE, onBackgroundMusicFinished );
		}

		public function gotoMenuScreen():void
		{
			menuScreen = new MenuScreen();
			menuScreen.addEventListener(NavigationEvent.START, onRequestStart, false, 0, true);
			menuScreen.addEventListener(NavigationEvent.INFO, onRequestInfo, false, 0, true);
			menuScreen.addEventListener(NavigationEvent.TUTORIAL, onRequestTutorial, false, 0, true);
			menuScreen.x = 0;
			menuScreen.y = 0;
			addChild(menuScreen);

			stage.focus = menuScreen;
		}

		public function onRequestInfo(navigationEvent: NavigationEvent):void
		{
			infoScreen = new InfoScreen();
			infoScreen.addEventListener(NavigationEvent.BACK, onRequestBackFromInfo, false, 0, true);
			infoScreen.x = 0;
			infoScreen.y = 0;
			addChild(infoScreen);

			removeChild(menuScreen);
			menuScreen = null;

			stage.focus = infoScreen;
		}

		public function onRequestTutorial(navigationEvent: NavigationEvent):void
		{
			tutorialScreen = new TutorialScreen();
			tutorialScreen.addEventListener(NavigationEvent.BACK, onRequestBackFromTut, false, 0, true);
			tutorialScreen.x = 0;
			tutorialScreen.y = 0;
			addChild(tutorialScreen);

			removeChild(menuScreen);
			menuScreen = null;

			stage.focus = tutorialScreen;
		}

		public function onRequestBackFromInfo(navigationEvent: NavigationEvent):void
		{
			gotoMenuScreen();

			removeChild(infoScreen);
			infoScreen = null;
		}

		public function onRequestBackFromTut(navigationEvent: NavigationEvent):void
		{
			gotoMenuScreen();

			removeChild(tutorialScreen);
			tutorialScreen = null;
		}

		private function onBackgroundMusicFinished(e:Event)
		{
			bgmSoundChannel = backgroundMusic.play();
			bgmSoundChannel.addEventListener( Event.SOUND_COMPLETE, onBackgroundMusicFinished );
		}
		private function onBackgroundMusic2Finished(e:Event)
		{
			bgmSoundChannel = backgroundMusic2.play();
			bgmSoundChannel.addEventListener( Event.SOUND_COMPLETE, onBackgroundMusic2Finished );
		}


	}
}