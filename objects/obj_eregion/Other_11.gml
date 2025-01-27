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
		if(t > 30 && t < 60){
			if(hp < max_hp / 2){
				if(t mod 3 == 1){//this one carpet bombs the ground
					var p = instance_create_depth(x + 19*dir, y - 6, depth - 1, obj_eregion_barf);
					p.h_speed = t * dir / 2;
					p.v_speed = 6;
					p.xscale = dir;
					p.owner = id;
				}
			} else {
				if(t mod 9 == 1){//this one shoots in the direction of the player
					var p = instance_create_depth(x + 19*dir, y - 6, depth - 1, obj_eregion_barf);
					p.h_speed = 6 * dir;
					p.v_speed = 0;
					p.xscale = dir;
					p.owner = id;
				}
			}
		}
		
		if(animation_end){
			state_set(boss_states.idle);
		}
		break;
	#endregion
	#region stop hiding and face me like a man
	case intro_boss.fly:
		if(t == 1){
			grav = 0;
			v_speed = 0;
			animation_play("fall");
		} else if(t < 10){
			x += 1 * dir;
			y -= 4
		} else if(t < 20){
			x += 3 * dir;
			y -= 2
		} else if(t < 30){
			x += 4 * dir;
			y -= 1.5
		} else if(t < 40){
			x += 3 * dir;
			y -= 1
		} else if(t < 60){
			x += 2 * dir;
		} else {
			grav = 0.5;
			state_set(boss_states.idle);
		}
		break;
	#endregion
}
