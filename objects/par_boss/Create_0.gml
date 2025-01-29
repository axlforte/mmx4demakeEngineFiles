event_inherited();
prev_mus = global.prev_music;
persist = true;
is_boss = true;
is_active = false;
using_world_speed = false;
phy_type = phy_types.NEW;
gravity_default = 0.25;
hp = 0; // Initial Health
max_hp = 32; // Max Health
xp = 20;
t = 0; // Timer
weapon_to_give = obj_drop_ground_hunter;
enum boss_states {
	intro = 100,
	idle = 101,
	jump = 102,
	fall = 103,
	land = 104,
	dash = 105,
	dolor = 106,
	death = 107,
}

intro = true;
jump_strength = 9;
jump_to_player = true;

idle_time_to_turn = 0;
idle_limit = 60;
idle_desperate_limit = 30;
jump_wait = 0;
dash_wait = 0;
dash_limit = 60;
death_animation = "death";

floor_state = -1; // State to jump back to floor
floor_y = 0;

through_walls = true;
activate_collision = true;
activate_collision_t = 0;
activate_collision_limit = 16;

distance_x = 0;
dash_speed = 9;
dash_friction = 0.0625;
dash_bounce = true;

skip_complete_walk = false; // Skip walking after defeating the boss

// Attacks list
attacks_list = ds_list_create();
ds_list_add(attacks_list,
	boss_states.jump,
	boss_states.dash
);
// Limit attack repetition
attack_limit = ds_map_create();
attack_limit[? boss_states.jump] = 1;
attack_limit[? boss_states.dash] = 1;
previous_attack = -1;
last_attack_count = 0;

// Attack Usage Properties           // cost > recover_rate
attack_properties = ds_map_create(); // [cost, recover_rate]
attack_properties[? boss_states.jump] = [3/4, 1/4];
attack_properties[? boss_states.dash] = [3/4, 1/4];

attack_energy = ds_map_create();
for (var k = ds_map_find_first(attack_properties); !is_undefined(k); k = ds_map_find_next(attack_properties, k)) {
	attack_energy[? k] = 1; // Initial energy for each attack
}

// Attack Object Condition
attack_object_condition = ds_map_create();
// Desperate
hp_desperate = 12;
desperate = false;
desperate_attacks = ds_list_create();
// The boss can't be hit in the shielded states
shielded_states = ds_map_create();
bar = noone;

// Themes
boss_battle_theme = "BossBattle";
play_theme = "";
// Palette
plt_index = 0;
anim[0] = false;

local_game_speed = 1;

dialouge = scr_get_lines_array("english", dialouge_type.words, 0, 2);
lines = scr_get_lines_array("english", dialouge_type.sounds, 0, 2);

death_line = noone;

has_worded = false;

function default_boss_intro_sequence(){
	if(instance_exists(obj_conversation)){
		state_timer--;
	}
			
	if(!has_worded){
		var convo = instance_create_depth(x,y,depth, obj_conversation);
		convo.conversation = dialouge;
		convo.lines = lines;
		has_worded = true;	
	}
			
	if (t == argument[0]) {
		animation_play("intro");
		bar = instance_create_depth(0, 0, layer_get_depth(layer_get_id("Camera")) - 300, obj_player_bar);
		bar.owner = id;
		bar.bar_icon_sprite = spr_boss_bar_icon;
		bar.x_off = 295;
	}
	if (t == intro_limit + argument[0]) {
		// Fill health
		var inst = instance_create_depth(0, 0, depth, obj_pickup_handler);
		inst.target = id;
		inst.pickup_pause = false;
		inst.amount = max_hp;
		inst.time_per_unit = 1;
		inst.pickup_type = pickup_types.hp;
	}
	// Full Health
	if (hp == max_hp) {
		state_set(boss_states.idle);
		intro = false;
		play_theme = boss_battle_theme;
		floor_y = y;
		with (obj_player_parent) {
			locked = false;	
		}
		global.bgm_volume = global.bgm_volume * 2;
		is_active = true;
	}
}