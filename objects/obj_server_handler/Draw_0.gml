for(i = 0; i < 32; i++){
	if(ds_grid_get(G.playersOnline,i,0) != 0){
		var _x = ds_grid_get(G.playersOnline,i,1);
		var _y = ds_grid_get(G.playersOnline,i,2);
		var _spr = ds_grid_get(G.playersOnline,i,3);
		var _spr_ind = ds_grid_get(G.playersOnline,i,4);
		draw_sprite_ext(_spr, _spr_ind, _x, _y, 1,1,0,c_white,1);
		draw_text(_x,_y - 32,ds_grid_get(G.playersOnline,i,0));
	}
}