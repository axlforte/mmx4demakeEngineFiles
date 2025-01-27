x = global.player_x;
y = global.player_y - 64;
palette_reset();
draw_rectangle(x,y,x + string_length(ds_list_find_value(possible_locations, index)) * 8,y + 8, false);
draw_string(0,0,string(ds_list_find_value(possible_locations, index)), colors.dark_green);
palette_shader();