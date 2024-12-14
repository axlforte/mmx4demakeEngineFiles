for(k = 0; k < array_length(particles); k++){
	particles[k,3] += 1;
	if(particles[k,3] >= particle_life){
		var pos = random_range(0,360);
		particles[k,0] = sin(pos) * (particle_dist + random_range(0,5));
		particles[k,1] = cos(pos) * (particle_dist + random_range(0,5));
		particles[k,2] = 0;
		particles[k,3] = 0;
		particles[k,4] = pos;
	} else {
		particles[k,0] += sin(particles[k,4]) * (particle_dist / particle_life) * -1;
		particles[k,1] += cos(particles[k,4]) * (particle_dist / particle_life) * -1;
		particles[k,2] = (particles[k,3] / particle_life)*8;
	}
}

var myPlayer = instance_nearest(x, y, obj_player_parent);

x = myPlayer.x;
y = myPlayer.y - 8;
if(myPlayer.dir == -1){
	x -= 8;
}

if(myPlayer.charge_level == 2){
	particle_image = spr_charge_particle_l2;
} else if(myPlayer.charge_level == 3){
	color = c_fuchsia;
} else if(myPlayer.charge == false){
	instance_destroy();
}