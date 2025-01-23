var col = c_white;
if (amazing)
	col = #ff508a;
if(tim < fadeTime / 2 || tim % 2 == 0){
	if(ind > 9){
		draw_sprite_ext(spr, ind/10, x, y, 1, 1 + (tim / fadeTime), 0, col, 1);
		draw_sprite_ext(spr, ind, x + 10, y, 1, 1 + (tim / fadeTime), 0, col, 1);
	} else if(ind > 99){
		draw_sprite_ext(spr, ind/100, x, y, 1, 1 + (tim / fadeTime), 0, col, 1);
		draw_sprite_ext(spr, ind/10, x + 10, y, 1, 1 + (tim / fadeTime), 0, col, 1);
		draw_sprite_ext(spr, ind, x + 20, y, 1, 1 + (tim / fadeTime), 0, col, 1);
	} else {
		draw_sprite_ext(spr, ind, x, y, 1, 1 + (tim / fadeTime), 0, col, 1);
	}
}