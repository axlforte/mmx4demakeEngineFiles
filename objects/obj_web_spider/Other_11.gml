enum web_spider {
	web,
	sling_intro,
	thunder,
	giga_transition,
	crawl_around
}
switch(state) {
	#region stop hiding and face me like a man
	case web_spider.giga_transition:
		// Play animation
		if (t == 0) {
			if(already_on_web == true){
				state_set(boss_states.idle);
			} else {
				animation_play("intro_enter");
					x = center_of_arena[0];
					damageable = false;
			}
		}
		
		if(t == 60){
			animation_play("web");
		}
		
		if(t == 80){
			already_on_web = true;
			damageable = true;
			state_set(web_spider.crawl_around);
		}
		
		if(t < 48){
			web_spider_default_web_intro();
		}
		break;
	#endregion
	
	#region crawling like a creepy spider
	case web_spider.crawl_around:
		if(t == 0){
			dest = random_range(0,8);
			web_delay = 0;
			web_delay_max = clamp(hp / array_get([0.25, 1, 2, 3], global.difficulty), 1, array_get([25, 20, 15, 5], global.difficulty));
		}
		
		if(web_move_positions[dest][0] - web_movement*2 > x){
			x += web_movement;
			x_centered = false;
		} else if(web_move_positions[dest][0] + web_movement*2 < x){
			x -= web_movement;
			x_centered = false;
		} else {
			x_centered = true;
		}
		
		if(web_move_positions[dest][1] - web_movement*2 > y){
			y += web_movement;
			y_centered = false;
		} else if(web_move_positions[dest][1] + web_movement*2 < y){
			y -= web_movement;
			y_centered = false;
		} else {
			y_centered = true;
		}
		
		if(y_centered && x_centered){
			if(web_delay < web_delay_max){
				web_delay++;
			} else {
				var atk = random_range(1,16);
				if(atk < 9){
					state_set(web_spider.web);
				} else {
					state_set(web_spider.thunder);
				}
			}
		}
		break;
	#endregion
	
	#region the stupid arse webs
	case web_spider.web:
		// Play animation
		if(already_on_web){
			if (t == 0) {
				animation_play("web");
			}
			if(t == 29){
				instance_create_depth(x, y, depth - 5, obj_web_spider_web);
			}
			if(t == 45){
				state_set(web_spider.crawl_around);
			}
		} else {
			web_spider_default_web_intro();
			
			if (t == 0) {
				x = center_of_arena[0] + random_range(-64,64);
				animation_play("intro_enter");
			}
			if (t == 50) {
				animation_play("web");
			}
			if (t == 79){
				instance_create_depth(x, y, depth - 5, obj_web_spider_web);
			}
		}
		break;
	#endregion
	
	#region the significantly less threatening attack
	case web_spider.thunder://ignore the naming it makes sense
		// Play animation
		if(already_on_web){
			if (t == 0) {
				animation_play("thunder");
			}
			if(t == 25){
				var p = instance_create_depth(center_of_arena[0] - 128, y - 128, depth - 5, obj_thunder_crack);
				p.dir = 1;
				p = instance_create_depth(x, y - 128, depth - 5, obj_thunder_crack);
				p.dir = 1;
				p = instance_create_depth(center_of_arena[0] + 144, y - 48, depth - 5, obj_thunder_crack);
				p.dir = 1;
			}
			
			if(t == 45){
				state_set(web_spider.crawl_around);
			}
		} else {
			web_spider_default_web_intro();
			
			if (t == 0) {
				x = center_of_arena[0] + random_range(-64,64);
				animation_play("intro_enter");
			}
			if (t == 50) {
				animation_play("thunder");
			}
			if (t == 75){
				var p = instance_create_depth(center_of_arena[0] - 128, y - 128, depth - 5, obj_thunder_crack);
				p.dir = 1;
				p = instance_create_depth(x, y - 128, depth - 5, obj_thunder_crack);
				p.dir = 1;
				p = instance_create_depth(center_of_arena[0] + 144, y - 128, depth - 5, obj_thunder_crack);
				p.dir = 1;
			}
		}
		break;
	#endregion
	
	#region intro but without falling
	case web_spider.sling_intro:
		if(t == 0){
			animation_play("intro");
			//y = center_of_arena[1] + 96;
		}
	
		if (t <= 47 || !intro) {
			web_spider_default_web_intro();
		}
		
		if(t >= 128 && intro){
			default_boss_intro_sequence(132);
		}
		
		if(t >= 128 && !intro){
			state_set(boss_states.idle);
		}
		break;
	#endregion
}
