scr_keys_update();

if(!activate){ 
	
} else if(key_p_jump || key_p_shoot||index < 0){
	dilog.die = true;
	index++;
	if(index > array_length(conversation) - 1){
		if(global.paused){
			pause_set(!global.paused, pause_types.dialouge);
		}
		instance_destroy();
	} else {
		dilog = instance_create_depth(x + 4,y + 4,-100, obj_dialouge);
		dilog.line = array_get(conversation, index);
		if (index <= 0){
			dilog.delay = 30;	
		}
	}
}

if(image_xscale < 1){
	image_xscale *= 1.1;
	image_yscale *= 1.1;
} else {
	image_xscale = 1;
	image_yscale = 1;
}