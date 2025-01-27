scr_keys_update();

if(key_down){
	gamma += 0.01;
	gamma = min(gamma, 0.9);
}
if(key_up){
	gamma -= 0.01;
	gamma = max(gamma, 0);
}