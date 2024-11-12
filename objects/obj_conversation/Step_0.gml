scr_keys_update();
x = __view_get(e__VW.XView, 0);
y = __view_get(e__VW.YView, 0);
if(!activate){ 
} else if(key_p_jump || key_p_shoot||index < 0 || ping){
	dilog.die = true;
	ping = false;
	index++;
	if(index > array_length(conversation) - 1){
		if(global.paused){
			//pause_set(!global.paused, pause_types.dialouge);
		}
		instance_destroy();
	} else {
		dilog = instance_create_depth(x - 140,y - 28,-100, obj_dialouge);
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

