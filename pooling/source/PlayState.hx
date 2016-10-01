import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxObject;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.group.FlxGroup;

class PlayState extends FlxState
{
	private var ship: Ship;
	private var text: FlxText;


	override public function create():Void
	{
		text = new FlxText(0, 0, 200);
		ship = new Ship();
		add(new FlxSprite(0, 0, "assets/images/back.png"));
		add(ship);
		add(ship.bullets);
		add(text);
	}

	override public function update(elapsed: Float):Void
	{
		super.update(elapsed);
		text.text  = "Group size: "+ship.bullets.length+"\n";
		text.text += "Alive bullets : "+ship.bullets.countLiving();
	}
}
