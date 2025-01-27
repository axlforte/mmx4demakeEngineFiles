if(pickup_type == pickup_types.hp && global.overcharged_systems){
	amount+= 3;
} else if(pickup_type == pickup_types.hp && global.energy_expert){
	amount++;
} else if(pickup_type = pickup_types.wp && global.weapons_specialist){
	amount++;
}
start_amount = amount;
if(global.rando && rando_id != -1){
	if(global.rando_item_locations[rando_id] != self && !has_been_randoed){
		var randy = instance_create_depth(x,y,depth,global.rando_item_locations[rando_id]);
		randy.has_been_randoed = true;
		instance_destroy();
	}
}