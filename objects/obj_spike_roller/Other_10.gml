event_inherited();
enum spike_roller { roll, collide, crash};
#region States
var t = state_timer++;
switch(state) {
	#region Roll
	case spiky.roll:
		animation_play("R");
		if (!can_move_x(h_speed))
			h_speed = 0;
		if (h_speed == 0 && is_on_floor() || t > 120)
			state_set(spiky.collide);
		break;
	#endregion
}
xscale = -dir;
#endregion