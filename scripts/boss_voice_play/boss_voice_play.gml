function boss_voice_play() {
	if (!G.voice_enabled) exit;
	audio_play(argument[0]);


}
