scr_keys_update();

var myPlayer = instance_nearest(x, y, obj_player_parent);
var _x = x - myPlayer.x;
var _y = y - myPlayer.y;

var close = _x + _y;

if(key_p_up && interactible && close < 64 && !convo_active){
	converse = instance_create_depth(x + 4,y + 4,-100, obj_conversation);
	converse.conversation = convo;
	convo_active = true
	with(obj_player_parent){
		locked = true;
	}
}

if(convo_active){
	if(!instance_exists(obj_conversation)){
		with(obj_player_parent){
			locked = false;
		}
		convo_active = false;
	}
}