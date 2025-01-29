function scr_moving_platform_step(){
	if(player == noone){
		player = instance_nearest(x,y,obj_player_parent);
	} else if(DPX < sprite_width * image_xscale){
			
		var _x_diff = x - prev_x;
		var _y_diff = y - prev_y;
		
		with(player){
			move_x(_x_diff);
			move_y_normal(_y_diff);
		}	
		
		prev_x = x;
		prev_y = y;
	}
}