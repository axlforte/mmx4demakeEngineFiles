event_inherited();

dialouge = scr_get_lines_array("english", dialouge_type.words, line.stingray_1, 3);
lines =    scr_get_lines_array("english", dialouge_type.sounds, line.stingray_1, 3);

idle_time_to_turn = 5;
intro_limit = 102;
jump_wait = 20;
crunch_speed = array_get([4, 5, 6,8], global.difficulty);//makes stingray faster depending on difficulty
//whirlpool_length = 130; old octopus code
//whirlpool_speed = 2; old octopus code
//grab_move_limit = 10; old octopus code
done_with_dash = false;
//missile_speed_multiplier = { hsp: 1, vsp: 1 }; old octopus code
grav_magnitude = 1;
#region Animations
animation_add("idle", [
	0, 7
], 0);
animation_add("intro",
[
	0, 3,
	10, 4,
	18, 7,
	36, 5,
	40, 6
], 40);
animation_add("death", [
	0, 13
], 0);
animation_add("death_chop", [
	0, 13
], 14);
animation_add("energy_drain",
[
	0, 35,
	8, 36,
	16, 37,
	24, 36,
	31, 36
], 0, 31);
animation_add("fall", keyframes_generate(1, 1/8,, 2));
animation_add_loop("fall");

animation_add("dash", keyframes_generate(1, 1/8));
animation_add_loop("dash");
animation_add("whirlpool", keyframes_generate(8, 1/8,, 38));
animation_add_loop("whirlpool");
animation_add("missile_1", [0, 24], 0);
animation_add("missile_2", [0, 25], 0);
animation_add("missile_3", [0, 26], 0);
animation_add("piranha", [
	0, 6,
	1, 20,
	5, 7,
	11, 20,
	15, 6,
	19, 19,
	23, 21,
	27, 18,
	31, 23,
	35, 17,
	39, 10,
	43, 8,
	47, 22,
	50, 22
]);

animation_add("shoot", [
	0,3,
	6,7,
	10,8,
	14,9,
	24,8
], 24);

animation_add("shoot_air", [
	0,2,
	4,10,
	8,11,
	10,12
],10);

animation_add("headbonk", [
	0,1
]);

animation_add("thunder",[
	0,2
])
#endregion


jump_strength = 6.5;

#region Difficulty
damage_set(3, 5, 7, 256);// this is where difficulty values are set.
switch (global.difficulty) {
	case diff_modes.easy:
		idle_limit = 40;
		idle_desperate_limit = 30;
		hp_desperate = 8;
		whirlpool_length = 180;
		whirlpool_speed = 1.5;
		missile_speed_multiplier = { hsp: 0.75, vsp: 0.75 };
		jump_wait = 20;
		jump_strength = 4.5;
		grav_magnitude = 0.5;
		break;
	case diff_modes.normal:
		idle_limit = 20;
		idle_desperate_limit = 10;
		grab_move_limit = 20;
		jump_wait = 16;
		break;
	case diff_modes.hard:
		jump_wait = 2;
		idle_limit = 10;
		idle_desperate_limit = 5;
		hp_desperate = 32;
		whirlpool_length = 130;
		whirlpool_speed = 2;
		grab_move_limit = 30;
		missile_speed_multiplier = { hsp: 1.25, vsp: 1.25 };
		jump_strength = 11;
		grav_magnitude = 3;
		break;
	case diff_modes.zero:
		jump_wait = 1;
		idle_limit = 1;
		idle_desperate_limit = 1;
		hp_desperate = 32;
		whirlpool_length = 130;
		whirlpool_speed = 2;
		grab_move_limit = 30;
		missile_speed_multiplier = { hsp: 1.25, vsp: 1.25 };
		jump_strength = 22;
		grav_magnitude = 6;
		break;
}
whirlpool_length = 180;
whirlpool_speed = 1.5;
#endregion
// Specific attacks
ds_list_clear(attacks_list);
ds_list_add(desperate_attacks, [STINGRAY.REVERSE_TACKLE, [1, 1/2]]);
// Attack Settings
attack_properties[? boss_states.jump] = [2, 0];
attack_properties[? boss_states.dash] = [2, 0];
attack_properties[? STINGRAY.CRUNCH] = [2/3, 1/2];
attack_properties[? STINGRAY.CHARBLARGE] = [1, 1/5];
attack_properties[? STINGRAY.DASH] = [1, 1/4];
// Desperate attacks [state, chances]
floor_state = STINGRAY.CRUNCH;
shielded_states[? OCTOPUS.WHIRLPOOL] = 0;
face_x = false;
activate_collision_limit = 70;
state_set(boss_states.fall);
animation_play("fall");
grav = 0;
v_speed = 2;