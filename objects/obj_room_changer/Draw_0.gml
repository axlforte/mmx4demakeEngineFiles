if(interactible){
	if(auto_door)
		if(global.difficulty < diff_modes.hard)
			draw_sprite_ext(spr_skill_selected, auto_door_image_index, floor(x), floor(y), 1, 1, 0, c_white, 1);
	else
		draw_sprite_ext(sprite_index, floor(image_index), floor(x), floor(y), 1, 1, 0, c_white, 1);
}

if(auto_door_image_index > 1.5){
	auto_door_image_index = 0;
} else {
	auto_door_image_index += 0.25
}