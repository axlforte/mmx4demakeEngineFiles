if(i_time >= interval){
	i_time = 0;
	if(diagonal == false){
		instance_create_depth(x,y, depth,obj_dragoon_rock);
	} else {
		instance_create_depth(x,y,depth, obj_dragoon_rock_diagonal);
	}
	
	if(abs(instance_nearest(x,y,obj_player_parent).x - x) < 160){
		audio_play(snd_magma_dragoon_fire);
	}
} else {
	i_time++;
}