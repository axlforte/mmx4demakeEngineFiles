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
	if(t < player_dist / dist_catchup_speed){
		x = G.player_x + t * myPlayer.dir * dist_catchup_speed;
	} else if(t > player_dist / dist_catchup_speed && t < player_dist_time - (player_dist / dist_catchup_speed)){
		x = G.player_x + player_dist * myPlayer.dir;
	}  else if(t > player_dist_time - (player_dist / dist_catchup_speed) && t < player_dist_time){
		x = G.player_x + (player_dist_time - t) * myPlayer.dir * dist_catchup_speed;
	} else if(t > player_dist_time){
		instance_destroy();
	}
	
	plt_index = random_range(0,37);
	
	y = G.player_y;
}
