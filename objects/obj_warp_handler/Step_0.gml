scr_keys_update();
if(key_p_left){
	if(index == 0){
		index = ds_list_size(possible_locations) - 1;
	} else {
		index--;
	}
}

if(key_p_right){
	if(index ==  ds_list_size(possible_locations) - 1){
		index = 0
	} else {
		index++;
	}
}

if(key_p_down){
	global.door_id = -2;
	room_goto(ds_list_find_value(possible_locations, index));
}

if(key_p_dash){
	with(obj_player_parent){
		locked = false;
	}
	instance_destroy();
}