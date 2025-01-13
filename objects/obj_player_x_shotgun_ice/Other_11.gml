
event_inherited();

if (destroy)
{
	instance_destroy();
}
else
{
	if(!move_x(6 * dir)){
		var shit = instance_create_depth(x,y,depth,obj_player_x_shotgun_ice_shards)
			shit.h_speed = -2 * dir;
			shit.v_speed = 4;
		var shit = instance_create_depth(x,y,depth,obj_player_x_shotgun_ice_shards)
			shit.h_speed = -4 * dir;
			shit.v_speed = 2;
		var shit = instance_create_depth(x,y,depth,obj_player_x_shotgun_ice_shards)
			shit.h_speed = -6;
			shit.v_speed = 0;
		var shit = instance_create_depth(x,y,depth,obj_player_x_shotgun_ice_shards)
			shit.h_speed = -4 * dir;
			shit.v_speed = -2;
		var shit = instance_create_depth(x,y,depth,obj_player_x_shotgun_ice_shards)
			shit.h_speed = -2 * dir;
			shit.v_speed = -4;
		instance_destroy();
	}
}
