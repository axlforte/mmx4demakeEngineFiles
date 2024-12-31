function player_x_variables() {
	// Intro
	intro_animation = "intro2"; // Unarmored part
	intro_end_animation = "intro2_end"; // Armored part

	// Weapon Test
	//player_weapon_set(1, weapons.homing_torpedo);
	//player_weapon_set(2, weapons.storm_tornado);
	player_x_weapon_reset();
	
	weapon[2] = weapons.x_buster;
	weapon[1] = weapons.x_buster;

	// Charge
	charge_unlocked = true;

	// Mobile buttons
	mobile_buttons_set_sprite(spr_charge_particle);
	mobile_weapon_swap_set_sprites(spr_mobile_weapon1, spr_mobile_weapon2);
	glow_circle_subtract = [
		{alpha: 0.2, radius: 42 },
		{alpha: 1, radius: 30 }
	];
	
	//trail_mode = 1;
	trail_color = #0047b3;
	player_trail_set(8,3);
	
	plt_index_default = 12;// this is needed it changes the player to have psx teal underarmor
	//dash_speed = 8;
	//jump_strength = 10; // for debugging purposes
	//vspeed_max = 2;
}

function player_x_weapon_reset(){
	if(global.web_spider_defeat)
		player_weapon_set(1, weapons.lightning_web);
	if(global.frost_walrus_defeat)
		player_weapon_set(2, weapons.frost_spike);
	if(global.split_mushroom_defeat)
		player_weapon_set(3, weapons.soul_body);
	if(global.magma_dragoon_defeat)
		player_weapon_set(4, weapons.rising_fire);
	if(global.jet_stingray_defeat)
		player_weapon_set(5, weapons.ground_hunter);
	if(global.cyber_pea_cock_defeat)
		player_weapon_set(6, weapons.aiming_laser);
	if(global.storm_owl_defeat)
		player_weapon_set(7, weapons.double_cyclone);
	if(global.slash_beast_defeat)
		player_weapon_set(8, weapons.twin_slasher);
}

function player_trail_minimize(){
	player_trail_set(0,3);
}

function player_trail_maximize(){
	player_trail_set(8,3);
}