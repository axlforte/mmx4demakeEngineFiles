/// @description  Networking code
var eventid = ds_map_find_value(async_load, "id");

// Our socket?
if( client == eventid )
{
switch(global.NetworkState)
    {
    case NETWORK_PLAY:
        // Read all data....
        var buff = ds_map_find_value(async_load, "buffer");
		
		// get what render call this is
		// 0 = ignore, 1 = players, 2 = projectiles
		var type = buffer_read(buff, buffer_s16); 
        
		if(type == 1){
			// Get number of sprites sent
	        sprites = buffer_read(buff, buffer_u32 ); 
			G.playersdetectable = sprites;
            
	        // Read out OUR location (allow scrolling maps)
	        clientx = buffer_read(buff, buffer_s16);     //x
	        clienty = buffer_read(buff, buffer_s16);     //y
		
			//show_debug_message(eventid);
        
	        // Now clear the render list, and start filling it up with NEW data!
	        ds_list_clear(allsprites);
	        for(var i = 0; i < sprites; ++i;)
				{     
	            ds_list_add(allsprites, buffer_read(buff,buffer_s16));     //x
	            ds_list_add(allsprites, buffer_read(buff,buffer_s16));     //y
	            ds_list_add(allsprites, buffer_read(buff,buffer_s16));     //sprite_index
	            ds_list_add(allsprites, buffer_read(buff,buffer_s16));     //image_index
	            ds_list_add(allsprites, buffer_read(buff,buffer_s32));     //image_blend   
	            ds_list_add(allsprites, buffer_read(buff,buffer_string));  // player name
		        }
			break;
		}
    }
}




