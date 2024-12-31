switch(menu){
	case(pause_menus.weapons):
		draw_sprite(spr_upgrade_screen_background,0,x,y);
		for(j = 0; j < 9; j++){
			oof = j - 1;
			if(get_if_weapon_is_unlocked()){
				draw_string(24, 28 + j * 20, global.weapon_names[j], colors.orange)
				draw_sprite_ext(spr_bar1_limit, 0, x+31, y+32+j*20,1,1,90,c_white,1);
				if(instance_exists(obj_player_parent)){
					var plr = instance_nearest(x,y,obj_player_parent);
					var wplen = 0;
					var wpcap = 28;
					if(j > 0){
						var wplenarr = player_get_weapon_energy_array();
						wplen = wplenarr[j-1];
					} else {
						wplen = plr.hp;
						wpcap = global.player_max_health
					}
					show_debug_message(string(j) + " " + string(wplen))
				}
				draw_sprite_ext(spr_bar1_limit, 0, x+32 + wpcap*2, y+20+j*20,1,1,270,c_white,1);
				for(i = 0; i < wpcap; i++){
					draw_sprite_ext(spr_bar1_area,0,x + 32 + i*2,y+32 + j * 20,1,1,90,c_white,1);
					if(wplen > i){
						draw_sprite_ext(spr_bar1_unit,0,x + 32 + i*2,y+30 + j * 20,1,1,90,c_white,1);
					}
				}
			}
		}
		
	break;	
	case(pause_menus.upgrades):
		draw_sprite(spr_upgrade_screen_background,1,x,y);
		draw_sprite_ext(spr_upgrade_screen_x,1,x+px,y+py,xsale,ysale,0,c_white,1);
		draw_text(x + 16, y + 20, string(global.player_exp));
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
				draw_text(x + 60, y + 32, title);
				draw_text(x + 60, y + 48, desc);
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
				draw_text(x + 60, y + 32, title);
				draw_text(x + 60, y + 48, desc);
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
				draw_text(x + 60, y + 32, title);
				draw_text(x + 60, y + 48, desc);
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
				draw_text(x + 60, y + 32, title);
				draw_text(x + 60, y + 48, desc);
			break;
		}
		break;
	case(pause_menus.saves):
	
	break;
}