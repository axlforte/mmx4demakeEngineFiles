// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_get_language(){
	switch (argument[0]) {
		case "english": return lang_english(argument[1]); break;	
		case "brainrot": return lang_brainrot(argument[1]); break;	
		case "espanol": return lang_espanol(argument[1]); break;	
	}
}