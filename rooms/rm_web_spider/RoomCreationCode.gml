// room creation code baby!
background_list_set(1, [
	new BGInfo(bg_spidus_trees, 0.5),
	new BGInfo(bg_waterfall, 0.75),
	new BGInfo(bg_chill_penguin_3, 0.5)
]);
room_shader_init();
global.current_music = music_play("webSpider")
global.music_volume = 1;
global.music_target_volume = 1;
global.music_fade_step = 0.05;
