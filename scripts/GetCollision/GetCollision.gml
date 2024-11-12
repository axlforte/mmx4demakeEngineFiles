/// @function			GetCollision(x, y);
/// @param	{real}	x	X coordinate to get tile (in pixels, not tiles)
/// @param	{real}	y	Y coordinate to get tile (in pixels, not tiles)
function GetCollision(argument0, argument1) {

	/// @description		Loop through the tiles in the room and create
	///						a tile map in a global array that can then be
	///						used for collisions.

	if argument0 >= room_width return -1;
	if argument1 >= room_height return -1;
	if argument0 < 0 return -1;
	if argument1 < 0 return -1;

	var xx = (argument0 div 32) + ((argument1 div 32) * (room_width div 32));

	if global.mapsize < xx return -1;

	return global.map[xx];




}
