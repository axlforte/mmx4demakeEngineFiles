/// @description  Start game - connect to a remote server
var i = iServerName;
global.ServerName = i.Text;

network_destroy(global.broadcast_server);
global.broadcast_server = -1;


show_debug_message("#######################################");
show_debug_message("Next room");
show_debug_message("#######################################");
room_goto(rm_road_to_stingray);

