event_inherited();
lkp[0,0] = x;
lkp[0,1] = y;
for(k = link_count*link_delay+1; k > 0 ; k--){
	lkp[k,0] = lkp[k - 1,0];
	lkp[k,1] = lkp[k - 1,1];
}

if(!can_move_x((abs(sin(x / 32)) + 0.1)*2)){
	flip_cos_wall = true;
}
if(!can_move_x((abs(sin(x / 32)) + 0.1)*-2) && flip_cos_wall){
	flip_cos_wall = true;
}

if(flip_cos_wall){
	x -= (abs(sin(x / 32)) + 0.1)*2;
} else {
	x += (abs(sin(x / 32)) + 0.1)*2;
}