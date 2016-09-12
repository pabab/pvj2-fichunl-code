import flixel.FlxG;
import flixel.FlxState;
import flixel.tile.FlxBaseTilemap;
import flixel.tile.FlxTilemap;
import flixel.addons.editors.tiled.TiledMap;
import flixel.addons.editors.tiled.TiledTileLayer;
import flixel.FlxCamera;

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
		FlxG.camera.follow(char, FlxCameraFollowStyle.TOPDOWN);
		FlxG.camera.setScrollBoundsRect(0, 0, level.width, level.height, true);
		add(char);
		add(level);
	}

	 override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		FlxG.collide(level, char);
	}

	private var char: Character;
	private var level: FlxTilemap;
}
