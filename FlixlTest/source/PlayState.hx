package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.group.FlxGroup;
import flixel.util.FlxMath;

import Card;
import Icon;

import flixel.FlxG;
/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	private var _Cards:FlxGroup;
	private var _Icons:FlxGroup;
	private var _arr:Array<Icon> = [];
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		super.create();
		
		_Icons = new FlxGroup();
		
		placeCoins();
		add(_Icons);
		
		_Cards = new FlxGroup();
		
		placeCard();
		add(_Cards);
		
	}
	
	private function placeCard():Void 
	{
		
		var RowCnt:Int = 5;
		for (j in 0...(25)) 
		{
			var coin:Icon = _arr[j];
			var x:Float = FlxG.width/2  - (194*2) - (194/2)  + (j % RowCnt * 194);	
			var y:Float = FlxG.height/2 - (194*2) - (194/2)  + Math.floor(j / RowCnt) * 194;	
			coin.setPosition(x, y);
			_Cards.add(new Card(x , y, coin));			
		}
	}
	
	//placeCoins(Assets.getText("assets/data/coins.csv"), Coin);
	//private function placeCoins(CoinData:String, Sparkle:Class<FlxObject>):Void 
	//if (Sparkle == Coin)
	//		{
	//			_coins.add(new Coin(Std.parseInt(coords[0]), Std.parseInt(coords[1]))); 
	//		}
	private function placeCoins():Void 
	{
		for (j in 0...(25)) 
		{
		  _arr.push(new Icon(0,0));
		  _Icons.add(_arr[j]);
		}
		
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		super.update();
	}	
}