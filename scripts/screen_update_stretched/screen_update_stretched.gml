function screen_update_stretched() {
	var base_w = 320;
	
	var base_h = 240;
	if(global.camera_16_by_9){
		base_w = 427 * global.camera_scale;
		base_h = base_h * global.camera_scale;
	}
	var ww = base_w, hh = base_h;

	// Stretched
	if (global.settings[0] == global.fullscreen_index) {
		base_w = display_get_width();
	    base_h = display_get_height();
	    var aspect = base_w / base_h ; // Get the game aspect ratio
	    hh = base_h;
	    ww = hh * aspect;
	}

	surface_resize(application_surface, ww, hh);


}
