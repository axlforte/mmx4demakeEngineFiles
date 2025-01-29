y += v_speed;

coll.x = x - 16;
coll.y = y - 8;

if(abs(global.player_x - x) < sprite_width / 2){
	if(player.state != states.fall && player.state != states.jump){
		player.y = y - 32;
	} else {
		player.y += v_speed;
	}
}

//scr_moving_platform_step();