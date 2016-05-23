package;

import flixel.FlxSprite;
import flixel.util.FlxColor;

import flixel.input.mouse.FlxMouseEventManager;
import flixel.tweens.FlxTween;


/**
 * ...
 * @author Dyson0913
 */
class Card extends FlxSprite
{
	private var _turned:Bool = false;
	
	private var _icon:Icon;
	
	private static inline var TURNING_TIME:Float = 0.2;
	
	public function new(X:Float=0, Y:Float=0,icon:Icon) 
	{
		super(X, Y);
		//makeGraphic(16, 16, FlxColor.BLUE);
		loadGraphic(AssetPaths.Card__png, true, 194, 194);
		
		animation.frameIndex = 0;
		antialiasing = true;
		FlxMouseEventManager.add(this, onDown, null, onOver, onOut);
		_icon = icon;
	}
	
	private function onDown(Sprite:FlxSprite)
	{
		if (!_turned)
		{
			_turned = true;
			FlxTween.tween(scale, { x: 0 }, TURNING_TIME / 2, { onComplete: pickCard });
		}
	}
	
	private function onOver(Sprite:FlxSprite) 
	{
		
	}
	
	private function onOut(Sprite:FlxSprite)
	{
		
	}
	
	private function pickCard(Tween:FlxTween):Void
	{
		// Choose a random card from the first 52 cards on the spritesheet 
		// - excluding those who have already been picked!
		//animation.frameIndex = FlxRandom.intRanged(0, 51, pickedCards);
		//pickedCards.push(animation.frameIndex);
		_icon.random();
		
		animation.frameIndex = 1;
		// Finish the card animation
		FlxTween.tween(scale, { x: 1 }, TURNING_TIME / 2);
	}
	
	override public function destroy():Void 
	{
		// Make sure that this object is removed from the MouseEventManager for GC
		FlxMouseEventManager.remove(this);
		super.destroy();
	}
}