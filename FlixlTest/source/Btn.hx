package;

import flixel.FlxSprite;
import flixel.util.FlxColor;

import flixel.plugin.MouseEventManager;
import flixel.tweens.FlxTween;


/**
 * ...
 * @author Dyson0913
 */
class Btn extends FlxSprite
{
	private var _turned:Bool = false;
	
	private static inline var TURNING_TIME:Float = 0.2;
	
	public function new(X:Float=0, Y:Float=0,Graphic:Dynamic) 
	{
		super(X, Y);
		//makeGraphic(16, 16, FlxColor.BLUE);
		loadGraphic(Graphic, true, 0, 0);
		
		MouseEventManager.add(this, onDown, null, onOver, onOut);
	}
	
	private function onDown(Sprite:FlxSprite)
	{
		
	}
	
	private function onOver(Sprite:FlxSprite) 
	{
		
	}
	
	private function onOut(Sprite:FlxSprite)
	{
		
	}
	
	
	
	override public function destroy():Void 
	{
		// Make sure that this object is removed from the MouseEventManager for GC
		MouseEventManager.remove(this);
		super.destroy();
	}
}