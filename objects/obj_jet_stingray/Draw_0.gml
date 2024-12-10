/// @description Insert description here
// You can write your code in this editor

if(state = STINGRAY.DASH)
	draw_text(x - 64,y - 64,"DASH");
else if(state = STINGRAY.STINGER)
	draw_text(x - 64,y - 64,"STINGER");
else if(state = STINGRAY.CRUNCH)
	draw_text(x - 64,y - 64,"CRUNCH");
else if(state = STINGRAY.CHARBLARGE)
	draw_text(x - 64,y - 64,"CHARGEBLARGE");
else if(state = STINGRAY.LAND_STINGER)
	draw_text(x - 64,y - 64,"LAND_STINGER");
else if(state = STINGRAY.ELECTROCUTE)
	draw_text(x - 64,y - 64,"ELECTROCUTE");
else
	draw_text(x - 64,y - 64,state);








// Inherit the parent event
event_inherited();

