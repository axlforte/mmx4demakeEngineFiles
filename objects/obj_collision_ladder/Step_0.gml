with(obj_player_parent){
	if((bbox_left) < other.x + 32 && (bbox_right) > other.x && 
	((key_up != 0 || key_p_down != 0) || !is_on_floor() && ( key_up != 0 || key_down != 0))){
		if(y > other.y && y < other.y + other.image_yscale*16 && state != states.ladder){
			state = states.ladder;
			x = other.x + 16;
			top_of_ladder = other.y;
			state_timer = 2;
		}
	}
}