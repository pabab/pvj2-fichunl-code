import flixel.FlxState;

class PlayState extends FlxState
{
	private var character: Character;

	override public function create():Void
	{
		super.create();
		character = new Character(100, 100);
		add(character);
	}
}
