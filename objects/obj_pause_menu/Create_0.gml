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
y_steps = 8;
y_step_length = 240 / y_steps;
//enums
enum pause_menus{
	weapons,
	upgrades,
	saves,
	length
}
menu = pause_menus.upgrades;

enum upgrade_menu{
	none,
	head,
	arms,
	body,
	legs,
	length
}
umenu = upgrade_menu.none;

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