px = G.player_x;
py = G.player_y;
scr_keys_update();
if(px < x + width && px > x){
	if(py > y && py < y + height){
		if(key_p_up){
			global.exitALevelTransition = true;
			global.levelTransitionX = loc_x;
			global.levelTransitionY = loc_y;
			global.levelTransitionCameraId = cam;
			//global.TeleportIn = false;
			//var tran = transition_create(transition_types.fade_out);
			//tran.color = c_white;
			//tran.depth = layer_get_depth(layer_get_id("Camera")) - 400;
			//tran.transition_limit = 120;
			//tran.wait_timer = 60;
			dlay = 5;
		}
	}
}

if(!CANDOOR){
	room_goto(location);
} else if (dlay > 0){
	dlay -= 1;	
} else if(dlay == 0){
	CANDOOR = false;
}