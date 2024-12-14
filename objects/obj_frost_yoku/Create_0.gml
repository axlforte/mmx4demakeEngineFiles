event_inherited();
wall_jumpable = false;
ice_slope = 0; //0 for flat, 1 for slanted down left, 2 for slanted down right
yoku_offset += yoku_timer*2 - (x % yoku_timer*2);
yoku_image = Icy_Yoku_Block;
if(yoku_offset > yoku_timer){
	yoku_interactible = !yoku_interactible;
	yoku_offset -= yoku_timer;
		y -= 4096;
		sprite_index=noone;
}
if(ice_slope > 0)
{
	slewpe = obj_slope_left_1;
	slewpe.image_xscale = 0.5 * ((ice_slope-1)*2-1);
	slewpe.x = x + (ice_slope-1)*8;
	slewpe.y = y - 28;
}

apha = 0;