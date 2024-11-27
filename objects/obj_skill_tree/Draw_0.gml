draw_sprite(spr_upgrade_screen_background,1,x,y);
		draw_sprite_ext(spr_upgrade_screen_x,1,px,py,xsale,ysale,0,c_white,1);
var availible = 0;
switch(menu){
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
		draw_line_width_color(116,116,156,116,4,c_blue,c_blue);
		draw_line_width_color(156,116,196,116,4,c_blue,c_blue);
		draw_line_width_color(156,116,196,166,4,c_blue,c_blue);
		draw_line_width_color(196,116,236,116,4,c_blue,c_blue);
		draw_line_width_color(196,166,236,166,4,c_blue,c_blue);
		
		availible = get_upgrade_availibility(true,global.energy_expert);//energy expert
		upgrade_draw(100,100,spr_skill_extra_hp,availible);
		
		availible = get_upgrade_availibility(global.energy_expert, global.energy_converter);//energy converter
		upgrade_draw(140,100,spr_skill_balancer,availible);
		
		availible = get_upgrade_availibility(global.energy_converter,global.explorers_instinct);//instinct
		upgrade_draw(180,100,spr_skill_items_here,availible);
		
		availible = get_upgrade_availibility(global.energy_converter,global.overcharged_systems);//systems
		upgrade_draw(180,150,spr_skill_overheal,availible);
		
		availible = get_upgrade_availibility(global.explorers_instinct,global.travelers_companion);//companion
		upgrade_draw(220,100,spr_skill_heres_item,availible);
		
		availible = get_upgrade_availibility(global.overcharged_systems,global.regenerative_capacitors);//capacitors
		upgrade_draw(220,150,spr_skill_auto_heal,availible);
		
	break;
	case(upgrade_menu.body):
		draw_sprite(spr_skill_straight,0,x+40,y+88);
		draw_line_width_color(116,116,156,116,4,c_blue,c_blue);
		draw_line_width_color(116,116,156,166,4,c_blue,c_blue);
		draw_line_width_color(156,116,196,116,4,c_blue,c_blue);
		draw_line_width_color(156,166,196,166,4,c_blue,c_blue);
		
		availible = get_upgrade_availibility(true, global.undershirt);//undershirt
		upgrade_draw(100,100,spr_skill_balancer,availible);
		
		availible = get_upgrade_availibility(global.undershirt, global.concussive_redirectors);//energy converter
		upgrade_draw(140,100,spr_skill_balancer,availible);
		
		availible = get_upgrade_availibility(global.undershirt, global.grip_training);//energy converter
		upgrade_draw(140,150,spr_skill_balancer,availible);
		
		availible = get_upgrade_availibility(global.concussive_redirectors, global.untouchable);//energy converter
		upgrade_draw(180,100,spr_skill_balancer,availible);
		
		availible = get_upgrade_availibility(global.grip_training, global.wall_cling);//energy converter
		upgrade_draw(180,150,spr_skill_balancer,availible);
	break;
	case(upgrade_menu.arms):
		draw_sprite(spr_skill_straight,0,x+40,y+88);
		draw_line_width_color(116,116,156,116,4,c_blue,c_blue);
		draw_line_width_color(156,116,196,116,4,c_blue,c_blue);
		draw_line_width_color(156,116,196,166,4,c_blue,c_blue);
		draw_line_width_color(196,116,236,116,4,c_blue,c_blue);
		draw_line_width_color(196,166,236,166,4,c_blue,c_blue);
		
		availible = get_upgrade_availibility(true, global.sense_of_duty);//sense of duty
		upgrade_draw(100,100,spr_skill_balancer,availible);
		
		availible = get_upgrade_availibility(global.sense_of_duty, global.super_charge);//energy converter
		upgrade_draw(140,100,spr_skill_balancer,availible);
		
		availible = get_upgrade_availibility(global.super_charge, global.weapons_specialist);//energy converter
		upgrade_draw(180,100,spr_skill_balancer,availible);
		
		availible = get_upgrade_availibility(global.super_charge, global.hyper_charge);//energy converter
		upgrade_draw(180,150,spr_skill_balancer,availible);
		
		availible = get_upgrade_availibility(global.weapons_specialist, global.energy_infusion);//energy converter
		upgrade_draw(220,100,spr_skill_balancer,availible);
		
		availible = get_upgrade_availibility(global.hyper_charge, global.auto_charge);//energy converter
		upgrade_draw(220,150,spr_skill_balancer,availible);
	break;
	case(upgrade_menu.legs):
		draw_sprite(spr_skill_straight,0,x+40,y+88);
		draw_line_width_color(116,116,156,116,4,c_blue,c_blue);
		draw_line_width_color(156,116,196,116,4,c_blue,c_blue);
		draw_line_width_color(196,116,236,116,4,c_blue,c_blue);
		
		availible = get_upgrade_availibility(true, global.yoga);//yoga
		upgrade_draw(100,100,spr_skill_balancer,availible);
		
		availible = get_upgrade_availibility(global.yoga, global.cardio_training);//cardio
		upgrade_draw(140,100,spr_skill_balancer,availible);
		
		availible = get_upgrade_availibility(global.cardio_training, global.super_dash);//superdash
		upgrade_draw(180,100,spr_skill_balancer,availible);
		
		availible = get_upgrade_availibility(global.super_dash, global.hyper_dash);//hyperdash
		upgrade_draw(220,100,spr_skill_balancer,availible);
	break;
}