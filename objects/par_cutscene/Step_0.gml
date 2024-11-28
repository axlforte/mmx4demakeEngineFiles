var tl = instance_place(x,y,obj_player_parent);
var tr = instance_place(x + (sprite_width * 16),y,obj_player_parent);
var bl = instance_place(x,y + (sprite_height * 16),obj_player_parent);
var br = instance_place(x + (sprite_width * 16),y + (sprite_height * 16),obj_player_parent);
var bm = instance_place(x + (sprite_width * 8),y + (sprite_height * 16),obj_player_parent);
var mm = instance_place(x + (sprite_width * 8),y + (sprite_height * 8),obj_player_parent);
var mr = instance_place(x + (sprite_width * 16),y + (sprite_height * 8),obj_player_parent);
var ml = instance_place(x,y + (sprite_height * 8),obj_player_parent);
var tm = instance_place(x + (sprite_width * 8),y,obj_player_parent);


if(tl || bl || tr || br || tm || mm || ml || mr || bm){
	with(obj_player_parent){
		locked = true;
	}
	in_cutscene = true;
	var convo = instance_create_depth(x,y,-600,obj_conversation);
	convo.dialouge = dialouge;
}