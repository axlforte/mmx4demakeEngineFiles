link_count = 5;
link_distance = 8;
link_delay = 4;
links = [];
links_angle = [];
for(i = 0; i < link_count; i++){
	for(j = 0; j < link_delay; j++){
		links[i,j] = 0;
	}
}
lkp = [];
for(k = 0; k < link_count*link_delay+1; k++){
	lkp[k,0] = x;
	lkp[k,1] = y;
}

