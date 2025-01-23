event_inherited();
enum met { hide, look, shoot};
#region States
var t = state_timer++;

switch(state) {
	#region hide under helmet
	case met.hide:
		if(t == 0){
			animation_play("shoop");
			damageable = false;
		}
		if(t == 120){
			damageable = true;
			state_set(met.look);
		}
		break;
	#endregion
	#region see if i should kill or be coward
	case met.look:
		if(t == 0){
			animation_play("pop");
		}
		
		if(t == 15){
			if(abs(DPX) > 48){
				state_set(met.hide);
			} else {
				state_set(met.shoot);
			}
		}
		break;
	#endregion
	#region pew pew motherfucker
	case met.shoot:
		if(t == 0){
			animation_play("pew");
		}
		if (t == 8) {
			var p = instance_create_depth(x + 9*dir, y, depth - 1, obj_x4_standard_bullet);
			p.h_speed = 4 * dir;
			p.v_speed = 0;
			p.xscale = dir;
			p.owner = id;
		}
		if (t == 13) 
			animation_play("look");
		if (t == 30) 
			state_set(met.look);
		break;
	#endregion
}
#endregion