function player_x_shotgun_ice(lvl = -1, t = 0) {
	charge_level = -1;
	shoot_type = shoot_types.normal;
	shoot_limit = 16;
	shoot_animation = "";

	switch (lvl) {
		// Normal shot
		case 0:
			player_shoot_projectile(obj_player_x_shotgun_ice);
		break;

		// Super-Charged shot
		default:
			if (lvl >= 3) {
				player_shoot_projectile(obj_player_x_shotgun_ice_2);
			}
	}
	shot_id = 0;


}
