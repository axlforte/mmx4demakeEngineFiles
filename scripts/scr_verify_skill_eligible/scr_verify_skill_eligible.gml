function verify_skill_eligible(){
	var cost = argument[0];
	var skill_name = argument[1];
	
	var skill = upgrade_change(skill_name, "get");
	
	var prev_skill_name = argument[2];
	var prev_skill = upgrade_change(prev_skill_name, "get");
	if(global.player_exp < cost || skill == true || prev_skill = false){
		audio_play(snd_nope);
	} else {
		upgrade_change(skill_name, true);
		global.player_exp -= cost;
	}
}