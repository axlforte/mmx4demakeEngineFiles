function scr_moving_platform_step(){
	if(player == noone){
		player = instance_nearest(x,y,obj_player_parent);
	} else if(abs(player.x - x) < x_zone){
			
		var _x_diff = x - prev_x;
		var _y_diff = y - prev_y;
		var _x = x;
		var _y = y;
		var _px = moves_x;
		var _py = moves_y;
		var _lpy = lock_player_y;
		
		with(player){
			if(_x_diff != 0 && _px)
				move_x(_x_diff);
			/*if(_lpy && (state == states.fall ||state == states.jump)){
				y = _y;
			} else {
				if(_y_diff != 0 && _py && !is_on_floor(_y_diff)&& (state == states.fall ||state == states.jump))
					move_y_normal(_y_diff);
			}*/
		}	
		
		prev_x = x;
		prev_y = y;
	}
}