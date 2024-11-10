var ang = sin(h_speed) + abs(cos(v_speed))
draw_sprite_ext(frost_mine,0,x,y,1,1,ang,c_white,1)
draw_text(x,y,ang / pi * 180);

draw_text(x,y - 12, sin(h_speed) + abs(cos(v_speed)));