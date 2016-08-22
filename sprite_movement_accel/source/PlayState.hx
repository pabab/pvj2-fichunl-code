import flixel.FlxState;
import flixel.FlxSprite;
import flixel.FlxG;

class PlayState extends FlxState
{
	override public function create():Void
	{
		super.create();
		sprite = new FlxSprite(100, 100, "assets/images/ImpGuy_0.jpg");
		sprite.drag.x = 200;
		sprite.maxVelocity.x = 200;
		add(sprite);
	}

	override public function update(elapsed):Void
	{
		super.update(elapsed);
		if(FlxG.keys.pressed.A)
		{
			sprite.acceleration.x = -200;
		}
		else if(FlxG.keys.pressed.D)
		{
			sprite.acceleration.x = 200;
		}
		else
		{
			sprite.acceleration.x = 0;
		}
	}

	private var sprite: FlxSprite;
}
