function scr_letter_apply(){
//make the letter
	if(string_char_at(line, index) == "/"){
		if(string_char_at(line, index + 1) == "n"){
			x -= xoff;
			xoff = 0;
			y += 10;
			yoff += 10;
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
		ltr = instance_create_depth(x,y,-100, obj_letter);
		ltr.dilog = self;
		ltr.letter = string_char_at(line, index);
		ltr._x = xoff;
		ltr._y = yoff;
		ltr.plt_index = pal;
		ltr.wobble = wobble;
		ltr.sine = sine;
		index++;
		x += 7;
		xoff += 7;
	}
	time = 0;
}

function scr_letter_apply_repeated(){
//make the letter
	while(string_length(line) + 1 > index){
		if(string_char_at(line, index) == "/"){
			if(string_char_at(line, index + 1) == "n"){
				x -= xoff;
				xoff = 0;
				y += 10;
				yoff += 10;
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
			ltr = instance_create_depth(x,y,-100, obj_letter);
			ltr.dilog = self;
			ltr.letter = string_char_at(line, index);
			ltr._x = xoff;
			ltr._y = yoff;
			ltr.plt_index = pal;
			ltr.wobble = wobble;
			ltr.sine = sine;
			index++;
			x += 7;
			xoff += 7;
		}
		time = 0;
	}
}