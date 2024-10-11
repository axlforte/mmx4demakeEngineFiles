enum slash_beastleo {
	funk,
	ass,
	way,
	to,
	code,
	man,// this is because enums are just a fancy
	drop_kick,//wrapper for ints
	flip_slash,
	screw_driver
}
switch(state) {
	
	#region do it again loser
	case boss_states.idle:
			state_set(slash_beastleo.drop_kick, 0, [0]);
		break;
	#endregion
	
	#region drop kick hiyah
	case slash_beastleo.drop_kick:
		// Play animation
		if (t == 0) {
			animation_play("jump");
		}
		// Set initial vertical speed, apply gravity
		if (t == jump_wait) {
			v_speed = -jump_strength;
			grav = gravity_default;
		}
		
		if(v_speed >= 0){
			animation_play("kick");
			v_speed = drop_kick_speed;
			h_speed = dir * drop_kick_speed * 2;
		}
		// Starting to fall
		if (v_speed >= 0 && is_on_floor()) {
			state_set(boss_states.idle, 0, [0]);
			animation_play("land");
			h_speed = 0;
		}
		break;
	#endregion
	
	#region do a flip
	case slash_beastleo.flip_slash:
		// Play animation
		if (t == 0) {
			animation_play("flip");
		}
		// Set initial vertical speed, apply gravity
		if (t == jump_wait) {
			//animation_play("flip");
			
			var shot = instance_create_depth(x + 20*dir, y, depth - 1, obj_slash_beast_slash);
			shot.dir = dir;
			shot.xscale = -dir;
			shot.h_speed = 4*dir;
			
			var shot2 = instance_create_depth(x + 20*dir, y, depth - 1, obj_slash_beast_slash_tilted);
			shot2.dir = dir;
			shot2.xscale = -dir;
			shot2.h_speed = 4*dir;
			
			v_speed = -jump_strength;
			grav = gravity_default;
		}
		// Starting to fall
		if (v_speed >= 0) {
			state_set(boss_states.fall, 0, [0]);
		}
		break;
	#endregion
	
	#region gtfo my house
	case slash_beastleo.screw_driver:
		// Play animation
		if (t == 0) {
			animation_play("pdcharge");
		}
		// Set initial horiz speed, dont apply gravity
		if (t == jump_wait) {
			//animation_play("pdpunch");
			grav = 0;
			h_speed = dir * dash_speed;
		}
		// hit a wall
		if (t == charge_limit) {
			state_set(boss_states.idle, 0, [0]);
			h_speed = 0;
		}
		break;
	#endregion
}