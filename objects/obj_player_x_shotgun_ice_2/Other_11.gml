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
	if (t >= 0 && t <= 20){ h_speed = 0; grav = 0;}
	else if (t >= 20 && t <= 75){ 
		h_speed = 0; 
		if(instance_place(x,y + 12, obj_block_parent)){
			grav = 0;
			v_speed = 0;
		} else {
			grav = 1;
		}
	} else {
		h_speed = 3 * dir;
		scr_moving_platform_step()
		if(instance_place(x,y + 12, obj_block_parent)){
			grav = 0;
			v_speed = 0;
		} else {
			grav = 1;
		}
		if(!can_move_x(h_speed)){
			//instance_destroy();
		}
	}
	if (coll != noone){
		coll.x = x - 24;
		coll.y = y - 8;
	}
}