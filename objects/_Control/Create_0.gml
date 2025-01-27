#region SIMPLE CAMERA

	Zoom = 4;
	ZoomTarget = 4;
	Ratio = 240/320;
	
#endregion

#region SHADER
	
	UCRTParams = shader_get_uniform(SHD_CRT, "params");
	CRT = GameState.CRT;
	CRT.Params_harsh[0] = 320 * global.settings[0];
	CRT.Params_harsh[1] = 240 * global.settings[0];
	CRT.Params_light[0] = 320 * global.settings[0];
	CRT.Params_light[1] = 240 * global.settings[0];
	application_surface_draw_enable(false);
	
#endregion


layer_set_visible(layer_get_id("Guide"), false);

