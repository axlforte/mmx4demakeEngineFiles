if (((t - 62) mod 3) == 0 && global.paused == pause_types.none) {
	var index = (t - 62) / 4;
	instance_create_depth(x + irandom_range(-30, 30), y + irandom_range(-30, 30), depth - index, explode_FX);
	if (((t - 62) mod rnd_snd) == 0){ 
		//audio_play(snd_X1_explode);
		rnd_snd = random_range(5,9);
	}
}
t++;