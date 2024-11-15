function GameClient(_ip, _port) : TCPSocket(_ip, _port) constructor {
    setEvent("connected", function() {
        // Send ping after connection is established
        rpc.sendRequest("ping", current_time)
            .onCallback(function(_previous_time) {
                // Show ping
                var _ping = current_time - _previous_time;
                show_debug_message($"{_ping} ms");
            })
            .onError(function(_error) {
                // Show error message
                show_debug_message($"Error {_error.code}: {_error.message}");    
            });    
			
		rpc.sendRequest("getPlayerId", current_time)
            .onCallback(function(_num) {
                // get unique player id, might not need in the future
               global.player_num = _num;
			   if(_num == -1){
                show_debug_message("You got unlucky and I havent coded retrying on this yet!");      
			   }
            })
            .onError(function(_error) {
                // Show error message
                show_debug_message($"Error {_error.code}: {_error.message}");     
            });    
		rpc.sendRequest("pingPlayerCount", 0)
            .onCallback(function(_count) {
                G.playersdetectable = _count;
                show_debug_message($"{_count} players online");
            })
            .onError(function(_error) {
                // Show error message
                show_debug_message($"Error {_error.code}: {_error.message}");    
            });  
    });
	
	//send out my info!
	static alrm = function() {
        // send 
		if(G.playersdetectable != -1) {
	        rpc.sendNotification("pingPlayerPos", {
				pid: G.player_num,
				pname: G.player_name,
	            x: G.player_x,
	            y: G.player_y,
				spr: G.player_sprite,
				spr_frame: G.player_sprite_frame
				
	        });
			show_debug_message("pinged player position!");
		} else {
			rpc.sendRequest("pingPlayerCount", 0)
            .onCallback(function(_count) {
                G.playersdetectable = _count;
                show_debug_message($"{_count} players online");
            })
            .onError(function(_error) {
                // Show error message
                show_debug_message($"Error {_error.code}: {_error.message}");    
            });  
		}
    }
	
	static step = function() {
		show_debug_message("step");
	}
	
	//recieve other ppl's info
	rpc.registerHandler("pingPlayerPos", function(_pos) {
        // Create the ball instance
        //global.playersOnline
		ds_grid_set(G.playersOnline,_pos.pid,0,_pos.pid);
		ds_grid_set(G.playersOnline,_pos.pid,1,_pos.pname);
		ds_grid_set(G.playersOnline,_pos.pid,2,_pos.x);
		ds_grid_set(G.playersOnline,_pos.pid,3,_pos.y);
		ds_grid_set(G.playersOnline,_pos.pid,4,_pos.spr);
		ds_grid_set(G.playersOnline,_pos.pid,5,_pos.spr_frame);
    });
}