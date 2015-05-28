package 
{
	import flash.events.Event;

	public class CreateEvent extends Event
	{
		public static const CREATE_PITCHFORK:String = "a";
		public static const CREATE_AARROW:String = "b";
		public static const CREATE_BOMB:String = "c";
		public static const CREATE_ELECTROBALL:String = "d";
		public static const CREATE_ROCK:String = "f";
		public static const CREATE_COIN:String = "g";
		public var realX:Number;
		public var realY:Number;
		public var initAngle:Number;
		public var initSpeed:Number;

		public function CreateEvent(type:String, realX:Number, realY:Number, initAngle:Number, initSpeed:Number)
		{
			super(type, true);
			this.realX=realX;
			this.realY=realY;
			this.initAngle=initAngle;
			this.initSpeed=initSpeed;
		}
	}
}