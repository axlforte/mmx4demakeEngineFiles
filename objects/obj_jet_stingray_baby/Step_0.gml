PAUSE;
event_inherited();
if (h_speed == 0 && type == 1) {// if touching wall and not wall climber, die
	audio_play(snd_X1_explode);
	instance_destroy();	// this eletes objects
}
if (!can_move_x(h_speed)) {// same thing as above
	if(type == 1){
		h_speed = 0;	
		audio_play(snd_X1_explode);
		instance_destroy();	
	} else if(type == 2) {
		v_speed = h_speed * -1;
		h_speed = 0;
	}
}

if(is_on_floor()){
	if(image_index == 1 || image_index == 3){// set vertical speed to 0 if you hit the floor
		v_speed = 0;
	}
	
	if(type == 1){
		image_index = 0;
	} else if(type == 2){
		image_index = 2
	}
}

if(is_on_ceil()){// if touching cieling die anyways
	audio_play(snd_X1_explode);
	instance_destroy();	
}