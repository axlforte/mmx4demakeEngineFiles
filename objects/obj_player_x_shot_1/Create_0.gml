event_inherited();

destroy_if_hit = true;
// Destroy Animation
animation_add("D",
[
	0, 1
]);

// Blocked Animation
animation_add("B",
[
	0, 0,
	2,1,
	4,2,
	6,3,
	8,4
], 0, 10);

animation_play("B");
sound = snd_player_x_shot_1;
abs_hspeed = 4;
dash_enabled = true;
execute_step_in_first_frame = true;
physics_ignore_frame = 1;
blocked_reflect = true;
destroy_reset_speed = false;