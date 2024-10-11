scr_keys_reset();
scr_keys_update();

if(key_p_jump || key_p_shoot){
	dilog.die = true;
	index++;
	if(4 > array_length(conversation)){
		instance_destroy();
	} else {
		dilog = instance_create_depth(x,y,-100, obj_dialouge);;
		dilog.line = array_get(conversation, 0);
	}
}