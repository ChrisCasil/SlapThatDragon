﻿package {	import flash.display.MovieClip;	import flashx.textLayout.formats.Float;	import flash.utils.Timer;	import flash.events.TimerEvent;	public class Electroball extends Projectile	{				public var ouch:Ouch = new Ouch();		public function Electroball(gameTimer:Timer, hand:Hand, dragon:Dragon, posX:int, posY:int, theAngle:Number, theSpeed)		{			super(gameTimer, hand, dragon, posX, posY, theAngle, theSpeed);			super.damage = 25;			super.stunDuration = 50;					}				protected override function onTick(e:TimerEvent):void		{			//angle = Calculate.doAngle(realX,lastX,realY + Calculate.PGRAV,lastY);			//speed = Calculate.doDistance(realX,lastX,realY + Calculate.PGRAV,lastY);			lastX = realX;			lastY = realY;			realX +=  speed * Math.cos(angle);			realY +=  speed * Math.sin(angle);			//rotation = angle * 180 / Math.PI;			x = realX;			y = realY;			doHitOnDragon();			doHitOnHand();		}				public function isAtEdge():void		{			if (x < 0 || x > 1280 || y < 0 || y > 720)			{				if (parent)				{					gameTimer.removeEventListener(TimerEvent.TIMER,onTick);					parent.removeChild(this);				}			}		}				protected override function doHitOnHand()		{			if (this.hitTestObject(hand) && parent)			{				hand.stunDuration = stunDuration;				playSound();				if (parent)				{					gameTimer.removeEventListener(TimerEvent.TIMER,onTick);					parent.removeChild(this);				}			}		}		protected override function playSound()		{			projChannel = ouch.play();		}	}}