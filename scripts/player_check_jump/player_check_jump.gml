function player_check_jump() {
	if (key_p_jump) {
		var can_jump = player_can_jump();
		if (can_jump) {
			if (state == states.dash)
				walk_speed = dash_speed;
			state_set(states.jump, 1, [0]);
			
			var dand = random_range(0,3);
			var sound_index = voice_x_jump_1;
			if(dand > 2){
				sound_index = voice_x_jump_2;	
			} else if(dand > 1){
				sound_index = voice_x_jump_3;	
			}
			
			audio_play_sound(sound_index, 0, 0);
			audio_sound_gain(sound_index, global.sfx_volume, 0);
			
			animation_play("jump");
			voice_play();
			v_speed = -jump_strength;
			if (state_unlocked[states.high_jump] && key_up) {
				v_speed = -high_jump_strength;
				grav = 0;
				substates[0] = 1; // High Jump
				dash_air_count++;
			}
		    audio_play(jump_sound);
		}
		
		if (can_jump == 2)
			dash_air_count++;
	}


}
