px = G.player_x;
py = G.player_y;
scr_keys_update();

if(left_facing){
	if(px < x && px > x - width){
		if(py > y && py < y + height){
			if(((key_p_up && interactible && !global.paused) || auto_door) && candoor){
				candoor = false;
				with(obj_player_parent){
					locked = true;
				}
			
				var fun = instance_create_depth(x,y,-1000,obj_transition_effect);
				fun.transition_type = transition_types.fade_out;
				fun.wait_timer = 0;
				fun.transition_limit = door_tran_effect_limit;
				fun.alpha_start = 0;
				tran_timer++;
				animation_play("opening", 0);
			}
		}
	}
} else {
	if(px < x + width && px > x){
		if(py > y && py < y + height){
			if(((key_p_up && interactible && !global.paused) || auto_door) && candoor){
				candoor = false;
				with(obj_player_parent){
					locked = true;
				}
			
				var fun = instance_create_depth(x,y,-1000,obj_transition_effect);
				fun.transition_type = transition_types.fade_out;
				fun.wait_timer = 0;
				fun.transition_limit = door_tran_effect_limit;
				fun.alpha_start = 0;
				tran_timer++;
				animation_play("opening", 0);
			}
		}
	}
}
//show_debug_message(global.player_y);
if(tran_timer > 0){
	if(tran_timer > door_tran_effect_limit){
		global.exitALevelTransition = true;
		global.level_transition_use_door_locs = use_location_over_door_id;
		global.door_id = id_to_go_to;
		global.TeleportIn = false;
		global.levelTransitionX = loc_x;
		global.levelTransitionY = loc_y;
		//global.levelTransitionCameraId = cam;
		if(instance_nearest(x, y, obj_player_parent) != noone){
			instance_destroy(instance_nearest(x, y, obj_player_parent));
		}
		room = location;
	} else {
		tran_timer++;
	}
	
}