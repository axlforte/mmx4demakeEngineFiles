if(t <= 0){
	instance_create_depth(x,y,depth, faller);
	t = t_wait;
} else {
	t --;
}