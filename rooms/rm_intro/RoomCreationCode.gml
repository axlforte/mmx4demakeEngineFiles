background_list_set(1, [new BGInfo(bg_city_scape, 0.5)]);
room_shader_init();
music_play("lagoon");
audio_play_sound(lagoon, 0, 0);
audio_sound_gain(lagoon, global.bgm_volume, 0);