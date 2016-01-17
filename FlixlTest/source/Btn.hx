package;

import flixel.FlxSprite;
import flixel.util.FlxColor;

import flixel.plugin.MouseEventManager;
import flixel.tweens.FlxTween;
import flixel.FlxG;

/**
 * ...
 * @author Dyson0913
 */
class Btn extends FlxSprite
{
	private var _turned:Bool = false;
	
	private var _onDown:Void->Void = null;
	private var _onUp:Void->Void = null;
	private var _onOver:Void->Void = null;
	private var _onOut:Void->Void = null;
	
	public function new(X:Float=0, Y:Float=0,Graphic:Dynamic,?OnDown:Void->Void,?OnUp:Void->Void,?OnOver:Void->Void,?OnOut:Void->Void) 
	{
		super(X, Y);
		FlxG.watch.add(Graphic, "x");
		
		//makeGraphic(16, 16, FlxColor.BLUE);
		loadGraphic(Graphic, true, 100, 100);
		
		_onDown = OnDown;
		_onUp = OnUp;
		_onOver = OnOver;
		_onOut = OnOut;
		
		MouseEventManager.add(this, onDown, onUp, onOver, onOut);
	}
	
	private function onDown(Sprite:FlxSprite)
	{
		if( _onDown != null) _onDown();
	}
	
	private function onUp(Sprite:FlxSprite)
	{
		if( _onUp != null) _onUp();
	}
	
	private function onOver(Sprite:FlxSprite) 
	{
		if( _onOver != null) _onOver();
	}
	
	private function onOut(Sprite:FlxSprite)
	{
		if( _onOut != null) _onOut();
	}
	
	
	
	override public function destroy():Void 
	{
		// Make sure that this object is removed from the MouseEventManager for GC
		MouseEventManager.remove(this);
		super.destroy();
	}
}