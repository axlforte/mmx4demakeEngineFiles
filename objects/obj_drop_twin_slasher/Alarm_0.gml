if(global.rando_item_locations[rando_id] != self && !has_been_randoed){
	var randy = instance_create_depth(x,y,depth,global.rando_item_locations[rando_id]);
	randy.has_been_randoed = true;
	instance_destroy();
}