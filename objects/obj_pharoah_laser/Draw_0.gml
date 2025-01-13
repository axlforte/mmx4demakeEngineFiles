if(endo){
	draw_sprite_ext(sprite_index,1,x-16,y,1,1,0,c_white,1);
	draw_sprite_ext(sprite_index,1,x+16,y,-1,1,0,c_white,1);
} else {
event_inherited();
}