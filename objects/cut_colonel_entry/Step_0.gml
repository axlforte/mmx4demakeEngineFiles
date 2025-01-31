event_inherited();
pl_new_room = false;
if(!instance_exists(obj_conversation) && in_cutscene){
	colonel_lerp += 1;
	if(colonel_lerp > colonel_distance / colonel_speed){
		global.met_colonel = true;
		instance_destroy();
	}
} else if(colonel_lerp > 0 && in_cutscene){
	colonel_lerp -= 1;
}