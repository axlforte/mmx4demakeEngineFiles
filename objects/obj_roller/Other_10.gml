event_inherited();
enum roller { roll};
#region States
var t = state_timer++;
switch(state) {
	#region Roll
	case roller.roll:
		if (!can_move_x(h_speed))
			h_speed = 0;
		if (h_speed == 0 && is_on_floor())
			hp = 0;
		rot += h_speed * dir * pi;
		break;
	#endregion
}
xscale = -dir;
#endregion