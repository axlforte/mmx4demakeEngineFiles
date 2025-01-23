if(popup_timer < 0)
	instance_destroy();
if(count > 4 && popup_timer > puti_exit)
	popup_timer = puti_exit;
	
if(popup_timer < puti_exit){
	x_off -= 4;
} else if(popup_timer > puti_start - puti_enter){
	x_off += 4;
}
popup_timer--;