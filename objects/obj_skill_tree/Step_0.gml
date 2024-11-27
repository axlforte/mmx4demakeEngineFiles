scr_keys_update()
switch(menu){
	case(upgrade_menu.none):
		if(key_p_shoot){
			if(opt == 0){
				menu = upgrade_menu.head;
				slerp_x = -440;
				slerp_y = -120;
				slerp_x_scale = 3;
				slerp_y_scale = 3;
			} else if(opt == 1){
				menu = upgrade_menu.body;
				slerp_x = -440;
				slerp_y = -180;
				slerp_x_scale = 3;
				slerp_y_scale = 3;
			} else if(opt == 2){
				menu = upgrade_menu.arms;
				slerp_x = -540;
				slerp_y = -240;
				slerp_x_scale = 3;
				slerp_y_scale = 3;
			} else {
				menu = upgrade_menu.legs;
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
			menu = upgrade_menu.none;
			slerp_x = 0;
			slerp_y = 0;
			slerp_x_scale = 1;
			slerp_y_scale = 1;
		}
	break;
	case(upgrade_menu.arms):
		if(key_p_shoot2){
			menu = upgrade_menu.none;
			slerp_x = 0;
			slerp_y = 0;
			slerp_x_scale = 1;
			slerp_y_scale = 1;
		}
	break;
	case(upgrade_menu.body):
		if(key_p_shoot2){
			menu = upgrade_menu.none;
			slerp_x = 0;
			slerp_y = 0;
			slerp_x_scale = 1;
			slerp_y_scale = 1;
		}
	break;
	case(upgrade_menu.legs):
		if(key_p_shoot2){
			menu = upgrade_menu.none;
			slerp_x = 0;
			slerp_y = 0;
			slerp_x_scale = 1;
			slerp_y_scale = 1;
		}
	break;
}

xsale = lerp(xsale,slerp_x_scale,slerp);
ysale = lerp(ysale,slerp_y_scale,slerp);
px = lerp(px, slerp_x, slerp);
py = lerp(py, slerp_y, slerp);