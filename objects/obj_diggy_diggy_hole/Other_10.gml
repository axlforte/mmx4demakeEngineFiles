event_inherited();
enum diggy_diggy_hole { stand, throwing, laugh};
#region States
var t = state_timer++;

switch(state) {
	#region Stand
	case diggy_diggy_hole.stand:
		animation_play("S");
		if (t >= 120)
			state_set(diggy_diggy_hole.throwing);
		break;
	#endregion
	#region Throw Pickaxe
	case diggy_diggy_hole.throwing:
		animation_play("T");
		if (t == 18) {
			var p = instance_create_depth(x + 19*dir, y - 6, depth - 1, obj_dig_labour_axe);
			p.h_speed = dir;
			p.v_speed = -3;
		}
		if (t >= 35) 
			state_set(diggy_diggy_hole.stand);
		break;
	#endregion
	#region Laugh
	case diggy_diggy_hole.laugh:
		animation_play("L");
		if (t >= 64)
			state_set(diggy_diggy_hole.stand);
		break;
	#endregion
}
#endregion