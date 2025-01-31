event_inherited();
idle_time_to_turn = 5;
intro_limit = 21;
jump_wait = 5;
activate_collision_limit = 35;
dash_wait = 36;
wave_wait_limit = 20;
light_mode_enabled = true;
#region Animations
animation_add("idle", [
	0, 1
], 0);
animation_add("intro", [
	0, 1,
	6, 24,
	15, 11,
	17, 2,
	30, 11,
	32, 1
]);


animation_add("jump", [
	0, 3
],0);
animation_add("jump_back", [
	0, 4
],0);
animation_add("land", [
	0, 1
]);
animation_add("fall", [
	0, 3
], 0);
animation_add("fall_back", [
	0, 4
], 0);
animation_add("fall_attack", [
	0, 5,
	8, 6,
	15, 7
],15 ,20);

animation_add("fall_attack_back", [
	0, 8,
	8, 9,
	15, 10
],15 ,20);

animation_add("wave_charge", [
	0, 11,
	2, 12,
	4, 13,
	6, 11,
	12, 16,
	13, 17,
	14, 18,
	16, 11
], 14,18);
animation_add("wave_shoot", [
	0, 24,
	15, 1
]);

animation_add("swap", [
	0, 11,
	3, 16,
	6, 18,
	9, 17,
	12, 14
]);

animation_add("messiah", [
0,19,
5,20,
10,21,
15,20,
20,19
]);

animation_add("death", [
	0, 0
], 0);
#endregion
// Specific attacks
ds_list_add(attacks_list,
	pharoah_man.wave,
	pharoah_man.yeet,
	pharoah_man.change,
	pharoah_man.pose
);
#region Difficulty
damage_set(3, 5, 7, 256);
switch (global.difficulty) {
	case diff_modes.easy:
		idle_limit = 40;
		idle_desperate_limit = 30;
		hp_desperate = 8;
		animation_add("wave_charge", [
			0, 11,
			3, 12,
			6, 13,
			9, 11,
			18, 16,
			19, 17,
			20, 18,
			22, 11
		], 20,24);
		wave_wait_limit = 20;
		break;
	case diff_modes.normal:
		idle_limit = 20;
		idle_desperate_limit = 10;
		ds_list_add(attacks_list, pharoah_man.messiah);
		break;
	case diff_modes.hard:
		idle_limit = 10;
		idle_desperate_limit = 5;
		hp_desperate = 32;
		max_hp = 32;
		animation_add("wave_charge", [
			0, 11,
			1, 12,
			2, 13,
			3, 11,
			10, 16,
			11, 17,
			12, 18,
			14, 11
		], 12,16);
		wave_wait_limit = 20;
		ds_list_add(attacks_list, pharoah_man.messiah);
		break;
	case diff_modes.zero:
		idle_limit = 10;
		idle_desperate_limit = 5;
		hp_desperate = 64;
		max_hp = 64;
		animation_add("wave_charge", [
			0, 11,
			1, 12,
			2, 13,
			3, 11,
			8, 16,
			9, 17,
			10, 18,
			12, 11
		], 10,14);
		wave_wait_limit = 12;
		ds_list_add(attacks_list, pharoah_man.messiah);
		break;
}
#endregion
// Desperate attacks [state, chances]
ds_list_add(desperate_attacks, [pharoah_man.messiah, [1, 1/6]]);
attack_properties[? pharoah_man.yeet] = [1/3, 1/3];
attack_properties[? pharoah_man.change] = [1, 1/6];
attack_properties[? pharoah_man.wave] = [1/3, 1/4];
attack_properties[? pharoah_man.pose] = [1/3, 1/4];
attack_properties[? boss_states.jump] = [2, 0];
attack_properties[? boss_states.dash] = [2, 0];
face_x = false;
state_set(boss_states.fall);
animation_play("fall");
gravity_default = grav;
palette_init();
palette_texture_set(plt_pharoah);

dialouge = scr_get_lines_array("english", dialouge_type.words, line.pharoah_x_1, 6);
lines = scr_get_lines_array("english", dialouge_type.sounds, line.pharoah_x_1, 6);

death_convo = scr_get_lines_array("english", dialouge_type.words, line.pharoah_man_4, 8);
death_lines = scr_get_lines_array("english", dialouge_type.sounds, line.pharoah_man_4, 8);