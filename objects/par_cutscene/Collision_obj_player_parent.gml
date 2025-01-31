if(!in_cutscene){
	with(obj_player_parent){
		locked = true;
	}
	in_cutscene = true;
	convo = instance_create_depth(x,y,-600,obj_conversation);
	convo.conversation = dialouge;
	convo.lines = lines;
}