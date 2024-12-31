var tl = instance_place(x,y,obj_player_parent);
var tr = instance_place(x + (sprite_width * 16),y,obj_player_parent);
var bl = instance_place(x,y + (sprite_height * 16),obj_player_parent);
var br = instance_place(x + (sprite_width * 16),y + (sprite_height * 16),obj_player_parent);
var bm = instance_place(x + (sprite_width * 8),y + (sprite_height * 16),obj_player_parent);
var mm = instance_place(x + (sprite_width * 8),y + (sprite_height * 8),obj_player_parent);
var mr = instance_place(x + (sprite_width * 16),y + (sprite_height * 8),obj_player_parent);
var ml = instance_place(x,y + (sprite_height * 8),obj_player_parent);
var tm = instance_place(x + (sprite_width * 8),y,obj_player_parent);


if((tl || bl || tr || br || tm || mm || ml || mr || bm) && !in_cutscene){
	with(obj_player_parent){
		locked = true;
	}
	in_cutscene = true;
	convo = instance_create_depth(x,y,-600,obj_conversation);
	convo.conversation = dialouge;
} else if(in_cutscene){
	if(!instance_exists(obj_conversation)){
		if(pl_new_room){
			global.is_using_door = 1;
			global.levelTransitionY = 128;
			room = rm_next;
		} else {
			with(obj_player_parent){
				locked = false;
			}
		}
	}
	with(obj_player_parent){
		locked = true;
	}
	if(instance_exists(obj_conversation)){
		if(next_line && convo.index < array_length(lines)){
			var temp_audio = lines[clamp(convo.index, 0, array_length(lines))];
			audio_play_sound(temp_audio, 0, 0);
			audio_sound_gain(temp_audio, global.sfx_volume, 0);
			next_line = false;
		} else {
			if(prev_index != convo.index){
				next_line = true;
			}
		}
		prev_index = convo.index;
	}
}

