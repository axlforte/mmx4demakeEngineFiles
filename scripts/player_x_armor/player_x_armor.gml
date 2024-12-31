function player_x_armor() {
	// Default
	palette_texture_set(plt_x_full);
	plt_index_default = 12;

	special_weapons = ds_list_create();
	weapons_script[weapons.x_buster] = player_x_buster_x2;
	charge_level_max = 2;
	
	#region X4 - Force Armor
		if (LEGS == "x4") {
			// Air Dash
			dash_air_unlocked = true;
			
			//zero difficulty doesnt benefit from any of this for whatever reason
			//so i will make x walk faster
			walk_speed = 2.25;
			//i might also marginally increase jump height
			jump_strength = 5.5;
			wall_jump_strength = 5.75;
			
			// Hover
			state_unlocked[states.hover] = true;
			hover_length = [10000, 120];
			hover_vertical = true;
		}
		
		if (BODY == "x4") {
			// Yeetus MCCleetus
			player_special_weapons_add(states.nova_strike);
			immunity_length *= 2;
			damage_reduction = 0.5;
		dolor_animation = "dolor2";
		}
		
		if (ARMS == "x4_1") {
			// X-Buster
			charge_level_max = 3;
			charge_limits[3] = charge_limits[2];
			//weapons_script[weapons.x_buster] = player_x_buster_x4;	
		}
		
		if (HELM == "x4") {
			//hit things with more things
			weapon_cost_reduce_rate = 0.25;	
		}
	#endregion
	#region X4 - Ultimate Armor
		if (FULL == "ult") {
			// Intro
			player_special_weapons_add(states.shoryuken);
			player_special_weapons_add(states.tatsumaki);
			player_special_weapons_add(states.hadouken);
			intro_end_sound = snd_player_intro_end;
			// Air Dash
			dash_air_unlocked = true;
			dash_up_unlocked = true;
			// Hover
			state_unlocked[states.hover] = true;
			glow_enabled = true;
			glow_name = "glow_ult";
			// Special Weapon
			player_special_weapons_add(states.nova_strike);
			// X-Buster
			charge_level_max = 3;
			charge_limits[3] = charge_limits[2];
			weapons_script[weapons.x_buster] = player_x_buster_x4;
			dash_speed = 7;
			charge_speed = 1;
			walk_speed_default = 4;
			walk_speed = 4;
		}
	#endregion
	
	state_unlocked[states.crouch] = global.yoga;
	auto_regen = global.regenerative_capacitors;
	if(global.cardio_training){
		walk_speed += 0.5;
	}
	if(global.super_dash){
		dash_speed = 4.25;
	}
	if(global.hyper_dash){
		dash_speed = 5;
		dash_spark = player_effect_new(obj_player_dash_spark, -6, 16, layer_up);
	}
	
	if(global.difficulty == diff_modes.zero){
		state_unlocked[states.dash] = false;
		double_jump_unlocked = true;
	}
	
}
