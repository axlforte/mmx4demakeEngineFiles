scr_keys_update();
if(!activate){ 
	sound_activated = false;
} else if(key_p_jump || key_p_shoot||index < 0 || ping){
	if(string_length(dilog.line) > dilog.index){
		dilog.spd = 0;
	} else {
		dilog.die = true;
		sound_activated = true;
		ping = false;
		index++;
		if(index > array_length(conversation) - 1){
			if(global.paused){
				//pause_set(!global.paused, pause_types.dialouge);
			}
			instance_destroy();
		} else {
			dilog = instance_create_depth(x - 140,y - 28,-100, obj_dialouge);
			dilog.convo = self;
			dilog.line = array_get(conversation, index);
			if (index <= 0){
				dilog.delay = 30;	
			}
		}
	}
}

if(intro_frame < intr_time){
	image_xscale += 1/(intr_time + 1);
	intro_frame++;
} else if(intro_frame < intr_time * 2){
	image_xscale = 1;
	image_yscale += 1/(intr_time + 1);
	intro_frame++;
} else if(intro_frame < intr_time * 2 + 1){
	image_yscale = 1;
	image_xscale = 1;
}

