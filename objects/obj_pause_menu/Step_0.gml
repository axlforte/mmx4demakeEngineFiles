scr_keys_update()

if(piss_off){
	y -= y_step_length;
	y_steps++;
	switch(y_steps){
		case(1):
			with(obj_player_parent){
				if(!instance_place(x,y,par_ride_armor)){//maybe fixes the issue?
					state_set(states.idle);
				}
			}
		break;
		case(8):
			instance_destroy();
		break;
	}
} else if(y_steps > 0){
	y += y_step_length;
	y_steps--;
} else {
	switch(menu){
		case(pause_menus.settings):
			if(key_p_wp1){
				menu = pause_menus.upgrades;
			} else if(key_p_wp2){
				menu = pause_menus.weapons;
			}
			
			if(key_p_up){
				selected_item--;
				if(selected_item < 0){
					selected_item = array_length(page_items) - 1;
				}
			}
			if(key_p_down){
				selected_item++;
				if(selected_item > array_length(page_items) - 1){
					selected_item = 0;
				}
			}
			subitem = (selected_item > 2 ? page_items[0][2] : 0);
			hinput_p = key_p_right - key_p_left;
			hinput = key_right - key_left;
			enter = key_p_shoot;
			scr_settings();
		break;
		case(pause_menus.key_config):
			if(key_p_up){
				selected_item--;
				if(selected_item < 0){
					selected_item = array_length(page_items) - 1;
				}
			}
			if(key_p_down){
				selected_item++;
				if(selected_item > array_length(page_items) - 1){
					selected_item = 0;
				}
			}
			subitem = (selected_item > 2 ? page_items[0][2] : 0);
			hinput_p = key_p_right - key_p_left;
			hinput = key_right - key_left;
			enter = key_p_shoot;
			scr_settings();
		break;
		case(pause_menus.weapons):
			if(key_p_wp1){
				menu = pause_menus.settings;
			} else if(key_p_wp2){
				menu = pause_menus.map;
			}
			
			if(selecting_sub_tanks){
				if(key_p_shoot){
					if(global.difficulty == diff_modes.easy){
						var p = instance_nearest(x,y,obj_player_parent);
						var heal = p.max_hp - p.hp;
						if(heal > global.tank_storage[0]){
							p.hp += global.tank_storage[0];
							global.tank_storage[0] = 0;
						} else {
							global.tank_storage[0] -= heal;
							p.hp += heal;
						}
					}
				}
			} else {
				if(key_p_down){
					with(obj_player_parent){
						player_check_weapon_change(1,0);
					}
					weapon_id = instance_nearest(x,y,obj_player_parent).weapon_id;
				} else if(key_p_up){
					with(obj_player_parent){
						player_check_weapon_change(0,1);
					}
					weapon_id = instance_nearest(x,y,obj_player_parent).weapon_id;
				}
			}
		break;
		case(pause_menus.upgrades):
			switch(umenu){
				case(upgrade_menu.none):
					if(key_p_wp1){//left
						menu = pause_menus.map;
					} else if(key_p_wp2){//right
						menu = pause_menus.settings;
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
		case(pause_menus.map):
			if(key_p_wp1){
				menu = pause_menus.weapons;
			} else if(key_p_wp2){
				menu = pause_menus.upgrades;
			}
		break;
	}
}

xsale = lerp(xsale,slerp_x_scale,slerp);
ysale = lerp(ysale,slerp_y_scale,slerp);
px = lerp(px, slerp_x, slerp);
py = lerp(py, slerp_y, slerp);