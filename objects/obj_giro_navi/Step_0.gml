can_find_goodie = false;
for(o = array_length(goodees_list) - 1; o > 0; o--){// i usually dont go DOWN an array but i messed up the order
	if(instance_nearest(x,y,goodees_list[o]) != noone){
		wish_x = instance_nearest(x,y,goodees_list[o]).x;
		wish_y = instance_nearest(x,y,goodees_list[o]).y;
		can_find_goodie = true;
	}
}

var cam_x = camera_get_view_x(view_camera[0]) + 160;
var cam_y = camera_get_view_y(view_camera[0]) + 120;

if(abs(x - wish_x) < 10){
	spd = 1;
} else if(abs(x - wish_x) < 35){
	spd = 2;
} else if(abs(x - wish_x) < 80){
	spd = 3;
} else if(abs(x - wish_x) < 140){
	spd = 4;
} else if(abs(x - wish_x) < 200){
	spd = 5;
} else if(abs(x - wish_x) < 300){
	spd = 6;
} 

if(player != noone){
	if(!can_find_goodie){
		wish_x = player.x;
		wish_y = player.y;
	}
	if(x > wish_x && abs(x - cam_x) < 140){
		x -= spd;
	} else if(x < wish_x && abs(x - cam_x) < 140){
		x += spd;
	}
	
	if(y > wish_y && abs(y - cam_y) < 100){
		y -= spd;
	} else if(y < wish_y && abs(y - cam_y) < 100){
		y += spd;
	}
	
	if(abs(y - cam_y) > 140 || abs(x - cam_x) > 180){
		x = player.x;
		y = player.y;
	}
}
		
spinny += 0.2;

if(spinny > 720){
	spinny = 0;
}

ind_flip++;
if(ind_flip >= spd){
	ind_flip = 0;
	index++;
	if(index > 3){
		index = 0;
	}
}