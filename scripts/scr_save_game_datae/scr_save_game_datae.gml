function scr_load_game_data(){
	ini_open("gamesave" + string(global.game_save_num) + ".ini");

	// boss defeat info
	// we can use this for unlocking the weapons too
	for (var i = 0; i < e_boss.length; i++) {
		//ini_write_real("BOSS", "boss " + string(i),global.boss_defeated[i]);
		global.boss_defeated[i] = ini_read_real("BOSS", "boss" + string(i), false);
	}
	
	//armors
	//easy to simply set based off of save data. really 
	global.character_armor_unlocked[pl_char.x][x_armor.x4][4] = ini_read_real("ARMOR", "legs", false);
	global.character_armor_unlocked[pl_char.x][x_armor.x4][3] = ini_read_real("ARMOR", "arms", false);
	global.character_armor_unlocked[pl_char.x][x_armor.x4][2] = ini_read_real("ARMOR", "body", false);
	global.character_armor_unlocked[pl_char.x][x_armor.x4][1] = ini_read_real("ARMOR", "head", false);
	
	//basic info
	global.player_max_health = ini_read_real("BASIC", "max hp", 12);
	global.player_health = ini_read_real("BASIC", "hp", global.player_max_health);
	global.player_exp = ini_read_real("BASIC", "xp", 0);
	global.save_dest = ini_read_string("BASIC", "location", "stingray");
	
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