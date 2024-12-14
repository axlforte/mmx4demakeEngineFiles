function player_draw_healthbar(p) {
	var xx = x_off + __view_get(e__VW.XView, 0);
	var yy = y_off + __view_get(e__VW.YView, 0);
	if(global.one_px_tall_health_bar){
		scr_draw_vertical_bar(
			xx,
			yy,
			bar_icon_sprite,
			bar_icon_index,
			p.hp,
			p.max_hp,
			p.max_bar_hp,
			spr_bar1_hp_unit,
			spr_bar1_area,
			spr_bar1_limit
		);
	} else {
		scr_draw_vertical_bar(
			xx,
			yy,
			bar_icon_sprite,
			bar_icon_index,
			p.hp,
			p.max_hp,
			p.max_bar_hp,
			spr_bar1_hp_unit,
			spr_bar1_area,
			spr_bar1_limit
		);
	}
}
function player_draw_weaponbar(p) {
	var xx = 22 + __view_get(e__VW.XView, 0);
	var yy = 95 + __view_get(e__VW.YView, 0);
	if (!p.weapon_bar_show || p.weapon_icon[p.weapon[0]] == noone) exit;
	var wp = p.weapon[0];
	scr_draw_vertical_bar(
		xx,
		yy,
		spr_wpbar1_icon,
		p.weapon_icon[wp],
		p.weapon_energy[wp],
		p.weapon_energy_max[wp],
		p.weapon_energy_max[wp],
		spr_bar1_unit,
		spr_bar1_area,
		spr_bar1_limit,
		p.weapon_color[wp]
	);
}