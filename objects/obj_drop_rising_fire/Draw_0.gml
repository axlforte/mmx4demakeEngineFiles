switch(weapon){
case(weapons.ground_hunter):
	sprite = pause_menu_icons5;
break;
case(weapons.lightning_web):
	sprite = pause_menu_icons4;
break;
case(weapons.rising_fire):
	sprite = pause_menu_icons3;
break;
case(weapons.twin_slasher):
	sprite = pause_menu_icons7;
break;
case(weapons.soul_body):
	sprite = pause_menu_icons2;
break;
case(weapons.frost_spike):
	sprite = pause_menu_icons1;
break;
case(weapons.double_cyclone):
	sprite = pause_menu_icons6;
break;
case(weapons.aiming_laser):
	sprite = pause_menu_icons8;
break;
}

draw_sprite(sprite,0,x,y);

draw_point(x,y-poffset);