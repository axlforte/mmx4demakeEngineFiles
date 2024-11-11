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
	0, 0,
	1, 1,
	2, 2,
	3, 3,
	4, 4,
	5, 5,
], 0, 6);

// Blocked Animation
animation_add("B",
[
	0, 0
], 0, 0);

animation_play("L");
sound = snd_player_x_shot_1;
abs_hspeed = 6;
dash_enabled = true;
v_speed = 4;
execute_step_in_first_frame = true;
physics_ignore_frame = 1;
blocked_reflect = true;
destroy_reset_speed = false;