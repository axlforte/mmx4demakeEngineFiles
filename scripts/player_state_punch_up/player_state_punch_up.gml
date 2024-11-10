function player_state_punch_up() {
	var t = state_timer++;

	// State Properties
	grav = 0;
	v_speed = 0;
	using_special_weapon = true;
	shoot_wait = true;
	player_effects_reset();

	// [Animations]
	// Start Animation
	if (t == 0)
	{
		if (is_on_floor())
			animation_play("punch_up");	
		else
			animation_play("punch_up_air");	
	}

	// Create Projectiles
	if (t == shoot_at_time) {
		player_shoot_projectile(shoot_next_projectile);
	}

	if (charge_level == 0) {
		player_charge_reset();	
	}

	if (t > shoot_limit) {
		player_check_idle();
		player_check_fall();
		using_special_weapon = false;
		shoot = false;
		shoot_wait = false;
		charge_enabled = true;
	}



}
