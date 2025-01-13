if(endo){
	draw_sprite_ext(sprite_index,3,x,y-16,1,1,180,c_white,1);
	draw_sprite_ext(sprite_index,3,x,y+16,-1,1,180,c_white,1);
} else {
	draw_sprite_ext(sprite_index,2,x+16,y,-1,1,180,c_white,1);
}