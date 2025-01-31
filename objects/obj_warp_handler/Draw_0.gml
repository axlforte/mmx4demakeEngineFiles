x = global.player_x;
y = global.player_y - 64;
palette_reset();

var _name = "hq";

if(ds_list_find_value(possible_locations, index) == rm_jet_stingray){
	_name = "warehouse";
} else if(ds_list_find_value(possible_locations, index) == rm_web_spider){
	_name = "jungle";
} else if(ds_list_find_value(possible_locations, index) == rm_magma_dragoon){
	_name = "volcano";
}

//draw_rectangle(x,y,x + string_length(_name) * 8,y + 8, false);
draw_string(160 - string_length((_name)) * 8,90,_name, colors.blue);
draw_string(161 - string_length((_name)) * 8,91,_name, colors.dark_blue);
palette_shader();