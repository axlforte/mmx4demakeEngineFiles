/// @description Step
event_inherited();

var myPlayer = instance_nearest(x, y, obj_player_parent);

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
	v_speed += gravity_default / 60;
	
	if(is_on_floor()){
		v_speed = 0;
		gravity_default = 0;
		h_speed = 0;
		abs_hspeed = 0;
	}
}

if(myPlayer.current_weapon != weapons.frost_spike){
	instance_destroy();
}
