
// fuck yoku blocks, i cant coordinate that well
if(yoku_clock >= yoku_timer){
	if(yoku_interactible){
		yoku_interactible = false;
		y -= 4096;
		sprite_index=noone;
	}else {
		yoku_interactible = true;
		y += 4096;
		sprite_index=yoku_image;
	}
	yoku_clock = 0;
} else if(global.pause_type == pause_types.none){
	yoku_clock += 1;
}

if(!has_applied_offset){
	yoku_clock += yoku_offset;
	has_applied_offset = true;
}