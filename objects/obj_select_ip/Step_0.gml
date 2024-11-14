scr_keys_update();

if(key_p_left){
	if(focus > 0){
		focus--;
	}
}
if(key_p_right){
	if(focus < 3){
		focus++;
	}
}

if(key_p_up){
	if(focus == 0){
		if(key_shoot2){
			num1+=100;
		} else if(key_shoot){
			num1+=10;
		} else {
			num1++;
		}
	} else if(focus == 1){
		if(key_shoot2){
			num2+=100;
		} else if(key_shoot){
			num2+=10;
		} else {
			num2++;
		}
	} else if(focus == 2){
		if(key_shoot2){
			num3+=100;
		} else if(key_shoot){
			num3+=10;
		} else {
			num3++;
		};
	} else if(focus == 3){
		if(key_shoot2){
			num4+=100;
		} else if(key_shoot){
			num4+=10;
		} else {
			num4++;
		}
	} 
}

if(key_p_down){
	if(focus == 0){
		if(key_shoot2){
			num1-=100;
		} else if(key_shoot){
			num1-=10;
		} else {
			num1--;
		}
	} else if(focus == 1){
		if(key_shoot2){
			num2-=100;
		} else if(key_shoot){
			num2-=10;
		} else {
			num2--;
		}
	} else if(focus == 2){
		if(key_shoot2){
			num3-=100;
		} else if(key_shoot){
			num3-=10;
		} else {
			num3--;
		}
	} else if(focus == 3){
		if(key_shoot2){
			num4-=100;
		} else if(key_shoot){
			num4-=10;
		} else {
			num4--;
		}
	} 
}

if(key_p_dash){
	instance_create_depth(0,0,-600,obj_server_handler);
	room = rm_warehouse_lounge;
} else if(key_p_start){
	global.ip = string(_ip);
	instance_create_depth(0,0,-600,obj_client_handler);
	room = rm_warehouse_lounge;
}