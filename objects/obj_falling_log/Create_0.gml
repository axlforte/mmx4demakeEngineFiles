v_speed = array_get([0.5, 0.75, 1, 1.5], global.difficulty);

scr_moving_platform_init();
death_timer = 0;
death_limit = 500;
x_zone = 15;
moves_x = false;
lock_player_y = true;
//coll = instance_create_depth(x,y,depth,obj_square_16);
coll.x = x - 24;
coll.image_xscale = 3;