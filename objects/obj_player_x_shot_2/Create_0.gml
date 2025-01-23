event_inherited();
sound = snd_player_x_shot_2;

abs_hspeed = 0;
atk = 2;
boss_damage[? obj_eregion] = 2;//because eregion is a pushover

// Start
animation_add("S",
[
	0, 0
], 6);
// Loop
animation_add("L", 
[
	0, 1,
	1, 2,
	2, 3,
	3, 4,
], 0, 4);
// Destroy
animation_add("D", 
[
	0, 5,
	2, 6,
	6, 7,
	9, 8
]);
// Blocked
animation_add("B",
[
	0, 9,
	2, 10,
	4, 9,
	6, 11,
	8, 12,
	10, 13,
	13, 13
]);

animation_play("S");

execute_step_in_first_frame = true;