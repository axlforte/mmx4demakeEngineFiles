for(j = 0; j < array_length(particles); j++){
	draw_sprite_ext(particle_image,particle_image_index_array[clamp(particles[j,3],0,18)],
	particles[j,0]+x,particles[j,1]+y,1,1,0,color,0.9)
}

if(particle_image == spr_charge_particle_l2){
	draw_sprite_ext(spr_x_charging_glow,0,x,y,sqrt(center_loop), sqrt(center_loop),0,c_white,0.5);
	center_loop++;
	if(center_loop >= center_loop_limit)
		center_loop = 0;
}