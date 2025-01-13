event_inherited();

scr_moving_platform_init();
coll.image_xscale = 3;
x_zone = 17;

destroy_if_hit = true;
atk = 3;

// Start
animation_add("S", 
[
	0,0,
	5,1,
	10,2,
	15,3,
	20,4,
	25,5
], 25, 26);
animation_play("S");
sound = snd_player_x_shot_1;
abs_hspeed = 0;
dash_enabled = true;
execute_step_in_first_frame = true;
physics_ignore_frame = 1;
blocked_reflect = true;
destroy_reset_speed = false;