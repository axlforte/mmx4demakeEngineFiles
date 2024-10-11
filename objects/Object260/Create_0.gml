event_inherited();
drop_kick_speed = 5;
dash_speed = 4;
charge_limit = 30;
intro_limit = 102;
floor_state = slash_beastleo.drop_kick;

animation_add("idle", [
	0, 1
], 0);
animation_add("land", [
	0, 4,
	3, 2,
	5,1
]);
animation_add("jump", [
	0, 1,
	2,2,
	4,3
], 4);

animation_add("fall", [
	0, 4
], 0);

animation_add("flip", [
	0, 6,
	3, 7,
	5, 8,
	6, 9,
	9, 10,
	11, 3,
], 11);

animation_add("pdcharge", [
	0, 10,
	3,11
], 3);

animation_add("pdpunch", [
	0, 11
], 0);

animation_add("death", [
	0, 12
], 0);

animation_add("kick", [
	0, 3,
	1,4,
	3,5
], 3);

animation_add("intro", [
	0, 1,
	5,2,
	7,1,
	9,0,
	17,1,
	19,2,
	21,1
], 21);

ds_list_clear(attacks_list);
attack_properties[? boss_states.jump] = [2, 0];
attack_properties[? boss_states.dash] = [2, 0];
attack_properties[? slash_beastleo.drop_kick] = [1/2, 1/3];
attack_properties[? slash_beastleo.flip_slash] = [1/2, 1/3];
attack_properties[? slash_beastleo.screw_driver] = [1/2, 1/3];
state_set(boss_states.fall);
animation_play("fall");
face_x = false;
grav = 0;
v_speed = 3;
jump_strength = 6.5;