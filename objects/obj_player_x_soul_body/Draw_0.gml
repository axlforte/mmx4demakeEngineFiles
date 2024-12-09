var myPlayer = instance_nearest(x, y, obj_player_parent);
palette_shader();
draw_sprite_ext(global.player_sprite, global.player_sprite_frame,x,y,myPlayer.dir,1,0,c_white,0.8);
palette_reset();