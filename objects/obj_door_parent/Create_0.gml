event_inherited();
animation_init();
animations_init();
state_machine_init();
surface_draw_init();
animation_add("S", [
	0, 0
], 0);
animation_add("N", [
	0, 10
], 0);
// Open
animation_add("O", [
	0, 1,
	4, 2,
	8, 3,
	12, 4,
	16, 5,
	20, 6,
	24, 7,
	28, 8,
]);
// Close
animation_add("C", [
	0, 8,
	4, 7,
	8, 6,
	12, 5,
	16, 4,
	20, 3,
	24, 2,
	28, 1,
]);
trail_init(0);
open_limit = 170;
close_limit = 0;
target = noone;
moving_target = false;
dir = image_yscale;
camera_id = -1;
boss_door = false;
is_vertical = (abs(sprite_width) > abs(sprite_height));
has_been_used = false;