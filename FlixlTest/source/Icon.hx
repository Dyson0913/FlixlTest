package ;

import flixel.FlxSprite;
import flixel.util.FlxRandom;

import flixel.tweens.FlxTween;
/**
 * ...
 * @author Dyson0913
 */
class Icon extends FlxSprite
{

	public function new(X:Float=0, Y:Float=0) 
	{
		super(X, Y);
		loadGraphic(AssetPaths.Icon__png, true, 194, 194);
		animation.frameIndex = 0;
		
		FlxTween.tween(scale, { x: 0 }, 0.1);
		exists = false;
	}
	
	public function random()
	{
		//visible = true;
		super.revive(); 
		FlxTween.tween(scale, { x: 1 }, 0.2 / 2);
		animation.frameIndex = FlxRandom.intRanged(0, 10);
	}
	
}