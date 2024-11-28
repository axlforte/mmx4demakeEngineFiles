function player_door_check() {
	//new code that should work.
	//as it turns out you could activate doors from the wrong side. fixed!
	
	if (state == states.outro) exit;
	
	if(instance_exists(obj_door_parent)){
		var lefty = instance_place(x - 17,y,obj_door_parent);
		if(dir == 1) 
			lefty = false;
		var righto = instance_place(x + 17,y,obj_door_parent);
		if(dir == -1)
			righto = false;
		var footsies = instance_place(x,y + 32,obj_door_parent);
		if(lefty || righto || footsies){
			var door = instance_nearest(x,y,obj_door_parent);
			
			if((door.dir == 1 && lefty) || (door.dir == -1 && righto)){
				return;
			}
			with (door) {
				target = other;
				state_set(door_states.open);
			}
			h_speed = 0;
			v_speed = 0;
			physics_ignore_frame = 1;
			if (door.is_vertical && door.dir == 1)
				animation_play("fall", 8);
			audio_stop(land_sound);
		}
	}
}
function doors_get_first_collision(positions) {
	var inst = noone;
	for (var i = 0, len = array_length(positions); i < len; i++) {
		inst = instance_place(x + positions[i].x, y + positions[i].y, obj_door_parent);
		if (inst != noone) break;
	}
	return inst;
}