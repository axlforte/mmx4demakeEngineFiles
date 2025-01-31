y += v_speed;

coll.x = x - 24;
coll.y = floor(y) - 8;

if(abs(global.player_x - x) < sprite_width / 2 && abs(global.player_y - y) < 28){
	if(player.state != states.fall && player.state != states.jump && player.state != states.wall_jump && player.state != states.wall_slide){
		player.y = floor(y) - 25;
	} else {
		player.y += v_speed;
	}
}

//scr_moving_platform_step();