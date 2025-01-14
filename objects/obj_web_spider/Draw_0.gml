if(already_on_web){
	//draw_sprite(webomega1, random_range(0,9),center_of_arena[0],center_of_arena[1]);
	draw_sprite(webomega1, random_range(0,9),center_of_arena[0],center_of_arena[1] + 32);
	draw_sprite(webomega1, random_range(0,9),center_of_arena[0],center_of_arena[1] - 32);
	draw_sprite(webomega1, random_range(0,9),center_of_arena[0] + 32,center_of_arena[1]);
	draw_sprite(webomega1, random_range(0,9),center_of_arena[0] - 32,center_of_arena[1]);
}

if (ignore_draw) exit;
draw_set_damage_effect(true);
draw_enemy();
draw_set_damage_effect(false);

draw_sprite(webbing1, random_range(0,3), x, y - 80);