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
animation_add("L",
[
	0, 5
]);
// Laugh
animation_add("T", [
	0, 1,
	26, 6,
	30, 7,
	32, 8,
	34, 9, 
	36, 7,
	38, 8,
	40, 9, 
	42, 7,
	44, 8,
	46, 1,
	75, 2,
	77, 3,
	81, 2,
	90, 2
])

animation_play("S");
#endregion