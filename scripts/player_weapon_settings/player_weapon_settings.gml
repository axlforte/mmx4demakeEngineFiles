function player_weapon_settings() {
	enum weapons {
		// Default
		x_buster,
		z_buster,
		z_saber,
		// X
		storm_tornado,
		homing_torpedo,
		sonic_slicer,
		wheel_cutter,
		acid_splash,
		ray_splasher,
		hyper_charge,
		falcon_giga,
		x2_giga_crush,
		nova_strike,
		// x4 weapons
		soul_body,
		aiming_laser,
		lightning_web,
		rising_fire,
		frost_spike,
		double_cyclone,
		twin_slasher,
		ground_hunter,
		// extra weapons
		hyper_bomb,
		quick_boomerang,
		hard_knuckle,
		pharoah_wave,
		gyro_attack,
		blizzard_shot,
		slash_claw,
		thunder_claw,
		concrete_shot,
		triple_blade,
		blazing_torch,
		kendo_parry,
		craft_grenade,
		// Zero
		messenko,
		z_buster_x5,
		nightmare_saber,
	}
	// Must be changed to struct array
	for (var i = 80; i >= 0; i--) {
		weapon_palettes[i] = plt_index_default;
		weapon_icon[i] = noone;
		weapon_color[i] = 0;
		weapon_sprite_name[i] = "";
		weapon_shots_limit[i] = 1;
		weapon_show[i] = true;
		weapon_energy[i] = 28;
		weapon_energy_max[i] = 28;
		weapon_max_level[i] = 3;
		weapon_costs[i] = [1, 1, 1, 2, 2, 2];
		weapon_auto_charge[i] = false;
		weapon_damage_refill[i] = 0;
		weapon_fill_rate[i] = 0;
		weapons_script[i] = noone;
		weapon_selectable[i] = true;
		weapon_full_sound[i] = noone;
		weapon_refill_enabled[i] = true;
		weapon_level_id[i] = 0; // Use this for weapons that use the same script and only changes the shot or its properties
	}
	// Palettes
	weapon_palettes[weapons.storm_tornado] = 6;
	weapon_palettes[weapons.homing_torpedo] = 9;
	weapon_palettes[weapons.hyper_bomb] = 18;
	weapon_palettes[weapons.quick_boomerang] = 19;
	weapon_palettes[weapons.hard_knuckle] = 20;
	weapon_palettes[weapons.pharoah_wave] = 21;
	weapon_palettes[weapons.gyro_attack] = 22;
	weapon_palettes[weapons.blizzard_shot] = 23;
	weapon_palettes[weapons.slash_claw] = 24;
	weapon_palettes[weapons.thunder_claw] = 25;
	weapon_palettes[weapons.concrete_shot] = 26;
	weapon_palettes[weapons.triple_blade] = 27;
	weapon_palettes[weapons.blazing_torch] = 28;
	weapon_palettes[weapons.lightning_web] = 29;
	weapon_palettes[weapons.frost_spike] = 30;
	weapon_palettes[weapons.soul_body] = 31;
	weapon_palettes[weapons.rising_fire] = 32;
	weapon_palettes[weapons.ground_hunter] = 33;
	weapon_palettes[weapons.aiming_laser] = 34;
	weapon_palettes[weapons.double_cyclone] = 35;
	weapon_palettes[weapons.twin_slasher] = 36;
	weapon_palettes[weapons.sonic_slicer] = 14;
	weapon_palettes[weapons.wheel_cutter] = 15;
	weapon_palettes[weapons.acid_splash] = 17;
	weapon_palettes[weapons.ray_splasher] = 16;
	// Bar Icons
	weapon_icon[weapons.storm_tornado] = 0;
	weapon_icon[weapons.homing_torpedo] = 1
	weapon_icon[weapons.messenko] = 1;
	weapon_icon[weapons.nova_strike] = 2;
	weapon_icon[weapons.lightning_web] = 8; // done, needs snes graphics
	weapon_icon[weapons.double_cyclone] = 6; // done, needs snes graphics
	weapon_icon[weapons.frost_spike] = 3;
	weapon_icon[weapons.ground_hunter] = 4; // done, might need graphical improvements
	weapon_icon[weapons.soul_body] = 8;
	weapon_icon[weapons.twin_slasher] = 4;
	weapon_icon[weapons.aiming_laser] = 6;
	weapon_icon[weapons.rising_fire] = 10;
	// Bar color (Image Index)
	weapon_color[weapons.storm_tornado] = 1;
	weapon_color[weapons.homing_torpedo] = 3;
	weapon_color[weapons.messenko] = 2;
	// Shots Limit
	weapon_shots_limit[weapons.x_buster] = 10;
	weapon_shots_limit[weapons.z_buster] = 3;
	weapon_shots_limit[weapons.hyper_charge] = 2;
	weapon_shots_limit[weapons.homing_torpedo] = 2;
	weapon_shots_limit[weapons.storm_tornado] = 1;
	weapon_shots_limit[weapons.ground_hunter] = 3;
	weapon_shots_limit[weapons.double_cyclone] = 2;
	weapon_shots_limit[weapons.twin_slasher] = 4;
	// Show
	weapon_show[weapons.z_buster] = false;
	weapon_show[weapons.z_saber] = false;
	weapon_show[weapons.falcon_giga] = false;
	// Cost
	weapon_costs[weapons.x_buster] = [0];
	weapon_costs[weapons.z_buster] = [0];
	weapon_costs[weapons.z_buster_x5] = [0];
	weapon_costs[weapons.nightmare_saber] = [0];
	weapon_costs[weapons.messenko] = [7];
	weapon_costs[weapons.hyper_charge] = [4];
	weapon_costs[weapons.nova_strike] = [0];
	weapon_costs[weapons.falcon_giga] = [-1];
	weapon_costs[weapons.x2_giga_crush] = [-1];
	weapon_costs[weapons.ground_hunter] = [0.25];
	weapon_costs[weapons.twin_slasher] = [2];
	weapon_costs[weapons.rising_fire] = [3];
	weapon_costs[weapons.soul_body] = [4];
	weapon_costs[weapons.aiming_laser] = [2];
	weapon_costs[weapons.double_cyclone] = [0.5];
	weapon_costs[weapons.frost_spike] = [3];
	weapon_costs[weapons.lightning_web] = [2];
	
	weapon_costs[weapons.ground_hunter] = [0.25];
	// Max Level
	weapon_max_level[weapons.x_buster] = infinity;
	weapon_max_level[weapons.z_buster] = infinity;
	weapon_max_level[weapons.hyper_charge] = 0;
	// Auto Charge
	weapon_auto_charge[weapons.hyper_charge] = true;
	// Refill by Hit
	weapon_damage_refill[weapons.hyper_charge] = 1;
	weapon_damage_refill[weapons.falcon_giga] = 4;
	weapon_damage_refill[weapons.x2_giga_crush] = 3;
	// Full Sound
	weapon_full_sound[weapons.x2_giga_crush] = snd_player_full_weapon;
	weapon_full_sound[weapons.falcon_giga] = snd_player_full_weapon;
	// Selectable
	weapon_selectable[weapons.z_saber] = false;
	weapon_selectable[weapons.nova_strike] = false;
	weapon_selectable[weapons.falcon_giga] = false;
	// Scripts
	weapons_script[weapons.x_buster] = player_x_buster_x4;
	weapons_script[weapons.z_buster] = player_zero_buster_x1;
	weapons_script[weapons.storm_tornado] = player_x_storm_tornado;
	weapons_script[weapons.homing_torpedo] = player_x_homing_torpedo;
	weapons_script[weapons.sonic_slicer] = player_x_homing_torpedo;
	weapons_script[weapons.wheel_cutter] = player_x_homing_torpedo;
	weapons_script[weapons.acid_splash] = player_x_homing_torpedo;
	weapons_script[weapons.ray_splasher] = player_x_homing_torpedo;
	weapons_script[weapons.hyper_charge] = player_x_hyper_charge;
	weapons_script[weapons.z_buster_x5] = player_zero_buster_x5;
	weapons_script[weapons.nightmare_saber] = player_zero_nightmare_saber;
	weapons_script[weapons.hyper_bomb] = player_x_hyper_bomb;
	weapons_script[weapons.quick_boomerang] = player_x_quick_boomerang;
	weapons_script[weapons.hard_knuckle] = player_x_hard_knuckle;
	weapons_script[weapons.pharoah_wave] = player_x_pharoah_wave;
	weapons_script[weapons.gyro_attack] = player_x_gyro_attack;
	weapons_script[weapons.blizzard_shot] = player_x_blizzard_shot;
	weapons_script[weapons.slash_claw] = player_x_slash_claw;
	weapons_script[weapons.thunder_claw] = player_x_thunder_claw;
	weapons_script[weapons.concrete_shot] = player_x_concrete_shot;
	weapons_script[weapons.triple_blade] = player_x_triple_blade;
	weapons_script[weapons.blazing_torch] = player_x_blazing_torch;
	
	
	weapons_script[weapons.lightning_web] = player_lightning_web;
	weapons_script[weapons.rising_fire] = player_rising_fire;
	weapons_script[weapons.double_cyclone] = player_double_cyclone;
	weapons_script[weapons.twin_slasher] = player_twin_slasher;
	weapons_script[weapons.soul_body] = player_soul_body;
	weapons_script[weapons.aiming_laser] = player_aiming_laser;
	weapons_script[weapons.ground_hunter] = player_ground_chaser;
	weapons_script[weapons.frost_spike] = player_frost_spike;
}
