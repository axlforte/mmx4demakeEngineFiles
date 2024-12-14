event_inherited();
#region Variables
hp = 4;
collide_damage = 3;
hit = 0;
state_set(beret.stand);
#endregion
#region Animations
// Stand
animation_add("S",
	[ 0, 0 ]
);
// Throw
animation_add("T",
[
	0, 1,
	5, 2,
	9, 1
]);
// Laugh
animation_add("L", [
	0, 0,
	3, 3,
	6, 4,
	9, 5,
	12, 6,
	15, 7,
	33, 6
], 0, 35)

animation_play("S");
#endregion