#region UPDATE CAMERA
	x = global.player_x;
	y = global.player_y;
#endregion

if(global.crt == 0){
	application_surface_draw_enable(true);
} else {
	application_surface_draw_enable(false);
}