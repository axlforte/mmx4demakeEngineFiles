event_inherited();

alarm[0] = 2;
doReverseShot = true;

destroy_if_hit = true;
atk = 3;
// Destroy Animation
animation_add("D",
[
	0, 1,
	2, 2,
	4, 3,
	5, 3
]);

// Loop
animation_add("L", 
[
	0, 1,
	1, 16,
	2, 5,
	3, 9,
	4, 11,
	5, 18,
	6, 2,
	7, 12,
	8, 4,
	9, 17,
	10, 6,
	11, 14,
	12, 7,
	13, 13,
	14, 3,
	15, 10,
	16, 8,
	17, 15,
	18, 0
], 0, 18);

// Blocked Animation
animation_add("B",
[
	0, 0
], 0, 0);

animation_play("L");
sound = snd_player_x_shot_1;
abs_hspeed = 3;
dash_enabled = true;
execute_step_in_first_frame = true;
physics_ignore_frame = 1;
blocked_reflect = true;
destroy_reset_speed = false;