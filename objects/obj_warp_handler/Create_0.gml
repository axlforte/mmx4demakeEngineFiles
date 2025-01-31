/*
either i can use the boss being defeated to determine if you can teleport or just by saving at that station

ill ask but i will use the boss defeated data for the moment
*/

possible_locations = ds_list_create();
loc_names = ds_list_create();
ds_list_add(possible_locations, rm_HQ);
ds_list_add(loc_names, "HQ");

if(global.web_spider_defeat){
	ds_list_add(possible_locations, rm_web_spider);
ds_list_add(loc_names, "Jungle");
}
if(global.jet_stingray_defeat){
	ds_list_add(possible_locations, rm_jet_stingray);
ds_list_add(loc_names, "Shipping Port");
}
if(global.magma_dragoon_defeat){
	ds_list_add(possible_locations, rm_magma_dragoon);
ds_list_add(loc_names, "Volcano");
}
if(global.frost_walrus_defeat && 1 == 0){
	ds_list_add(possible_locations, rm_frost_walrus);
ds_list_add(loc_names, "Frozen Mountain");
}
//cyber peacock can be easily accessed via the hq save station
if(global.slash_beast_defeat && 1 == 0){
	ds_list_add(possible_locations, rm_train_station);
ds_list_add(loc_names, "Train Station");
}
if(global.split_mushroom_defeat && 1 == 0){
	ds_list_add(possible_locations, noone);
ds_list_add(loc_names, "Abandoned Lab");
}

//storm owl doesnt get a warp. by the time you defeat him, the warp is useless.

if(ds_list_size(possible_locations) < 1){
	with(obj_player_parent){
		locked = false;
	}
	instance_destroy();
}
scr_keys_reset();
palette_init();
depth = -100000;
index = 0;