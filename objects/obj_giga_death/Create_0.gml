#region Variables
event_inherited();
hp = 10;
collide_damage = 3;
face_x = false;
#endregion

#region animations
// hola
animation_add("SA", [
	2, 0,
	6, 1,
	8, 2,
	9, 3
]);
// hello
animation_add("BA", [
    2, 0,
	6, 1,
	8, 2,
	9, 3
]);
// oi
animation_play("SA");
#endregion