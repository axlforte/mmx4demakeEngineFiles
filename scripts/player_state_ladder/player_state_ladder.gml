function player_state_ladder() {
	var t = state_timer;
	
	
	v_speed = 0;
	grav = 0;
	
	if(key_up)
	{
		v_speed = ladder_speed * -1;
		var t = state_timer++;
	} else if(key_down){
		v_speed = ladder_speed;
		var t = state_timer++;
	} else {
	}
	
	animation_play("ladder", t % 24);

	if (is_on_floor() && !key_up) {
		player_state_set(states.land, 1);
		animation_play("land");
		v_speed = 0;
		h_speed = 0;
		move_down();
		player_counters_reset();
		walk_speed = walk_speed_default;
		audio_play(land_sound);
	}
	
	if(key_jump){
		player_state_set(states.fall, 1);
		v_speed = 0;
		h_speed = 0;
		walk_speed = walk_speed_default;
		audio_play(land_sound);
	}
	
	
	player_check_jump();
}
