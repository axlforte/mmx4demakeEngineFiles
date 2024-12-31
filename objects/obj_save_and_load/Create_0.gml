global.game_save_num = -1;
scr_save_game_data();
max_saves = 3;//it should be expandable

//drawing vars
boss_icon_data = [-28, -12, 4, 20, -24, -8];
player_x = -50;
player_y = -8;

//the expandable bit
save_length = 19;
saves = array_create(max_saves, array_create(18, true))
shit = array_create(max_saves * save_length);

palette_init();

for(e = 0; e < max_saves; e++){
	global.game_save_num = e;
	scr_load_game_data();
	saves[e][0] = global.character_armor_unlocked[pl_char.x][x_armor.x4][4];
	saves[e][1] = global.character_armor_unlocked[pl_char.x][x_armor.x4][3];
	saves[e][2] = global.character_armor_unlocked[pl_char.x][x_armor.x4][2];
	saves[e][3] = global.character_armor_unlocked[pl_char.x][x_armor.x4][1];
	saves[e][4] = global.boss_defeated[0];
	saves[e][5] = global.boss_defeated[1];
	saves[e][6] = global.boss_defeated[2];
	saves[e][7] = global.boss_defeated[3];
	saves[e][8] = global.boss_defeated[4];
	saves[e][9] = global.boss_defeated[5];
	saves[e][10] = global.boss_defeated[6];
	saves[e][11] = global.boss_defeated[7];
	saves[e][12] = global.player_exp;
	saves[e][13] = global.player_health;
	saves[e][14] = global.player_max_health;
	saves[e][15] = false;
	saves[e][16] = false;
	saves[e][17] = false;
	saves[e][18] = global.save_dest;
	for(i = 0; i < array_length(saves[e]); i++){
		show_debug_message(string(saves[e][i]) + ", " + string(i) + " save" + string(e));
		shit[(save_length * e) + i] = saves[e][i];
	}
}

//menu navigation
scr_keys_reset();
index = 0;
p_index = max_saves - 1;
n_index = 1;
save_offset = 160;

//cool lerping of the positions
slerp = 0;
s_dir = 1;
s_timer = 5;