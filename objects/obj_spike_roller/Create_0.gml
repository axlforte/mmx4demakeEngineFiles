event_inherited();
hp = 3;
collide_damage = 4;
abs_hspeed = 2;
h_speed = abs_hspeed * dir;
face_x = false;
#region Animations
// Roll
animation_add("R",
[
	0, 2,
	2, 3,
	4, 4
], 0, 6);

animation_add("E",
[ 
   0, 0,
   2, 2
], 0, 4
)
// Collide
animation_add("C",
[
	0, 3,
	3, 0,
	6, 3,
	10, 0
], 10);
// Destroy
animation_add("D1",
[
	0, 4,
	3, 5,
	6, 7,
	9, 8,
	11, 8
], 3, 11);
animation_add("D2",
[
	0, 9
]);
animation_play("R");
#endregion