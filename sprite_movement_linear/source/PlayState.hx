import flixel.FlxState;
import flixel.FlxSprite;
import flixel.FlxG;

class PlayState extends FlxState
{
	override public function create():Void
	{
		super.create();
		sprite = new FlxSprite(100, 100, "assets/images/ImpGuy_0.jpg");
		add(sprite);
	}
	
	override public function update(elapsed):Void
	{
		super.update(elapsed);
		if(FlxG.keys.pressed.A)
		{
			sprite.velocity.x = -200;
		}
		else if(FlxG.keys.pressed.D)
		{
			sprite.velocity.x = 200;
		}
		else
		{
			sprite.velocity.x = 0;
		}
	}

	private var sprite: FlxSprite;
}
