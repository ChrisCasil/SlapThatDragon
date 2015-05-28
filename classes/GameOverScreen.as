package 
{
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	import flash.net.SharedObject;
	import flash.text.TextField;


	public class GameOverScreen extends MovieClip
	{

		public var sharedObject:SharedObject;
		public var goldEarned:int;
		public var timeLasted:int;

		public function GameOverScreen()
		{
			Mouse.show();

			menuButton.addEventListener(MouseEvent.CLICK, onClickMenu, false, 0, true);
			sharedObject = SharedObject.getLocal("mldScores");
		}

		public function setFinalScore(goldEarned:Number, timeLasted:Number):void
		{
			this.goldEarned = goldEarned;
			this.timeLasted = timeLasted;
			try
			{
				finalGold.text = goldEarned.toString();
				if (sharedObject.data.bestGold == null)
				{
					sharedObject.data.bestGold = goldEarned;
				}
				else if ( goldEarned > sharedObject.data.bestGold)
				{
					sharedObject.data.bestGold = goldEarned;
				}
				//trace(sharedObject.data.bestGold);
				bestGold.text = sharedObject.data.bestGold.toString();
				sharedObject.flush();

				finalTime.text = timeLasted.toString();
				if (sharedObject.data.bestTime == null)
				{
					sharedObject.data.bestTime = timeLasted;
				}
				else if ( timeLasted > sharedObject.data.bestTime)
				{
					sharedObject.data.bestTime = timeLasted;
				}
				bestTime.text = sharedObject.data.bestTime.toString();
				sharedObject.flush();
			}
			catch (sharedObjectError:Error)
			{
				trace( "Caught this error:", sharedObjectError.name, sharedObjectError.message );
			}
		}

		public function onClickMenu(mouseEvent: MouseEvent):void
		{
			dispatchEvent(new NavigationEvent(NavigationEvent.MENU));
		}
	}
}