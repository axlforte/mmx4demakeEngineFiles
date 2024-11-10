event_inherited();

grounded = false;
deathTimer = 0;

destroy_if_hit = true;


sound = snd_player_x_shot_1;
abs_hspeed = 2;
v_speed = -3;
gravity_default = v_speed * -1;
dash_enabled = true;
execute_step_in_first_frame = true;
physics_ignore_frame = 1;
blocked_reflect = true;
destroy_reset_speed = false;