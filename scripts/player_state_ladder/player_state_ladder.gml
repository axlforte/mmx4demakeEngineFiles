function player_state_ladder() {
	var t = state_timer;
	
	if(t == 0){
		trail_sprites_enabled = false;
		trail_sprites_remove = true;
	}
	
	v_speed = 0;
	grav = 0;
	var outtro = 0;
	
	if(top_of_ladder < y){
		animation_play("ladder", t % 24);
		if(key_up)
		{
			v_speed = ladder_speed * -1;
			var t = state_timer++;
		} else if(key_down){
			v_speed = ladder_speed;
			var t = state_timer++;
		}
	} else if(top_of_ladder - 16 < y) {
		animation_play("ladder", 28);
		/*if(outtro == 0){
			outtro = t + 15;
			//y -= 8;
		}
		
		if(outtro < t){
			y -= 9;
		}*/
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
