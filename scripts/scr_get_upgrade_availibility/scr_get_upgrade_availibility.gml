function get_upgrade_availibility(){
	var prev = argument[0]
	var curr = argument[1]
	if(prev && !curr){
		return 1;
	} else if(prev && curr){
		return 0;	
	}
	return 2;
}