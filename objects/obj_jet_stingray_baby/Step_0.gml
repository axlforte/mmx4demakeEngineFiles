PAUSE;
event_inherited();
if (!can_move_x(h_speed)) {// same thing as above
	h_speed = 0;	
	audio_play(snd_X1_explode);
	instance_destroy();	
}

if(is_on_floor()){
	if(image_index == 1){// set vertical speed to 0 if you hit the floor
		v_speed = 0;
	}
	image_index = 0;
}

if(is_on_ceil()){// if touching cieling die anyways
	audio_play(snd_X1_explode);
	instance_destroy();	
}