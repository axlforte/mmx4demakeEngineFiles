/*enum enem { stand, trip, recover};
#region comboCode
	comboState = 0;
var t = state_timer++;

switch(comboState) {
	#region Stand and wait to get hit
	case enem.stand:
		if (t == 0){
			hit = 0;
		}
		
		if (hit == 3)
			comboState = enem.trip;
		break;
	#endregion
	#region Stand and wait to get hit
	case enem.trip:
		if (t == 0){
			v_speed = -4;
			grav = 0.125;
		}
		
		if (is_on_floor() && v_speed >= 0)
			comboState = enem.recover;
		break;
	#endregion
	
	#region regain footing
	case enem.recover:
		if (t >= 10)
			comboState = enem.stand;
		break;
	#endregion
}
#endregion*/