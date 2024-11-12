/// @description  Draw server list
draw_set_font(font0);
draw_set_color(c_black);
draw_text(10, 10, string_hash_to_newline("Select server"));
draw_line(10, 30, room_width - 10, 30);

var yindex = 40;
var count = ds_list_size(global.serverlist);
for(var i = 0; i < count; ++i;)
{
draw_text(10, yindex, string(ds_list_find_value(global.serverlist, i) + "  " + ds_list_find_value(global.servernames, i) + "'s server"));
yindex += 30;
}


