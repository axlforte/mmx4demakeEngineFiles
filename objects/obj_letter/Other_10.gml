ltrNum = 0;
if(string_upper(letter) == "A"){
	ltrNum = 32;
} else if(string_upper(letter) == "B"){
	ltrNum = 33;
} else if(string_upper(letter) == "C"){
	ltrNum = 34;
} else if(string_upper(letter) == "D"){
	ltrNum = 35;
} else if(string_upper(letter) == "E"){
	ltrNum = 36;
} else if(string_upper(letter) == "F"){
	ltrNum = 37;
} else if(string_upper(letter) == "G"){
	ltrNum = 38;
} else if(string_upper(letter) == "H"){
	ltrNum = 39;
} else if(string_upper(letter) == "I"){
	ltrNum = 40;
} else if(string_upper(letter) == "J"){
	ltrNum = 41;
} else if(string_upper(letter) == "K"){
	ltrNum = 42;
} else if(string_upper(letter) == "L"){
	ltrNum = 43;
} else if(string_upper(letter) == "M"){
	ltrNum = 44;
} else if(string_upper(letter) == "N"){
	ltrNum = 45;
} else if(string_upper(letter) == "O"){
	ltrNum = 46;
} else if(string_upper(letter) == "P"){
	ltrNum = 47;
} else if(string_upper(letter) == "Q"){
	ltrNum = 48;
} else if(string_upper(letter) == "R"){
	ltrNum = 49;
} else if(string_upper(letter) == "S"){
	ltrNum = 50;
} else if(string_upper(letter) == "T"){
	ltrNum = 51;
} else if(string_upper(letter) == "U"){
	ltrNum = 52;
} else if(string_upper(letter) == "V"){
	ltrNum = 53;
} else if(string_upper(letter) == "W"){
	ltrNum = 54;
} else if(string_upper(letter) == "X"){
	ltrNum = 55;
} else if(string_upper(letter) == "Y"){
	ltrNum = 56;
} else if(string_upper(letter) == "Z"){
	ltrNum = 57;
} else if(string_upper(letter) == " "){
	ltrNum = 94;
} else if(letter == "0"){
	ltrNum = 15;
} else if(letter == "1"){
	ltrNum = 16;
} else if(letter == "2"){
	ltrNum = 17;
} else if(letter == "3"){
	ltrNum = 18;
} else if(letter == "4"){
	ltrNum = 19;
} else if(letter == "5"){
	ltrNum = 20;
} else if(letter == "6"){
	ltrNum = 21;
} else if(letter == "7"){
	ltrNum = 22;
} else if(letter == "8"){
	ltrNum = 23;
} else if(letter == "9"){
	ltrNum = 24;
} else if(letter == "."){
	ltrNum = 13;
} else {
	//lol
}

if(string_upper(letter) != letter && letter != " "){
	ltrNum += 32;
}