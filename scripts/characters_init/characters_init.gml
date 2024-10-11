function characters_init() {
	global.character_object[pl_char.x]			= obj_player_x;
	global.character_object[pl_char.zero]		= obj_player_zero;
	global.character_name[pl_char.x]		= "X";
	global.character_name[pl_char.zero]		= "ZERO";
	player_global_armor_settings();
	player_global_voices_init();


}
