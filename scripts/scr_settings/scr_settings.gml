function scr_settings(){
	switch(selected_item) {
		// Window Size
		case 0:
			// PC
			if (!G.mobile) {
				var new_value = clamp(global.settings[0] + hinput_p, 0, 5);
				if (global.settings[0] != new_value) {
					sound = true;
					global.settings[0] = new_value;
					global.center_screen = true;
					custom_window_size(new_value + 1);
				}
			} else if (enter) {
				var new_value = (global.settings[0] == 0) ? 1 : 0;
				sound = true;
				global.settings[0] = new_value;
				custom_window_size(new_value + 1);
			}
			// Android
			break;
		// 16 by 9 aspect ratio (if streched or widened)
		case 1:
			if(enter)
				global.DialougeSpeed++;
				if(global.DialougeSpeed > 5){
					global.DialougeSpeed = 1;
				}
			break;
		// Key Config
		case 2:
			if (enter)
				if(room == rm_start_menu)
					menu_set_state(menu_states.key_config);
				else
					audio_play(snd_nope);
			break;
		// popup notifications
		case 3:
			if (enter)
				global.notes = !global.notes;
			break;
		//crt filter
		case 4:
			if (enter){
				global.crt = array_get([1,2,0], global.crt);
			}
		break;
		// one pixel tall healthbar
		case 5:
			if (enter)
				global.hit_numbers = !global.hit_numbers;
			break;
		// camera offset amount
		case 6:
			global.camera_shift_distance = clamp(global.camera_shift_distance+hinput*0.25,0,96);
			if(hinput == 0){
				global.camera_shift_distance = floor(global.camera_shift_distance);
			}
			break;
		// camera offset shift speed
		case 7:
			global.camera_shift_speed = clamp(global.camera_shift_speed+hinput*0.05,0.5,4);
			break;
		//sfx
		case 8:
			global.sfx_volume = clamp(global.sfx_volume+hinput*0.01,0,1);
		    audio_group_set_gain(audiogroup_default,global.sfx_volume,0);
			if (global.sfx_volume <= 0.9){
				audio_play(snd_item_changed);
				sound = false;
			}
		break;
		//bgm
		case 9:
				global.bgm_volume = clamp(global.bgm_volume+hinput*0.01,0,1);
		        audio_sound_gain(global.music_playing_index,global.bgm_volume,0);
			break;
		// Back
		case 10:
			if (enter) {
				menu_set_state(menu_states.main);
				settings_save();
			}
			break;
	}
}