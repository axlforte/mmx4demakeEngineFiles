switch(menu){
	case(pause_menus.key_config):
		draw_sprite(spr_upgrade_screen_background,2,x,y);
		for (var i = 1; i < items_length; i++) {
			var item = items[i];
			var _x = 64, _y = 32 + 14*i;
			// BACK
			if (i == items_length - 1) _x = 144;
			var item_name = item[0];
			// Gamepad
			var _color = (selected_item == i ? colors.pink : colors.dark_blue);
			var show_subitem = array_length(item) > 2;
			var sub_text = "";
			if (i >= 1 && i <= 4 && global.settings[1] == 1) {
				sub_text = " ";
				switch(i) {
					case 1: item_name = "GAMEPAD INDEX "; sub_text = global.gamepad_list_index break;
					case 2: item_name = global.gp_name; _color = colors.orange; break;
					case 3: item_name = "MOVEMENT"; sub_text = gamepad_movement_mode_text[global.gp_movement]; break;
					case 4: item_name = "----------------"; break;
				}
			}
			draw_string(_x, _y, item_name, _color);
			if (selected_item == i) {
				draw_string(_x - 16, _y, "▶", colors.pink);
			}
			if (show_subitem) {
				
				var subitems = item[2];
				var txt = "";
				if (sub_text == "")
					txt = ((global.settings[1] == input_types.keyboard) ? subitems[0] : subitems[1])
				else
					txt = sub_text;
				if (selected_item == i && substates[0] == 1) {
					txt = " ";
					if (item_blink_t < 15) txt = "-";
				}
				draw_string(_x + 144, _y, txt, colors.orange);
			}
		}
		menu_draw_buttons();
	break;
	case(pause_menus.settings):
		draw_sprite(spr_upgrade_screen_background,2,x,y);
		draw_string(0,0,"Upgrades");
		draw_string(320-56,0,"Weapons");
		scr_draw_settings();
	break;
	case(pause_menus.weapons):
		draw_sprite(spr_upgrade_screen_background,0,x,y);
		draw_string(0,0,"Settings");
		draw_string(320-24,0,"Map");
		for(var j = 0; j < ds_list_size(avail_weps) - 1; j++){
			draw_string(26, 28 + j * 20 - y_step_length * y_steps, weapon_name[ds_list_find_value(avail_weps,j)], colors.orange)
			draw_sprite_ext(spr_bar1_limit, 0, x+31, y+32+j*20,1,1,90,c_white,1);
				
			var wplen = 0;
			var wpcap = 28;
			if(ds_list_find_value(avail_weps,j) != weapons.x_buster){
				wplen = nrg[ds_list_find_value(avail_weps,j)]
			} else {
				wplen = hp;
				wpcap = global.player_max_health;
			}
				
			draw_sprite_ext(spr_bar1_limit, 0, x+32 + wpcap*2, y+20+j*20,1,1,270,c_white,1);
			for(i = 0; i < wpcap; i++){
				draw_sprite_ext(spr_bar1_area,0,x + 32 + i*2,y+32 + j * 20,1,1,90,c_white,1);
				if(wplen > i){
					if(j == weapon_id && !selecting_sub_tanks){
						draw_sprite_ext(spr_bar1_unit,0,x + 32 + i*2,y+30 + j * 20,1,1,90,c_white,1);
					} else {
						draw_sprite_ext(spr_bar1_unit,2,x + 32 + i*2,y+30 + j * 20,1,1,90,c_white,1);
					}
				}
			}
		}
		if(selecting_sub_tanks){
			draw_set_color(#9cfff8);
			draw_rectangle(x + 174,y + 174,x + 194,y + 210,true);
		}
		if(global.sub_tank_1){
			
			draw_sprite(tank_in_menu, 0, x + 176, y + 176);
			draw_set_color(#e87917);
			draw_rectangle(x + 182, y + 176, x + 186, y + 176 + (global.tank_storage[0]/2), true);
		} 
		if(global.sub_tank_2){
			draw_sprite(tank_in_menu, 0, x + 192, y + 176);
			draw_rectangle(x + 182, y + 176, x + 186, y + 176 + (global.tank_storage[1]/2), true);
		}
		
	break;	
	case(pause_menus.upgrades):
		draw_sprite(spr_upgrade_screen_background,1,x,y);
		draw_string(0,0,"Map");
		draw_string(320-64,0,"Settings");
		draw_sprite_ext(spr_upgrade_screen_x,1,x+px,y+py,xsale,ysale,0,c_white,1);
		draw_string(16,20, string(global.player_exp), colors.pink);
		var availible = 0;
		switch(umenu){
			case(upgrade_menu.none):
				if(opt == 0){//head
					draw_sprite(spr_skill_reticle,0,x + 128,y + 48);
				} else if(opt == 1){
					draw_sprite(spr_skill_reticle,0,x + 128,y + 72);
				} else if(opt == 2){
					draw_sprite(spr_skill_reticle,0,x + 102,y + 86);
				} else {
					draw_sprite(spr_skill_reticle,0,x + 112,y + 128);
				}
			break;
			case(upgrade_menu.head):
				draw_sprite(spr_skill_straight,0,x+40,y+88);
				draw_line_width_color(x+116,y+116,x+156,y+116,4,c_blue,c_blue);
				draw_line_width_color(x+156,y+116,x+196,y+116,4,c_blue,c_blue);
				draw_line_width_color(x+156,y+116,x+196,y+166,4,c_blue,c_blue);
				draw_line_width_color(x+196,y+116,x+236,y+116,4,c_blue,c_blue);
				draw_line_width_color(x+196,y+166,x+236,y+166,4,c_blue,c_blue);
		
				availible = get_upgrade_availibility(true,global.energy_expert);//energy expert
				upgrade_draw(x+100,y+100,spr_skill_extra_hp,availible);
		
				availible = get_upgrade_availibility(global.energy_expert, global.energy_converter);//energy converter
				upgrade_draw(x+140,y+100,spr_skill_balancer,availible);
		
				availible = get_upgrade_availibility(global.energy_converter,global.explorers_instinct);//instinct
				upgrade_draw(x+180,y+100,spr_skill_items_here,availible);
		
				availible = get_upgrade_availibility(global.energy_converter,global.overcharged_systems);//systems
				upgrade_draw(x+180,y+150,spr_skill_overheal,availible);
		
				availible = get_upgrade_availibility(global.explorers_instinct,global.travelers_companion);//companion
				upgrade_draw(x+220,y+100,spr_skill_heres_item,availible);
		
				availible = get_upgrade_availibility(global.overcharged_systems,global.regenerative_capacitors);//capacitors
				upgrade_draw(x+220,y+150,spr_skill_auto_heal,availible);
				
				if(sel == 3 && alt_path == true){
					title = global.upgrade_names[14];
					prev_title = global.upgrade_names[11];
					desc = global.upgrade_description[14];
					draw_sprite(spr_skill_selected,0,x+219,y+149);
					xp = 40;
				} else if(sel == 2 && alt_path == true){
					title = global.upgrade_names[11];
					prev_title = global.upgrade_names[15];
					desc = global.upgrade_description[11];
					draw_sprite(spr_skill_selected,0,x+179,y+149);
					xp = 25;
				} else if(sel == 3 && alt_path == false){
					title = global.upgrade_names[19];
					prev_title = global.upgrade_names[18];
					desc = global.upgrade_description[19];
					draw_sprite(spr_skill_selected,0,x+219,y+99);
					xp = 45;
				} else if(sel == 2 && alt_path == false){
					title = global.upgrade_names[18];
					prev_title = global.upgrade_names[15];
					desc = global.upgrade_description[18];
					draw_sprite(spr_skill_selected,0,x+179,y+99);
					xp = 30
				} else if(sel == 1){
					title = global.upgrade_names[15];
					prev_title = global.upgrade_names[7];
					desc = global.upgrade_description[15];
					draw_sprite(spr_skill_selected,0,x+139,y+99);
					xp = 20;
				} else {
					title = global.upgrade_names[7];
					prev_title = true;
					desc = global.upgrade_description[7];
					xp = 15;
					draw_sprite(spr_skill_selected,0,x+99,y+99);
				}
			break;
			case(upgrade_menu.body):
				draw_sprite(spr_skill_straight,0,x+40,y+88);
				draw_line_width_color(x+116,y+116,x+156,y+116,4,c_blue,c_blue);
				draw_line_width_color(x+116,y+116,x+156,y+166,4,c_blue,c_blue);
				draw_line_width_color(x+156,y+116,x+196,y+116,4,c_blue,c_blue);
				draw_line_width_color(x+156,y+166,x+196,y+166,4,c_blue,c_blue);
				//there seems to be a minor hiccup with checking the undershirt ability
				// i just got the thing that actually works for the moment and called it
				availible = get_upgrade_availibility(true, upgrade_change(global.upgrade_names[14],"get"));//undershirt
				upgrade_draw(x+100,y+100,spr_skill_undershirt,availible);
		
				availible = get_upgrade_availibility(upgrade_change(global.upgrade_names[14],"get"), global.concussive_redirectors);//energy converter
				upgrade_draw(x+140,y+100,spr_skill_air_prot,availible);
		
				availible = get_upgrade_availibility(upgrade_change(global.upgrade_names[14],"get"), global.grip_training);//energy converter
				upgrade_draw(x+140,y+150,spr_skill_wall_slow,availible);
		
				availible = get_upgrade_availibility(global.concussive_redirectors, global.untouchable);//energy converter
				upgrade_draw(x+180,y+100,spr_skill_extra_invuln,availible);
		
				availible = get_upgrade_availibility(global.grip_training, global.wall_cling);//energy converter
				upgrade_draw(x+180,y+150,spr_skill_no_slide,availible);
				
				if(sel == 2 && alt_path == true){
					title = global.upgrade_names[3];
					prev_title = global.upgrade_names[17];
					desc = global.upgrade_description[3];
					draw_sprite(spr_skill_selected,0,x+179,y+149);
					xp = 30;
				} else if(sel == 1 && alt_path == true){
					title = global.upgrade_names[17];
					prev_title = global.upgrade_names[14];
					desc = global.upgrade_description[17];
					draw_sprite(spr_skill_selected,0,x+139,y+149);
					xp = 15;
				} else if(sel == 2 && alt_path == false){
					title = global.upgrade_names[9];
					prev_title = global.upgrade_names[20];
					desc = global.upgrade_description[9];
					draw_sprite(spr_skill_selected,0,x+179,y+99);
					xp = 35;
				} else if(sel == 1 && alt_path == false){
					title = global.upgrade_names[20];
					prev_title = global.upgrade_names[14];
					desc = global.upgrade_description[20];
					xp = 20;
					draw_sprite(spr_skill_selected,0,x+139,y+99);
				} else {
					title = global.upgrade_names[14];
					prev_title = true;
					desc = global.upgrade_description[14];
					xp = 10;
					draw_sprite(spr_skill_selected,0,x+99,y+99);
				}
			break;
			case(upgrade_menu.arms):
				draw_sprite(spr_skill_straight,0,x+40,y+88);
				draw_line_width_color(x+116,y+116,x+156,y+116,4,c_blue,c_blue);
				draw_line_width_color(x+156,y+116,x+196,y+116,4,c_blue,c_blue);
				draw_line_width_color(x+156,y+116,x+196,y+166,4,c_blue,c_blue);
				draw_line_width_color(x+196,y+116,x+236,y+116,4,c_blue,c_blue);
				draw_line_width_color(x+196,y+166,x+236,y+166,4,c_blue,c_blue);
		
				availible = get_upgrade_availibility(true, global.sense_of_duty);//sense of duty
				upgrade_draw(x+100,y+100,spr_skill_always_fire,availible);
		
				availible = get_upgrade_availibility(global.sense_of_duty, global.super_charge);//energy converter
				upgrade_draw(x+140,y+100,spr_skill_super_charge,availible);
		
				availible = get_upgrade_availibility(global.super_charge, global.weapons_specialist);//energy converter
				upgrade_draw(x+180,y+100,spr_skill_extra_weapons,availible);
		
				availible = get_upgrade_availibility(global.super_charge, global.hyper_charge);//energy converter
				upgrade_draw(x+180,y+150,spr_skill_hyper_charge,availible);
		
				availible = get_upgrade_availibility(upgrade_change(global.upgrade_names[8],"get"), global.energy_infusion);//energy converter
				upgrade_draw(x+220,y+100,spr_skill_big_bang_kamehameha,availible);
		
				availible = get_upgrade_availibility(global.hyper_charge, global.auto_charge);//energy converter
				upgrade_draw(x+220,y+150,spr_skill_auto_charge,availible);
				
				if(sel == 3 && alt_path == true){
					title = global.upgrade_names[4];
					prev_title = global.upgrade_names[6];
					desc = global.upgrade_description[4];
					draw_sprite(spr_skill_selected,0,x+219,y+149);
					xp = 50;
				} else if(sel == 2 && alt_path == true){
					title = global.upgrade_names[6];
					prev_title = global.upgrade_names[5];
					desc = global.upgrade_description[6];
					draw_sprite(spr_skill_selected,0,x+179,y+149);
					xp = 25;
				} else if(sel == 3 && alt_path == false){
					title = global.upgrade_names[13];
					prev_title = global.upgrade_names[8];
					desc = global.upgrade_description[13];
					draw_sprite(spr_skill_selected,0,x+219,y+99);
					xp = 45;
				} else if(sel == 2 && alt_path == false){
					title = global.upgrade_names[8];
					prev_title = global.upgrade_names[5];
					desc = global.upgrade_description[8];
					draw_sprite(spr_skill_selected,0,x+179,y+99);
					xp = 30;
				} else if(sel == 1){
					title = global.upgrade_names[5];
					prev_title = global.upgrade_names[21];
					desc = global.upgrade_description[5];
					draw_sprite(spr_skill_selected,0,x+139,y+99);
					xp = 20;
				} else {
					title = global.upgrade_names[21];
					prev_title = true;
					desc = global.upgrade_description[21];
					draw_sprite(spr_skill_selected,0,x+99,y+99);
					xp = 15;
				}
			break;
			case(upgrade_menu.legs):
				draw_sprite(spr_skill_straight,0,x+40,y+88);
				draw_line_width_color(x+116,y+116,x+156,y+116,4,c_blue,c_blue);
				draw_line_width_color(x+156,y+116,x+196,y+116,4,c_blue,c_blue);
				draw_line_width_color(x+196,y+116,x+236,y+116,4,c_blue,c_blue);
		
				availible = get_upgrade_availibility(true, global.yoga);//yoga
				upgrade_draw(x+100,y+100,spr_skill_walk_fast,availible);
		
				availible = get_upgrade_availibility(global.yoga, global.cardio_training);//cardio
				upgrade_draw(x+140,y+100,spr_skill_walk_fast,availible);
		
				availible = get_upgrade_availibility(global.cardio_training, global.super_dash);//superdash
				upgrade_draw(x+180,y+100,spr_skill_super_dash,availible);
		
				availible = get_upgrade_availibility(global.super_dash, global.hyper_dash);//hyperdash
				upgrade_draw(x+220,y+100,spr_skill_hyper_dash,availible);
				
				if(sel == 3){
					title = global.upgrade_names[1];
					prev_title = global.upgrade_names[0];
					desc = global.upgrade_description[1];
					draw_sprite(spr_skill_selected,0,x+219,y+99);
					xp = 30;
				} else if(sel == 2){
					title = global.upgrade_names[0];
					prev_title = global.upgrade_names[16];
					desc = global.upgrade_description[0];
					draw_sprite(spr_skill_selected,0,x+179,y+99);
					xp = 25;
				} else if(sel == 1){
					title = global.upgrade_names[16];
					prev_title = global.upgrade_names[10];
					desc = global.upgrade_description[16];
					draw_sprite(spr_skill_selected,0,x+139,y+99);
					xp = 15;
				} else {
					title = global.upgrade_names[10];
					prev_title = true;
					desc = global.upgrade_description[10];
					draw_sprite(spr_skill_selected,0,x+99,y+99);
					xp = 10;
				}
			break;
		}
		
		if(string_length(desc) < desc_cutoff_length){
			draw_string(112,24 , desc, colors.blue);
		} else {
			for(var q = 0; q < string_length(desc)/desc_cutoff_length; q++){
				draw_string(112,24 + 7*q, string_copy(desc, desc_cutoff_length*q, desc_cutoff_length - 1), colors.blue);
			}
		}
		draw_string(112,8, title, colors.red);
		break;
	case(pause_menus.map):
		//draw_sprite(spr_upgrade_screen_background,1,x,y);
		draw_set_color(#260004);
		draw_rectangle(x, y, x + 320, y + 240, false);
		var cam_x = __view_get(e__VW.XView, 0) - 160;
		var cam_y = __view_get(e__VW.YView, 0) - 120;
		//draw_sprite_part_ext(map,0, cam_x,cam_y,20,15,100 + x,83 + y,6,6,c_white,0.9);
		draw_set_color(#c22000);
		var suc = false;
		for(var w = 0; w < 40; w++){
			for(var h = 0; h < 30; h++){
				tpix = tilemap_get_at_pixel(map_id, cam_x + w * 16,cam_y + h * 16);
				if(tpix != 0)
					tpix = tilemap_get_at_pixel(map_id, cam_x + w * 16 + 8,cam_y + h * 16);
				if(tpix != 0)
					tpix = tilemap_get_at_pixel(map_id, cam_x + w * 16,cam_y + h * 16 + 8);
				if(tpix != 0)
					tpix = tilemap_get_at_pixel(map_id, cam_x + w * 16 + 8,cam_y + h * 16 + 8);
					
				if(tpix != 0){
					suc = true;
				}
					
				if(suc){
					draw_rectangle(x + w * 8, y + h * 8, x + 8 + w * 8,  y + 8 + h * 8, false);
				}
				
				suc = false;
			}
		}
		draw_set_color(#021fb3);
		var _mpx = (global.player_x - cam_x)/2;
		var _mpy = (global.player_y - cam_y)/2;
		draw_rectangle(x + _mpx - 2,y + _mpy - 4,
		x + _mpx + 6, y + _mpy + 12, false);
		draw_sprite(spr_upgrade_screen_background, 3, x, y);
		draw_string(0,0,"Weapons");
		draw_string(320-64,0,"Upgrades");
	break;
}