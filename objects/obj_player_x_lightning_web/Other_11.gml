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
	else if (t >= 6 && t <= 18) abs_hspeed = 6;
	else if (t >= 17 && t <= 19) animation_play("L");
	else if(t >= 19 && t <= 180){
		abs_hspeed = 0;
		if (coll != noone){
			coll.x = x - 8;
			coll.y = y;
		}
	} else {
		instance_destroy(coll);
		instance_destroy();
	}
	h_speed = abs_hspeed * dir;
}
