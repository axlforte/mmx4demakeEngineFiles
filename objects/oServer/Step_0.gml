/// @description  Send player data to ALL attached clients

// Once a frame, we send ALL attached clients, ALL game sprites
var count = ds_list_size(socketlist);
if count > 0
{
/// Send all sprites to all clients
global.player_buffer = player_buffer;
    
// Reset buffer to start - Networking ALWAYS reads from the START of the buffer
buffer_seek(player_buffer, buffer_seek_start, 0);
    
// Total number of sprites 
buffer_write(player_buffer, buffer_u32, global.PlayerTotal);

// Dummy player x,y...will fill in later. This allows the client to follow themselves in a scrolling level.
buffer_write(global.player_buffer, buffer_s16, 0);
buffer_write(global.player_buffer, buffer_s16, 0);

// All attached players

var plength = 0;

for(r = 0; r < 32; r++){
	if(ds_grid_get(G.playersOnline,r,0) != 0){
		plength++;
	}
}

var count = 0;
//for(s = 0; s < plength; s++)
with(oPlayer)
    {
    buffer_write(global.player_buffer, buffer_s16, ds_grid_get(G.playersOnline,count + 1,1));
    buffer_write(global.player_buffer, buffer_s16, ds_grid_get(G.playersOnline,count + 1,2));
    buffer_write(global.player_buffer, buffer_s16, ds_grid_get(G.playersOnline,count + 1,3));
    buffer_write(global.player_buffer, buffer_s16, ds_grid_get(G.playersOnline,count + 1,4));
    buffer_write(global.player_buffer, buffer_s32, ds_grid_get(G.playersOnline,count + 1,5));
    buffer_write(global.player_buffer, buffer_string, ds_grid_get(G.playersOnline,count + 1,0));
	count++;
    }

var buffer_size = buffer_tell(player_buffer);
// Now send all data... to all clients
for(var i = 0; i < count; ++i;)
    {   
    // get the socket
    var sock = ds_list_find_value(socketlist, i);

    // Write in client location, so it can do a scroll window "follow"
    buffer_seek(player_buffer, buffer_seek_start, 4);

    // Get the player's instance, so we can get it's X,Y
	if(i == 0){
		buffer_write(global.player_buffer, buffer_s16, ds_grid_get(G.playersOnline,1,1));
		buffer_write(global.player_buffer, buffer_s16, ds_grid_get(G.playersOnline,1,2));
	} else {
	    var inst = ds_map_find_value(Clients, sock);
		for(e = 0; e < 32; e++){
			if(inst.PlayerName == ds_grid_get(G.playersOnline,i,0)){
				buffer_write(global.player_buffer, buffer_s16, ds_grid_get(G.playersOnline,i,1));
				buffer_write(global.player_buffer, buffer_s16, ds_grid_get(G.playersOnline,i,2));
			}
		}
	}

    // Send data to client
    network_send_packet(sock,player_buffer, buffer_size);
    }
}






