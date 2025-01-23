// room creation code baby!
background_list_set(1, [
	new BGInfo(bg_spidus_trees, 0.5),
	new BGInfo(bg_waterfall, 0.75),
	new BGInfo(bg_web_spider_greenery, 0.25)
]);
room_shader_init();
global.current_music = music_play("webSpider")
