//making the reverse fucker

if(doReverseShot){
	var inst = instance_create_depth(x + (-16 * dir), y, depth - 10, obj_player_x_double_cyclone);
	inst.image_xscale = image_xscale * -1;
	inst.h_speed = inst.abs_hspeed * dir * -1;
	inst.dir = dir * -1;
	inst.owner = owner;
	inst.dir_angle = shot_angle;
	inst.is_main = true;
	inst.doReverseShot = false;
	shoot_update_position = true;
}