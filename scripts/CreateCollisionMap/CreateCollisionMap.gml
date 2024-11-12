/// @function			CreateCollisionMap();
/// @description		Loop through the tiles in the room and create
///						a tile map in a global array that can then be
///						used for collisions.
function CreateCollisionMap() {

	global.mapsize = (room_width div 32) * (room_height div 32);


	var _layer = layer_get_id("Tiles");
	var _tiles = layer_tilemap_get_id(_layer);

	for(var yy = 0; yy < room_height; yy += 32;)
	{
	s="";
	for(var xx = 0; xx < room_width; xx += 32;)
		{
		var i = (xx div 32) + ((yy div 32) * (room_width div 32));
		global.map[i] = -1;
		var t = tilemap_get_at_pixel(_tiles, xx, yy);
		if t > 0
			{
			s = s+"1";
			global.map[i] = xx div 32;            
	        }
		else s = s + "_";
	    }
	show_debug_message(s);
	}





}
