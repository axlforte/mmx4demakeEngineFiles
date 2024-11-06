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
			room_goto(location);
		}
	}
}