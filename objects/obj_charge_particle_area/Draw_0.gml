for(j = 0; j < array_length(particles); j++){
	draw_sprite_ext(particle_image,particle_image_index_array[clamp(particles[j,3],0,18)],
	particles[j,0]+x,particles[j,1]+y,1,1,0,color,0.9)
}