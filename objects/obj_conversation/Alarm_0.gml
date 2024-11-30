activate = true;
visible = true;
image_xscale = 1/(intr_time + 1);
image_yscale = 1/(intr_time + 1);

if(global.dialouge_completed[dindex]){
	instance_destroy();
}