scr_keys_update()

if(y_steps > 0){
	y += y_step_length;
	y_steps--;
}

switch(menu){
	case(pause_menus.weapons):
		if(key_p_wp1){
			menu = pause_menus.upgrades;
		} else if(key_p_wp2){
			menu = pause_menus.upgrades;
		}
	break;
	case(pause_menus.upgrades):
		switch(umenu){
			case(upgrade_menu.none):
				if(key_p_wp1){
					menu = pause_menus.weapons;
				} else if(key_p_wp2){
					menu = pause_menus.weapons;
				}
				if(key_p_shoot){
					alt_path = false;
					sel = 0;
					if(opt == 0){
						umenu = upgrade_menu.head;
						slerp_x = -440;
						slerp_y = -120;
						slerp_x_scale = 3;
						slerp_y_scale = 3;
					} else if(opt == 1){
						umenu = upgrade_menu.body;
						slerp_x = -440;
						slerp_y = -180;
						slerp_x_scale = 3;
						slerp_y_scale = 3;
					} else if(opt == 2){
						umenu = upgrade_menu.arms;
						slerp_x = -540;
						slerp_y = -240;
						slerp_x_scale = 3;
						slerp_y_scale = 3;
					} else {
						umenu = upgrade_menu.legs;
						slerp_x = -480;
						slerp_y = -340;
						slerp_x_scale = 3;
						slerp_y_scale = 3;
					}
				} else if(key_p_up){
					opt --;
					if(opt < 0){
						opt = 3;
					}
				} else if(key_p_down){
					opt++;
					if(opt > 3){
						opt = 0;
					}
				}
			break;
	
			case(upgrade_menu.head):
				if(key_p_shoot2){
					umenu = upgrade_menu.none;
					slerp_x = 0;
					slerp_y = 0;
					slerp_x_scale = 1;
					slerp_y_scale = 1;
				}
				if(key_p_right && sel < 3){
					sel++;
				}
				if(key_p_left && sel > 0){
					sel--;
					if(sel < 2){
						alt_path = false;
					}
				}
				if(key_p_down && sel > 1){
					alt_path = true;
				}
				if(key_p_up && sel > 1){
					alt_path = false;
				}
				if(key_p_shoot){
					verify_skill_eligible(xp, title, prev_title);
				}
			break;
			
			case(upgrade_menu.body):
				if(key_p_shoot2){
					umenu = upgrade_menu.none;
					slerp_x = 0;
					slerp_y = 0;
					slerp_x_scale = 1;
					slerp_y_scale = 1;
				}
				if(key_p_right && sel < 2){
					sel++;
				}
				if(key_p_left && sel > 0){
					sel--;
					if(sel < 1){
						alt_path = false;
					}
				}
				if(key_p_down && sel > 0){
					alt_path = true;
				}
				if(key_p_up && sel > 0){
					alt_path = false;
				}
				if(key_p_shoot){
					verify_skill_eligible(xp, title, prev_title);
				}
			break;
			case(upgrade_menu.arms):
				if(key_p_shoot2){
					umenu = upgrade_menu.none;
					slerp_x = 0;
					slerp_y = 0;
					slerp_x_scale = 1;
					slerp_y_scale = 1;
				}
				if(key_p_right && sel < 3){
					sel++;
				}
				if(key_p_left && sel > 0){
					sel--;
					if(sel < 2){
						alt_path = false;
					}
				}
				if(key_p_down && sel > 1){
					alt_path = true;
				}
				if(key_p_up && sel > 1){
					alt_path = false;
				}
				if(key_p_shoot){
					verify_skill_eligible(xp, title, prev_title);
				}
			break;
			case(upgrade_menu.legs):
				if(key_p_shoot2){
					umenu = upgrade_menu.none;
					slerp_x = 0;
					slerp_y = 0;
					slerp_x_scale = 1;
					slerp_y_scale = 1;
				}
				if(key_p_right && sel < 3){
					sel++;
				}
				if(key_p_left && sel > 0){
					sel--;
				}
				if(key_p_shoot){
					verify_skill_eligible(xp, title, prev_title);
				}
			break;
		}
	break;
}

xsale = lerp(xsale,slerp_x_scale,slerp);
ysale = lerp(ysale,slerp_y_scale,slerp);
px = lerp(px, slerp_x, slerp);
py = lerp(py, slerp_y, slerp);