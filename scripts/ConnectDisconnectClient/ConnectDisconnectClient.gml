/// @function			ConnectDisconnectClient
/// @description		Called on a connect or disconnect of a client
function ConnectDisconnectClient() {

	// get connect or disconnect (1=connect)
	var t = ds_map_find_value(async_load, "type");

	// Get the NEW socket ID, or the socket that's disconnecting
	var sock = ds_map_find_value(async_load, "socket");
    
	// Get the IP that the socket comes from
	var ip = ds_map_find_value(async_load, "ip");
    
	// Connecting?
	if t == network_type_connect
		{
		// add client to our list of connected clients
		ds_list_add(socketlist, sock);

		// Create a new player, and pick a random colour for that player        
		var inst = instance_create_layer(64, 192, "Instances", oPlayer);
		inst.image_blend = ColourArray[colourindex];
		colourindex = (colourindex + 1) & 15;

		// put this instance into a map, using the socket ID as the lookup
		ds_map_add(Clients, sock, inst);
		}
	else
		{
		// disconnect a CLIENT. First find the player instance using the socket ID as a lookup
		var inst = ds_map_find_value(Clients, sock);
		// Create a disconnecting "PUFF" at the current coords
		instance_create_layer(inst.x, inst.y, "Instances", oPuff);

		// Delete the socket from out map, and kill the player instance
		ds_map_delete(Clients, sock);
		with(inst)
			{
			instance_destroy();
			}
        
		// Also delete the socket from our global list of connected clients
		var index = ds_list_find_index(socketlist, sock);
		ds_list_delete(socketlist, index);
		}






}
