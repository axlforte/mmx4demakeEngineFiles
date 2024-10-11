///control object collissions
if (instance_exists(obj_player_parent))
   {
	   scr_keys_update();
       vinput_p = key_p_down - key_p_up;
       hinput_p = key_p_right - key_p_left;
       hinput = key_right - key_left;
       vinput = key_down - key_up;
       enter = key_p_start;
	/*if ((obj_player_parent.bbox_bottom) > y) || 
	   (key_down && key_jump)
	   {
	     mask_index = -1;sprite_index = -1;	
	   }
	else
	   {mask_index = spr_semisolid_square;sprite_index = spr_semisolid_square;}*/
	   
	   
	   if((obj_player_parent.bbox_left) < x + xoff && (obj_player_parent.bbox_right) > x + xoff + sprite_width && !global.grounded && (key_up != 0 || key_down != 0)){
		   obj_player_parent.state = states.ladder;
		   obj_player_parent.x = x + sprite_width / 2 + xoff;
	   }
		   
   }