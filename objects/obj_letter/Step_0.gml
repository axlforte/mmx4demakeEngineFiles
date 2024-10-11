if(dilog != noone){
	if(dilog.die){
		instance_destroy();	
	}
} else {
	instance_destroy();	
}

if(!foundLetter){
	foundLetter = true;
	event_user(0);
}