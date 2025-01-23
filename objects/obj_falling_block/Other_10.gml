enum falling_block { hold, fall}
#region States
var t = state_timer++;
var distance_x = abs(pl_x - x);
switch(state) {
	#region Hanging
	case falling_block.hold:
	    if (!is_on_floor())
		        state_set(falling_block.fall);
		break;
	#endregion
	#region Attacking
	case falling_block.fall:
		if(t == 0){
			grav = 1;
			v_speed = 0;
		}
		// Retreat if the target has been hit
		if (is_on_floor()) {
			state_set(falling_block.hold);
		}
		break;
	#endregion
}
#endregion