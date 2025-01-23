/*This gets the current player and opens up their skill tree. 

needed information:
- a skill tree array
- what each skill does
- how they get unlocked
- how they get rendered
- how to get in and out of the menu

skill tree array can be a script loaded with the global variables. 
what each skill does can be set in here. it will be noted in the global array however.
i would assume enemies would have a new exp value that defaults to 1. bosses default to 15. some items can also give exp
mmm yay line rendering
assumedly the same way the pause menu is rendered. must check how this is possible.

*/

scr_keys_reset();
slerp = 0.25;
opt = 0;
y = y - 240;
y_step_total = 8;
y_steps = y_step_total;
y_step_length = 240 / y_step_total;
//enums
enum pause_menus{
	weapons,
	upgrades,
	map,
	length
}
menu = pause_menus.weapons;

enum upgrade_menu{
	none,
	head,
	arms,
	body,
	legs,
	length
}
umenu = upgrade_menu.none;

wep_offset = 0;//offset is how far you have to scroll to get to the weapon

slerp_x = 0;
slerp_y = 0;
slerp_x_scale = 1;
slerp_y_scale = 1;

xsale = 1;
ysale = 1;
px = 0;
py = 0;

//menu selection
sel = 0;
alt_path = false;

title = "";
prev_title = "";
desc = "";
xp = 0;
oof = 0;

desc_cutoff_length = 25;

palette_init();

var p = instance_nearest(x,y,obj_player_parent);
weapon_selectable = [];
player_weapon_settings();
player_x_weapon_reset();
weps = p.weapon_list;
nrg = p.weapon_energy;
hp = p.hp;
length = array_length(weapon_selectable) - 1;
show_debug_message(string(array_length(weapon_selectable)));
show_debug_message(string(array_length(p.weapon_list)));

piss_off = false;

map = web_spider_map;

//simple tilemap fetching code
var lay_id = layer_get_id("map_reading_tiles");
map_id = layer_tilemap_get_id(lay_id);
tpix = noone;

if(global.pause_type == pause_types.none){
	instance_destroy();
}