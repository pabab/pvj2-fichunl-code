import flixel.FlxSprite;
import flixel.FlxState;

class PlayState extends FlxState
{
	override public function create():Void
	{
		super.create();
		sprite = new FlxSprite(100, 100, "assets/images/haxeflixel_logo.png");
		sprite.angularVelocity = 150;
		add(sprite);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}

	private var sprite: FlxSprite;
}
