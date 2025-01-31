if(in_cutscene){
	if(!instance_exists(obj_conversation)){
		if(pl_new_room){
			global.is_using_door = 1;
			global.levelTransitionY = 128;
			room = rm_next;
		} else {
			with(obj_player_parent){
				locked = false;
			}
		}
	} else {
		with(obj_player_parent){
			locked = true;
		}
	}
}

