scr_keys_update();

if(key_p_up){
	var converse = instance_create_depth(x + 4,y + 4,-100, obj_conversation);
	converse.conversation = convo;
}