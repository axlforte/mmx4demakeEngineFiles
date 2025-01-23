function scr_letter_apply(){
//make the letter
	if(string_char_at(line, index) == "/"){
		if(string_char_at(line, index + 1) == "n"){
			//x -= xoff;
			//xoff = 0;
			//y += 10;
			//yoff += 10;
			xoff += 5;
			x += 5;
		} else if(string_char_at(line, index + 1) == "c"){
			pal = real(string_char_at(line, index + 2));
			index++;
		}  else if(string_char_at(line, index + 1) == "w"){
				wobble = real(string_char_at(line, index + 2));
				index++;
		}  else if(string_char_at(line, index + 1) == "s"){
				sine = real(string_char_at(line, index + 2));
				index++;
		}
		index += 2;
	} else {
		
		if(string_char_at(line, index) == " "){
			var found = false;
			var ind = 0;
			while(!found){
				if(index + ind > string_length(line)){
					found = true;
				}
				if(string_char_at(line, index + ind) == " "){
					if(xoff + ind * 7 > 224){
						x -= xoff + 6;
						xoff = -6;
						y += 9;
						yoff += 10;
					}
					found = true;
				} else {
					ind++;
				}
			}
		}
		ltr = instance_create_depth(x,y,-100, obj_letter);
		ltr.dilog = self;
		ltr.letter = string_char_at(line, index);
		ltr._x = xoff;
		ltr._y = yoff;
		ltr.plt_index = pal;
		ltr.wobble = wobble;
		ltr.sine = sine;
		if(array_contains(["i","c", "l", " "], string_char_at(line, index))){
			xoff += 5;
			x += 5;
			//show_debug_message("big gap was registered with " + string_char_at(line, index))
		} else if(array_contains(["r","p","b","o","h","g","t","f","d","n","e"], string_char_at(line, index))){
			xoff += 6;
			x += 6;
			//show_debug_message("small gap was registered with " + string_char_at(line, index))
		} else {
			xoff += 7;
			x += 7;
		}
		index++;
	}
	time = 0;
}

function scr_letter_apply_repeated(){
//make the letter
	while(string_length(line) + 1 > index){
		scr_letter_apply();
	}
}