amount = 1;
name = "none"
enum pickup_types {
	none,
	heart,
	hp,
	wp,
	subtank,
	energytank,
	lifeup,
	weapon
}

enum weaps {
	web,
	twin,
	rising,
	soul,
	cyclone,
	frost,
	aiming,
	hunter
}
start_amount = 0;
wait_timer = 0;
timer = 0;
pickup_pause = false;
pickup_type = pickup_types.none;
time_per_unit = 2;
min_limit = 0;
bar_light = false;
weapon_id = -1;
weapon_fill_other = false;
fill_sound = snd_item_health;
instant_fill = false;
weapon_to_give = noone;
alarm[0] = 1;