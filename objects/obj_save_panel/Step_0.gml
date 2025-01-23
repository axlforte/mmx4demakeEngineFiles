scr_keys_update();
if(check_tick == check_tick_delay){
	check_tick = 0;
	if(abs(global.player_x - x) < players_fat_ass && global.player_y > y - 2 && global.player_y < y + 32){
		if(squish < 4){
			instance_nearest(x,y,obj_player_parent).y ++;
			squish++;
		}
		if(key_p_up){
			instance_nearest(x,y,obj_player_parent).x = x;
			with(obj_player_parent){
				instance_create_depth(x,y,depth,obj_warp_handler);
				locked = true;
			}
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
} else {
	check_tick++;
}
if(save_timer > 40 && !saved){
	save_timer --;
	//global.game_save_num = 1;
	global.save_dest = save_loc;
	scr_save_game_data();
	saved = true;
	audio_play(snd_player_success);
	var note = instance_create_depth(x,y,depth,obj_notification);
	note.text = "Game saved to slot " + string(global.game_save_num + 1);
	note.popup_timer = 300;
} else if (save_timer > 40){
	save_timer = 40;
}
