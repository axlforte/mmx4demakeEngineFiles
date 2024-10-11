event_inherited();

hp = 100000;

animation_add("S",
	[ 0, 0,
	1,1,
	2,2]
);
// Throw
animation_add("F",
[
	0, 1,
	5, 2,
	9, 3,
	13, 4,
	17, 5,
	34, 0
]);
// Laugh
animation_add("R", [
	0, 0,
	4, 6,
	8, 7,
	12, 6,
	15, 6
], 0, 15)

animation_play("S");