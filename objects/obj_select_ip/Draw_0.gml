_ip = string(num1) + "." + string(num2) + "." + string(num3) + "." + string(num4);

draw_text(x,y,num1);
draw_text(x+36,y,num2);
draw_text(x+72,y,num3);
draw_text(x+108,y,num4);
draw_text(x+156,y,_ip);

draw_text(x, y + 24, "up and down to change number");
draw_text(x, y + 36, "hold shoot 1 to change by 10");
draw_text(x, y + 48, "hold shoot 2 to change by 100");
draw_text(x, y + 72, "press left and right to change");
draw_text(x, y + 84, " which number to change");
draw_text(x, y + 108, "press start to look for server");
draw_text(x, y + 120, "press dash to create a server");

if(focus == 0){
	draw_text(x, y + 12, "/\\");
} else if(focus == 1){
	draw_text(x + 36, y + 12, "/\\");
} else if(focus == 2){
	draw_text(x + 72, y + 12, "/\\");
} else if(focus == 3){
	draw_text(x + 108, y + 12, "/\\");
}