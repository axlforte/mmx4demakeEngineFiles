function global_values() {
	global.reload                           = false; // Is the game reloading after a death?
	global.player_x                         = 0;     // Player X coordinate used for the camera and misc other actions
	global.player_y                         = 0;     // Player Y coordinate
	global.player_spawned                   = false; // Has the player spawned yet?
	global.debug_active                     = false; // Is the Debug mode on?
	global.view_width                       = 320;
	global.view_height                      = 240;
	global.checkpoint                       = 0;
	global.checkpoint_x                     = 0;
	global.checkpoint_y                     = 0;
	global.checkpoint_phase					= 0;
	global.current_camera                   = 0;
	global.checkpoint_camera                = 0;
	global.prev_camera                      = 0;
	global.current_camera_collision         = 0;
	global.camera_min_x                     = 0;
	global.camera_min_y                     = 0;
	global.camera_max_x                     = 0;
	global.camera_max_y                     = 0;
	global.camera_vbor_min_y				= -12;
	global.camera_vbor_max_y				= 12;
	global.camera_shake						= false;
	global.camera_16_by_9                   = false;
	global.camera_scale                     = 1;
	global.camera_shift_distance            = 96;
	global.camera_shift_speed               = offset_speed.slow;
	global.check							= false;
	global.paused						    = false;
	global.pause_type					    = pause_types.none;
	global.is_using_door					= 0;
	global.bgm_volume			        	= 0;
	global.sfx_volume			        	= 0;
	global.center_screen                    = true;
	global.player_lives                     = 2;
	global.items_count                      = 0;
	global.difficulty                       = diff_modes.normal;
	global.dash_lemon_visible               = false;
	global.unlocked_points                  = 0;
	global.golden_armor_enabled             = false;
	global.tile_shader_multiplier           = 1;
	global.anyone_can_get_armors            = 1;
	global.grounded                         = false; // purely for ladders
	global.under_water                      = false; // debug
	global.exitALevelTransition             = false;
	global.levelTransitionX                 = 0;
	global.levelTransitionY                 = 0;
	global.levelTransitionCameraId          = 0;
	global.level_transition_use_door_locs   = false;
	global.door_id                          = 2;
	global.DialougeSpeed                    = 2;
	global.TeleportIn                       = false;
	global.player_sprite                    = 0;
	global.player_sprite_frame              = 0;
	global.temp                             = 0;
	global.player_health                    = 28;
	global.player_exp                       = 0;
	global.one_px_tall_health_bar           = true;
	global.game_save_num                    = 0;
	global.hit_numbers                      = false;
	global.notes                            = true;
	global.rando                            = false;
	global.crt                              = 0;
	global.met_colonel = false;
	
	enum diff_modes {
		easy,
		normal,
		hard,
		zero
	}
	enum pause_types {
		none,
		normal,
		door,
		pickup,
		boss_death,
		special_attack,
		dialouge,
		pause_menu
	};
	global.background_list = ds_list_create();
	global.start_menu_force_state = false;
	global.start_menu_state = menu_states.main;
	global.player_max_health = 16;

	global.gamepad_list = ds_list_create();
	global.gamepad_list_index = 0;
	global.gp_movement = 0; // Directional
	global.gp_name = "";
	for (var i = 0; i < 7; i ++) {
		global.heart_used[i] = 0;
		global.checkpointid[i] = 0;
	}

	shaders_init();
	global.dictionary = ds_map_create();
	global.mobile = (os_type == os_android);
	characters_init();
	text_init();
	display_reset(0, false);
	global.character_selected_index[0] = 0;
	global.character_selected[0] = obj_player_x;
	global.pickup_lifeup_sprite = spr_x_pickup_lifeup;
	global.transition_object_list = ds_list_create();
	for (var i = 0; i < pl_char.length; i++) {
		global.player_character_armor[i] = ["", "", "", "", "", ""];
		global.player_character_armor_index[i] = [0, 0, 0, 0, 0, 0];
	}
	draw_set_circle_precision(64);
	//global.run_from_ide = !global.mobile && parameter_count() == 3 && string_count("GMS2TEMP", parameter_string(2));
	global.run_from_ide = true;
	instance_create_depth(0, 0, 0, obj_window_center);
	global.game_world_speed = 1;
	
	//boss deaths
	global.magma_dragoon_defeat = 0;//funnily enough we WILL use this one
	global.jet_stingray_defeat = 0;
	global.web_spider_defeat = 0;
	global.frost_walrus_defeat = 0;//not in demo, not enough time
	global.slash_beast_defeat = 0;
	global.cyber_pea_cock_defeat = 0;//wont need til post demo
	global.storm_owl_defeat = 0;//above
	global.split_mushroom_defeat = 0;//also above
	global.beat_colonel = 0;// hell to the no!
	
	global.show_fps = false;
	
	// Replay
	global.recording_replay = false;
	global.running_replay = false;
	global.replay_fname = "";
	replay_init();
	upgrade_values();
	weapon_information_global_vars();
	overworld_info();
	global_dialouge_load();
}

