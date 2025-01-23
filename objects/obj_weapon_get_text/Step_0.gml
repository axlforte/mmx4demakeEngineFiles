var t = timer++;
for (var i = 0; i < array_length(lines); i++) {
	var linoone = lines[i];
	if (t >= linoone.start && string_length(linoone.text) != string_length(linoone.text_draw)) {
		if (t mod 4 == 0) {
			linoone.text_draw += string_char_at(linoone.text, string_length(linoone.text_draw) + 1);	
		}
	}
}