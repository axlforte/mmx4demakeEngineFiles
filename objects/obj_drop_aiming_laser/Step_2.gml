if(player == noone){
	player = instance_nearest(x,y,obj_player_parent);
} else if(abs(x - player.x) < spr_width && abs(y-poffset - player.y) < spr_width && !pickup_pause){
	switch(weapon){
		case(weapons.ground_hunter):
			global.jet_stingray_defeat = true;
		break;
		case(weapons.lightning_web):
			global.web_spider_defeat = true;
		break;
		case(weapons.rising_fire):
			global.magma_dragoon_defeat = true;
		break;
		case(weapons.twin_slasher):
			global.slash_beast_defeat = true;
		break;
		case(weapons.soul_body):
			global.split_mushroom_defeat = true;
		break;
		case(weapons.frost_spike):
			global.frost_walrus_defeat = true;
		break;
		case(weapons.double_cyclone):
			global.storm_owl_defeat = true;
		break;
		case(weapons.aiming_laser):
			global.cyber_pea_cock_defeat = true;
		break;
	}
	with(obj_player_parent){
		script_try(variables_script);
	}
	instance_destroy();
}