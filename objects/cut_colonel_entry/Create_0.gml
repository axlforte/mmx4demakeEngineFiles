if(global.met_colonel){
	instance_destroy();
}

event_inherited();
colonel_distance = 320;
colonel_speed = 8;
colonel_offset = 64;

colonel_lerp = colonel_distance / colonel_speed;
dialouge = scr_get_lines_array("english", dialouge_type.words, 1, 2);
lines =   scr_get_lines_array("english", dialouge_type.sounds, 1, 2);