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