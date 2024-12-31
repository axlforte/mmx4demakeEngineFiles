scr_keys_update();

if(key_p_left){
	if(index == 0){
		index = max_saves - 1;
		n_index = 0;
	} else {
		index--;
		if(index == 0){
			p_index = max_saves - 1;
		}
	}
	slerp = s_timer;
	s_dir = -1;
	global.game_save_num = index;
}
if(key_p_right){
	if(index == max_saves - 1){
		index = 0;
		p_index = max_saves - 1;
	} else {
		index++;
		if(index == max_saves - 1){
			n_index = 0;
		}
	}
	slerp = s_timer;
	s_dir = 1;
	global.game_save_num = index;
}

if(key_p_start){
	scr_load_game_data();
	room = get_save_location_in_room_terms();	
}

if(slerp > 0){
	slerp--;
}