event_inherited();

if(instance_exists(convo)){
	if(convo.index >= 4){
		if(dragoon_leave_timer <= 1){
			with(obj_npc){
				sprite_frame = 38;
				audio_play(snd_player_outro);
			}
		} else {
			with(obj_npc){
				y -= 12;
			}
		}
		dragoon_leave_timer++;
	}
}