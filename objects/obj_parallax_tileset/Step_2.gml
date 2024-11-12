var myPlayer = instance_nearest(x, y, obj_player_parent);
x = __view_get(e__VW.XView, 0);
y = __view_get(e__VW.YView, 0);
if(stage == "highway"){
	layer_x(109,x/2);
	layer_y(109,y/16)
	layer_x(108,x/4);
	layer_x(110,x/4);
	layer_y(110,y/8)
}
layers = layer_get_all();