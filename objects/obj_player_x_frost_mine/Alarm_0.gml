//making the reverse fucker

if(doReverseShot){
	var inst = instance_create_depth(x, y, depth - 10, obj_player_x_frost_mine);
	inst.v_speed = -3.25;
	inst.dir = dir;
	inst.owner = owner;
	inst.dir_angle = shot_angle;
	inst.is_main = true;
	inst.doReverseShot = false;
	
	var inst2 = instance_create_depth(x, y, depth - 10, obj_player_x_frost_mine);
	inst2.v_speed = -2.75;
	inst2.dir = dir;
	inst2.owner = owner;
	inst2.dir_angle = shot_angle;
	inst2.is_main = true;
	inst2.doReverseShot = false;
	shoot_update_position = true;
}