function upgrade_draw(){
	var _x = argument[0]
	var _y = argument[1]
	var spr = argument[2]
	var avail = argument[3]
	draw_sprite(spr,0,_x,_y);	
	if(avail == 0){
		draw_sprite(spr_skill_got,0,_x,_y);	
	} else if(avail == 1){
		draw_sprite(spr_skill_availible,0,_x,_y);	
	} else {
		draw_sprite(spr_skill_hidden,0,_x,_y);	
	}
}

function get_upgrade_availibility(){
	var prev = argument[0]
	var curr = argument[1]
	if(prev && !curr){
		return 1;
	} else if(prev && curr){
		return 0;	
	}
	return 2;
}