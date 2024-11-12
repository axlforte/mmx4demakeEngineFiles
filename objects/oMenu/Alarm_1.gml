/// @description  Start game - local client+server
var i = iServerName;
global.ServerName = i.Text;
global.Server = instance_create_layer(0, 0,"Instances", oServer);
if global.haveserver == false
{
show_debug_message("Cant create server");
}
else
{
global.connectip = "127.0.0.1";
network_destroy(global.broadcast_server);
global.broadcast_server = -1;
show_debug_message("#######################################");
show_debug_message("Start game");
show_debug_message("#######################################");
room_goto(rm_road_to_stingray);
}

