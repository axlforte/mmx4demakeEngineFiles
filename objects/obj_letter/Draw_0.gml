palette_shader();
draw_sprite(spr_text_font_normal,ltrNum,x + random_range(0, wobble),
y + random_range(0, wobble) + sin((sine_time / sine_speed)*pi) * sine * 1.25);
palette_reset();
//draw_string_center(x,y,letter);
//this method didnt work ):