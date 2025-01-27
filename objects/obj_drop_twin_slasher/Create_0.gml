player = instance_nearest(x,y,obj_player_parent);
weapon = weapons.twin_slasher;
sprite = pause_menu_icons1;
poffset = 16;
spr_width = 8;
pickup_pause = false;
amount = 1;

if(global.rando){
	rando_id = 0;
	has_been_randoed = false;
	alarm[0] = 1;
}