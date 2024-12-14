if (spd = 0) {
	scr_letter_apply_repeated();
} else if(time >= spd){
	if(string_length(line) + 1 > index){
		scr_letter_apply();
	}
} else {
	if(string_length(line) + 1 > index){
		time += 1;
	}
	if (delay > 0){
		time -= delay;
		delay = 0;
	}
}

if(die){
	instance_destroy();	
}

