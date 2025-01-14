/*
todo:

he shouldnt snap into the trees when starting, just a quick zip
his babies dont exist yet. make sure you get sprites. maybe just have them crawl across the floor 
	as walljumping isnt really needed in this fight.
he needs to be able to crawl around after doing an attack. make sure that when he goes into the second
	phase he disables the web and birth attacks and enables the crawl attack, then make crawl decide
	which attack (web or birth) to do from there
unfuck that intro animation. too much snapping from pose to pose. maybe just ditch the upwards recoil
	bit and extend the downwards recoil a few frames.
*/


event_inherited();
idle_time_to_turn = 5;
intro_limit = 0;
jump_wait = 5;
activate_collision_limit = 0;
already_on_web = false;

center_of_arena = [9754,1312];
dest = 0;

start_x = x;

web_move_positions = [
[9754,1312],
[9754 + 48,1312],
[9754 - 48,1312],
[9754 + 32,1312 + 32],
[9754 + 32,1312 - 32],
[9754 - 32,1312 - 32],
[9754 - 32,1312 + 32],
[9754,1312 + 48],
[9754,1312 - 48],
];

#region Animations
animation_add("idle", [
	0, 13
], 0);
animation_add("intro_enter", [
	0, 0,
	34, 2,
	36, 1,
	38, 2,
	40, 3,
	44, 13,
	46, 3,
	48, 13,
	85, 5,
	90, 6,
	95, 7,
	100, 8,
	105, 9,
	110, 8,
	115, 13,
	120, 6, 
	122, 5,
	124, 10,
	126, 11, 
	127, 12
]);
animation_add("intro", [
	0, 12
]);

animation_add("fall", [
	0, 0,
	34, 2,
	36, 1,
	38, 2,
	40, 3,
	44, 13,
	46, 3,
	48, 13
]);

animation_add("web", [
	0, 22,
	3, 23,
	6, 24, 
	9, 25, 
	12, 26,
	25, 27,
	45, 27
]);

animation_add("birth", [// i thought web spider was a dude. either that or he's a trans robot
	0, 19,
	3, 23,
	6, 24, 
	9, 25, 
	12, 26,
	25, 27
]);

animation_add("death", [
	0, 0
], 0);
#endregion
// Specific attacks
ds_list_add(attacks_list,
	web_spider.web,
	web_spider.birth,
	web_spider.giga_transition
);
#region Difficulty
damage_set(3, 5, 7, 256);
switch (global.difficulty) {
	case diff_modes.easy:
		idle_limit = 40;
		idle_desperate_limit = 30;
		hp_desperate = 8;
		break;
	case diff_modes.normal:
		idle_limit = 20;
		idle_desperate_limit = 10;
		break;
	case diff_modes.hard:
		idle_limit = 10;
		idle_desperate_limit = 5;
		hp_desperate = 24;
		max_hp = 32;
		break;
	case diff_modes.zero:
		idle_limit = 10;
		idle_desperate_limit = 5;
		hp_desperate = 48;
		max_hp = 64;
		break;
}
#endregion
// Desperate attacks [state, chances]
ds_list_add(desperate_attacks, [web_spider.giga_transition, [1, 1/6]]);
attack_properties[? web_spider.web] = [1, 1/2];
attack_properties[? web_spider.birth] = [1, 1/2];
attack_properties[? boss_states.jump] = [2, 0];
attack_properties[? boss_states.dash] = [2, 0];
face_x = false;
state_set(web_spider.sling_intro);
gravity_default = 0;
grav = 0;
v_speed = 0;
h_speed = 0;

function web_spider_default_web_intro(){
	if (t >= 144) {
		y = center_of_arena[1] - 96;//puts web spider at the center of the arena's height plus 6 tiles
		state_set(boss_states.idle);
	} else if (t <= 36) {
		y += 2;
	} else if (t <= 42) {
		y -= 2;
	} else if (t <= 46) {
		y += 1;
	} else if (t >= 112) {
		y -= 2;
	} else if (t >= 106) {
		y -= 1;
	} else if (t >= 100) {
		y += 1;
	} else {
			
	}
}