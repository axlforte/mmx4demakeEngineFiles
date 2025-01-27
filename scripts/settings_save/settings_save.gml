function settings_save() {
	ini_open("Settings/savedata.ini");
	// Settings
	ini_write_real("SETTINGS", "Window", global.settings[0]);
	ini_write_real("SETTINGS", "Input", global.settings[1]);
	ini_write_real("SETTINGS", "scale", global.camera_16_by_9);
	ini_write_real("SETTINGS", "notes", global.notes);
	ini_write_real("SETTINGS", "hitnums", global.hit_numbers);
	ini_write_real("SETTINGS", "dialouge speed", global.DialougeSpeed);
	ini_write_real("SETTINGS", global.gp_name, global.gp_movement);
	ini_write_real("SETTINGS", "shift dist", global.camera_shift_distance);
	ini_write_real("SETTINGS", "shift speed", global.camera_shift_speed);
	ini_write_real("SETTINGS", "crt", global.crt);
	// Audio
	ini_write_string("AUDIO", "Voice Language", global.voice_language);
	ini_write_real("AUDIO", "Sound Volume", global.sfx_volume);
	ini_write_real("AUDIO", "Music Volume", global.bgm_volume);

	for (var i = array_length(global.key_config) - 1; i >= 0; i--)
	{
		ini_write_real("KEYS", global.key_text[i], global.key_config[i]);
		ini_write_real("GAMEPAD", global.key_text[i], global.gamepad_config[i]);
	}
	ini_close();


}
