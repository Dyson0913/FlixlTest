package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;

import flixel.util.FlxDestroyUtil;

using flixel.util.FlxSpriteUtil;


/**
 * A FlxState which can be used for the game's menu.
 */
class MenuState extends FlxState
{
	private var _btnPlay:FlxButton;
	
	private var _btn_start:Btn;
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		super.create();
		add(new FlxText(10, 10, 100, "Hello, World!",50));
		
		//tnPlay = new FlxButton(0, 0, "Play", clickPlay);
		//add(_btnPlay);
		//_btnPlay.screenCenter();
		
		_btn_start = new Btn(0, 0, AssetPaths.Btn__png,clickPlay,null,null,null);
		add(_btn_start);
		_btn_start.screenCenter();
		
		FlxG.sound.playMusic("bg");
		
		
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
		_btnPlay = FlxDestroyUtil.destroy(_btnPlay);
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		super.update();
		for (touch in FlxG.touches.list)
		{
			if (touch.justPressed)
			{
				 
					_btn_start.setPosition(touch.getWorldPosition().x, touch.getWorldPosition().y);
				
			}

			if (touch.pressed)
			{
			}

			if (touch.justReleased)
			{
			}
		}
	}	
	
	private function clickPlay():Void
	{
		FlxG.switchState(new PlayState());
	}
}