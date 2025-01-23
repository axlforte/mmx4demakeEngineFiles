x = __view_get(e__VW.XView, 0) + x_off;
y = __view_get(e__VW.YView, 0) + y_off;
draw_self();
palette_reset();
for(var i = 0; i < array_length(ltrarray); i++){
	ltrnum = ltrarray[i];
	draw_sprite(spr_text_font_normal, ltrnum, x - ltroffset + i * 8 + 8,y - 2);
}
palette_shader();