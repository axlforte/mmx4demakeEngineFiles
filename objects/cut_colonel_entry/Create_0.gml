if(global.met_colonel){
	instance_destroy();
}

event_inherited();
colonel_distance = 320;
colonel_speed = 8;
colonel_offset = 128;
convo_start_delay = 30;

colonel_lerp = colonel_distance / colonel_speed;
dialouge = scr_get_lines_array("english", dialouge_type.words, line.colonel_1, 11);
lines =   scr_get_lines_array("english", dialouge_type.sounds, line.colonel_1, 11);