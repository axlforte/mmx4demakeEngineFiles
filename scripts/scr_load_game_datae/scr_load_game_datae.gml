function scr_save_game_data() {
	ini_open("gamesave" + string(global.game_save_num) + ".ini");

	// boss defeat info
	ini_write_real("BOSS", "dragoon",global.magma_dragoon_defeat);
	ini_write_real("BOSS", "spider",global.web_spider_defeat);
	ini_write_real("BOSS", "stingray",global.jet_stingray_defeat);
	ini_write_real("BOSS", "mushroom",global.split_mushroom_defeat);
	ini_write_real("BOSS", "peacock",global.cyber_pea_cock_defeat);
	ini_write_real("BOSS", "walrus",global.frost_walrus_defeat);
	ini_write_real("BOSS", "owl",global.storm_owl_defeat);
	ini_write_real("BOSS", "beast",global.slash_beast_defeat);
	
	//cutscene info
	ini_write_real("CUT", "colonel in wreckage",global.met_colonel);
	
	//armors
	//easy to simply set based off of save data. really 
	ini_write_string("ARMOR", "legs", G.player_character_armor[pl_char.x][4]);
	ini_write_string("ARMOR", "arms", G.player_character_armor[pl_char.x][3]);
	ini_write_string("ARMOR", "body", G.player_character_armor[pl_char.x][2]);
	ini_write_string("ARMOR", "head", G.player_character_armor[pl_char.x][1]);
	
	//basic info
	ini_write_real("BASIC", "max hp", global.player_max_health);
	ini_write_real("BASIC", "hp", global.player_health);
	ini_write_real("BASIC", "xp", global.player_exp);
	ini_write_string("BASIC", "location", global.save_dest);
	ini_write_string("BASIC", "tank 1", global.sub_tank_1);
	ini_write_string("BASIC", "tank 2", global.sub_tank_2);
	ini_write_string("BASIC", "tank 3", global.weap_tank_1);
	
	for(var d = 0; d < array_length(global.heart_used);d++){
		ini_write_real("BASIC", "heart " + string(d), global.heart_used[d])
	}
	
	//skills
	//all the skills in the skill tree. i should also save max health in here too.
	ini_write_real("SKILL", "super dash", global.super_dash);
	ini_write_real("SKILL", "hyper dash", global.hyper_dash);
	ini_write_real("SKILL", "buster specialist", global.buster_specialist);
	ini_write_real("SKILL", "wall cling", global.wall_cling);
	ini_write_real("SKILL", "auto charge", global.auto_charge);
	ini_write_real("SKILL", "super charge", global.super_charge);
	ini_write_real("SKILL", "hyper charge", global.hyper_charge);
	ini_write_real("SKILL", "energy expert", global.energy_expert);
	ini_write_real("SKILL", "weapons expert", global.weapons_specialist);
	ini_write_real("SKILL", "untouchable", global.untouchable);
	ini_write_real("SKILL", "yoga", global.yoga);
	ini_write_real("SKILL", "overcharged systems", global.overcharged_systems);
	ini_write_real("SKILL", "undershirt", global.undershirt);
	ini_write_real("SKILL", "energy infusion", global.energy_infusion);
	ini_write_real("SKILL", "regenerative capacitors", global.regenerative_capacitors);
	ini_write_real("SKILL", "energy converter", global.energy_converter);
	ini_write_real("SKILL", "cardio training", global.cardio_training);
	ini_write_real("SKILL", "grip training", global.grip_training);//grip dash
	ini_write_real("SKILL", "explorers instinct", global.explorers_instinct);
	ini_write_real("SKILL", "travelers companion", global.travelers_companion);
	ini_write_real("SKILL", "concussive redirectors", global.concussive_redirectors);
	ini_write_real("SKILL", "sense of duty", global.sense_of_duty);
	
	//secret shit
	ini_write_real("SECRET", "pharoah dash", global.pharoah_dash);
	
	ini_close();
}
