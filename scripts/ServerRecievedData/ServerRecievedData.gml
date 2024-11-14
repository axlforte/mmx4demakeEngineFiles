/// @function			ServerReceivedData();
/// @description		Read incoming data to the server from a connected saocket
function ServerRecievedData() {


	// get the buffer the data resides in
	var buff = ds_map_find_value(async_load, "buffer");
    
	// read ythe command 
	var cmd = buffer_read(buff, buffer_s16);

	// Get the socket ID - this is the CLIENT socket ID. We can use this as a "key" for this client
	var sock = ds_map_find_value(async_load, "id");

	// Look up the client details
	var inst = ds_map_find_value(Clients, sock);

	// Is this a KEY command?
	if cmd==KEY_CMD    
	{
	// not needed, but i bet i can turn this into the projectile spawn code
		
		
	
	}
	// Is this a NAME command?
	else if cmd == NAME_CMD   
	{
	// Set the client "name"
	inst.PlayerName = buffer_read(buff, buffer_string);   
	ds_grid_set(global.playersOnline,global.PlayerTotal,0, inst.PlayerName);
	}
	else if cmd == PING_CMD
	{
		var name = buffer_read(buff, buffer_string)
		var exists = false;
		for(i = 0; i < 32; i++){
			if(name == ds_grid_get(global.playersOnline,i,0)){
				exists = true;
			}
		}
		if(exists){
			var _x = buffer_read(buff, buffer_s16);
			var _y = buffer_read(buff, buffer_s16);
			var _sprite = buffer_read(buff, buffer_s16);
			var _sprite_index = buffer_read(buff, buffer_s16);
			var _sprite_dir = buffer_read(buff, buffer_s16);
			if(_x != 0 && _y != 0){
				show_debug_message(name+string_format(_x,4,0)+string_format(_y,4,0)+string_format(_sprite,4,0)+string_format(_sprite_index,4,0));
				show_debug_message("server packet heartbeat over!");
				for(i = 0; i < 32; i++){
					if(name == ds_grid_get(G.playersOnline,i,0)){
						ds_grid_set(global.playersOnline,i,1, _x);
						ds_grid_set(global.playersOnline,i,2, _y);
						ds_grid_set(global.playersOnline,i,3, _sprite);
						ds_grid_set(global.playersOnline,i,4, _sprite_index);
						ds_grid_set(global.playersOnline,i,5, _sprite_dir);
					}
				}
			}
		}
	} else if(cmd == ){
		
	}





}
