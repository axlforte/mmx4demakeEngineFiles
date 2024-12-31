// Needs refactoring...
function companion_step() {
	local_game_speed_update();
	
	companion_determine_keys();
	
	if (G.paused && G.pause_type != pause_types.normal)
		player_charge();
	if (G.paused && G.pause_type != pause_types.special_attack)
		exit;
	if (!local_game_run_step) {
		animation_ignore_frame++;
		physics_ignore_frame++;
		exit;
	}
	show_debug_message(string(x) + " " + string(y))
	if (under_water && breath_enabled) {
		breath_effect.timer++;
		if (breath_effect.timer > breath_effect.timer_limit) {
			breath_effect.timer = 0;
			player_effect_create(breath_effect);
		}
	} else {
		breath_effect.timer = 0;	
	}
	under_water = false;
	
	move = key_right - key_left;
	// Walk to the middle of the screen
	if (walking_to_x) {
		if (state != states.walk)
			state_set(states.walk);
		if (dest_x > x)
			move = 1;
		else if (dest_x < x)
			move = -1;
		if (abs(dest_x - x) < walk_speed) {
			move = 0;
			x = dest_x;
			player_complete_outro();
			walking_to_x = false;
		}
	}
	x_door_check = x;
	y_door_check = y;
	if (glow_mode == 1) {
		glow_alpha = 1;	
	} else {
		glow_alpha = 0;
	}
	if (glow_type == 1) {
		glow_alpha2 = glow_timer / ( glow_length / 2);
		if (glow_timer >= glow_length / 2) {
			glow_alpha2 = 2 - glow_alpha2;
		}
		if (glow_timer >= glow_length) {
			glow_timer = -1;
			glow_type = 0;
		}
		glow_timer++;
	}
	player_check_weapon_change();
	if (state != states.ride) {
		player_gravity();
		script_try(state_array[state]);
		player_saber_check();
		player_immunity();
		player_collision();
		player_door_check();
		special_input_update();
		if (state == states.death) exit;

		for (var i = 0; i < ds_list_size(special_weapons); i++) {
			var spi = special_weapons[| i];
	
			if (!array_contains([states.dolor, states.ready, states.intro, states.complete, states.outro, states.grabbed], state)) {
				script_try(spi.check);
				if (using_special_weapon) {
					shoot_wait = false;
					dash_tap_timers = [0, 0, 0, 0];
					audio_stop(hover_sound);
				}
			}
		}

		player_shoot_check();
		player_saber_check();
		player_check_dolor();
	} else {
		script_try(state_array[state]);
		player_charge_reset();
		player_charge();	
	}
	full_health = (hp == max_hp);
	player_auto_regen();
}