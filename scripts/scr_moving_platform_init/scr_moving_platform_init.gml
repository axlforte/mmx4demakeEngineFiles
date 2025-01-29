function scr_moving_platform_init(){
	prev_x = x;
	prev_y = y;
	player = instance_nearest(x,y,obj_player_parent);
	x_zone = 9;
	y_zone = 9;
	moves_x = true;
	moves_y = true;
	lock_player_y = false;
	y_off = sprite_height / -2;
	
	coll = instance_create_depth(x,y  + 1000,600,obj_square_16);
}