event_inherited();
idle_time_to_turn = 5;
intro_limit = 0;
jump_wait = 5;
activate_collision_limit = 0;
//has_worded = false;

#region Animations
animation_add("idle", [
	0, 0
], 0);

animation_add("land", [
	0, 0
]);

animation_add("intro", [
	0, 12
]);

animation_add("fall", [
	0, 2,
	1, 3
]);

animation_add("death", [
	0, 5
], 0);

animation_add("slash",[
0, 6,
10, 7,
12, 8, 
15, 9,
45, 8,
50, 0
]);

animation_add("pew",[
0, 4,
8, 1, 
16, 4, 
24, 5,
60, 4, 
64, 0
]);
#endregion
// Specific attacks
ds_list_add(attacks_list,
	intro_boss.fly,
	intro_boss.pew,
	intro_boss.slash
);
#region Difficulty
damage_set(3, 5, 7, 256);
switch (global.difficulty) {
	case diff_modes.easy:
		idle_limit = 40;
		idle_desperate_limit = 30;
		sling_speed = 3;
		hp_desperate = 8;
		break;
	case diff_modes.normal:
		idle_limit = 20;
		idle_desperate_limit = 10;
		break;
	case diff_modes.hard:
		idle_limit = 10;
		idle_desperate_limit = 5;
		sling_speed = 6;
		hp_desperate = 24;
		max_hp = 32;
		break;
	case diff_modes.zero:
		idle_limit = 10;
		idle_desperate_limit = 5;
		sling_speed = 16;
		hp_desperate = 48;
		max_hp = 64;
		break;
}
#endregion
// Desperate attacks [state, chances]
attack_properties[? intro_boss.fly] = [1, 1/2];
attack_properties[? intro_boss.pew] = [1, 1/2];
attack_properties[? intro_boss.slash] = [1, 1/2];
attack_properties[? boss_states.jump] = [2, 0];
attack_properties[? boss_states.dash] = [2, 0];
face_x = false;
state_set(boss_states.fall);
gravity_default = 0;
grav = 0;
v_speed = 1;
h_speed = 0;