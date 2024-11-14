PAUSE;
if (instance_exists(owner)) {
	local_game_speed = owner.local_game_speed;	
}
local_game_speed_update();
if (local_game_run_step) {
	event_user(1);
	if (animation_auto) {
		animation_update(true);
	}
	if (physics_auto) {
		scr_physics_update();
	}
	if (shot_level_increase_frames > 0) {
		shot_level_increase_t++;
		if (shot_level_increase_t >= shot_level_increase_frames) {
			shot_level++;
			shot_level_increase_t = 0;
		}
	}
	
	// make the server know our name
	// this is a threat and i am approaching your house rapidly
	if(G.mp){
		var bluff = buffer_create(256, buffer_grow, 1);
		buffer_seek(bluff, buffer_seek_start, 0);

		// Write the command, and the name into the buffer.
		buffer_write(bluff, buffer_s16, KEY_CMD);
		
		// is this a new projectile? no!
		buffer_write(bluff, buffer_bool, false);
		
		//send projectile data
		buffer_write(bluff, buffer_string, owner); // object name
		buffer_write(bluff, buffer_string, x); // x
		buffer_write(bluff, buffer_string, y); // y

		// Send this to the server
		network_send_packet(client, bluff, buffer_tell(bluff));
		buffer_delete(bluff);
	}
}
if (animation_end_destroy && animation_end) {
	instance_destroy();
	exit;
}
