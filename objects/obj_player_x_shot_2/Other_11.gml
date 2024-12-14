/// @description Step
event_inherited();

if (destroy)
{
	h_speed = 0;/*
	if (destroy_t == 1)
	{
		if (!blocked) animation_play("D");
		else animation_play("B");
	}
	if (animation_end)
	{
		instance_destroy();
		exit;
	}*/
}
else
{
	var t = timer++;

	if (t < 4) player_shot_pos_fix();
	else if (t >= 4 && t <= 6) abs_hspeed = 5;
	else if (t >= 6 && t <= 7) abs_hspeed = 5.5;
	else if (t >= 7 && t <= 8) abs_hspeed = 6;
	else if (t >= 8) abs_hspeed = 6.25;
	h_speed = abs_hspeed * dir;

	if (t == 10)
	{
		animation_play("L");	
	}
}