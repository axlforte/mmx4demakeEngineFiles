function player_get_weapon_energy_array() {
	var wp = argument[0]; 	
	var plr = instance_nearest(x,y,obj_player_parent);
	return[
		plr.weapon_energy[weapons.lightning_web],
		plr.weapon_energy[weapons.frost_spike],
		plr.weapon_energy[weapons.soul_body],
		plr.weapon_energy[weapons.rising_fire],
		plr.weapon_energy[weapons.ground_hunter],
		plr.weapon_energy[weapons.aiming_laser],
		plr.weapon_energy[weapons.double_cyclone],
		plr.weapon_energy[weapons.twin_slasher]
	]
}
