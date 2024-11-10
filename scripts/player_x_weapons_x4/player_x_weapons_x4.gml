function player_lightning_web(lvl = -1, t = 0) {
	charge_level = -1;
	shoot_type = shoot_types.normal;
	shoot_limit = 16;
	shoot_animation = "";
	switch (lvl) {
		// Normal shot
		case 0:
			player_shoot_projectile(obj_player_x_lightning_web);
		break;
		// Super-Charged shot
		default:
			if (lvl >= 3) {
				player_shoot_open_arms(obj_player_x_shot_storm_tornado_2);
			}
	}
	shot_id = 0;
}

function player_rising_fire(lvl = -1, t = 0) {
	charge_level = -1;
	shoot_type = shoot_types.normal;
	shoot_limit = 16;
	shoot_animation = "";
	switch (lvl) {
		// Normal shot
		case 0:
			player_shoot_punch_up(obj_player_x_rising_fire);
		break;
		// Super-Charged shot
		default:
			if (lvl >= 3) {
				player_shoot_open_arms(obj_player_x_shot_storm_tornado_2);
			}
	}
	shot_id = 0;
}

function player_double_cyclone(lvl = -1, t = 0) {
	charge_level = -1;
	shoot_type = shoot_types.normal;
	shoot_limit = 16;
	shoot_animation = "";
	switch (lvl) {
		// Normal shot
		case 0:
			player_shoot_open_arms(obj_player_x_double_cyclone);
		break;
		// Super-Charged shot
		default:
			if (lvl >= 3) {
				player_shoot_open_arms(obj_player_x_shot_storm_tornado_2);
			}
	}
	shot_id = 0;
}

function player_ground_chaser(lvl = -1, t = 0) {
	charge_level = -1;
	shoot_type = shoot_types.normal;
	shoot_limit = 16;
	shoot_animation = "";
	switch (lvl) {
		// Normal shot
		case 0:
			player_shoot_projectile(obj_player_x_ground_hunter);
		break;
		// Super-Charged shot
		default:
			if (lvl >= 3) {
				player_shoot_open_arms(obj_player_x_shot_storm_tornado_2);
			}
	}
	shot_id = 0;
}

function player_frost_spike(lvl = -1, t = 0) {
	charge_level = -1;
	shoot_type = shoot_types.normal;
	shoot_limit = 16;
	shoot_animation = "";
	switch (lvl) {
		// Normal shot
		case 0:
			player_shoot_projectile(obj_player_x_shot_storm_tornado);
		break;
		// Super-Charged shot
		default:
			if (lvl >= 3) {
				player_shoot_open_arms(obj_player_x_shot_storm_tornado_2);
			}
	}
	shot_id = 0;
}

function player_aiming_laser(lvl = -1, t = 0) {
	charge_level = -1;
	shoot_type = shoot_types.normal;
	shoot_limit = 16;
	shoot_animation = "";
	switch (lvl) {
		// Normal shot
		case 0:
			player_shoot_projectile(obj_player_x_shot_storm_tornado);
		break;
		// Super-Charged shot
		default:
			if (lvl >= 3) {
				player_shoot_open_arms(obj_player_x_shot_storm_tornado_2);
			}
	}
	shot_id = 0;
}

function player_soul_body(lvl = -1, t = 0) {
	charge_level = -1;
	shoot_type = shoot_types.normal;
	shoot_limit = 16;
	shoot_animation = "";
	switch (lvl) {
		// Normal shot
		case 0:
			player_shoot_projectile(obj_player_x_soul_body);
		break;
		// Super-Charged shot
		default:
			if (lvl >= 3) {
				player_shoot_open_arms(obj_player_x_shot_storm_tornado_2);
			}
	}
	shot_id = 0;
}

function player_twin_slasher(lvl = -1, t = 0) {
	charge_level = -1;
	shoot_type = shoot_types.normal;
	shoot_limit = 16;
	shoot_animation = "";
	switch (lvl) {
		// Normal shot
		case 0:
			player_shoot_projectile(obj_player_x_twin_slasher);
		break;
		// Super-Charged shot
		default:
			if (lvl >= 3) {
				player_shoot_open_arms(obj_player_x_shot_storm_tornado_2);
			}
	}
	shot_id = 0;
}