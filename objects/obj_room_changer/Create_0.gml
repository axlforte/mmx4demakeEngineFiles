px = 0;
py = 0;
width = 32;
height = 48;
location = rm_frost_walrus;
cam = 0;
loc_x = 0;
loc_y = 0;
candoor = false;
dp = depth;
tran_timer = 0;
auto_door = false;
door_id = 0;
id_to_go_to = 0;
use_location_over_door_id = false;
door_tran_effect_limit = 30;

interactible = true;

alarm[0] = 15;
scr_keys_reset();
animation_init();
animations_init();

animation_add("opening|open",[
0,0,
2,1,
4,2,
6,3,
8,4,
10,5,
12,6,
14,7,
16,8,
18,9,
20,9
],18,20);

animation_add("close|open",[
0,9,
2,8,
4,7,
6,6,
8,5,
10,4,
12,3,
14,2,
16,1,
18,0,
20,0
],18,20);

animation_play("close");