ltroffset = string_length(text) * 8 + 16;
puti_exit = string_length(text) * 2 + 2;
puti_enter = puti_exit;
puti_start = popup_timer;

ltrarray = [string_length(text)];
for(var i = 0; i < string_length(text); i++){
	letter = string_copy(text, i + 1, 1);
	ltrnum = scr_letter_fetch();
	ltrarray[i] = ltrnum;
}