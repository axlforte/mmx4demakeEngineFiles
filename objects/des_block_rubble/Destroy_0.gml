event_inherited();
instance_create_on_self(explosion_set_box);
instance_create_depth(x + 32,y + 16,depth, obj_rubble_rubble);
instance_create_depth(x,y + 16,depth, obj_rubble_rubble);
instance_create_depth(x - 32,y + 16,depth, obj_rubble_rubble);
instance_create_depth(x + 32,y - 16,depth, obj_rubble_rubble);
instance_create_depth(x,y - 16,depth, obj_rubble_rubble);
instance_create_depth(x - 32,y - 16,depth, obj_rubble_rubble);