function scr_save_game_data() {
	ini_open("gamesave" + string(global.game_save_num) + ".ini");

	// boss defeat info
	// we can use this for unlocking the weapons too
	for (var i = 0; i < e_boss.length; i++) {
		ini_write_real("BOSS", "boss " + string(i),global.boss_defeated[i]);
	}
	
	//armors
	//easy to simply set based off of save data. really 
	ini_write_real("ARMOR", "legs", global.character_armor_unlocked[pl_char.x][x_armor.x4][4]);
	ini_write_real("ARMOR", "arms", global.character_armor_unlocked[pl_char.x][x_armor.x4][3]);
	ini_write_real("ARMOR", "body", global.character_armor_unlocked[pl_char.x][x_armor.x4][2]);
	ini_write_real("ARMOR", "head", global.character_armor_unlocked[pl_char.x][x_armor.x4][1]);
	
	//basic info
	ini_write_real("BASIC", "max hp", global.player_max_health);
	ini_write_real("BASIC", "hp", global.player_health);
	ini_write_real("BASIC", "xp", global.player_exp);
	ini_write_string("BASIC", "location", global.save_dest);
	
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
	
	ini_close();
}
