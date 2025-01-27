if global.crt > 0 && global.settings[0] != global.fullscreen_index//streched made the system shit itself
{
	shader_set(SHD_CRT);

	// If using shader on GUI layer, set resolution
	// CRT.SetResolution(window_get_width(), window_get_height());
	if(global.crt == 1	)
		shader_set_uniform_f_array(UCRTParams, CRT.Params_light);
	else 
		shader_set_uniform_f_array(UCRTParams, CRT.Params_harsh);

}
gpu_set_blendenable(false);
var drawsize = (global.settings[0] < global.fullscreen_index - 1 ? global.settings[0] : 3.5);//.125
var drawsize_y = drawsize;
if(global.settings[0] == global.fullscreen_index)
	drawsize_y = (16/9) * drawsize;
var _x_off = 0;
if(global.settings[0] == 4)
	_x_off = (display_get_width() - (320 * (display_get_height() / 240)))/2
draw_surface_ext(application_surface, _x_off, 0, drawsize + 1, drawsize_y + 1, 0, c_white, 1);
gpu_set_blendenable(true);
shader_reset();