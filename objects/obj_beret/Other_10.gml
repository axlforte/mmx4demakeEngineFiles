event_inherited();
enum beret { stand, throwing, shoot};
#region States
var t = state_timer++;

switch(state) {
	#region Stand
	case beret.stand:
		animation_play("S");
		if (t >= 120){
			if(random_range(0,100) < 70)
				state_set(beret.shoot);
			else
				state_set(beret.shoot);
		}
		break;
	#endregion
	#region Throw Pickaxe
	case beret.throwing:
		animation_play("T");
		if (t == 18) {
			var p = instance_create_depth(x + 19*dir, y - 6, depth - 1, obj_x4_standard_bullet);
			p.h_speed = 2 * dir;
			p.v_speed = -6;
			p.xscale = dir;
			p.owner = id;
		}
		if (t >= 35) 
			state_set(beret.stand);
		break;
	#endregion
	#region Laugh
	case beret.shoot:
		animation_play("L");
		if(t == 1){
			var p = instance_create_depth(x + 19*dir, y - 6, depth - 1, obj_x4_standard_bullet);
			p.h_speed = 3 * dir;
			p.v_speed = 0;
			p.xscale = dir;
			p.owner = id;
		}
		if (t >= 40)
			state_set(beret.stand);
		break;
	#endregion
}
#endregion