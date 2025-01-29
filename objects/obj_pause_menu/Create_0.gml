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

selected_item = 0;

var wsize_options = [];
var k = 0;
while((k+1)*global.view_height + 40 <= global.screen_height) {
	wsize_options[k] = "x" + string(k+1);
	k++;
}
wsize_options[k] = "FULLSCREEN";
wsize_options[k + 1] = "STRETCHED";
global.fullscreen_index = k + 1;
// Mobile
if (G.mobile) {
	wsize_options = ["NORMAL", "STRETCHED"];
	global.fullscreen_index = 1;
}

subitem = 0;
hinput_p = 0;
hinput = 0;
enter = 0;
page_items = scr_settings_init();
key_items = scr_keys_rebind_init();

//enums
enum pause_menus{
	weapons,
	upgrades,
	map,
	settings,
	key_config
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
weapon_id = p.weapon_id;
starting_weapon_id = weapon_id;

avail_weps = ds_list_create();

for(var w = 0; w < array_length(weapon_palettes); w++){
	if(weapon_selectable[w] == true){
		ds_list_add(avail_weps,w);
	}
}

piss_off = false;

selecting_sub_tanks = false;

//simple tilemap fetching code
var lay_id = layer_get_id("map_reading_tiles");
map_id = layer_tilemap_get_id(lay_id);
tpix = noone;

if(global.pause_type == pause_types.none){
	instance_destroy();
}