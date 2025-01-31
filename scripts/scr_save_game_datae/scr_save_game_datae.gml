function scr_load_game_data(){
	ini_open("gamesave" + string(global.game_save_num) + ".ini");

	// boss defeat info
	// we can use this for unlocking the weapons too
	global.magma_dragoon_defeat = ini_read_real("BOSS", "dragoon",false);
	global.web_spider_defeat = ini_read_real("BOSS", "spider",false);
	global.jet_stingray_defeat = ini_read_real("BOSS", "stingray",false);
	global.split_mushroom_defeat = ini_read_real("BOSS", "mushroom",false);
	global.cyber_pea_cock_defeat = ini_read_real("BOSS", "peacock",false);
	global.frost_walrus_defeat = ini_read_real("BOSS", "walrus",false);
	global.storm_owl_defeat = ini_read_real("BOSS", "owl",false);
	global.slash_beast_defeat = ini_read_real("BOSS", "beast",false);
	
	//cutscene triggers
	global.met_colonel = ini_read_real("CUT", "colonel in wreckage",false);
	
	//armors
	//easy to simply set based off of save data. really 
	G.player_character_armor[pl_char.x][4] = ini_read_string("ARMOR", "legs", x_armor.none);
	show_debug_message(G.player_character_armor[pl_char.x][4]);
	G.player_character_armor[pl_char.x][3] = ini_read_string("ARMOR", "arms", x_armor.none);
	G.player_character_armor[pl_char.x][2] = ini_read_string("ARMOR", "body", x_armor.none);
	G.player_character_armor[pl_char.x][1] = ini_read_string("ARMOR", "head", x_armor.none);
	
	//basic info
	global.player_max_health = ini_read_real("BASIC", "max hp", 12);
	global.player_health = ini_read_real("BASIC", "hp", global.player_max_health);
	global.player_exp = ini_read_real("BASIC", "xp", 0);
	global.save_dest = ini_read_string("BASIC", "location", "stingray");
	
	global.sub_tank_1 = ini_write_string("BASIC", "tank 1", false);
	global.sub_tank_2 = ini_write_string("BASIC", "tank 2", false);
	global.weap_tank_1 = ini_write_string("BASIC", "tank 3", false);
	
	for(var d = 0; d < array_length(global.heart_used);d++){
		global.heart_used[d] = ini_read_real("BASIC", "heart " + string(d), false)
	}
	
	//skills
	global.super_dash = ini_read_real("SKILL", "super dash", false);
	global.hyper_dash = ini_read_real("SKILL", "hyper dash", false);
	global.buster_specialist = ini_read_real("SKILL", "buster specialist", false);
	global.wall_cling = ini_read_real("SKILL", "wall cling", false);
	global.auto_charge = ini_read_real("SKILL", "auto charge", false);
	global.super_charge = ini_read_real("SKILL", "super charge", false);
	global.hyper_charge = ini_read_real("SKILL", "hyper charge", false);
	global.energy_expert = ini_read_real("SKILL", "energy expert", false);
	global.weapons_specialist = ini_read_real("SKILL", "weapons specialist", false);
	global.untouchable = ini_read_real("SKILL", "untouchable", false);
	global.yoga = ini_read_real("SKILL", "yoga", false);
	global.overcharged_systems = ini_read_real("SKILL", "overcharged systems", false);
	global.undershirt = ini_read_real("SKILL", "undershirt", false);
	global.energy_infusion = ini_read_real("SKILL", "energy infusion", false);
	global.regenerative_capacitors = ini_read_real("SKILL", "regenerative capacitors", false);
	global.energy_converter = ini_read_real("SKILL", "energy converter", false);
	global.cardio_training = ini_read_real("SKILL", "cardio training", false);
	global.grip_training = ini_read_real("SKILL", "grip training", false);
	global.explorers_instinct = ini_read_real("SKILL", "explorers instinct", false);
	global.travelers_companion = ini_read_real("SKILL", "travelers companion", false);
	global.concussive_redirectors = ini_read_real("SKILL", "concussive redirectors", false);
	global.sense_of_duty = ini_read_real("SKILL", "sense of duty", false);
	
	//ooh secrets
	global.pharoah_dash = ini_read_real("SECRET", "pharoah dash", false);
	
	ini_close();
}

function get_save_location_in_room_terms(){
	switch(global.save_dest){
		case("intro"):
			return rm_intro;
		break;
		case("wreckage"):
			return rm_wreckage;
		break;
		case("stingray"):
			return rm_jet_stingray;
		break;
		case("hq"):
			return rm_HQ;
		break;
		case("suburbs"):
			return rm_suburbs;
		break;
		case("spider"):
			return rm_web_spider;
		break;
		case("dragoon"):
			return rm_magma_dragoon;
		break;
		case("walrus"):
			return rm_frost_walrus;
		break;
	}
}