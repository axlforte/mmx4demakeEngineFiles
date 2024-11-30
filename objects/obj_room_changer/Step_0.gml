px = G.player_x;
py = G.player_y;
scr_keys_update();
if(px < x + width && px > x){
	if(py > y && py < y + height){
		if(key_p_up && candoor){
			candoor = false;
			with(obj_player_parent){
				locked = true;
			}
			
			tran_timer++;
			animation_play("opening", 0);
		}
	}
}

if(tran_timer > 0){
	if(tran_timer > 30){
		global.exitALevelTransition = true;
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