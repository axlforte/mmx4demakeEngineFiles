#region Variables
event_inherited();
hp = 10;
collide_damage = 3;
face_x = false;
if (nearest_player.x > x)
	xscale = -1;
dir = -xscale;
#endregion

#region animations
// slowly pulsate eyes ig
animation_add("SA", [
	0, 0,
	5, 1,
	10, 2,
	15, 1,
], 0, 20);
animation_play("SA");
#endregion