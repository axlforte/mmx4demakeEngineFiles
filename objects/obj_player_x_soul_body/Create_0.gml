event_inherited();

palette_init();
palette_texture_set(plt_x_full);
plt_index = 37;

grounded = false;
deathTimer = 0;
anti_destroy = true;

atk = 3;
destroy_if_hit = false;
// Grounded
animation_add("G", 
[
	0,3,
	1,4,
	2,5
], 0, 6);

// Explode
animation_add("E", 
[
	0,6,
	3,7,
	6,8,
	9,9,
	12,10,
	15,11
], 0, 6);

// Fall
animation_add("F" ,
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

animation_play("F");
sound = snd_player_x_shot_1;
abs_hspeed = 3;
v_speed = 3;
dash_enabled = true;
execute_step_in_first_frame = true;
physics_ignore_frame = 1;
blocked_reflect = true;
destroy_reset_speed = false;

player_dist = 42;
dist_catchup_speed = 3;
player_dist_time = 500;