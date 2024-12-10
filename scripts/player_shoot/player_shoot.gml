function player_shoot() {
	//shoot = true;
	previous_charge_level = argument[0];
	previous_shot_id = argument[1];
	if (weapon_script != noone)
		script_execute(weapon_script, argument[0], argument[1]);

	if(previous_charge_level == 2){
		var dand = random_range(0,3);
		var sound_index = voice_x_charge;
		if(dand > 2.5){
			sound_index = voice_x_charge_voiceline;	
		} else if(dand > 1.25){
			sound_index = voice_x_charge_2;	
		}
			
		audio_play_sound(sound_index, 0, 0);
		audio_sound_gain(sound_index, global.sfx_volume, 0);
	}
}
