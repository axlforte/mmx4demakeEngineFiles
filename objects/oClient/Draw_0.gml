/// @description  Draw all sprites in level

// set the X and Y of the client so the room "follows" our player
x = clientx;
y = clienty;

// Now loop through all active sprites and draw them
var index = 0;
for(var i = 0; i < sprites; ++i;)
{    
	var xx = ds_list_find_value(allsprites, index++);
	var yy = ds_list_find_value(allsprites, index++);
	var sp = ds_list_find_value(allsprites, index++);
	var spindex = ds_list_find_value(allsprites, index++);
	var dir = ds_list_find_value(allsprites, index++);
	name = ds_list_find_value(allsprites, index++);
	if(!(global.ServerName == name)){
		draw_sprite_ext(sp,spindex, xx, yy, dir, 1, 0, c_white, 1);
		draw_set_color(c_white);
		draw_set_font(fName);
		draw_set_halign(fa_center);
		draw_text(xx + 16, yy - 32, string(name));
	}
}






