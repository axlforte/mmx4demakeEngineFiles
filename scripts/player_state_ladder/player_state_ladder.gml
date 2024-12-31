function player_state_ladder() {
	var t = state_timer;
	
	if(t == 0){
		trail_sprites_enabled = false;
		trail_sprites_remove = true;
		
		player_effects_reset();
	}
	
	v_speed = 0;
	grav = 0;
	
	if(t < 4){
		animation_play("ladder", 1);
	} else if(top_of_ladder < y){
		animation_play("ladder", ladder_anim % 32 + 4);
		
		
		if(key_up)
		{
			v_speed = ladder_speed * -1;
			ladder_anim ++;
		} else if(key_down){
			v_speed = ladder_speed;
			ladder_anim --;
		}
		
		if(key_p_left){
			dir = -1;
		} else if(key_p_right){
			dir = 1;
		}
	} else if(top_of_ladder - 16 < y) {
		animation_play("ladder", 39);
		y -= 17;
	} else {
		player_state_set(states.land, 1);
		animation_play("land");
		v_speed = 0;
		h_speed = 0;
		y -= 1;
		player_counters_reset();
		walk_speed = walk_speed_default;
		audio_play(land_sound);
	}
	

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
	
	if(key_p_jump){
		player_state_set(states.fall, 1);
		v_speed = 0;
		h_speed = 0;
		walk_speed = walk_speed_default;
		audio_play(land_sound);
	}
	
	
	player_check_jump();
}
