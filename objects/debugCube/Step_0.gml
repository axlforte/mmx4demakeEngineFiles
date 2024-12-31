
scr_keys_update();

if(key_right){
	x+=spd;
	if(on_slope){
		y -= slope_scale
	}
}
if(key_left){
	x-=spd;
	if(on_slope){
		y += slope_scale
	}
}

camera_set_view_pos(view_camera[0],x - 160,y - 120)

//slope detection
slope = noone;
if(instance_place(x + sloffset, y + height, obj_slope_parent)){
	slope = instance_place(x + sloffset, y + height, obj_slope_parent);
	
} 

if(slope != noone){
	on_slope = true;
	slope_height = slope.image_yscale;
	slope_width = slope.image_xscale;
	slope_scale = slope_height / slope_width;
	ignore_regular_ground = true;
	if(slope.x + 8*slope_width < x){
		sloffset = width;
	} else {
		sloffset = 0;
	}
} else {
	on_slope = false;
	ignore_regular_ground = false;	
}

if(on_slope){
	grounded = true;
} else if(instance_place(x + width, y + height, obj_square_parent) && !ignore_regular_ground){
	grounded = true;
} else if(instance_place(x - width, y + height, obj_square_parent) && !ignore_regular_ground){
	grounded = true;
} else {
	grounded = false;
}

if(!grounded){
	y += 1;
} else {
	//y -= 1;
}