image_xscale = 2;

v_speed = 1;

scr_moving_platform_init();
death_timer = 0;
death_limit = 500;
//coll = instance_create_depth(x,y,depth,obj_square_16);
coll.x = x - 16;
coll.image_xscale = image_xscale;