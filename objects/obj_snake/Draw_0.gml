for(l = 0; l < link_count; l++){
	draw_sprite_ext(link_image,link_sprites[l],lkp[l * link_delay,0],lkp[l * link_delay,1],dir * -1, 1, 0, c_white, 1);
}