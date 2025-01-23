function scr_moving_platform_step(){
	if(player == noone){
		player = instance_nearest(x,y,obj_player_parent);
	} else if(instance_place(x - x_zone,y - y_zone,obj_player_parent) || 
	instance_place(x + x_zone,y - y_zone,obj_player_parent) || 
	instance_place(x,y - y_zone,obj_player_parent)){
		if(player.moved_by_platform)
			return;
			
		var _x_diff = x - prev_x;
		var _y_diff = y - prev_y;
		
		with(player){
			move_x(_x_diff);
			move_y_normal(_y_diff);
			moved_by_platform = true;
		}	
		
		prev_x = x;
		prev_y = y;
	}
}