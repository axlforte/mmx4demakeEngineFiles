#region Variables
event_inherited();
hp = 10;
collide_damage = 3;
face_x = false;
#endregion

#region animations
// slowly pulsate eyes ig
animation_add("SA", [
	0, 0,
	5, 1,
	10, 2,
	15, 1,
], 20);
animation_play("SA");
#endregion