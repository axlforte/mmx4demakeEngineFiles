function player_pause_check() {
	if (key_p_start) {
		if (G.pause_type != pause_types.door) {
			pause_set(!global.paused, pause_types.normal);
			if(instance_exists(obj_pause_menu)){
				instance_destroy(instance_find(obj_pause_menu,0));
			} else {
				instance_create_depth(camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]),-600,obj_pause_menu);
			}
		}
	}


}
