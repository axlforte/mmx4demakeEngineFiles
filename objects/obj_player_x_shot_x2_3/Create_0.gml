event_inherited();
// Damage
atk = 3;
shot_level = 1;
hit_if_shot_level_is_equal = true;
boss_damage[? noone] = 2; // Default damage on bosses
sound = snd_player_x_shot_x2_3;
abs_hspeed_max = 7.5;
animation_add("S",
[
	0, 0
], 4);

animation_add("L",
[
	0, 1,
	2, 2,
	4, 3,
], 0, 5);

animation_add("D",
[
	0, 4,
	2, 5,
	6, 6,
	9, 7
]);
animation_add("B",
[
	0, 7,
	2, 8,
	4, 7,
	6, 9,
	8, 10,
	10, 11,
	13, 11
]);

animation_play("S");