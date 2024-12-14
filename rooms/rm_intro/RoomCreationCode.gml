background_list_set(1, [new BGInfo(bg_test)]);
room_shader_init();
music_play("jetStingray");
audio_play_sound(openingStageX, 0, 0);
audio_sound_gain(openingStageX, global.bgm_volume, 0);