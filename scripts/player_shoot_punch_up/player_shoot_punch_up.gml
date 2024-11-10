function player_shoot_punch_up() {
	if (state == states.dolor) exit;
	state_set(states.punch_up, 0);
	shoot_next_projectile = argument[0];
	player_add_projectile();
	shoot_limit = 24;
	shoot_at_time = 8;


}
