function player_x_variables() {
	// Intro
	intro_animation = "intro2"; // Unarmored part
	intro_end_animation = "intro2_end"; // Armored part

	// Weapon Test
	//player_weapon_set(1, weapons.homing_torpedo);
	//player_weapon_set(2, weapons.storm_tornado);
	player_weapon_set(3, weapons.lightning_web);
	player_weapon_set(4, weapons.frost_spike);
	player_weapon_set(5, weapons.soul_body);
	player_weapon_set(6, weapons.rising_fire);
	player_weapon_set(7, weapons.ground_hunter);
	player_weapon_set(8, weapons.aiming_laser);
	player_weapon_set(9, weapons.double_cyclone);
	player_weapon_set(10, weapons.twin_slasher);
	
	weapon[2] = weapons.x_buster;
	weapon[1] = weapons.x_buster;

	// Charge
	charge_unlocked = true;

	// Mobile buttons
	mobile_buttons_set_sprite(spr_x_mobile_buttons);
	mobile_weapon_swap_set_sprites(spr_mobile_weapon1, spr_mobile_weapon2);
	glow_circle_subtract = [
		{alpha: 0.2, radius: 42 },
		{alpha: 1, radius: 30 }
	];
	
	//trail_mode = 1;
	trail_color = #0047b3;
	player_trail_set(8,3);
	plt_index_default = 12;// this is needed it changes the player to have psx teal underarmor
	dash_speed = 8;
	jump_strength = 10;
	vspeed_max = 2;
}
