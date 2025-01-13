function scr_rando_settings(){
	global.rando_item_locations = [//this is the completed rando thing. rando logic needs to be added
	// most notably 'do i need this item to get to this location'
	// blacklist system?
		
	]
	//mhp = medium health pickup,
	//swp = small weapon pickup, etc
	checks = [
		obj_pickup_life_2,//mwp at bottom of ladder, stingray
		obj_pickup_wp_2,//mhp between crates, stingray
		obj_pickup_life_2,//mhp 1 on rafter, stingray
		obj_pickup_wp_2,//mwp on rafter, stingray
		obj_pickup_life_2,//mhp 2 on rafter, stingray
		obj_drop_ground_hunter,//ground hunter drop
		obj_pickup_wp_1,//shp by pharoah room
		obj_pickup_life_1,//swp by pharoah room
		false,
		false,
		false,
		false,
		false,
		false,
		false,
		false,
		false,
		false,
		false,
		false,
		false,
		false,
		false,
		false
	]
}