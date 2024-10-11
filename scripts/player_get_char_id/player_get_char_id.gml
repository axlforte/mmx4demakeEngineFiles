function player_get_char_id() {
	enum pl_char {
		x, zero, 
		length
	}

	switch (argument[0]) {
		case "x": return pl_char.x; break;	
		case "zero": return pl_char.zero; break;	
	}


}
