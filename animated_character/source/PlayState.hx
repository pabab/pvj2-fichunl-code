import flixel.FlxState;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	private var character: Character;

	override public function create():Void
	{
		super.create();
		character = new Character(160, 160);
		add(character);
		bgColor = FlxColor.WHITE;
	}
}
