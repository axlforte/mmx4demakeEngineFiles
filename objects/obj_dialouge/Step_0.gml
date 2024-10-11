if(time >= spd){
	//make the letter
	if(string_char_at(line, index) == "/"){
		if(string_char_at(line, index + 1) == "n"){
			x -= xoff;
			xoff = 0;
			y += 14;
		}
		index += 2;
	} else {
		ltr = instance_create_depth(x,y,-100, obj_letter);
		ltr.dilog = self;
		ltr.letter = string_char_at(line, index);
		index++;
		x += 7;
		xoff += 7;
	}
	time = 0;
} else {
	if(string_length(line) > index){
		time += 1;
	}
}

if(die){
	instance_destroy();	
}