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
	v_speed = 0;
	h_speed = 0;
	
	var myPlayer = instance_nearest(x, y, obj_player_parent);
	if(t < 16){
		x = G.player_x + t * myPlayer.dir * 4;
	} else if(t > 16 && t < 344){
		x = G.player_x + 64 * myPlayer.dir;
	}  else if(t > 344 && t < 360){
		x = G.player_x + (360 - t) * myPlayer.dir * 4;
	} else if(t > 360){
		instance_destroy();
	}
	
	y = G.player_y;
}
