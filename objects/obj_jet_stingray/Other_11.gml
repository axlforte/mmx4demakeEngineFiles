enum STINGRAY {
	DASH,
	STINGER,
	CRUNCH,
	CHARBLARGE,
	LAND_STINGER,
	REVERSE_TACKLE,
	LENGTH
}
switch (state) {
	#region Jump before DASH Attack
	case STINGRAY.CRUNCH:
		if (t == 0) {
			//show_debug_message("what is happening here")
			animation_play("fall");//puts stingray into his falling pose
			v_speed = -jump_strength * (random_range(13,20) / 20);// randomizes the vertical velocity
			grav = gravity_default * grav_magnitude;// changes gravity depending on the difficulty
			look_at_player();//faces the player, wherever they are
			h_speed = 0;// stops moving side to side
			if(random_range(1,5) > 4){//a 20 percent chance to 
				state_set(STINGRAY.CHARBLARGE);//dash without jumping
			}
		}
		if (v_speed >= 0 && t > 15) {
			state_set(STINGRAY.DASH);//go into a dash when stingray is falling
		}
		break;
	#endregion
	
	#region
	case STINGRAY.REVERSE_TACKLE://moves under the player then goes straight up
		if(t == 0){
			animation_play("thunder");// plays an animation where stingray shoots projectiles
		}
		
		if(t < 45){
			x -= 9 * dir
		}else if(t == 60){
			animation_play("headbonk");
			x = global.player_x;
			y = 1904;
		}else if(t > 45){
			y -= 6;
		}
	
		if(y < 1280){
			y = 1280;
			x = 9912;
			state_set(boss_states.idle);
		}
	break;
	#endregion
	
	#region
	case STINGRAY.CHARBLARGE:
		if(t == 0){
			look_at_player();//face the player
			//show_debug_message("ro")
		}
	
		if(t >= 15){//wait a bit
			y -= 32; // move up half a tile
			state_set(STINGRAY.DASH);// dash
		}
	break;
	#endregion
	
	#region Jump to Attack with Missile
	case STINGRAY.LAND_STINGER:
		if (t == 0) {
			//show_debug_message("dah")
			h_speed = 0;
			v_speed = 0;
			grav = 0;//stop moving at all
			look_at_player();
			if(is_on_floor()){// play shooting animation
				animation_play("shoot");
			} else {
				animation_play("shoot_air");
			}
			var inst = instance_create_depth(x, y, depth - 5, obj_jet_stingray_baby);
			inst.h_speed = array_get([1, 2, 3], global.difficulty) * dir;
			inst.v_speed = array_get([3, 4, 5], global.difficulty);
			inst.dir = dir;
			inst.xscale = -dir;//shoot a baby stingray
			if(random_range(1,5) > 4){
				inst.type = 2;//20 percent chance to make a wall crawling baby
			}//plays a sound when shooting a baby
			audio_play(snd_octopus_missile);//needs a different sound
		}
		if (t == jump_wait) {
			grav = gravity_default * grav_magnitude;//restart gravity
		}
		if (t >= jump_wait && is_on_floor()) {// if gravity is on and touching floor
			state_set(boss_states.idle);
			h_speed = 0;
			v_speed = 0;
			grav = 0;
		}
		break;
	#endregion
	#region DASH (Spin attack)
	case STINGRAY.DASH:
		if(t == 0){
			animation_play("dash");// change animation
			//show_debug_message("brr")
			v_speed = 0;
			grav = 0;
			look_at_player();
			h_speed = crunch_speed * dir;//move forwards at dashing speed depending on difficulty
		}
		
		if(t % 15 == 2){//every quarter of a second make a dash effect
			var inst = instance_create_depth(x, y, depth - 5, obj_jet_stingray_exhaust);
			inst.dir = dir* -1;
			inst.xscale = -dir;
		}
		
		if (place_meeting(x - 1, y, obj_block_parent) && dir == -1) {// if facing left
			done_with_dash = true;//end the dash
			//move_x(8);
		} else if (place_meeting(x + 1, y, obj_block_parent) && dir == 1) {//if facing right
			done_with_dash = true;
			//move_x(-8);
		} //else if(is_on_floor()){
			//done_with_dash = true;
		//}
		
		if(done_with_dash){// if done with dash, change state and reset the variables
			if(random_range(0,256) > 150){// random chance to shoot babies
				state_set(STINGRAY.LAND_STINGER);
				grav = 0;// a fair amount of variables are set twice but thats alright
				v_speed = 0;
				h_speed = 0;
			} else {
				state_set(boss_states.fall);// fall to the ground and decide on next move
				grav = gravity_default * grav_magnitude;
				v_speed = -1;
				h_speed = 0;
			}
				done_with_dash = false;
		}
		break;
	#endregion
	
	#region
	case STINGRAY.STINGER:
		if (t == 0) {// immediately go to the ground version, which 
			animation_play("fall");
			//show_debug_message("craps out")
			state_set(STINGRAY.LAND_STINGER);
		}
		break;
	#endregion
}