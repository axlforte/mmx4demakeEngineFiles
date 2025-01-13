enum pharoah_man {
	wave,
	yeet,
	yeet_fall,
	change,
	pose,
	messiah
}
switch(state) {
	#region throw the wave
	case pharoah_man.wave:
		// Play animation
		if (t == 0) {
			animation_play("wave_charge");
		}
		if(t == wave_wait_limit){
			animation_play("wave_shoot");
			var shot = instance_create_depth(x + 20*dir, y, depth - 1, obj_pharoah_wave);
			shot.dir = dir;
			shot.xscale = -dir;
			shot.h_speed = shot.abs_hspeed*dir;
			state_set(boss_states.idle)
		}
		break;
	#endregion
	#region yeet
	case pharoah_man.yeet:
		// Play animation
		if (t == 0) {
			animation_play("jump");
			y -= 8;
			var d = global.player_x - x; // Hor Distance
			var h1 = (abs(d) + 1) / 2; // Max height relative to the pickaxe
			var h2 = max(0, h1 + global.player_y - y) + 2; // Max height relative to the player
			h_speed = d * sqrt(grav) / (sqrt(2) * (sqrt(h1) + sqrt(h2)));
			v_speed = -sqrt(2 * grav * h1);
		}
		
		if(v_speed > 0){
			state_set(pharoah_man.yeet_fall)
		}
		break;
	#endregion
	#region yeet but fall
	case pharoah_man.yeet_fall:
		// Play animation
		if (t == 0) {
			animation_play("fall_attack");
			if(light_mode_enabled)
				var shot = instance_create_depth(x + 20*dir, y, depth - 1, obj_pharoah_shot);
			else
				var shot = instance_create_depth(x + 20*dir, y, depth - 1, obj_pharoah_shot_dark);
			shot.dir = dir;
			shot.xscale = -dir;
			var _x = global.player_x - x;
			var _y = global.player_y - y;
			
			var _e = sqrt(power(_x,2) + power(_y, 2));
			
			shot.h_speed = _x / _e;
			shot.v_speed = _y / _e;
			
			if(!light_mode_enabled){
				shot.h_speed = shot.h_speed * -1;
				shot.v_speed = shot.v_speed * -1;
			}
		}
		
		if(is_on_floor()){
			state_set(boss_states.idle)
			h_speed = 0;
		}
		break;
	#endregion
	#region swap from light mode to dark mode
	case pharoah_man.change:
		// Play animation
		if (t == 0) {
			light_mode_enabled = !light_mode_enabled;
			animation_play("swap");
			if(light_mode_enabled){
				plt_index_default = 0;
				sprite_index = spr_pharoah_man;
			} else {
				plt_index_default = 1;
				sprite_index = spr_pharoah_man_dark_mode;
			}
		}
		
		if(t == 12){
			state_set(boss_states.idle)
		}
		break;
	#endregion
	#region do the ult, either dark or light ult
	//dark ult: soul spikes
	//light ult: sky beams
	case pharoah_man.messiah:
		// Play animation
		if (t == 0) {
			animation_play("messiah")
			grav = 0;
			v_speed = 0;
			y-= 8;
		} else if(t < 30){
			y--;
		} else if(t < 90 && t % 2 == 0){
			y--;
		} else if(t < 120 && t %4 == 0){
			y--;
		} else if(t == 600){
			state_set(boss_states.fall)
			grav = gravity_default;
		}
		
		if(light_mode_enabled){
			if(t % 60 == 15)
				instance_create_depth(x + random_range(-128,128), y, depth - 1, obj_pharoah_beam_light);
		}else{
			if(t % 90 == 15)
				instance_create_depth(x + random_range(-128,128), y, depth - 1, obj_pharoah_beam_dark);
		}
		break;
	#endregion
	#region KONO DIO DA
	case pharoah_man.pose:
		// Play animation
		if (t == 0) {
			animation_play("death");
		} else if(t == idle_limit){
			state_set(boss_states.idle)
		}
		break;
	#endregion
}
