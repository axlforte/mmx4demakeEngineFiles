#region Input
scr_keys_update();
vinput_p = key_p_down - key_p_up;
hinput_p = key_p_right - key_p_left;
hinput = key_right - key_left;
vinput = key_down - key_up;
enter = key_p_start;
var previous_selected_item = selected_item;
#endregion
#region Buttons
switch(state) {
	// sprite, image, x, y, xscale
	case menu_states.player_select:
		buttons[| 0] = [spr_start_menu_arrow_right, 0, 256,  96];
		buttons[| 1] = [spr_start_menu_arrow_left, 0, 4,   96];
		buttons[| 2] = [spr_player_select_capsule, 0, 12, 14];
		break;
	case menu_states.key_config:
		buttons[| 0] = [spr_start_menu_keyboard, 0, 214, 4];
		buttons[| 1] = [spr_start_menu_gamepad, 0, 264, 4];
		break;
	case menu_states.armor_select:
		buttons[| 0] = [spr_armor_scroll_arrows, 0, -100, -100];
		break;
}
btn_length = ds_list_size(buttons);
#endregion
#region Timers
if (wait_t > 0) {
	wait_t--;
	if (wait_t == 0) {
		var tran = transition_create(transition_types.fade_out_and_fade_in);
		tran.transition_limit = input_timer;
		tran.wait_timer = 10;
		switch(state){
			case menu_states.boss_intro:
			case menu_states.game_mode:
			case menu_states.weapon_get:
				music_stop(1000);
				break;
		}
	}
	exit;	
}
if (input_timer > 0) {
	if (can_activate_sprites) {
		activate_sprites = true;
		can_activate_sprites = false;
	}
	input_timer--;
	inputting = false;
	if (input_timer == 0) {
		inputting = true;
	}
}
if (timer > 0)
{
	timer--;
	if (timer == 0)
	{
		state = state_next;
		state_timer = 0;
		changed_state = true;
		items = items_next;
		items_length = array_length(items);
		selected_item = selected_item_next;
		selected_item_next = 0;
		can_activate_sprites = true;
		ds_list_clear(buttons);
		btn_length = 0;
	}
}
#endregion
#region Animated Sprites + Background
if (activate_sprites) {
	activate_sprites = false;
	layer_background_sprite(layer_bg, noone);
	layer_background_blend(layer_bg, c_black);
	layer_x(layer_id, 0);
	switch(state) {
		case menu_states.main:
			animation2_init();
			animation2_add(final_logo, 1/4, 0, 0);
			break;
		case menu_states.stage_select:
			var wlen = array_length(weapon_get_props.instances);
			for (var i = 0; i < wlen; i++) {
				instance_destroy(weapon_get_props.instances[i]);		
			}
			if (wlen) {
				weapon_get_props.instances = [];
				weapon_get_props.player.visible = false;
				weapon_get_props.player.palette_sprite = noone;
				weapon_get_props.player.palette_swap = false;
			}
			animation2_init();
			animation2_add(spr_stage_selecter, 1/5, 0, 0);
			animation2_add(spr_stage_selecter2, 1/5, 176, 85);
			break;
		case menu_states.player_select:
			layer_background_change(layer_bg, spr_player_select_background2);
			layer_background_blend(layer_bg, c_white);
			layer_hspeed(layer_id, 1.5);
			// It's necessary for the draw event
			selected_item = global.character_selected_index[0];
			armor_index = global.player_character_armor_index[selected_item];
			background_index = selected_item % 5;
			armor = G.player_character_armor[selected_item];
			switch (FULL) {
				case "black": background_index = 2; break;
				case "white": background_index = 5; break;
				default: background_index = selected_item % 5;
			}
			break;
		case menu_states.armor_select:
			menu_armor_load(global.character_selected_index[0]);
			menu_armor_update_colors();
			break;
		case menu_states.weapon_get:
			layer_background_change(layer_bg, spr_player_select_background2);
			layer_background_blend(layer_bg, c_white);
			layer_hspeed(layer_id, 1.5);
	}
}
if (!inputting) exit;
#endregion
#region Changed State
if (changed_state) {
	changed_state = false;
	switch(state) {
		case menu_states.stage_select:
			music_play("StageSelect");
			break;
		case menu_states.voice_language:
			var voice_languages = player_voice_languages_get();
			alength = array_length(voice_languages)
			page = [
				["", []]
			];
			selected_item = alength - 1;
			for (var i = 0; i < alength; i++) {
				page[i] = [ _(voice_languages[i]), [92, 64 + 20*i, 144, 20] ];
				if (voice_languages[i] == G.voice_language)
					selected_item = i;
			}
			previous_selected_item = selected_item;
			items = page;
			items_length = array_length(items);
			break;
		case menu_states.boss_intro:
			state_timer = 0;
			break;
	}
}
#endregion
switch (state) {
	#region Main
	case menu_states.main:
		menu_update_item_v();
		menu_update_item_click();
		if (enter) {
			switch(selected_item) {
				case 0: state_next = menu_states.difficulty_mode; break;
				case 1: menu_set_state(menu_states.load); return; break; 
				case 2: state_next = menu_states.option; break;
				case 3: game_end(); exit; break;
			}
			menu_set_state(state_next);
		}
		break;
	#endregion
	#region loading
	case menu_states.load:
		menu_update_item_v();
		menu_update_item_click();
		if(state_timer == 0){
			state_timer++;
			items_next = noone;
			instance_create_depth(x + 160,y + 128,-128,obj_save_and_load);
		}
		//room = rm_skill_tree;
		break;
	#endregion
	#region Difficulty Mode
	case menu_states.difficulty_mode:
		menu_update_item_v();
		menu_update_item_click();
		if (enter) {
			
			if(key_wp2 && 1 == 0){
				global.rando = true;
				scr_rando_settings();
				audio_play(snd_player_x_shot_2);
			}
			
			global.difficulty = selected_item;
			menu_set_state(menu_states.save_select);
			break;
		}
		break;
	#endregion
	#region Player Select
	case menu_states.player_select:
		for (var i = 0; i < btn_length; i++) {
			var b = buttons[| i];
			b[1] = (menu_button_pressed(b)
				|| ((hinput == 1 && i == 0) || (hinput == -1 && i == 1)));
			if (menu_button_inside(b) && mouse_check_button_released(mb_left)) {
				if (i == 1)
					hinput_p = -1;
				else if (i == 0)
					hinput_p = 1;
				else
					vinput_p = -1;
			}
			buttons[| i] = b;
		}
		menu_update_item_h();
		global.character_selected_index[0] = selected_item;
		if (selected_item < array_length(global.player_character_armor)) {
			armor_index = G.player_character_armor_index[selected_item];
			armor = G.player_character_armor[selected_item];
		}
		switch (FULL) {
			case "black": background_index = 2; break;
			case "white": background_index = 5; break;
			case "nightmare": background_index = 4; break;
			default: background_index = selected_item % 5;
		}
		var w = 96;
		if (point_in_rectangle(mouse_x, mouse_y, 160 - w, 0, 160 + w, global.view_width)
		&& mouse_check_button_released(mb_left))
			enter = true;
		if (enter ) {
			var tran = transition_create(transition_types.blink);
			tran.color = c_white;
			tran.transition_limit = 16;
			//menu_set_state(menu_states.boss_intro, 16, 60);
			room = rm_music_unfucker;
			music_stop(1000);
			audio_play(snd_player_success);
			global.character_selected[0] = global.character_object[selected_item];
		}
		break;
	#endregion
	#region Difficulty Mode
	case menu_states.save_select:
		menu_update_item_v();
		menu_update_item_click();
		if (enter) {
			global.game_save_num = selected_item;
			var _boss = global.boss_slot[1];
			if (_boss != noone) {
			var info = global.boss_info[_boss];
			boss_room = info[3];
			boss_object = info[4];
			boss_name = info[0];
			boss_defeated = global.boss_defeated[_boss];
			}
			var tran = transition_create(transition_types.blink);
			tran.color = c_white;
			tran.transition_limit = 16;
			settings_apply();
			room = rm_music_unfucker;
			music_stop(1000);
			G.player_character_armor[pl_char.x][3] = x_armor.x1;
			global.character_selected[0] = global.character_object[global.character_selected_index[0]];
			//original
			audio_play(snd_player_success);
			break;
		}
		break;
	#endregion
	#region Option
	case menu_states.option:
		menu_update_item_v();
		menu_update_item_click();
		
		var item = items[selected_item];
		var subitem = (array_length(item) > 2 ? item[2] : 0);
		
		scr_settings();
		break;
	#endregion
	#region Key Config
	case menu_states.key_config:
		state_timer++;
			menu_update_item_click();
			scr_keys_rebind();
		break;
	#endregion
	#region Volume Settings
	case menu_states.volume:
		menu_update_item_v();
		menu_update_item_click();
		if (enter) {
			switch (selected_item) {
				// Back
				case 2:
					menu_set_state(menu_states.audio_settings);
					break;
			}
		}
		if (key_right || key_left) {
			switch (selected_item) {
				// SFX
				case 0:
					global.sfx_volume = clamp(global.sfx_volume+hinput*0.01,0,1);
	                audio_group_set_gain(audiogroup_default,global.sfx_volume,0);
					if (global.sfx_volume <= 0.9){
						audio_play(snd_item_changed);
			            sound = false;
					}
				break;
				
				// BGM   global.music_playing_index
				case 1:
					global.bgm_volume = clamp(global.bgm_volume+hinput*0.01,0,1);
	                audio_sound_gain(global.music_playing_index,global.bgm_volume,0);
				break;
			}
		}
		break;
	#endregion
	#region Visuals Settings
	case menu_states.visuals:
		menu_update_item_v();
		menu_update_item_click();
		if (enter) {
			switch (selected_item) {
				// Back
				case 2:
					menu_set_state(menu_states.audio_settings);
					break;
			}
		}
		if (key_right || key_left) {
			switch (selected_item) {
				// SFX
				case 0:
				global.sfx_volume = clamp(global.sfx_volume+hinput*0.01,0,1);
                audio_group_set_gain(audiogroup_default,global.sfx_volume,0);
				if (global.sfx_volume <= 0.9){
				audio_play(snd_item_changed);
	            sound = false;
				}
				break;
				
				// BGM   global.music_playing_index
				case 1:
				global.bgm_volume = clamp(global.bgm_volume+hinput*0.01,0,1);
                audio_sound_gain(global.music_playing_index,global.bgm_volume,0);
				break;
			}
		}
		break;
	#endregion
	#region Voice Language
	case menu_states.voice_language:
		menu_update_item_v();
		menu_update_item_click();
		if (enter) {
			var item = items[selected_item];
			G.voice_language = item[0];
			G.voice_enabled = (G.voice_language != "NONE");
			
		}
		menu_set_state(menu_states.audio_settings);
		break;
	#endregion
	#region Weapon Get
	case menu_states.weapon_get:
		var t = state_timer++;
		weapon_get_props.player.visible = true;
		if (t == 0)
			music_play("WeaponGet");
		var move_to = weapon_get_props.player.move_to;
		var move_from = weapon_get_props.player.move_from;
		var interval = move_to.interval;
		var amount = (t - interval[0]) / (interval[1] - interval[0]);
		if (t >= interval[0] && t <= interval[1]) {
			weapon_get_props.player.x = lerp(move_from.x, move_to.x, amount);
			weapon_get_props.player.y = lerp(move_from.y, move_to.y, amount);
		}
		else if (t == weapon_get_props.blink_limit) {
			var tran = transition_create(transition_types.fade_out_and_fade_in);
			tran.color = c_white;
			tran.transition_limit = 30;
			audio_play(snd_player_success);
			break;
		}
		else if (t == weapon_get_props.blink_limit + 15) {
			background_index = 1;
			var player_inst = instance_create_depth(64, -64, depth - 20, global.character_selected[0]);
			weapon_get_props.instances[0] = player_inst;
			player_inst.armor = G.player_character_armor[G.character_selected_index[0]];
			with (player_inst) {
				weapon_demo = true;
				weapon_demo_limit = 210;
				player_load_armor(true);
				player_weapon_set(other.weapon_get_props.player.wp_slot, other.weapon_get_props.player.new_weapon);
				weapon[0] = other.weapon_get_props.player.new_weapon;
				plt_index = weapon_palettes[weapon[0]];
				other.weapon_get_props.player.palette_swap = true;
				if (!weapon_allow_pallete) {
					if (plt_index == weapon_palettes[weapon[0]])
						plt_index = plt_index_default;
					other.weapon_get_props.player.palette_swap = false;
				}
			}
			weapon_get_props.player.palette_sprite = player_inst.plt_texture_sprite;
			weapon_get_props.player.palette_array = player_inst.armor_palette_index;
			weapon_get_props.player.palette_index = player_inst.plt_index;
			if (weapon_get_props.player.palette_swap == false) {
				weapon_get_props.player.palette_sprite = noone;	
			}
		}
		else if (t == weapon_get_props.dark_limit) {
			
			var tran = transition_create(transition_types.fade_out, depth - 1);
			tran.transition_limit = 30;
			tran.alpha_end = 0.5;
			tran.auto_destroy = false;
			weapon_get_props.instances[1] = tran; 
		}
		else if (t == weapon_get_props.dark_limit + 30) {
			var inst = instance_create_depth(0, -72, depth - 10, obj_weapon_get_bar);
			inst.interval = 30;
			inst.move_to = { x: 0, y: 84 };
			weapon_get_props.instances[2] = inst;
		}
		else if (t == weapon_get_props.dark_limit + 60) {
			var inst = instance_create_depth(0, 0, depth - 10, obj_weapon_get_text);
			weapon_get_props.instances[3] = inst;
			var block = instance_create_depth(0, obj_weapon_get_bar.y + 64, 0, obj_square_16);
			block.image_xscale = 20;
			weapon_get_props.instances[4] = block;
			var player_inst = weapon_get_props.instances[0];
			with (player_inst) {
				state = states.intro;
				y = -64;
				weapon_demo_t = 0;
				state_timer = 0;
			}
		} else {
			if (instance_exists(obj_player_parent)) {
				if (obj_player_parent.weapon_demo_finished) {			
					menu_set_state(menu_states.stage_select, 16, 60);
					wait_t = 60;
				}
			}
		}
		break;
	#endregion
}
// Play Sound
if (previous_selected_item != selected_item || sound) {
	audio_play(snd_item_changed);
	sound = false;
}
// View
menu_update_view_pos();