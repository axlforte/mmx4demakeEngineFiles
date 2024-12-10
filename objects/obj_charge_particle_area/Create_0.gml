particle_delay = 3;
particle_life = 18;
particle_dist = 32;
particles = [];//x,y,frame, time alive, direction
index = 0;
color = c_white;
particle_image = spr_charge_particle;
for(i = 0; i < particle_life / particle_delay + 1; i++){
	particles[i,0] = 0;
	particles[i,1] = 0;
	particles[i,2] = 0;
	particles[i,3] = i * particle_delay + particle_delay;
	particles[i,4] = 0;
}
depth -= 1;

particle_image_index_array = [7,6,4,2,0,0,1,2,2,3,3,4,5,5,6,6,7,7,7];