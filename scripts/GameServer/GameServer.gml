function GameServer(_port) : TCPServer(_port) constructor {
    rpc.registerHandler("ping", function(_time, _socket) {
        return _time;
    });
	
	rpc.registerHandler("pingPlayerCount", function(_time, _socket) {
        return G.playersdetectable;
    });
	
	//pingPlayerCount
	 rpc.registerHandler("getPlayerId", function(_time, _socket) {
		 var num = random_range(0,32);
		 
		 for(i = 0; i < 32; i++){
				 if(ds_grid_get(G.playersOnline,i,0) == num){
					 //new playersOnline format: name,x,y,sprite,index,dir,pal?
					return -1;
				 }
		 }
		 ds_grid_set(G.playersOnline,G.playersdetectable,0,num);
        return num;
    });
   
   
	rpc.registerHandler("pingPlayerPos", function(_pos, _socket) {
        for(i = 0; i < 32; i++){
			if(ds_grid_get(G.playersOnline,i,0) == _pos.pid){
				ds_grid_set(G.playersOnline,i,1,_pos.pname);
				ds_grid_set(G.playersOnline,i,2,_pos.x);
				ds_grid_set(G.playersOnline,i,3,_pos.y);
				ds_grid_set(G.playersOnline,i,4,_pos.spr);
				ds_grid_set(G.playersOnline,i,5,_pos.spr_frame);
			}
		}
        rpc.sendNotification("pingPlayerPos", _pos, sockets);
    });
}