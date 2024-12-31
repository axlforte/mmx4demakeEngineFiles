draw_self();
draw_string(x-10,y-30,string(slope_width) + "," + string(slope_height) + "," + string(slope_scale) + "," + string(width * slope_scale), colors.orange);
draw_string(x-10,y-20,string(grounded) + "," + string(on_slope) + ", " + string(shit), colors.orange);
//draw_sprite(spr_maverickscrap_02, 0,x, y + height + ( width * slope_scale))
draw_point(x,y + height);
if(slope != noone){
	draw_sprite_ext(spr_slope_left1, 0,slope.x, slope.y, slope_width, slope_height, 0, c_yellow, 1);
}