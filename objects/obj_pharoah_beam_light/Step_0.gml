if(beam_timer > 8/spd){
	if(length == length_init){
		var piss = instance_create_depth(x,y,depth,beam);
		piss.v_speed = spd;
		piss.h_speed = 0;
		piss.endo = true;
		length--;
	} else if(length == 0){
		instance_destroy();
	} else {
		var piss = instance_create_depth(x,y,depth,beam);
		piss.v_speed = spd;
		piss.h_speed = 0;
		length--;
	}
	beam_timer = 0;
} else {
	beam_timer++;
}