if(dilog != noone){
	if(dilog.die){
		instance_destroy();	
	}
	x = dilog.x + _x;
	y = dilog.y + _y;
} else {
	instance_destroy();	
}

if(!foundLetter){
	foundLetter = true;
	event_user(0);
}
