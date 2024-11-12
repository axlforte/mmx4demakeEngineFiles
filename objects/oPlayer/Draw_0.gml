var myPlayer = instance_nearest(x, y, obj_player_parent);
//draw_sprite_ext(global.player_sprite,global.player_sprite_frame,x,y,myPlayer.dir,1,0,c_white,0.25);

sprite_index = global.player_sprite;
if(myPlayer.state = states.dash || myPlayer.state = states.idle || myPlayer.state = states.punch_up || myPlayer.state = states.jump || myPlayer.state = states.fall){
	image_index = myPlayer.image_index - 1;
} else {
	image_index = myPlayer.image_index ;
}
draw_text(x + 32,y,image_index);
draw_text(x + 32,y - 12,myPlayer.image_index);