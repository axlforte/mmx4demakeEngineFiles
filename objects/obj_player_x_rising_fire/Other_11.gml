
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
}
