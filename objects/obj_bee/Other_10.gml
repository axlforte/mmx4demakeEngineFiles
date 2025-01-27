enum bee { hanging, attacking}
#region States
var t = state_timer++;
var target = nearest_player;
var distance_x = DPX;
switch(state) {
	#region Hanging
	case bee.hanging:
		animation_play("H");
	    if (distance_x < 128){
			
			x_spd = pl_x - x;
			y_spd = pl_y - y;
			
			move_ratio = sqrt(power(y_spd, 2) + power(x_spd, 2));
			
			x_spd = x_spd / move_ratio * fly_speed;
			y_spd = y_spd / move_ratio * fly_speed;
			
			state_set(bee.attacking);
		}
		break;
	#endregion
	#region Attacking
	case bee.attacking:
		animation_play("A");
		if(t >= 18){
			x += x_spd;
			y += y_spd;
		}
		break;
	#endregion
}
#endregion