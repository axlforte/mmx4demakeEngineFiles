function boss_death_x1() {
	v_speed = 0;
	h_speed = 0;
	grav = 0;
	damageable = false;
	light = 0;
	// Play animation
	if (t == 0) {
		animation_play(death_animation);
		with (obj_player_parent) {
			auto_regen = false;
			pause_enabled = false;
		}
		if (grab_player_inst != noone) {
			with (grab_player_inst) {
				player_check_fall();
				player_check_idle();	
			}
		}
		if(object_index == obj_pharoah_man){
			global.pharoah_dash = true;
		}
		with (obj_player_parent) {
			if (armor_is_full("") && FULL == "") {
				if (hp == max_hp) {
					if (my_character == pl_char.x && other.object_index == obj_chill_penguin) {
						global.unarmored_x_defeat = 1;	
					}
				}
			}
			player_x_weapon_reset();
		}
	}
	// Resume all sounds
	if (t == 59) {
		audio_resume_all();
		pause_set(false);
		with (obj_player_parent) {
			//locked = true;	
		}
	}
	// Create red transparency effect
	if (t == 60) {
		var transp = transition_create(transition_types.transparency, obj_player_parent.depth + 10);
		transp.color = c_red;
		transp.transition_limit = 200;
		transp.alpha = 0.1;
	}
	// Explosion Sound
	if (t == 62) {
		audio_play(snd_boss_explosion_x1);	
	}
	// Blink
	if (t == 179) {
		var tran = transition_create(transition_types.blink);
		tran.color = c_white;
		tran.blink_limit = 4;
		tran.transition_limit = 5;
	}
	// Black Fade Alpha
	if (t >= 193 && t <= 253) {
		fade_alpha = (t - 193) / 60;
	}
	if (t >= 345 && t <= 365) {
		fade_alpha = 1 - (t - 345) / 20;
	    normal_alpha = 0;
	}
	// Update Depth
	if (t >= 192) {
	    depth = obj_player_parent.depth + 8;
	}
	// Fade in through the white
	if (t == 192) {
		var tran = transition_create(transition_types.fade_out_and_fade_in, obj_player_parent.depth + 9);
		tran.color = c_white;
		tran.transition_limit = 120;
		tran.wait_timer = 161;
	}
	// Explosions
	if (t >= 62 && t <= 371) {
	    if (((t - 62) mod 3) == 0) {
			var index = (t - 62) / 4;
			instance_create_depth(x + irandom_range(-30, 30), y + irandom_range(-30, 30), depth - index, explode_FX);
		}
	}
	if (t == 507) {
		with (obj_player_parent) {
			boss_complete_music = "BossDefeated";
			music_play(boss_complete_music);
		}
		global.current_music = prev_mus;
	}
	
	if(t == 860){
		with (obj_player_parent) {
			//locked = false;
			pause_enabled = true;
			//music_play(global.current_music);
			music_play(global.current_music);
		}
		instance_destroy();
	}


}
