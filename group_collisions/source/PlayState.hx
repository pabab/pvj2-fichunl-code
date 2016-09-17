import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxObject;
import flixel.group.FlxGroup;
import flixel.tile.FlxBaseTilemap;
import flixel.tile.FlxTilemap;
import flixel.addons.editors.tiled.TiledMap;
import flixel.addons.editors.tiled.TiledTileLayer;

class PlayState extends FlxState
{
	override public function create():Void
	{
		super.create();
		bgColor = 0xff849684;
		level = new FlxTilemap();
		var tiledMap = new TiledMap("assets/data/levels/level01.tmx");
		var layer = cast(tiledMap.getLayer("solid"), TiledTileLayer);
		level.loadMapFromArray(layer.tileArray, layer.width, layer.height, "assets/images/tiles_alpha.png", 16, 16, FlxTilemapAutoTiling.OFF, 1);
		char = new Character(64, 64);
		enemies = new FlxTypedGroup<Enemy>();
		coins = new FlxTypedGroup<Coin>();
		characterCollideables = new FlxGroup();

		coins.add(new Coin(160, 64));
		coins.add(new Coin(160, 80));
		coins.add(new Coin(160, 96));
		coins.add(new Coin(64, 144));
		coins.add(new Coin(80, 144));
		coins.add(new Coin(96, 144));
		coins.add(new Coin(256, 80));
		coins.add(new Coin(256, 96));
		coins.add(new Coin(256, 112));
		coins.add(new Coin(256, 128));
		coins.add(new Coin(256, 144));
		coins.add(new Coin(256, 160));
		enemies.add(new Enemy(256, 176));
		enemies.add(new Enemy(240, 48));
		enemies.add(new Enemy(160, 112));

		add(level);
		add(coins);
		add(enemies);
		add(char);
		characterCollideables.add(enemies);
		characterCollideables.add(level);
		characterCollideables.add(coins);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		FlxG.overlap(characterCollideables, char, onCollisionWithChar);
		FlxG.collide(level, enemies);
	}

	private function onCollisionWithChar(theObject: FlxObject, theChar: Character)
	{
		if(theObject == level){
			FlxObject.separate(theObject, theChar);
		}
		else if(Type.getClass(theObject) == Enemy)
		{
			theChar.hit();
		}
		else if(Type.getClass(theObject) == Coin){
			var theCoin = cast(theObject, Coin);
			theCoin.pick();
		}
	}

	private var char: Character;
	private var level: FlxTilemap;
	private var enemies: FlxTypedGroup<Enemy>;
	private var coins: FlxTypedGroup<Coin>;
	private var characterCollideables: FlxGroup;
}
