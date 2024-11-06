// Código de creación del room
background_list_set(1, [new BGInfo(bg_test)]);
room_shader_init();
global.current_music = music_play("WebSpidus")
global.music_volume = 1;
global.music_target_volume = 1;
global.music_fade_step = 0.05;
