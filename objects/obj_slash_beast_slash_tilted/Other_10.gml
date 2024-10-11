var t = timer++;
if (t == 2) {
	y-=16;
	var inst = instance_create_depth(x + 18*dir, y, depth, object_index);
	inst.dir = dir;
	inst.xscale = xscale;
	inst.shot_type = shot_type + 1;
}
if (t > 12) {
	collide_damage = 0;
}
if (animation_end) {
	instance_destroy();	
}
if (shot_type > 30)
	persist = false;