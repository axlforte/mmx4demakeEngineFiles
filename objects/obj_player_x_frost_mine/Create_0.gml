event_inherited();

grounded = false;
deathTimer = 0;

destroy_if_hit = true;

alarm[0] = 1
doReverseShot = true;
atk = 5;
boss_damage[? noone] = 1;
boss_damage[? obj_jet_stingray] = 3;
sound = snd_player_zero_saber_hyouretsuzan;
abs_hspeed = 2;
angle = 0;
v_speed = -3;
gravity_default = v_speed * -1.5;
dash_enabled = true;
execute_step_in_first_frame = true;
physics_ignore_frame = 1;
blocked_reflect = true;
destroy_reset_speed = false;