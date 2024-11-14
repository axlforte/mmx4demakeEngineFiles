function player_shoot_projectile(_object, _affect_direction = false) {
	if(G.mp){
		var bluff = buffer_create(256, buffer_grow, 1);
		buffer_seek(bluff, buffer_seek_start, 0);

		// Write the command, and the name into the buffer.
		buffer_write(bluff, buffer_s16, KEY_CMD);
		
		// is this a new projectile? yes!
		buffer_write(bluff, buffer_bool, true);
		
		//send projectile data
		buffer_write(bluff, buffer_string, _object); // object name
		buffer_write(bluff, buffer_string, x); // x
		buffer_write(bluff, buffer_string, y); // y
		buffer_write(bluff, buffer_string, dir); // dir
		buffer_write(bluff, buffer_string, G.ServerName); // owner

		// Send this to the server
		network_send_packet(client, bluff, buffer_tell(bluff));
		buffer_delete(bluff);
	} else {
		var inst = instance_create_depth(x, y, depth - 10, _object);
		inst.image_xscale = dir;
		inst.h_speed = inst.abs_hspeed * dir;
		inst.dir = dir;
		inst.owner = id;
		inst.dir_angle = shot_angle;
		inst.dash = inst.dash_enabled && dash_shot_count < dash_shot_limit && (state == states.dash || walk_speed == dash_speed);
		if (inst.dash)
			dash_shot_count++;	
		inst.is_main = true;
		shoot_update_position = true;

		if (_affect_direction) {
			inst.shot_direction_index = shoot_direction_index;
			switch(shoot_direction_index) {
				case 0:
				case 1:
				case 2:
					inst.image_index = shoot_direction_index; break;
				case 3:
					inst.image_index = 1;
					inst.image_yscale = -1; break;
				case 4:
					inst.image_index = 2;
					inst.image_yscale = -1; break;	
			}
			inst.image_index_start = inst.image_index;
			inst.shot_angle = player_get_aim_angle();
			inst.image_index = (inst.image_number / 3) * inst.image_index_start;
		}
		player_add_projectile(inst);
		shots_count++;
		if (previous_charge_level > 0) {
			charged_shots_count++;
			inst.charged_shot = true;
		}
		shoot = true;
		return inst;
	}
}
