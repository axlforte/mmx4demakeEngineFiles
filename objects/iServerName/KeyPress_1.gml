/// @description  Process text box
if(focus){
	if(keyboard_lastkey == vk_backspace) {
		Text = string_delete(Text, tlen, 1); 
		show_debug_message("yay");
		tlen--;
		if(tlen < 0){
			tlen = 0;
		}
	} else if(keyboard_lastkey == vk_enter) {
		global.InitObject.alarm[1] = 1;
	} else {
		Text += keyboard_lastchar;
		tlen ++;
	}
}

//global.InitObject.alarm[1] = 1;