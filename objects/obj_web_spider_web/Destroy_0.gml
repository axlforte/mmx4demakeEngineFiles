if (is_inside_view()) {
	instance_create_depth(x, y, depth - 1, explode_FX);	
}
with(obj_player_parent){
	locked = false;
}