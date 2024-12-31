function companion_determine_keys(){
		key_shoot = false;
		key_dash = false;
		if(!dash){
		key_p_dash = false;
		}
	
	//state machine determination
	
	if(instance_exists(obj_player_x)){
		var _x = instance_nearest(x,y,obj_player_x).x;
		var _y = instance_nearest(x,y,obj_player_x).y;
	} else if(instance_exists(obj_player_zero)){
		var _x = instance_nearest(x,y,obj_player_zero).x;
		var _y = instance_nearest(x,y,obj_player_zero).y;
	}
			target_loc[0] = _x;
			target_loc[1] = _y;
	
	switch(companion_state){
		case(comp_states.idle):
				key_right = false;
				key_left = false;
			if(abs(x - target_loc[0]) > comp_follow_dist || abs(y - target_loc[1]) > comp_follow_dist){
				companion_state = comp_states.move;
			}
		break;
		
		case(comp_states.attack):
			key_right = false;
			key_left = false;
			if(!key_shoot){
				key_p_shoot = true;
			} else {
				key_p_shoot = false;
			}
			if(state_timer % 5 == 2){
				key_shoot = true;
			} else {
				key_shoot = false;
			}
				
			if(abs(x - target_loc[0]) > 64 || abs(y - target_loc[1]) > 64){
				companion_state = comp_states.move;
			}
		break;
		
		case(comp_states.move):
			if(instance_exists(par_enemy)){
				companion_state = comp_states.attack;
			}
			
			if(y - 32 > target_loc[1]){
				key_jump = true;
			}
			
			if(target_loc[0] > x + comp_follow_dist){
				if(target_loc[0] > x + comp_follow_dist * 2){
					if(!dash){
						key_p_dash = true;
					}
					key_dash = true;
				}
				key_right = true;
				key_left = false;
			} else if(target_loc[0] < x - comp_follow_dist){
				if(target_loc[0]  < x - comp_follow_dist * 2){
					if(!dash){
						key_p_dash = true;
					}
					key_dash = true;
				}
				key_right = false;
				key_left = true;
			} else {
				key_right = false;
				key_left = false;
			}
			
			if(instance_place(x + 16, y, par_destructibleobject) != noone && charge_level < 2){
				if(!key_shoot){
					key_p_shoot = true;
				} else {
					key_p_shoot = false;
				}
				if(state_timer % 5 == 2){
					key_shoot = true;
				} else {
					key_shoot = false;
				}
			}
		break;
	}
	/*
	//actual keys determination
	if(instance_exists(par_enemy) ){
		var enem = instance_nearest(x,y,par_enemy)
		if(enem.x > x + 45){
			key_right = true;
			key_left = false;
		} else if(enem.x < x - 45){
			key_right = false;
			key_left = true;
		} else {
			key_right = false;
			key_left = false;
		}
		if(state_timer % 3 == 2){
			key_shoot = true;
		} else {
			key_shoot = false;
		}
	} else if(global.player_x > x + 10){
		if(global.player_x > x + 80){
			if(!dash){
				key_p_dash = true;
			}
			key_dash = true;
		}
		key_right = true;
		key_left = false;
	} else if(global.player_x < x - 10){
		if(global.player_x < x - 80){
			if(!dash){
				key_p_dash = true;
			}
			key_dash = true;
		}
		key_right = false;
		key_left = true;
	} else {
		key_right = false;
		key_left = false;
	}
	
	//intro breakable barriers
	if(instance_place(x + 16, y, par_destructibleobject) != noone && charge_level < 2){
		if(!key_shoot){
			key_p_shoot = true;
		} else {
			key_p_shoot = false;
		}
		if(state_timer % 5 == 2){
			key_shoot = true;
		} else {
			key_shoot = false;
		}
	}
	
	//wall fixes
	if(!can_move_x(walk_speed*dir)){
		key_jump = true;
	} else {
		key_jump = false;
	}
	
	*/
	
	if(shots_count > 0 && !instance_exists(obj_player_shot_parent)){
		shots_count--;
	}
}