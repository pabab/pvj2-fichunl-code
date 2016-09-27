import flixel.FlxBasic;
import flixel.group.FlxGroup;
import flixel.tile.FlxTilemap;

/**
 * Helper class to create objects from specific tiles in a tilemap
 */
class TilemapHelper{
	/**
	 * Creates FlxTypedGroup<T> from tiles with values in `tiles`
	 *
	 * @param	tilemap			The tilemap 	
	 * @param	tiles			Tile values where the objects will be created
	 * @param	objectClass		Class of the objects that will be created
	 * @param	args			Array of arguments that will be passed to the object's constructor 
	 *							"x" will be replaced by tile x coordinate
	 *							"y" will be replaced by tile y coordinate
	 *							"tile" will be replaced by the tile value (usefull when creating objects from the same clase using multiple tile values)
	 * @param	deleteTile		If the tiles must be deleted from the map after creating the object
	 */
    @:generic
    public static function createGroupFromTiles<T: FlxBasic>(tilemap: FlxTilemap, tiles: Array<Int>, objectClass:Class<T>, args: Array<Dynamic>, deleteTile: Bool = true): FlxTypedGroup<T>{
        var tileWidth: Int = Std.int(tilemap.width/tilemap.widthInTiles);
        var tileHeight: Int = Std.int(tilemap.height/tilemap.heightInTiles);
        var group = new FlxTypedGroup<T>();
        var realArgs = new Array<Dynamic>();
        for(tile in tiles){
            var tileInstances = tilemap.getTileInstances(tile);
            if(tileInstances != null){
                for(eTile in tileInstances){
                    parseArgs(args, eTile, tilemap, tileWidth, tileHeight, realArgs);
                    var newObject = Type.createInstance(objectClass, realArgs);
                    group.add(newObject);
                    if(deleteTile){
                        tilemap.setTileByIndex(eTile, 0);
                    }

                }
            }
        }
        return group;
    }


	/**
	 * Creates a single object at the location of the first tile with value in `tiles`
	 *
	 * @param	tilemap			The tilemap 	
	 * @param	tiles			Tile values where the objects will be created
	 * @param	objectClass		Class of the objects that will be created
	 * @param	args			Array of arguments that will be passed to the object's constructor 
	 *							"x" will be replaced by tile x coordinate
	 *							"y" will be replaced by tile y coordinate
	 *							"tile" will be replaced by the tile value (usefull when creating objects from the same clase using multiple tile values)
	 * @param	deleteTile		If the tiles must be deleted from the map after creating the object
	 */
    @:generic
    public static function createSingleObjectFromTile<T: FlxBasic>(tilemap: FlxTilemap, tiles: Array<Int>, objectClass:Class<T>, args: Array<Dynamic>, deleteTile: Bool = true): T {
        var tileWidth: Int = Std.int(tilemap.width/tilemap.widthInTiles);
        var tileHeight: Int = Std.int(tilemap.height/tilemap.heightInTiles);
        var realArgs = new Array<Dynamic>();
        for(tile in tiles){
            var tileInstances = tilemap.getTileInstances(tile);
            if(tileInstances != null){
                for(eTile in tileInstances){
                    parseArgs(args, eTile, tilemap, tileWidth, tileHeight, realArgs);
                    var object = Type.createInstance(objectClass,realArgs);
                    if(deleteTile){
                        tilemap.setTileByIndex(eTile, 0);
                    }
                    return object;
                }
            }
        }
        return null;
    }


    private static function parseArgs(argsIn: Array<Dynamic>, iTile: Int, tilemap: FlxTilemap, tileWidth: Int, tileHeight: Int, argsOut: Array<Dynamic>){
        argsOut.splice(0, argsOut.length);
        for(arg in argsIn){
            if(arg == "x"){
                argsOut.push(iTile%tilemap.widthInTiles*tileWidth);
            }else if(arg == "y"){
                argsOut.push(Std.int(iTile/tilemap.widthInTiles)*tileHeight);
            }else if(arg == "tile"){
                argsOut.push(tilemap.getTileByIndex(iTile));
            }else{
                argsOut.push(arg);
            }
        }
    }
}
