function scr_rando_settings(){
	
	global.rando = true;
	
	//mhp = medium health pickup,
	//swp = small weapon pickup, etc
	//so i meant to do (demo) instead of (demp) but its funny ergo im keeping it
	checks = [
		obj_pickup_life_2,//mwp at bottom of ladder, stingray
		obj_pickup_wp_2,//mhp between crates, stingray
		obj_pickup_life_2,//mhp 1 on rafter, stingray
		obj_pickup_wp_2,//mwp on rafter, stingray
		obj_pickup_life_2,//mhp 2 on rafter, stingray
		obj_pickup_heart,//stingray heart tank//id = 1
		obj_drop_ground_hunter,//ground hunter drop//
		obj_pickup_wp_1,//shp by pharoah room
		obj_pickup_life_1,//swp by pharoah room
		obj_pickup_life_2,//mhp by boots, spider
		obj_drop_soul_body,//soul body pickup(demp)//
		obj_pickup_life_1,//shp 1 by heart tank, spider
		obj_pickup_life_1,//shp 2 by heart tank, spider
		obj_pickup_wp_1,//swp 1 by heart tank, spider
		obj_pickup_heart,//spider heart tank//id = 2
		obj_pickup_life_2,//mhp by met, spider
		obj_pickup_life_1,//shp by met, spider
		obj_pickup_wp_2,//mwp by aiming laser (demp)//
		obj_drop_aiming_laser,//aiming laser(demp)//
		obj_drop_lightning_web,//lightning web//
		obj_drop_sub_tank,//sub tank 1
		obj_drop_double_cyclone,//double cyclone(demp)//
		obj_drop_twin_slasher,//twin slasher(demp)//
		obj_pickup_heart,//dragoon haert tank//id = 3
		obj_drop_rising_fire//rising fire
	]

	global.rando_item_locations = [array_length(checks)];
	
	var _has_been_randoed = array_create(array_length(checks), false);
	show_debug_message(string(array_length(_has_been_randoed)) + ", " + string(array_length(checks)));
	
	for(var r = 0; r < array_length(_has_been_randoed);r++){
		var iteem = set_rando_position(_has_been_randoed);
		show_debug_message(string(iteem) + "worked for position " + string(r));
		global.rando_item_locations[r] = checks[iteem];
		_has_been_randoed[iteem] = true;
	}
}

//yay recursion
//this is the only time i have used recursion outside of school. its also gonna be fucking laggy
function set_rando_position(){
	var blocked = argument[0];
	
	var pos = (argument_count > 1 ? argument[1] : irandom_range(0, array_length(blocked) - 1));

	
	if(blocked[pos]){
		if(pos <= 0){
			//show_debug_message(string(pos) + " didnt work so we are trying " + string(array_length(blocked) - 1));
			return set_rando_position(blocked, array_length(blocked) - 1);
		} else {
			//show_debug_message(string(pos) + " didnt work so we are trying " + string(pos - 1));
			return set_rando_position(blocked, pos - 1);
		}
	} else {
		return pos;
	}
}