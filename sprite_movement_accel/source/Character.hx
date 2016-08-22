import flixel.FlxSprite;
import flixel.FlxG;

class Character extends FlxSprite
{
	public function new(X: Float, Y: Float)
	{
		super(X, Y, "assets/images/ImpGuy_0.jpg");
		drag.x = SPRITE_DRAG;
		maxVelocity.x = SPRITE_MAXVEL;
	}

	override public function update(elapsed):Void
	{
		super.update(elapsed);
		if(FlxG.keys.pressed.A)
		{
			acceleration.x = -SPRITE_ACCEL;
		}
		else if(FlxG.keys.pressed.D)
		{
			acceleration.x = SPRITE_ACCEL;
		}
		else
		{
			acceleration.x = 0;
		}
	}

	private static inline var SPRITE_ACCEL: Float 	= 200;
	private static inline var SPRITE_MAXVEL: Float 	= 200;
	private static inline var SPRITE_DRAG: Float 		= 200;
}
