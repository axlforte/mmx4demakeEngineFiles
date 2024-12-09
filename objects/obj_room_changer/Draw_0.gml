depth = dp;
draw_sprite_ext(sprite_index, floor(image_index), floor(x), floor(y), 1, 1, 0, c_white, 1);

if(tran_timer > 0){
	depth = -10000000;
	draw_sprite_ext(spr_square_16, 0, x - 300, y - 300, 64, 64,0,c_white,(tran_timer/30));
}