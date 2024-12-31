if(abs(global.player_x - x) < players_fat_ass && global.player_y > y - 2){
	if(squish < 4){
		instance_nearest(x,y,obj_player_parent).y ++;
		squish++;
	}
	save_timer++;
} else {
	if(squish > 0){
		if(abs(global.player_x - x) < players_fat_ass){
			instance_nearest(x,y,obj_player_parent).y --
		}
		save_timer = 0;
		saved = false;
		squish--;
	}
}

coll.y = y + 16 + squish;
coll.x = x - 16;

if(save_timer > 40 && !saved){
	save_timer --;
	global.game_save_num = 1;
	global.save_dest = save_loc;
	scr_save_game_data();
	saved = true;
	audio_play(snd_player_success)
} else if (save_timer > 40){
	save_timer = 40;
}