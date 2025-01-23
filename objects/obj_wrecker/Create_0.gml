event_inherited();
hp = 3;
collide_damage = 3;
abs_hspeed = 2;
h_speed = abs_hspeed * dir;
face_x = false;
state_set(wrecker.decide);
#region Animations
// Stand
animation_add("S",
	[ 0, 12 ]
);
// roll forward
animation_add("T",
[
	0, 11,
	2, 10,
	4, 9,
	6, 8,
	7, 7,
	9, 6,
	10, 5,//roll starts here
	12, 4,
	14, 3,
	16, 2,
	18, 5,
	20, 4,
	22, 3,
	24, 2,
	26, 5,
	28, 4,
	30, 3,
	31, 6,
	33, 7,
	34, 8,
	36, 9,
	38, 10,
	40, 11
]);
// Walk forward
animation_add("W",
[
	0, 13,
	6, 14,
	12, 15,
	16, 16,
	20, 16
],0,20);

animation_play("S");
#endregion