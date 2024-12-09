/// @description Step
event_inherited();
scr_keys_update();

var myPlayer = instance_nearest(x, y, obj_player_parent);


var t = timer++;
		
if(t > 120 || (key_p_shoot && t > 4)){
	shoto = true;
}
		
if(shoto){
	h_speed = sin(angle) * move_speed;	
	v_speed = cos(angle) * move_speed;
	//y += 2;
	/*if(is_on_floor()){
		v_speed = 0;
		gravity_default = 0;
		h_speed = 0;
		abs_hspeed = 0;
	} */
	
	if(key_up){
		angle += rot_speed / 180 * pi;
	} else if(key_down){
		angle -= rot_speed / 180 * pi;
	}
	
	instance_create_depth(x + random_range(-effect_dist,effect_dist),
	y + random_range(-effect_dist,effect_dist),
	0,obj_ice_smoke);
} else {
	dir = myPlayer.dir;
	angle = pi/2 * dir;
	x =  myPlayer.x + 32 * dir;
	y = myPlayer.y - 8;
}


if(myPlayer.current_weapon != weapons.frost_spike){
	instance_destroy();
}
