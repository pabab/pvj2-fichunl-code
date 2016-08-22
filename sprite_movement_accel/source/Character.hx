import flixel.FlxSprite;
import flixel.FlxG;

class Character extends FlxSprite
{
	public function new(X: Float, Y: Float)
	{
		super(X, Y, "assets/images/ImpGuy_0.jpg");
		drag.x = 200;
		maxVelocity.x = 200;
	}

	override public function update(elapsed):Void
	{
		super.update(elapsed);
		if(FlxG.keys.pressed.A)
		{
			acceleration.x = -200;
		}
		else if(FlxG.keys.pressed.D)
		{
			acceleration.x = 200;
		}
		else
		{
			acceleration.x = 0;
		}
	}
}
