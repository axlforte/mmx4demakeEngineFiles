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
	h_speed = abs_hspeed * dir;
	if(is_on_floor()){
		if(!grounded){
			v_speed = 0;
			y -= 2;
			abs_hspeed = 6;
			grounded = true;
			animation_play("G");
		} else {
			if(!can_move_x(abs_hspeed)){
				if(deathTimer == 0){
					animation_play("E")
					abs_hspeed = 0;
				}
				move_x(abs_hspeed * -1);
				deathTimer += 1;
			}
			if(deathTimer > 15){
				instance_destroy();
			}
		}
	}
}
