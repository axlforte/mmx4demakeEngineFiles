/// @function			SendKeepAlive
/// @description		Ping the server now and then so we know if we're still connected or not....
function SendKeepAlive() {


	// Move to start of buffer. Networking ALWAYS takes the data from the START of a buffer.
	buffer_seek(buff, buffer_seek_start, 0);
	
	var myPlayer = instance_nearest(x, y, obj_player_parent);
	// Write the command into the buffer.
	buffer_write(buff, buffer_s16, PING_CMD);
	buffer_write(buff , buffer_string,PlayerName);
	buffer_write(buff , buffer_u16,global.player_x);
	buffer_write(buff , buffer_u16,global.player_y);
	buffer_write(buff , buffer_u16,global.player_sprite);
	buffer_write(buff , buffer_u16,global.player_sprite_frame);
	buffer_write(buff , buffer_u16,myPlayer.dir);

	// Send this to the server
	var size = network_send_packet(client, buff, buffer_tell(buff));
	if size <= 0
	{
	network_destroy(client);
	buffer_delete(buff);
	game_restart();
	}




}
