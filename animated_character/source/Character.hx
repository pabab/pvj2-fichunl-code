package;

import flixel.FlxSprite;
import flixel.FlxObject;
import flixel.FlxG;

class Character extends FlxSprite
{
	public function new(X: Float, Y: Float)
	{
		super(X, Y);
		loadGraphic("assets/images/char_sheet.png", true, 16, 16);
		animation.add("idle", [0, 1, 2, 3], 4, true);
		animation.add("walk", [5, 6, 7], 10, true);
		animation.play("idle");
	}

	public override function update(elapsed: Float):Void
	{
		super.update(elapsed);
		if (FlxG.keys.pressed.A || FlxG.keys.pressed.LEFT)
		{
			velocity.x = -CHAR_VEL;
			animation.play("walk");
			flipX = true;
		}
		else if (FlxG.keys.pressed.D || FlxG.keys.pressed.RIGHT)
		{
			velocity.x = CHAR_VEL;
			animation.play("walk");
			flipX = false;
		}
		else
		{
			velocity.x = 0;
			animation.play("idle");
		}
	}

	private static inline var CHAR_VEL: Float = 100;
}
