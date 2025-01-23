enum intro_boss {
	slash,
	fly,
	pew
}
switch(state) {
	#region stop hiding and face me like a man
	case intro_boss.slash:
		if(t == 0){
			animation_play("slash");
		}
		
		if(animation_end){
			state_set(boss_states.idle);
		}
		break;
	#endregion
	#region stop hiding and face me like a man
	case intro_boss.pew:
		if(t == 0){
			animation_play("pew");
		}
		
		if(hp < max_hp / 2){
			if(t mod 3 == 1){//this one carpet bombs the ground
				var p = instance_create_depth(x + 19*dir, y - 6, depth - 1, obj_x4_standard_bullet);
				p.h_speed = t * dir;
				p.v_speed = -6;
				p.xscale = dir;
				p.owner = id;
			}
		} else {
			if(t mod 8 == 1){//this one shoots in the direction of the player
				var p = instance_create_depth(x + 19*dir, y - 6, depth - 1, obj_x4_standard_bullet);
				p.h_speed = 5 * dir;
				p.v_speed = 0;
				p.xscale = dir;
				p.owner = id;
			}
		}
		
		if(animation_end){
			state_set(boss_states.idle);
		}
		break;
	#endregion
	#region stop hiding and face me like a man
	case intro_boss.fly:
		if(t == 0){
			animation_play("fall");
		}
		
		if(t < 10){
			x += 2 * dir;
		} else if(t < 20){
			x += 3 * dir;
			y -= 0.25;
		} else if(t < 30){
			x += 4 * dir;
			y -= 0.5;
		} else if(t < 40){
			x += 3 * dir;
			y -= 1;
		} else {
			state_set(boss_states.idle);
		}
		break;
	#endregion
}
