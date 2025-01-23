while(!seperated){
	if(l_pt > string_length(line)){
		//show_debug_message(string(l_pt) + " was enough for " + string(string_length(line)))
		seperated = true;
	} else {
		//show_debug_message(string_char_at(line, l_pt));
		if(string_char_at(line, l_pt) == " "){
			var newline = string_copy(line,1, l_pt - 1) + "/n" + string_copy(line,l_pt + 1, string_length(line));
			line = newline;
			l_pt += line_seperation_amount;
		} else {
			l_pt --;
			if(string_char_at(line, l_pt) == " "){
				
			}
		}
	}
}