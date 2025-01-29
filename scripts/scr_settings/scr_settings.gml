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
					menu = pause_menus.key_config;
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
		//game speed
		case 8:
			global.game_world_speed = clamp(global.game_world_speed+hinput*0.01,0.5,1);
			break;
		//sfx
		case 9:
			global.sfx_volume = clamp(global.sfx_volume+hinput*0.01,0,1);
		    audio_group_set_gain(audiogroup_default,global.sfx_volume,0);
			if (global.sfx_volume <= 0.9){
				audio_play(snd_item_changed);
				sound = false;
			}
		break;
		//bgm
		case 10:
				global.bgm_volume = clamp(global.bgm_volume+hinput*0.01,0,1);
		        audio_sound_gain(global.music_playing_index,global.bgm_volume,0);
			break;
		// Back
		case 11:
			if (enter && room == rm_start_menu) {
				menu_set_state(menu_states.main);
				settings_save();
			}
			break;
	}
}

function scr_settings_init(){
	var wsize_options = [];
	var k = 0;
	while((k+1)*global.view_height + 40 <= global.screen_height) {
		wsize_options[k] = "x" + string(k+1);
		k++;
	}
	wsize_options[k] = "FULLSCREEN";
	wsize_options[k + 1] = "STRETCHED";
	global.fullscreen_index = k + 1;
	// Mobile
	if (G.mobile) {
		wsize_options = ["NORMAL", "STRETCHED"];
		global.fullscreen_index = 1;
	}
	
	return [
		[_("Window Size"), [64, 64, 200, 20], wsize_options],//0
		[_("Dialouge Speed"), [64, 80, 200, 20]],//1
		[_("Key Configuration"), [64, 112, 96, 20]],//2
		[_("Pickup Notifications"), [64, 128, 144, 20]],//3
		[_("CRT Filter"), [64, 128, 144, 20]],//4
		[_("Hit Numbers"),[64, 144, 144, 20]],//5
		[_("Camera Offset"),[64, 144, 144, 20]],//6
		[_("Camera Offset Apply Speed"),[64, 144, 144, 20]],//7
		[_("Game Speed"),[64, 144, 144, 20]],//7
		[_("Effect Volume"),[64, 160, 144, 20]],//8
		[_("Music Volume"),[64, 176, 144, 20]],//9
		[_("Back"), [64, 192, 144, 20]]//10
	];
}

function scr_keys_rebind(){
	for (var i = 0; i < btn_length; i++) {
		var b = buttons[| i];
		if (menu_button_pressed(b)) {
			global.settings[settings_types.input] = input_types.keyboard;	
			if (i == input_types.gamepad) {
				global.gp_id = -1;
				if (!ds_list_empty(global.gamepad_list)) {
					global.settings[settings_types.input] = input_types.gamepad;
					global.gamepad_list_index = (global.gamepad_list_index + 1) mod ds_list_size(global.gamepad_list);
					global.gp_id = global.gamepad_list[| global.gamepad_list_index];		
					global.gp_name = gamepad_get_description(global.gp_id);
				} 
			}
		}
	}
	for (var i = 0; i < btn_length; i++) {
		var b = buttons[| i];
		b[1] = (global.settings[1] == i); // Image Index
		buttons[| i] = b;
	}
	if (substates[0] == 0)
		menu_update_item_v(true);
	if (substates[0] == 1) {
		item_blink_t = ((item_blink_t + 1) mod 30);
		var item = items[selected_item];
		var subitem = item[2];
		var update_items = false;
		if (keyboard_check_pressed(vk_escape)) {
			update_items = true;	
		}
		else if (global.settings[1] == input_types.keyboard) {
			if (keyboard_lastkey != -1) {
				var key_str = key_to_string(keyboard_lastkey);
				if (key_str != "") {
					global.key_config[selected_item - 1] = keyboard_lastkey;
					subitem[0] = key_str;
					update_items = true;
					state_timer = -1;
				}
			}
		}
		else {
			var k = gamepad_key(global.gp_id);
			if (global.gp_id != -1 && k != -1)
			{
				global.gamepad_config[selected_item - 1] = k;
				subitem[1] = gamepad_to_string(k);
				update_items = true;
			}
		}
			
		if (update_items) {
			item[2] = subitem;
			items[selected_item] = item;
			page_items[state] = items;
			substates[0] = 0;
			if (global.gp_id == -1)
				global.settings[1] = input_types.keyboard;
			keys_apply();
		}
	}
	else if (enter && state_timer > 0) {
		if (selected_item > 0 && selected_item < items_length - 1) {
			// Wait for the key
			if (substates[0] == 0)
			{
				if (global.settings[1] == input_types.keyboard
				|| (global.settings[1] == input_types.gamepad && global.gp_id != -1 && selected_item > 4)) {
					substates[0] = 1;
					keyboard_lastkey = -1;
				}
				if (global.settings[1] == input_types.gamepad) {
					if (selected_item == 3) { // Directional / Joystick
						global.gp_movement = !global.gp_movement;	
					}
				}
			}
		}
		else if (selected_item != 0) {
			if(room == rm_start_menu){
				menu_set_state(menu_states.option);
			} else {
				menu = pause_menus.settings;
			}
			settings_save();
		}
	}
	else {
		if (selected_item == 0) {
			if (hinput_p != 0) {
				var new_value = clamp(global.settings[1] + hinput_p, 0, 1);
				if (new_value == input_types.gamepad) {
					if (!ds_list_empty(global.gamepad_list)) {
						global.gamepad_list_index = (global.gamepad_list_index + 1) mod ds_list_size(global.gamepad_list);
						global.gp_id = global.gamepad_list[| global.gamepad_list_index];
						global.gp_name = gamepad_get_description(global.gp_id);
					} else {
						new_value = global.settings[1];	
					}
				}
				if (global.settings[1] != new_value) {
					global.settings[1] = new_value;
					sound = true;
				}
			}
		}
	}
}

function scr_keys_rebind_init(){
	page = [
		["", []]
	];
	alength = array_length(global.key_text)
	for(var i = 0; i < alength; i++)
	{
		page[i + 1] = [_(global.key_text[i]),
						[],
						[key_to_string(global.key_config[i]), gamepad_to_string(global.gamepad_config[i])]
		];
	
	}
	gamepad_movement_mode_text[0] = "Directional";
	gamepad_movement_mode_text[1] = "Joystick";
	page[alength + 1] = [_("BACK"), [128, 32 + 14*(alength + 1), 128, 24]];
	
	// Buttons
	buttons = ds_list_create();
	btn_length = 0;
	
	return page;
}