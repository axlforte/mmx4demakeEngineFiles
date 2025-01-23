instance_create_depth(x,y,depth,explode_FX);
instance_create_depth(x,y + 64,depth,explode_FX);
instance_create_depth(x,y + 32,depth,explode_FX);
instance_create_depth(x,y - 64,depth,explode_FX);
instance_create_depth(x,y - 32,depth,explode_FX);

instance_destroy(coll);