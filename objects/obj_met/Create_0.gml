event_inherited();
#region Variables
hp = 4;
collide_damage = 3;
hit = 0;
state_set(beret.stand);
#endregion
#region Animations
// Stand
animation_add("hide",
	[ 0, 0 ]
);
animation_add("look",
	[ 0, 3 ]
);
// Throw
animation_add("pop",
[
	0, 0,
	3, 1,
	6, 3,
	9, 2,
	12, 3,
	13, 3
],12,13);
animation_add("shoop",
[
	0, 3,
	3, 1,
	6, 0,
	7, 0
], 6, 6);
animation_add("pew",
[
	0, 3,
	2, 7,
	8, 8,
	10, 2,
	13, 3
]);

animation_play("S");
#endregion