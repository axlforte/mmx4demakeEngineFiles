event_inherited();

coll = instance_create_depth(x,y  + 1000,600,obj_lightning_web_collision);

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
	0,3,
	1,4,
	2,5,
	3,6,
	4,7,
	5,8
], 0, 6);

// Start
animation_add("S", 
[
	0,0,
	1,1,
	2,2
], 0, 3);

// Blocked Animation
animation_add("B",
[
	0, 0
], 0, 0);

animation_play("S");
sound = snd_player_x_shot_1;
abs_hspeed = 3;
dash_enabled = true;
execute_step_in_first_frame = true;
physics_ignore_frame = 1;
blocked_reflect = true;
destroy_reset_speed = false;