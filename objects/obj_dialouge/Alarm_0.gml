while(!seperated){
	if(l_pt > string_length(linone)){
		//show_debug_message(string(l_pt) + " was enough for " + string(string_length(line)))
		seperated = true;
	} else {
		//show_debug_message(string_char_at(line, l_pt));
		if(string_char_at(linone, l_pt) == " "){
			var newline = string_copy(linone,1, l_pt - 1) + "/n" + string_copy(linone,l_pt + 1, string_length(linone));
			linone = newline;
			l_pt += line_seperation_amount;
		} else {
			l_pt --;
			if(string_char_at(linone, l_pt) == " "){
				
			}
		}
	}
}

if(string_char_at(linone, string_length(linone)) == "!" && 
(string_char_at(linone, string_length(linone) - 1) == "!" ||
string_char_at(linone, string_length(linone) - 1) == "." ||
string_char_at(linone, string_length(linone) - 1) == "?"
)){
	linone = string_copy(linone,1, string_length(linone) - 2);
}