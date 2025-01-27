// Draw condition
	surface_draw_init();
	
	animation_init();
	animations_init();
	animation_script = player_x_animation;
	animation_controller = player_x_animation_controller;

player_x_animation();
animation_play("walk");