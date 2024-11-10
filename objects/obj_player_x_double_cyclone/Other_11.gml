/// @description Step
event_inherited();

if (destroy)
{
	var t = destroy_t - 1;
	if (blocked_reflect && blocked && (t <= 1))
	{
		x = xprevious;
		y = yprevious;
		h_speed = -6 * dir;
		v_speed = -3;
		if (dash)
		{
			grav = 0.25;
		}
	}
}
else
{
	var t = timer++;
	if (t >= 0 && t <= 2) abs_hspeed = 4;
	else if (t >= 3 && t <= 5) abs_hspeed = 5;
	else if (t >= 6 && t <= 24) abs_hspeed = 6;
	else abs_hspeed = 6.25;
	h_speed = abs_hspeed * dir;
	if(v_speed == 0){
		v_speed = -0.01;
	} else {
		v_speed = v_speed - 0.15;
	}
}
