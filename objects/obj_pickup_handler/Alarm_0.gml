if(pickup_type == pickup_types.hp && global.overcharged_systems){
	amount+= 3;
} else if(pickup_type == pickup_types.hp && global.energy_expert){
	amount++;
} else if(pickup_type = pickup_types.wp && global.weapons_specialist){
	amount++;
}
start_amount = amount;