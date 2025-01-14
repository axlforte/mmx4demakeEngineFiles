enum web_spider {
	web,
	sling_intro,
	birth,
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
			if(t == 25){
				instance_create_depth(x, y, depth - 5, obj_web_spider_web);
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
			if (t == 75){
				instance_create_depth(x, y, depth - 5, obj_web_spider_web);
			}
		}
		break;
	#endregion
	
	#region the significantly less threatening attack
	case web_spider.birth://ignore the naming it makes sense
		// Play animation
		if(already_on_web){
			if (t == 0) {
				animation_play("birth");
			}
			if(t == 25){
				var p = instance_create_depth(x, y, depth - 5, obj_jet_stingray_baby);
				p.dir = 1;
				p.y += 16;
				p = instance_create_depth(x, y, depth - 5, obj_jet_stingray_baby);
				p.dir = 1;
				p.y -= 16;
				p = instance_create_depth(x, y, depth - 5, obj_jet_stingray_baby);
				p.dir = -1;
				p.y += 16;
				p = instance_create_depth(x, y, depth - 5, obj_jet_stingray_baby);
				p.dir = -1;
				p.y -= 16;
			}
		} else {
			web_spider_default_web_intro();
			
			if (t == 0) {
				x = center_of_arena[0] + random_range(-64,64);
				animation_play("intro_enter");
			}
			if (t == 50) {
				animation_play("birth");
			}
			if (t == 75){
				var p = instance_create_depth(x, y, depth - 5, obj_jet_stingray_baby);
				p.dir = 1;
				p.y += 16;
				p = instance_create_depth(x, y, depth - 5, obj_jet_stingray_baby);
				p.dir = 1;
				p.y -= 16;
				p = instance_create_depth(x, y, depth - 5, obj_jet_stingray_baby);
				p.dir = -1;
				p.y += 16;
				p = instance_create_depth(x, y, depth - 5, obj_jet_stingray_baby);
				p.dir = -1;
				p.y -= 16;
			}
		}
		break;
	#endregion
	
	#region intro but without falling
	case web_spider.sling_intro:
		if(t == 0){
			animation_play("intro");
			
		}
	
		if (t <= 47 || !intro) {
			web_spider_default_web_intro();
		}
		
		if(t >= 128 && intro){
			if (t == 128) {
				animation_play("intro");
				bar = instance_create_depth(0, 0, layer_get_depth(layer_get_id("Camera")) - 300, obj_player_bar);
				bar.owner = id;
				bar.bar_icon_sprite = spr_boss_bar_icon;
				bar.x_off = 295;
			}
			if (t == intro_limit + 128) {
				// Fill health
				var inst = instance_create_depth(0, 0, depth, obj_pickup_handler);
				inst.target = id;
				inst.pickup_pause = false;
				inst.amount = max_hp;
				inst.time_per_unit = 2;
				inst.pickup_type = pickup_types.hp;
			}
			// Full Health
			if (hp == max_hp) {
				intro = false;
				play_theme = boss_battle_theme;
				floor_y = y;
				with (obj_player_parent) {
					locked = false;	
				}
				is_active = true;
				t = 96;
			}
		}
		
		if(t == 128 && !intro){
			state_set(boss_states.idle);
		}
		break;
	#endregion
}
