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
		char = TilemapHelper.createSingleObjectFromTile(level, [CHAR_TILE], Character, ["x", "y"]);
		enemies = TilemapHelper.createGroupFromTiles(level, [ENEMY_TILE], Enemy, ["x", "y"]);
		coins = TilemapHelper.createGroupFromTiles(level, [COIN_TILE], Coin, ["x", "y"]);
		characterCollideables = new FlxGroup();
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
		if(FlxG.keys.justPressed.R)
		{
			FlxG.resetState();
		}
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
	private static inline var CHAR_TILE = 385;
	private static inline var ENEMY_TILE = 386;
	private static inline var COIN_TILE = 387;
}
