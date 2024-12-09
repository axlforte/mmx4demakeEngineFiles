//making the reverse fucker

if(doReverseShot){
	var inst = instance_create_depth(x, y, depth - 10, obj_player_x_twin_slasher);
	image_yscale = image_yscale * -1;
	inst.image_yscale = image_yscale * -1;
	inst.image_xscale = image_xscale;
	inst.dir = dir;
	inst.h_speed = inst.abs_hspeed * dir * -1;
	inst.dir = dir;
	inst.owner = owner;
	inst.dir_angle = shot_angle;
	inst.is_main = true;
	inst.doReverseShot = false;
	inst.v_speed = -4;
	shoot_update_position = true;
}