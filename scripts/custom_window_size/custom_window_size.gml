function custom_window_size() {
	// 1, 2, 3, 4, 5
	var s = argument[0];
	global.camera_scale = s;
	window_set_fullscreen((s >= global.fullscreen_index));
	if(global.camera_16_by_9){
		if (s < global.fullscreen_index){
			__view_set(e__VW.WPort, 0, 427);
			window_set_size(427 * s, 240 *s);
		}
	} else {
		if (s < global.fullscreen_index)
			window_set_size(320 * s, 240 *s);
	}
	screen_update_stretched();
	if (global.center_screen) {
		instance_create_depth(0, 0, 0, obj_window_center);
		global.center_screen = false;
	}
	
}
