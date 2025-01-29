// States Enum
enum menu_states {
	main,
	game_mode,
	difficulty_mode,
	player_select,
	armor_select,
	save_select,
	multiplayer,
	option,
	key_config,
	stage_select,
	boss_intro,
	audio_settings,
	voice_language,
	weapon_get,
	volume,
	visuals,
	load
}

enum background_select { intro, middle, ending }

funny = 0;

// State
state = menu_states.main;
state_timer = 0;
substates = [0, 0, 0, 0];
changed_state = false;

// Stage
stage = background_select.intro;
stage_phase = 0;

// Timers
timer = 0;
item_blink_t = 0;
input_timer = 0;
wait_t = 0;

// Appear from the Black
transition_create(transition_types.fade_in);

// Titles
titles[menu_states.main]            = "";
titles[menu_states.game_mode]       = _("GAME MODE");
titles[menu_states.difficulty_mode] = _("DIFFICULTY MODE");
titles[menu_states.save_select]     = _("SAVE SLOT SELECT");
titles[menu_states.player_select]   = _("PLAYER SELECT");
titles[menu_states.option]          = _("OPTION MENU");
titles[menu_states.key_config]      = _("KEY CONFIG");
titles[menu_states.audio_settings]  = _("AUDIO SETTINGS");
titles[menu_states.voice_language]  = _("VOICE LANGUAGE");
titles[menu_states.weapon_get]		= "";
titles[menu_states.volume]		    = _("VOLUME CONTROL");

// Pages
// Needs a lot of refactoring:
// - Suggestion: Use struct for each item, automatic position/size, define function here instead of step event

#region Main
/// Main
page_items[menu_states.main] = [
	[_("New Game"), [100, 536, 144, 20]],
	[_("Load Game"),       [92, 560, 144, 20]],
	[_("Settings"),    [92, 572, 144, 20]],
	[_("Quit"),       [92, 584, 144, 20]]
];
#endregion
#region Game Mode
page_items[menu_states.game_mode] = [
	[_("SINGLE PLAYER"), [92, 88, 144, 20]]/*,
	[_("MULTIPLAYER"),   [92, 128, 144, 20]]*/
];
#endregion
#region Game Mode
page_items[menu_states.save_select] = [
	[_("Slot 1"), [92, 88, 144, 20]],
	[_("Slot 2"), [92, 88, 144, 20]],
	[_("Slot 3"), [92, 88, 144, 20]]
];
#endregion
#region load
page_items[menu_states.load] = [
	[_("   "), [92, 88, 144, 20]]/*,
	[_("MULTIPLAYER"),   [92, 128, 144, 20]]*/
];
#endregion
#region Difficulty Mode
page_items[menu_states.difficulty_mode] = [
	[_("EASY"),			 [92, 88, 144, 20]],
	[_("NORMAL"),		 [92, 112, 144, 20]],
	[_("HARD"),		     [92, 136, 144, 20]],
	[_("ZERO"),		     [92, 136, 144, 20]]
];
#endregion
#region Settings
enum e_settings {
	window_size
}

page_items[menu_states.option] = scr_settings_init();

#endregion
// Settings
settings_load();
settings_apply();
#region Player Select

page_items[menu_states.player_select] = [
	"X", "ZERO"
];
global.golden_armor_enabled = false;

#endregion
#region Key Config
/// Key Config
page_items[menu_states.key_config] = scr_keys_rebind_init();
#endregion
#region Stage Select
/// Stage Select
page_items[menu_states.stage_select] = [

];
//// Stage Icons Position
stage_select_positions = [
	[19,  18],
	[67,  18],
	[140, 11],
	[213, 18],
	[261, 18],

	[19, 182],
	[67, 182],
	[140, 189],
	[213, 182],
	[261, 182]
]
#endregion
#region Audio Settings
page_items[menu_states.audio_settings] = [
	//[_("VOICE LANGUAGE"),  [64, 64, 144, 20]],
	[_("VOLUME SETTINGS"), [64, 88, 144, 20]],
	[_("BACK"),            [64, 112, 144, 20]]
];
#endregion
#region Voice Language
page_items[menu_states.voice_language] = [];
#endregion
#region Volume Settings
page_items[menu_states.volume] = [
	[_("SFX VOLUME"),      [64, 64, 144, 20]],
	[_("BGM VOLUME"),      [64, 88, 144, 20]],
	[_("BACK"),            [64, 112, 144, 20]]
];
#endregion

#region Weapon Get
weapon_get_props = {
	player: {
		x: 320,
		y: 0,
		move_from: {
			x: -320,
			y: 0
		},
		move_to: {
			x: 40,
			y: 0,
			interval: [0, 60]
		},
		new_weapon: weapons.homing_torpedo,
		wp_slot: 2,
		visible: false,
		palette_array: [0, 0, 0, 0, 0, 0],
		palette_sprite: noone,
		palette_index: 0,
		palette_swap: false
	},
	blink_limit: 75,
	dark_limit: 120,
	instances: []
};
#endregion

// Boss Intro Scripts
enum boss_intros {
	eclipse	
}
boss_intro[boss_intros.eclipse] = boss_intro_eclipse;
// Items
items = page_items[menu_states.main];
items_length = array_length(items);
selected_item = 0;
selected_item_next = 0;
item_y = 0;
sound = false;

// Input
inputting = true;
hinput = false;
vinput = false;
hinput_p = false;
vinput_p = false;
enter = false;
scr_keys_reset();

// Palette
palette_init();

// Layer Background
layer_id = layer_get_id("BG");
layer_bg = layer_background_get_id(layer_id);

// Boss Intro
boss_intro_sprite = noone;
boss_intro_index = 0;
boss_inst = noone;
boss_object = noone;
boss_room = noone;
boss_name = "";
boss_name_show = false;
boss_defeated = false;
loading_text = "";

activate_sprites = true;
if (global.start_menu_force_state) {
	global.start_menu_force_state = false;
	state = global.start_menu_state;
	state_timer = 0;
	changed_state = true;
	items = page_items[state];
	items_length = array_length(items);
	selected_item = selected_item_next;
	selected_item_next = 0;
	activate_sprites = true;
} else if (state == menu_states.main) {
	music_play("TitleTheme");
}

// Character Select Sprites
global.char_select_sprites = [
	spr_player_x,
	spr_player_zero
];
background_index = 0;
// Animation
animation2_init();
can_activate_sprites = true;
for (var i = 0; i <= P_EXT4; i++) {
	armor[i] = "";
	tmp_armor[i] = "";
	armor_index[i] = 0;
	tmp_armor_index[i] = 0;
	
}
var index = global.character_selected_index[0];
armor = global.player_character_armor[index];
armor_index = global.player_character_armor_index[index];

menu_edge_init();
menu_armor_load(0);
menu_player_select_sprites_load();