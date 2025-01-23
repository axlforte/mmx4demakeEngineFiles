x = global.player_x;
y = global.player_y - 64;
palette_reset();
draw_rectangle(x,y,x + string_length(ds_list_find_index(loc_names, index)) * 8,y + 8, false);
draw_string(x,y,string(ds_list_find_index(possible_locations, index)), colors.dark_green);
palette_shader();