function overworld_info(){
	global.tank_storage = [0,0,0]
	global.sub_tank_1 = false;
	global.sub_tank_2 = false;
	global.weap_tank_1 = false;
	global.save_dest = 0;
}

function upgrade_values(){
	global.super_dash = false;
	global.hyper_dash = false;
	global.buster_specialist = false;
	global.wall_cling = false;
	global.auto_charge = false;
	global.super_charge = false;
	global.hyper_charge = false;
	global.energy_expert = false;
	global.weapons_specialist = false;
	global.untouchable = false;
	global.yoga = false;
	global.overcharged_systems = false;
	global.undershirt = false;
	global.energy_infusion = false;
	global.regenerative_capacitors = false;
	global.energy_converter = false;
	global.cardio_training = false;
	global.grip_training = false;
	global.explorers_instinct = false;
	global.travelers_companion = false;
	global.concussive_redirectors = false;
	global.sense_of_duty = false;
	global.pharoah_dash = false;
	
	global.upgrade_names = [
	"super dash",//sd
	"hyper dash",
	"buster specialist",//bs
	"wall cling",
	"ultra charge",//ac
	"super charge",
	"hyper charge",//hc
	"energy expert",
	"weapons specailist",//ws
	"untouchable",
	"yoga",//ya
	"overcharged systems",
	"undershirt",//us
	"energy infusion",
	"regenerative capacitors",//rc
	"energy converter",
	"cardio training",//ct
	"grip training",
	"explorers instinct",//ei
	"travelers companion",
	"concussive redirectors",//cr
	"sense of duty",
	];
	
	global.upgrade_description = [
	"dash slightly faster",//sd
	"dash much faster",
	"dashing puts extra force into base shots",//bs
	"press up to stop slidingdown walls",
	"charge time near instant",//ac
	"charge time down        slightly",
	"charge time down a lot",//hc
	"get extra health per    pickup",
	"get extra energy per    weapon pickup",//ws
	"extra invulnerability   frames",
	"crouch by pressing down while not moving",
	"collect 3 extra health  per pickup",
	"cannot die if above 1 health",//us
	"supercharged buster shot",
	"slowly heal damage back if not moving",//rc
	"turn health into weapon energy and vice versa",
	"walk slightly faster",//ct
	"slide down walls slower.press down to slide     faster",
	"get notified if area hascollectibles in it",//ei
	"small friend floats     towards items not yet   collected",
	"take less damage in the air",//cr
	"shoot while stunned",
	];
}

function weapon_information_global_vars(){
	global.weapon_names = [
	"Megaman X",
	"Lightning Web",
	"Frost Spike",
	"Soul Body",
	"Rising Fire",
	"Ground Chaser",
	"Double Cyclone",
	"Twin Slasher",
	"Aiming Laser"
	];
}