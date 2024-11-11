event_inherited();
enum poseidon { stand, throwing, laugh};
#region States
var t = state_timer++;

switch(state) {
	#region Stand
	case poseidon.stand:
		animation_play("S");
		if (t >= 120)
			state_set(poseidon.throwing);
		break;
	#endregion
	#region Throw Pickaxe
	case poseidon.throwing:
		animation_play("T");
		if (t == 18) {
			var p = instance_create_depth(x + 19*dir, y - 6, depth - 1, obj_dig_labour_axe);
			p.grav = 4;
			p.h_speed = dir;
			p.v_speed = -3;
		}
		if (t >= 35) 
			state_set(poseidon.stand);
		break;
	#endregion
	#region Laugh
	case poseidon.laugh:
		animation_play("L");
		if (t >= 64)
			state_set(poseidon.stand);
		break;
	#endregion
}
#endregion